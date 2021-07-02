/***********
 * Hydromisc, an interface to various sensors and actuators useful when
 * working with water, designed primarily for hydroponics but maybe also
 * useful for aquaria, ponds, etc. This can measure pH and EC, drive
 * solenoid valves, drive dosing pumps, drive other pumps, etc.
 *
 * Copyright 2021 Hydromisc contributors.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ***********/

static const char *TAG = "hydromisc";

#include <esp_wifi.h>
#include <esp_event.h>
#include <esp_log.h>
#include <esp_system.h>
#include <nvs_flash.h>
#include <sys/param.h>
#include "esp32/rom/ets_sys.h"
#include "nvs_flash.h"
#include "esp_netif.h"
#include "esp_eth.h"
#include "esp_http_server.h"

#include "protocol_examples_common.h"

#include "driver/gpio.h"
#include "driver/ledc.h"
#include "driver/periph_ctrl.h"
#include "driver/timer.h"
#include "driver/adc.h"
#include "esp_adc_cal.h"


// GPIO assignment
//
#define GPIO_PH_0_SENSE                 36
#define ADC_PH_0_SENSE                  ADC_CHANNEL_0
#define GPIO_PH_1_SENSE                 39
#define ADC_PH_1_SENSE                  ADC_CHANNEL_3

#define GPIO_EC_0_SENSE                 34
#define ADC_EC_0_SENSE                  ADC_CHANNEL_6
#define GPIO_EC_1_SENSE                 33
#define ADC_EC_1_SENSE                  ADC_CHANNEL_5

#define GPIO_CURRENT_SENSE              35
#define ADC_CURRENT_SENSE               ADC_CHANNEL_7

#define GPIO_DCR_SENSE                  32
#define ADC_DCR_SENSE                   ADC_CHANNEL_4

#define GPIO_EC_M_GATE                  25
#define GPIO_SR_SI                      26
#define GPIO_SR_SCK                     27
#define GPIO_SR_RCK                     14
#define GPIO_SR_nRCLR                   12

#define GPIO_DIG_0_CK                   13
#define GPIO_EC_P_GATE                  15
#define GPIO_DIG_0_IN                    2
#define GPIO_DIG_0_OUT                   4
#define GPIO_DIG_1_CK                   16
#define GPIO_DIG_1_IN                   17
#define GPIO_DIG_1_OUT                  23

#define GPIO_DOSING_GATE_A              18
#define GPIO_DOSING_GATE_B              19
#define GPIO_DOSING_GATE_PH             21
#define GPIO_DOSING_GATE_AUX            22
#define LEDC_CHANNEL_DOSING_A            0
#define LEDC_CHANNEL_DOSING_B            1
#define LEDC_CHANNEL_DOSING_PH           2
#define LEDC_CHANNEL_DOSING_AUX          3


// Shift register output expander assignment

#define SR_SOLENOID_4                    0
#define SR_SOLENOID_3                    1
#define SR_SOLENOID_5                    2
#define SR_SOLENOID_2                    3
#define SR_SOLENOID_6                    4
#define SR_SOLENOID_1                    5
#define SR_SOLENOID_7                    6
#define SR_SOLENOID_0                    7

#define SR_PUMP_0                        8
#define SR_PUMP_1                        9
#define SR_PUMP_2                       10
#define SR_PUMP_3                       11
#define SR_PUMP_4                       12
#define SR_PUMP_5                       13
#define SR_BIG_PUMP                     14
#define SR_DEBUG_LED                    15


static volatile int seconds_until_stop_pump = 0;
static volatile int seconds_until_stop_solenoid = 0;
static volatile int seconds_until_stop_solenoid_pumps = 0;

static volatile int pwm_a_duty = 0,
                    pwm_b_duty = 0,
                    pwm_ph_duty = 0,
                    pwm_aux_duty = 0;

static volatile int pwm_a_phase = 0xfff,
                    pwm_b_phase = 0xfff,
                    pwm_ph_phase = 0xfff,
                    pwm_aux_phase = 0xfff;

static volatile int run_big_pump = 1;

static volatile int sr_bits = 0;

#define MAX_PUMP_PERIOD 1000
static volatile int last_pump_current[MAX_PUMP_PERIOD+10];
static int last_pump_period = 0;

#define DEFAULT_VREF    1100 // mV
static esp_adc_cal_characteristics_t adc_chars_0db;
static esp_adc_cal_characteristics_t adc_chars_11db;


// Configure GPIO pins at startup
static void config_gpio(void)
{
    gpio_config_t io_conf;

    // Outputs
    io_conf.intr_type = GPIO_PIN_INTR_DISABLE;
    io_conf.mode = GPIO_MODE_OUTPUT;
    io_conf.pin_bit_mask = 
        (1ULL << GPIO_EC_M_GATE) |
        (1ULL << GPIO_SR_SI) |
        (1ULL << GPIO_SR_SCK) |
        (1ULL << GPIO_SR_RCK) |
        (1ULL << GPIO_SR_nRCLR) |
        (1ULL << GPIO_DIG_0_CK) |
        (1ULL << GPIO_EC_P_GATE) |
        (1ULL << GPIO_DIG_0_OUT) |
        (1ULL << GPIO_DIG_1_CK) |
        (1ULL << GPIO_DIG_1_OUT) |
        (1ULL << GPIO_DOSING_GATE_A) |
        (1ULL << GPIO_DOSING_GATE_B) |
        (1ULL << GPIO_DOSING_GATE_PH) |
        (1ULL << GPIO_DOSING_GATE_AUX);
    io_conf.pull_down_en = 0;
    io_conf.pull_up_en = 0;
    gpio_config(&io_conf);

    // Inputs, analog and digital
    io_conf.mode = GPIO_MODE_INPUT;
    io_conf.pin_bit_mask =
        (1ULL << GPIO_PH_0_SENSE) |
        (1ULL << GPIO_PH_1_SENSE) |
        (1ULL << GPIO_EC_0_SENSE) |
        (1ULL << GPIO_EC_1_SENSE) |
        (1ULL << GPIO_CURRENT_SENSE) |
        (1ULL << GPIO_DCR_SENSE) |
        (1ULL << GPIO_DIG_0_IN) |
        (1ULL << GPIO_DIG_1_IN);
    gpio_config(&io_conf);

    gpio_set_level(GPIO_EC_P_GATE, 0);
    gpio_set_level(GPIO_EC_M_GATE, 0);

    gpio_set_level(GPIO_DIG_0_CK, 0);
    gpio_set_level(GPIO_DIG_1_CK, 0);

    // used for AM2301, open drain type
    gpio_set_direction(GPIO_DIG_0_OUT, GPIO_MODE_INPUT_OUTPUT_OD);
    gpio_set_pull_mode(GPIO_DIG_0_OUT, GPIO_PULLUP_ONLY);
    gpio_set_level(GPIO_DIG_0_OUT, 1);

    gpio_set_direction(GPIO_DIG_1_OUT, GPIO_MODE_INPUT_OUTPUT_OD);
    gpio_set_pull_mode(GPIO_DIG_1_OUT, GPIO_PULLUP_ONLY);
    gpio_set_level(GPIO_DIG_1_OUT, 1);

    gpio_set_level(GPIO_SR_SI, 0);
    gpio_set_level(GPIO_SR_SCK, 0);
    gpio_set_level(GPIO_SR_RCK, 0);
    gpio_set_level(GPIO_SR_nRCLR, 0);

    adc1_config_width(ADC_WIDTH_BIT_12);
    adc1_config_channel_atten(ADC_CURRENT_SENSE, ADC_ATTEN_DB_0);
    adc1_config_channel_atten(ADC_PH_0_SENSE, ADC_ATTEN_DB_11);
    adc1_config_channel_atten(ADC_PH_1_SENSE, ADC_ATTEN_DB_11);
    adc1_config_channel_atten(ADC_EC_0_SENSE, ADC_ATTEN_DB_11);
    adc1_config_channel_atten(ADC_EC_1_SENSE, ADC_ATTEN_DB_11);
    adc1_config_channel_atten(ADC_DCR_SENSE, ADC_ATTEN_DB_11);

    esp_adc_cal_characterize(ADC_UNIT_1, ADC_ATTEN_DB_0, ADC_WIDTH_BIT_12,
            DEFAULT_VREF, &adc_chars_0db);
    esp_adc_cal_characterize(ADC_UNIT_1, ADC_ATTEN_DB_11, ADC_WIDTH_BIT_12,
            DEFAULT_VREF, &adc_chars_11db);
}

static void config_ledc(void)
{
    ledc_timer_config_t ledc_timer = {
        .duty_resolution = LEDC_TIMER_8_BIT,
        .freq_hz = 300000,
        .speed_mode = LEDC_LOW_SPEED_MODE,
        .timer_num = LEDC_TIMER_1,
        .clk_cfg = LEDC_AUTO_CLK,
    };
    ledc_timer_config(&ledc_timer);

    ledc_timer.speed_mode = LEDC_HIGH_SPEED_MODE;
    ledc_timer.timer_num = LEDC_TIMER_0;
    ledc_timer_config(&ledc_timer);

    ledc_channel_config_t ch_a = {
        .channel    = LEDC_CHANNEL_DOSING_A,
        .duty       = 0,
        .gpio_num   = GPIO_DOSING_GATE_A,
        .speed_mode = LEDC_HIGH_SPEED_MODE,
        .hpoint     = 0,
        .timer_sel  = LEDC_TIMER_0
    };
    ledc_channel_config(&ch_a);

    ledc_channel_config_t ch_b = {
        .channel    = LEDC_CHANNEL_DOSING_B,
        .duty       = 0,
        .gpio_num   = GPIO_DOSING_GATE_B,
        .speed_mode = LEDC_HIGH_SPEED_MODE,
        .hpoint     = 0,
        .timer_sel  = LEDC_TIMER_0
    };
    ledc_channel_config(&ch_b);

    ledc_channel_config_t ch_ph = {
        .channel    = LEDC_CHANNEL_DOSING_PH,
        .duty       = 0,
        .gpio_num   = GPIO_DOSING_GATE_PH,
        .speed_mode = LEDC_HIGH_SPEED_MODE,
        .hpoint     = 0,
        .timer_sel  = LEDC_TIMER_0
    };
    ledc_channel_config(&ch_ph);

    ledc_channel_config_t ch_aux = {
        .channel    = LEDC_CHANNEL_DOSING_AUX,
        .duty       = 0,
        .gpio_num   = GPIO_DOSING_GATE_AUX,
        .speed_mode = LEDC_HIGH_SPEED_MODE,
        .hpoint     = 0,
        .timer_sel  = LEDC_TIMER_0
    };
    ledc_channel_config(&ch_aux);

}

static void sr_set(int bit, int value)
{
    portDISABLE_INTERRUPTS();
    if(value) {
        sr_bits |=  (1 << bit);
    } else {
        sr_bits &= ~(1 << bit);
    }
    portENABLE_INTERRUPTS();
}

static void sr_write(void)
{
    portDISABLE_INTERRUPTS();
    int i;
    for(i = 15; i >= 0; i--) {
        gpio_set_level(GPIO_SR_SI, (sr_bits & (1 << i)) ? 1 : 0);
        ets_delay_us(1);
        gpio_set_level(GPIO_SR_SCK, 1);
        ets_delay_us(1);
        gpio_set_level(GPIO_SR_SCK, 0);
        ets_delay_us(1);
    }

    gpio_set_level(GPIO_SR_RCK, 1);
    ets_delay_us(1);
    gpio_set_level(GPIO_SR_RCK, 0);
    ets_delay_us(1);
    gpio_set_level(GPIO_SR_nRCLR, 1);
    portENABLE_INTERRUPTS();
}

static void sr_set_and_write(int bit, int value) {
    sr_set(bit, value);
    sr_write();
}

static void set_dosing_pwm(int a, int b, int ph, int aux)
{
    ledc_set_duty(LEDC_HIGH_SPEED_MODE, LEDC_CHANNEL_DOSING_A, a);
    ledc_update_duty(LEDC_HIGH_SPEED_MODE, LEDC_CHANNEL_DOSING_A);

    ledc_set_duty(LEDC_HIGH_SPEED_MODE, LEDC_CHANNEL_DOSING_B, b);
    ledc_update_duty(LEDC_HIGH_SPEED_MODE, LEDC_CHANNEL_DOSING_B);

    ledc_set_duty(LEDC_HIGH_SPEED_MODE, LEDC_CHANNEL_DOSING_PH, ph);
    ledc_update_duty(LEDC_HIGH_SPEED_MODE, LEDC_CHANNEL_DOSING_PH);

    ledc_set_duty(LEDC_HIGH_SPEED_MODE, LEDC_CHANNEL_DOSING_AUX, aux);
    ledc_update_duty(LEDC_HIGH_SPEED_MODE, LEDC_CHANNEL_DOSING_AUX);
}

static void stop_solenoid_pumps(void)
{
    sr_set(SR_BIG_PUMP, 0);

    sr_write();

    pwm_a_duty = 0;
    pwm_b_duty = 0;
    pwm_ph_duty = 0;
    pwm_aux_duty = 0;

    set_dosing_pwm(0, 0, 0, 0);

    seconds_until_stop_solenoid_pumps = 0;
}

static void stop_solenoid(void)
{
    sr_set(SR_SOLENOID_0, 0);
    sr_set(SR_SOLENOID_1, 0);
    sr_set(SR_SOLENOID_2, 0);
    sr_set(SR_SOLENOID_3, 0);
    sr_set(SR_SOLENOID_4, 0);
    sr_set(SR_SOLENOID_5, 0);
    sr_set(SR_SOLENOID_6, 0);
    sr_set(SR_SOLENOID_7, 0);

    sr_write();

    seconds_until_stop_solenoid = 0;
}

static void stop_pump(void) {
    sr_set(SR_PUMP_0, 0);
    sr_set(SR_PUMP_1, 0);
    sr_set(SR_PUMP_2, 0);
    sr_set(SR_PUMP_3, 0);
    sr_set(SR_PUMP_4, 0);
    sr_set(SR_PUMP_5, 0);

    sr_write();

    seconds_until_stop_pump = 0;
}

static void stop_everything(void)
{
    stop_solenoid();
    stop_solenoid_pumps();
    stop_pump();
}

static int start_solenoid(int k, int dosingA, int dosingB, int dosingPh, int dosingAux, int t)
{
    stop_everything();

    if(k         < 0 || k         > 7   ||
       dosingA   < 0 || dosingA   > 255 ||
       dosingB   < 0 || dosingB   > 255 ||
       dosingPh  < 0 || dosingPh  > 255 ||
       dosingAux < 0 || dosingAux > 255 ||
       t         < 5 || t         > 120)
    {
        return 0;
    }

    seconds_until_stop_solenoid_pumps = t;

    // want the pump to stop first, so we don't hold pressure
    seconds_until_stop_solenoid = t + 3;

    switch(k) {
        case 0: sr_set(SR_SOLENOID_0, 1); break;
        case 1: sr_set(SR_SOLENOID_1, 1); break;
        case 2: sr_set(SR_SOLENOID_2, 1); break;
        case 3: sr_set(SR_SOLENOID_3, 1); break;
        case 4: sr_set(SR_SOLENOID_4, 1); break;
        case 5: sr_set(SR_SOLENOID_5, 1); break;
        case 6: sr_set(SR_SOLENOID_6, 1); break;
        case 7: sr_set(SR_SOLENOID_7, 1); break;
    }

    if(run_big_pump) sr_set(SR_BIG_PUMP, 1);

    sr_set(SR_DEBUG_LED, 1);

    sr_write();

    pwm_a_duty = dosingA;
    pwm_b_duty = dosingB;
    pwm_ph_duty = dosingPh;
    pwm_aux_duty = dosingAux;

    return 1;
}

static int start_pump(int k, int t)
{
    stop_everything();

    if(k < 0 || k > 5 || t < 5 || t > MAX_PUMP_PERIOD) return 0;

    memset((void *)last_pump_current, 0, sizeof(last_pump_current));
    last_pump_period = t;

    seconds_until_stop_pump = t;

    switch(k) {
        case 0: sr_set(SR_PUMP_0, 1); break;
        case 1: sr_set(SR_PUMP_1, 1); break;
        case 2: sr_set(SR_PUMP_2, 1); break;
        case 3: sr_set(SR_PUMP_3, 1); break;
        case 4: sr_set(SR_PUMP_4, 1); break;
        case 5: sr_set(SR_PUMP_5, 1); break;
    }

    sr_set(SR_DEBUG_LED, 1);

    sr_write();

    return 1;
}

static xQueueHandle timer_tick_queue;

static void timer_tick_task(void *arg)
{
    int mod10 = 0, mod12 = 0;

    while (1) {
        int evt;
        xQueueReceive(timer_tick_queue, &evt, portMAX_DELAY);

        // software PWM with period of twelve ticks = 1200 ms
        //
        mod12++;
        if(mod12 >= 12) mod12 = 0;

        int a = 0, b = 0, ph = 0, aux = 0;
        if(pwm_a_phase   & (1 << mod12)) a   = pwm_a_duty;
        if(pwm_b_phase   & (1 << mod12)) b   = pwm_b_duty;
        if(pwm_ph_phase  & (1 << mod12)) ph  = pwm_ph_duty;
        if(pwm_aux_phase & (1 << mod12)) aux = pwm_aux_duty;
        set_dosing_pwm(a, b, ph, aux);
        
        // and timeout with period of ten ticks = 1 s

        mod10++;
        if(mod10 < 10) continue;
        mod10 = 0;

        if(seconds_until_stop_pump > 0) {
            seconds_until_stop_pump--;

            int i, v = 0, n = 32;
            for(i = 0; i < n; i++) {
                v += adc1_get_raw(ADC_CURRENT_SENSE);
            }
            v /= n;
            // 2.2 ohm sense resistor
            v = (int)(esp_adc_cal_raw_to_voltage(v, &adc_chars_0db) / 2.2f);

            last_pump_current[seconds_until_stop_pump] = v;

            if(seconds_until_stop_pump == 0) {
                ESP_LOGI(TAG, "TICK => pump stop next tick");
                sr_set(SR_DEBUG_LED, 0); // to write later
            }
        } else {
            stop_pump();
        }

        if(seconds_until_stop_solenoid_pumps > 0) {
            seconds_until_stop_solenoid_pumps--;
            if(seconds_until_stop_solenoid_pumps == 0) {
                ESP_LOGI(TAG, "TICK => solenoid pumps stop next tick");
                sr_set(SR_DEBUG_LED, 0); // to write later
            }
        } else {
            stop_solenoid_pumps();
        }

        if(seconds_until_stop_solenoid > 0) {
            seconds_until_stop_solenoid--;
            if(seconds_until_stop_solenoid == 0) {
                ESP_LOGI(TAG, "TICK => solenoid stop next tick");
                sr_set(SR_DEBUG_LED, 0); // to write later
            }
        } else {
            stop_solenoid();
        }
    }
}

void IRAM_ATTR timer_tick_isr(void *param)
{
    timer_spinlock_take(TIMER_GROUP_0);

    timer_group_clr_intr_status_in_isr(TIMER_GROUP_0, TIMER_0);
    timer_group_enable_alarm_in_isr(TIMER_GROUP_0, TIMER_0);

    int evt = 0;
    xQueueSendFromISR(timer_tick_queue, &evt, NULL);

    timer_spinlock_give(TIMER_GROUP_0);
}

static void config_timer_tick(void)
{
    timer_tick_queue = xQueueCreate(10, sizeof(int));

    xTaskCreate(timer_tick_task, "timer_evt_task", 2048, NULL, 5, NULL);

    timer_config_t config = {
        .divider = 16,
        .counter_dir = TIMER_COUNT_UP,
        .counter_en = TIMER_PAUSE,
        .alarm_en = TIMER_ALARM_EN,
        .auto_reload = true,
    };
    timer_init(TIMER_GROUP_0, TIMER_0, &config);

    timer_set_counter_value(TIMER_GROUP_0, TIMER_0, 0ULL);

    timer_set_alarm_value(TIMER_GROUP_0, TIMER_0, (TIMER_BASE_CLK / (16*10)));
    timer_enable_intr(TIMER_GROUP_0, TIMER_0);
    timer_isr_register(TIMER_GROUP_0, TIMER_0, timer_tick_isr, NULL,
                                                    ESP_INTR_FLAG_IRAM, NULL);

    timer_start(TIMER_GROUP_0, TIMER_0);
}

static void send_response(httpd_req_t *req, const char *resp_str) {
    httpd_resp_set_hdr(req, "Access-Control-Allow-Origin", "*");
    httpd_resp_send(req, resp_str, strlen(resp_str));
}

static esp_err_t solenoid_get_handler(httpd_req_t *req)
{
    char*  buf;
    size_t buf_len;
    int ok = 0;

    buf_len = httpd_req_get_url_query_len(req) + 1;
    if (buf_len > 1) {
        buf = malloc(buf_len);
        if (httpd_req_get_url_query_str(req, buf, buf_len) == ESP_OK) {
            char param[32];
            int k = -1, dosingA = -1, dosingB = -1, dosingPh = -1, dosingAux = -1, t = -1;

            if(httpd_query_key_value(buf, "k", param, sizeof(param)) == ESP_OK) {
                k = atoi(param);
            }
            if(httpd_query_key_value(buf, "dosingA", param, sizeof(param)) == ESP_OK) {
                dosingA = atoi(param);
            }
            if(httpd_query_key_value(buf, "dosingB", param, sizeof(param)) == ESP_OK) {
                dosingB = atoi(param);
            }
            if(httpd_query_key_value(buf, "dosingPh", param, sizeof(param)) == ESP_OK) {
                dosingPh = atoi(param);
            }
            if(httpd_query_key_value(buf, "dosingAux", param, sizeof(param)) == ESP_OK) {
                dosingAux = atoi(param);
            }
            if(httpd_query_key_value(buf, "t", param, sizeof(param)) == ESP_OK) {
                t = atoi(param);
            }

            ESP_LOGI(TAG, "FLOODING => k=%d dosingA=%d dosingB=%d dosingPh=%d dosingAux=%d t=%d", k, dosingA, dosingB, dosingPh, dosingAux, t);
            ok = start_solenoid(k, dosingA, dosingB, dosingPh, dosingAux, t);
        }
        free(buf);
    }

    const char *resp_str = ok ? "{ \"result\": \"solenoiding\" }\r\n" : "{ \"result\": \"error\" }\r\n";
    send_response(req, resp_str);

    return ESP_OK;
}

static esp_err_t pump_get_handler(httpd_req_t *req)
{
    char*  buf;
    size_t buf_len;
    int ok = 0;

    buf_len = httpd_req_get_url_query_len(req) + 1;
    if (buf_len > 1) {
        buf = malloc(buf_len);
        if (httpd_req_get_url_query_str(req, buf, buf_len) == ESP_OK) {
            char param[32];
            int k = -1, t = -1;

            if(httpd_query_key_value(buf, "k", param, sizeof(param)) == ESP_OK) {
                k = atoi(param);
            }
            if(httpd_query_key_value(buf, "t", param, sizeof(param)) == ESP_OK) {
                t = atoi(param);
            }
            ESP_LOGI(TAG, "DRAINING => k=%d t=%d", k, t);
            ok = start_pump(k, t);
        }
        free(buf);
    }

    const char *resp_str = ok ? "{ \"result\": \"pumping\" }\r\n" : "{ \"result\": \"error\" }\r\n";
    send_response(req, resp_str);

    return ESP_OK;
}

static esp_err_t stop_get_handler(httpd_req_t *req)
{
    ESP_LOGI(TAG, "STOPPING");

    stop_everything();

    send_response(req, "{ \"result\": \"stopping\" }\r\n");

    return ESP_OK;
}

static esp_err_t current_get_handler(httpd_req_t *req)
{
    ESP_LOGI(TAG, "CURRENT");

    static char resp_str[MAX_PUMP_PERIOD*6+100];
    strcpy(resp_str, "{ \"result\": \"current\", \"current\": [ ");
    int i, p = strlen(resp_str);
    for(i = last_pump_period - 1; i >= 0; i--) {
        char num[20];
        sprintf(num, "%d", last_pump_current[i]);
        num[6] = 0;
        strcpy(resp_str+p, num);
        p += strlen(num);

        if(i != 0) {
            resp_str[p++] = ',';
        }
        resp_str[p++] = ' ';
    }
    strcpy(resp_str+p, "] }\r\n");

    send_response(req, resp_str);

    return ESP_OK;
}

static esp_err_t sensors_get_handler(httpd_req_t *req)
{
    sr_set_and_write(SR_DEBUG_LED, 1);

    ESP_LOGI(TAG, "EC");

    const int nEc = 32, nPh = 128;
    int a, i, j, k, sum;
    int ph[2], ec[2], dcr[2], sg[2], temp[2], humidity[2];
    unsigned char am2301[5];

    // pH first, since the EC measurement might make that noisy for some time
    for(a = 0; a < 2; a++) {
        sum = 0;
        for(i = 0; i < nPh; i++) {
            sum += adc1_get_raw((a == 0) ? ADC_PH_0_SENSE : ADC_PH_1_SENSE);
        }
        double V = esp_adc_cal_raw_to_voltage(sum / nPh, &adc_chars_11db);
        // offset due to Vref, scale due to second-stage gain
        ph[a] = (int)((V - 1200)/3.3);
    }

    // Now EC

    ec[0] = 0;
    ec[1] = 0;

    for(i = 0; i < nEc; i++) {
        portDISABLE_INTERRUPTS();

        gpio_set_level(GPIO_EC_M_GATE, 1);

        ets_delay_us(10);

        ec[0] += adc1_get_raw(ADC_EC_0_SENSE);
        ec[1] += adc1_get_raw(ADC_EC_1_SENSE);

        ets_delay_us(90);

        gpio_set_level(GPIO_EC_M_GATE, 0);
        gpio_set_level(GPIO_EC_P_GATE, 1);

        ets_delay_us(10);

        // dummy reads to make delay match
        (void)adc1_get_raw(ADC_EC_0_SENSE);
        (void)adc1_get_raw(ADC_EC_1_SENSE);

        ets_delay_us(90);

        gpio_set_level(GPIO_EC_P_GATE, 0);

        portENABLE_INTERRUPTS();
    }

    for(a = 0; a < 2; a++) {
        // V = (3300 mV)*R/(1k + R)
        // V/(3300 mV) = A = R/(1k + R)
        // (1k + R)*A = R
        // 1k*A + R*A = R
        // 1k*A = R*(1 - A)
        // R = 1k*A/(1 - A)
        double V = esp_adc_cal_raw_to_voltage(ec[a] / nEc, &adc_chars_11db),
               A = V/3300.0,
               R = 1000.0*A/(1 - A),
               G = 1e6/R;

        ec[a] = G;
    }

    // DC resistance

    for(a = 0; a < 2; a++) {
        int gpio = (a == 0) ? GPIO_EC_M_GATE : GPIO_EC_P_GATE;
        gpio_set_level(gpio, 1);

        ets_delay_us(10*1000);

        sum = 0;
        for(i = 0; i < nPh; i++) {
            sum += adc1_get_raw(ADC_DCR_SENSE);
        }
        
        double V = esp_adc_cal_raw_to_voltage(sum / nPh, &adc_chars_11db),
               A = V/3300.0,
               R = 10000.0*A/(1-A);

        dcr[a] = (int)R;

        gpio_set_level(gpio, 0);
    }

    // digital sensors

    // temperature and humidity with AM2301
    for(a = 0; a < 2; a++) {
        int gout;
        if(a == 0) {
            gout = GPIO_DIG_0_OUT;
        } else {
            gout = GPIO_DIG_1_OUT;
        }

        temp[a] = -99999;
        humidity[a] = -99999;

        portDISABLE_INTERRUPTS();
        gpio_set_level(gout, 0);
        ets_delay_us(1000);
        gpio_set_level(gout, 1);

#define AWAIT_STATE_FOR_AT_MOST(gpio, state, tmax) \
    for(k = 0; k < tmax; k++) { \
        ets_delay_us(1); \
        if((!!gpio_get_level(gpio)) == state) break; \
    } \
    if(k >= tmax) goto fail;

        AWAIT_STATE_FOR_AT_MOST(gout, 0, 200);
        AWAIT_STATE_FOR_AT_MOST(gout, 1, 85);
        AWAIT_STATE_FOR_AT_MOST(gout, 0, 85);

        for(i = 0; i < 5; i++) {
            sum = 0;
            for(j = 0; j < 8; j++) {
                sum <<= 1;
                AWAIT_STATE_FOR_AT_MOST(gout, 1, 55);
                AWAIT_STATE_FOR_AT_MOST(gout, 0, 75);
                if(k > 49) sum |= 1;
            }
            am2301[i] = sum;
        }

        if(((am2301[0] + am2301[1] + am2301[2] + am2301[3]) & 0xff) !=
                                                                 am2301[4])
        {
            goto fail;
        }

        humidity[a] = (am2301[0] << 8) | am2301[1];

        temp[a] = (am2301[2] << 8) | am2301[3];
        if(temp[a] & 0x8000) {
            temp[a] &= 0x7fff;
            temp[a] = -temp[a];
        }

fail:
        portENABLE_INTERRUPTS();
    }

    // strain gauge with HX710
    for(a = 0; a < 2; a++) {
        int gck, gin;
        if(a == 0) {
            gck = GPIO_DIG_0_CK;
            gin = GPIO_DIG_0_IN;
        } else {
            gck = GPIO_DIG_1_CK;
            gin = GPIO_DIG_1_IN;
        }

        sum = 0;
        // 25 clocks means next conversion is diff input, 10 Hz
        // the HX710 has built-in temperature, but looked noisy so not
        // bothering for now
        portDISABLE_INTERRUPTS();
        for(i = 0; i < 25; i++) {
            gpio_set_level(gck, 1);
            ets_delay_us(1);

            sum <<= 1;
            if(gpio_get_level(gin)) {
                sum |= 1;
            }

            gpio_set_level(gck, 0);
            ets_delay_us(1);
        }
        portENABLE_INTERRUPTS();
        sum >>= 1; // 25 clocks, but only 24 bits
        if(sum & (1 << 23)) sum |= 0xff000000; // sign-extend
        sg[a] = sum;
    }

    // and print the response as JSON
    char resp_str[500];
    sprintf(resp_str, "{ \"result\": \"sensors\", "
                      "\"ec0\": %d, \"ec1\": %d, "
                      "\"ph0\": %d, \"ph1\": %d, "
                      "\"dcr0\": %d, \"dcr1\": %d, "
                      "\"temp0\": %.1f, \"humidity0\": %.1f, "
                      "\"temp1\": %.1f, \"humidity1\": %.1f, "
                      "\"sg0\": %d, \"sg1\": %d }\r\n",
        ec[0], ec[1], ph[0], ph[1], dcr[0], dcr[1],
        temp[0] / 10.0, humidity[0] / 10.0, 
        temp[1] / 10.0, humidity[1] / 10.0, 
        sg[0], sg[1]);

    send_response(req, resp_str);

    sr_set_and_write(SR_DEBUG_LED, 0);

    return ESP_OK;
}

static esp_err_t conf_get_handler(httpd_req_t *req)
{
    char*  buf;
    size_t buf_len;

    buf_len = httpd_req_get_url_query_len(req) + 1;
    if (buf_len > 1) {
        buf = malloc(buf_len);
        if (httpd_req_get_url_query_str(req, buf, buf_len) == ESP_OK) {
            char param[32];

            pwm_a_phase   = 0xfff;
            pwm_b_phase   = 0xfff;
            pwm_ph_phase  = 0xfff;
            pwm_aux_phase = 0xfff;
            run_big_pump = 1;

            if(httpd_query_key_value(buf, "dosingAPhase", param, sizeof(param)) == ESP_OK) {
                pwm_a_phase = atoi(param);
            }
            if(httpd_query_key_value(buf, "dosingBPhase", param, sizeof(param)) == ESP_OK) {
                pwm_b_phase = atoi(param);
            }
            if(httpd_query_key_value(buf, "dosingPhPhase", param, sizeof(param)) == ESP_OK) {
                pwm_ph_phase = atoi(param);
            }
            if(httpd_query_key_value(buf, "dosingAuxPhase", param, sizeof(param)) == ESP_OK) {
                pwm_aux_phase = atoi(param);
            }
            if(httpd_query_key_value(buf, "runBigPump", param, sizeof(param)) == ESP_OK) {
                run_big_pump = atoi(param);
            }
        }
        free(buf);
    }

    const char *resp_str = "{ \"result\": \"configured\" }\r\n";
    send_response(req, resp_str);

    return ESP_OK;
}


static const httpd_uri_t solenoid_uri = {
    .uri       = "/solenoid",
    .method    = HTTP_GET,
    .handler   = solenoid_get_handler,
};

static const httpd_uri_t pump_uri = {
    .uri       = "/pump",
    .method    = HTTP_GET,
    .handler   = pump_get_handler,
};

static const httpd_uri_t stop_uri = {
    .uri       = "/stop",
    .method    = HTTP_GET,
    .handler   = stop_get_handler,
};

static const httpd_uri_t current_uri = {
    .uri       = "/current",
    .method    = HTTP_GET,
    .handler   = current_get_handler,
};

static const httpd_uri_t sensors_uri = {
    .uri       = "/sensors",
    .method    = HTTP_GET,
    .handler   = sensors_get_handler,
};

static const httpd_uri_t conf_uri = {
    .uri       = "/conf",
    .method    = HTTP_GET,
    .handler   = conf_get_handler,
};


static httpd_handle_t start_webserver(void)
{
    httpd_handle_t server = NULL;
    httpd_config_t config = HTTPD_DEFAULT_CONFIG();

    // Start the httpd server
    ESP_LOGI(TAG, "Starting server on port: '%d'", config.server_port);
    if (httpd_start(&server, &config) == ESP_OK) {
        // Set URI handlers
        ESP_LOGI(TAG, "Registering URI handlers");
        httpd_register_uri_handler(server, &solenoid_uri);
        httpd_register_uri_handler(server, &pump_uri);
        httpd_register_uri_handler(server, &stop_uri);
        httpd_register_uri_handler(server, &current_uri);
        httpd_register_uri_handler(server, &sensors_uri);
        httpd_register_uri_handler(server, &conf_uri);
        return server;
    }

    ESP_LOGI(TAG, "Error starting server!");
    return NULL;
}

static void stop_webserver(httpd_handle_t server)
{
    // Stop the httpd server
    httpd_stop(server);
}

static void disconnect_handler(void* arg, esp_event_base_t event_base, 
                               int32_t event_id, void* event_data)
{
    httpd_handle_t* server = (httpd_handle_t*) arg;
    if (*server) {
        ESP_LOGI(TAG, "Stopping webserver");
        stop_webserver(*server);
        *server = NULL;
    }
}

static void connect_handler(void* arg, esp_event_base_t event_base, 
                            int32_t event_id, void* event_data)
{
    httpd_handle_t* server = (httpd_handle_t*) arg;
    if (*server == NULL) {
        ESP_LOGI(TAG, "Starting webserver");
        *server = start_webserver();
    }
}

void app_main(void)
{
    static httpd_handle_t server = NULL;

    ESP_ERROR_CHECK(nvs_flash_init());
    ESP_ERROR_CHECK(esp_netif_init());
    ESP_ERROR_CHECK(esp_event_loop_create_default());

    ESP_ERROR_CHECK(example_connect());

    ESP_ERROR_CHECK(esp_event_handler_register(IP_EVENT,
                    IP_EVENT_STA_GOT_IP, &connect_handler, &server));
    ESP_ERROR_CHECK(esp_event_handler_register(WIFI_EVENT,
                    WIFI_EVENT_STA_DISCONNECTED, &disconnect_handler, &server));

    // GPIO directions and ADC pins
    config_gpio();
    // The LEDC is designed for LEDs, but we use it for dosing pump PWM
    config_ledc();
    // Periodic 100 ms tick that sequences our coarse timing
    config_timer_tick();

    // Blink LED to show we're alive
    for(int i = 0; i < 3; i++) {
        sr_set_and_write(SR_DEBUG_LED, 1);
        ets_delay_us(200*1000);
        sr_set_and_write(SR_DEBUG_LED, 0);
        ets_delay_us(200*1000);
    }

    server = start_webserver();
}

