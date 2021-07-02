EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L hydromisc:ESP32-WROOM-32E U1
U 1 1 60334993
P 1900 1400
F 0 "U1" H 1950 1400 50  0000 C CNN
F 1 "ESP32-WROOM-32E" H 2550 1400 50  0000 C CNN
F 2 "hydromisc:HM_ESP32-WROOM-32E" H 1900 1400 50  0001 C CNN
F 3 "" H 1900 1400 50  0001 C CNN
	1    1900 1400
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:74HC594 IC2
U 1 1 60335E40
P 6150 1700
F 0 "IC2" H 6425 1773 50  0000 C CNN
F 1 "74HC594" H 6500 1750 50  0001 C CNN
F 2 "hydromisc:HM_SOIC-16" H 6150 1725 50  0001 C CNN
F 3 "" H 6150 1725 50  0001 C CNN
	1    6150 1700
	-1   0    0    -1  
$EndComp
$Comp
L hydromisc:74HC594 IC4
U 1 1 6036B8B3
P 6150 3200
F 0 "IC4" H 6425 3273 50  0000 C CNN
F 1 "74HC594" H 6500 3250 50  0001 C CNN
F 2 "hydromisc:HM_SOIC-16" H 6150 3225 50  0001 C CNN
F 3 "" H 6150 3225 50  0001 C CNN
	1    6150 3200
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 60E2356D
P 5450 2550
F 0 "#PWR0111" H 5450 2300 50  0001 C CNN
F 1 "GND" H 5455 2377 50  0000 C CNN
F 2 "" H 5450 2550 50  0001 C CNN
F 3 "" H 5450 2550 50  0001 C CNN
	1    5450 2550
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0112
U 1 1 60E2421F
P 5450 1750
F 0 "#PWR0112" H 5450 1600 50  0001 C CNN
F 1 "+3V3" H 5465 1923 50  0000 C CNN
F 2 "" H 5450 1750 50  0001 C CNN
F 3 "" H 5450 1750 50  0001 C CNN
	1    5450 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 60E273B3
P 5450 4450
F 0 "#PWR0113" H 5450 4200 50  0001 C CNN
F 1 "GND" H 5455 4277 50  0000 C CNN
F 2 "" H 5450 4450 50  0001 C CNN
F 3 "" H 5450 4450 50  0001 C CNN
	1    5450 4450
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0114
U 1 1 60E2795A
P 5450 3250
F 0 "#PWR0114" H 5450 3100 50  0001 C CNN
F 1 "+3V3" H 5465 3423 50  0000 C CNN
F 2 "" H 5450 3250 50  0001 C CNN
F 3 "" H 5450 3250 50  0001 C CNN
	1    5450 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3300 5450 3300
Wire Wire Line
	5450 3300 5450 3250
Wire Wire Line
	5500 4000 5450 4000
Wire Wire Line
	5500 2500 5450 2500
Wire Wire Line
	5450 2500 5450 2550
Wire Wire Line
	5500 1800 5450 1800
Wire Wire Line
	5450 1800 5450 1750
Wire Wire Line
	5500 2200 5350 2200
Wire Wire Line
	5350 2200 5350 3400
Wire Wire Line
	5350 3400 5500 3400
Text GLabel 5000 2300 0    50   Input ~ 0
SR_RCK
Text GLabel 5000 2400 0    50   Input ~ 0
SR_nRCLR
Text GLabel 5000 2000 0    50   Input ~ 0
SR_SCK
Text GLabel 5000 1900 0    50   Input ~ 0
SR_SI
Wire Wire Line
	5500 2100 5450 2100
Wire Wire Line
	5450 2100 5450 1800
Connection ~ 5450 1800
Wire Wire Line
	5500 3600 5450 3600
Wire Wire Line
	5450 3600 5450 3300
Connection ~ 5450 3300
Text GLabel 5000 3500 0    50   Input ~ 0
SR_SCK
Text GLabel 5000 3800 0    50   Input ~ 0
SR_RCK
Text GLabel 5000 3900 0    50   Input ~ 0
SR_nRCLR
NoConn ~ 5500 3700
$Comp
L power:GND #PWR0115
U 1 1 60E2AB63
P 2150 3250
F 0 "#PWR0115" H 2150 3000 50  0001 C CNN
F 1 "GND" H 2155 3077 50  0000 C CNN
F 2 "" H 2150 3250 50  0001 C CNN
F 3 "" H 2150 3250 50  0001 C CNN
	1    2150 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 60E2B097
P 3850 1250
F 0 "#PWR0116" H 3850 1000 50  0001 C CNN
F 1 "GND" H 3855 1077 50  0000 C CNN
F 2 "" H 3850 1250 50  0001 C CNN
F 3 "" H 3850 1250 50  0001 C CNN
	1    3850 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1100 3650 1550
Wire Wire Line
	3650 1550 3600 1550
Wire Wire Line
	1800 1550 1750 1550
Wire Wire Line
	1750 1550 1750 1100
Wire Wire Line
	1750 1100 3100 1100
Wire Wire Line
	3100 1350 3100 1100
Connection ~ 3100 1100
Wire Wire Line
	2300 3100 2300 3150
$Comp
L power:+3V3 #PWR0117
U 1 1 60E2E7FF
P 1550 1400
F 0 "#PWR0117" H 1550 1250 50  0001 C CNN
F 1 "+3V3" H 1565 1573 50  0000 C CNN
F 2 "" H 1550 1400 50  0001 C CNN
F 3 "" H 1550 1400 50  0001 C CNN
	1    1550 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1400 1550 1650
Wire Wire Line
	1550 1650 1800 1650
Text GLabel 3600 1850 2    50   Input ~ 0
ESP32_TXD0
Text GLabel 3600 1950 2    50   Input ~ 0
ESP32_RXD0
Text GLabel 1800 1750 0    50   Input ~ 0
ESP32_EN
Text GLabel 3600 2850 2    50   Input ~ 0
ESP32_IO0
Text GLabel 6250 1800 2    50   Input ~ 0
G_SOL_4
Text GLabel 6250 1900 2    50   Input ~ 0
G_SOL_3
Text GLabel 6250 2000 2    50   Input ~ 0
G_SOL_5
Text GLabel 6250 2300 2    50   Input ~ 0
G_SOL_1
Text GLabel 6250 2400 2    50   Input ~ 0
G_SOL_7
Text GLabel 6250 2500 2    50   Input ~ 0
G_SOL_0
Text GLabel 6250 3300 2    50   Input ~ 0
G_PUMP_0
Text GLabel 6250 3400 2    50   Input ~ 0
G_PUMP_1
Text GLabel 6250 3500 2    50   Input ~ 0
G_PUMP_2
Text GLabel 6250 3600 2    50   Input ~ 0
G_PUMP_3
Text GLabel 6250 3700 2    50   Input ~ 0
G_PUMP_4
Text GLabel 6250 3800 2    50   Input ~ 0
G_PUMP_5
Text GLabel 6250 3900 2    50   Input ~ 0
G_BIG_PUMP
Text GLabel 3600 2350 2    50   Input ~ 0
G_DOSING_A
Text GLabel 3600 2250 2    50   Input ~ 0
G_DOSING_B
Text GLabel 3600 2050 2    50   Input ~ 0
G_DOSING_PH
Text GLabel 3600 1750 2    50   Input ~ 0
G_DOSING_AUX
Text GLabel 1800 1850 0    50   Input ~ 0
PH_0
Text GLabel 1800 1950 0    50   Input ~ 0
PH_1
Text GLabel 1800 2150 0    50   Input ~ 0
ISENSE
Text GLabel 1800 2250 0    50   Input ~ 0
DCR
$Comp
L Device:R_US R?
U 1 1 60E3CCB0
P 5200 4200
AR Path="/602E8AF8/60E3CCB0" Ref="R?"  Part="1" 
AR Path="/603346A0/60E3CCB0" Ref="R29"  Part="1" 
F 0 "R29" H 5268 4246 50  0000 L CNN
F 1 "1k" H 5268 4155 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 5240 4190 50  0001 C CNN
F 3 "~" H 5200 4200 50  0001 C CNN
	1    5200 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 4000 5450 4400
Wire Wire Line
	5200 4050 5200 3900
Wire Wire Line
	5200 3900 5500 3900
Wire Wire Line
	5200 3900 5000 3900
Connection ~ 5200 3900
Wire Wire Line
	5200 4350 5200 4400
Wire Wire Line
	5200 4400 5450 4400
Connection ~ 5450 4400
Wire Wire Line
	5450 4400 5450 4450
Wire Wire Line
	5000 3800 5500 3800
Wire Wire Line
	5000 3500 5500 3500
Wire Wire Line
	5000 2400 5500 2400
Wire Wire Line
	5000 2300 5500 2300
Wire Wire Line
	5000 2000 5500 2000
Wire Wire Line
	5000 1900 5500 1900
$Comp
L Device:R_US R?
U 1 1 60E4534D
P 6300 4200
AR Path="/602E8AF8/60E4534D" Ref="R?"  Part="1" 
AR Path="/603346A0/60E4534D" Ref="R30"  Part="1" 
F 0 "R30" H 6368 4246 50  0000 L CNN
F 1 "1k" H 6368 4155 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 6340 4190 50  0001 C CNN
F 3 "~" H 6300 4200 50  0001 C CNN
	1    6300 4200
	1    0    0    -1  
$EndComp
Text GLabel 1800 2850 0    50   Input ~ 0
SR_nRCLR
Text GLabel 1800 2750 0    50   Input ~ 0
SR_RCK
Text GLabel 1800 2650 0    50   Input ~ 0
SR_SCK
Text GLabel 1800 2550 0    50   Input ~ 0
SR_SI
Wire Wire Line
	3100 1100 3650 1100
Wire Wire Line
	3650 1100 3850 1100
Wire Wire Line
	3850 1100 3850 1250
Connection ~ 3650 1100
$Comp
L hydromisc:opamp IC5
U 2 1 610073D4
P 2050 6900
F 0 "IC5" H 2250 7050 50  0000 C CNN
F 1 "opamp" H 2350 7150 50  0001 C CNN
F 2 "hydromisc:HM_SOIC-14" H 2050 6900 50  0001 C CNN
F 3 "" H 2050 6900 50  0001 C CNN
	2    2050 6900
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:opamp IC5
U 3 1 610093AB
P 2050 5400
F 0 "IC5" H 2250 5550 50  0000 C CNN
F 1 "opamp" H 2350 5650 50  0001 C CNN
F 2 "hydromisc:HM_SOIC-14" H 2050 5400 50  0001 C CNN
F 3 "" H 2050 5400 50  0001 C CNN
	3    2050 5400
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:opamp IC5
U 5 1 6100B6CF
P 4850 6200
F 0 "IC5" H 5000 6423 50  0000 C CNN
F 1 "opamp" H 5150 6450 50  0001 C CNN
F 2 "hydromisc:HM_SOIC-14" H 4850 6200 50  0001 C CNN
F 3 "" H 4850 6200 50  0001 C CNN
	5    4850 6200
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:opamp IC5
U 4 1 6100C12E
P 3150 5500
F 0 "IC5" H 3350 5650 50  0000 C CNN
F 1 "opamp" H 3450 5750 50  0001 C CNN
F 2 "hydromisc:HM_SOIC-14" H 3150 5500 50  0001 C CNN
F 3 "" H 3150 5500 50  0001 C CNN
	4    3150 5500
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:opamp IC5
U 1 1 6100CE4C
P 3150 7000
F 0 "IC5" H 3250 7150 50  0000 L CNN
F 1 "opamp" H 3450 7250 50  0001 C CNN
F 2 "hydromisc:HM_SOIC-14" H 3150 7000 50  0001 C CNN
F 3 "" H 3150 7000 50  0001 C CNN
	1    3150 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 5100 1900 5300
Wire Wire Line
	1900 5300 1950 5300
Wire Wire Line
	1900 6600 1900 6800
Wire Wire Line
	1900 6800 1950 6800
Wire Wire Line
	3050 5400 2900 5400
Wire Wire Line
	3050 6900 2900 6900
Wire Wire Line
	3000 7100 3050 7100
Wire Wire Line
	3000 5600 3050 5600
$Comp
L Device:R_US R?
U 1 1 61023DE2
P 3300 5150
AR Path="/602E8AF8/61023DE2" Ref="R?"  Part="1" 
AR Path="/603346A0/61023DE2" Ref="R33"  Part="1" 
F 0 "R33" H 3368 5196 50  0000 L CNN
F 1 "33k" H 3368 5105 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 3340 5140 50  0001 C CNN
F 3 "~" H 3300 5150 50  0001 C CNN
	1    3300 5150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 61025207
P 3300 6650
AR Path="/602E8AF8/61025207" Ref="R?"  Part="1" 
AR Path="/603346A0/61025207" Ref="R34"  Part="1" 
F 0 "R34" H 3368 6696 50  0000 L CNN
F 1 "33k" H 3368 6605 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 3340 6640 50  0001 C CNN
F 3 "~" H 3300 6650 50  0001 C CNN
	1    3300 6650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3150 5150 2900 5150
Wire Wire Line
	2900 5150 2900 5400
Wire Wire Line
	3450 5150 3600 5150
Wire Wire Line
	3600 5150 3600 5500
Wire Wire Line
	3600 5500 3550 5500
$Comp
L Device:R_US R?
U 1 1 610283CC
P 2700 5400
AR Path="/602E8AF8/610283CC" Ref="R?"  Part="1" 
AR Path="/603346A0/610283CC" Ref="R31"  Part="1" 
F 0 "R31" H 2768 5446 50  0000 L CNN
F 1 "10k" H 2768 5355 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 2740 5390 50  0001 C CNN
F 3 "~" H 2700 5400 50  0001 C CNN
	1    2700 5400
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 61028FDB
P 2700 6900
AR Path="/602E8AF8/61028FDB" Ref="R?"  Part="1" 
AR Path="/603346A0/61028FDB" Ref="R32"  Part="1" 
F 0 "R32" H 2768 6946 50  0000 L CNN
F 1 "10k" H 2768 6855 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 2740 6890 50  0001 C CNN
F 3 "~" H 2700 6900 50  0001 C CNN
	1    2700 6900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3150 6650 2900 6650
Wire Wire Line
	2900 6650 2900 6900
Wire Wire Line
	2850 6900 2900 6900
Connection ~ 2900 6900
Wire Wire Line
	2850 5400 2900 5400
Connection ~ 2900 5400
Wire Wire Line
	3550 7000 3600 7000
Wire Wire Line
	3600 7000 3600 6650
Wire Wire Line
	3600 6650 3450 6650
Wire Wire Line
	3650 7000 3600 7000
Connection ~ 3600 7000
Wire Wire Line
	3650 5500 3600 5500
Connection ~ 3600 5500
$Comp
L Device:C C?
U 1 1 6103C17E
P 3250 4800
AR Path="/602E8AF8/6103C17E" Ref="C?"  Part="1" 
AR Path="/603346A0/6103C17E" Ref="C17"  Part="1" 
F 0 "C17" H 3365 4846 50  0000 L CNN
F 1 "100n" H 3365 4755 50  0000 L CNN
F 2 "hydromisc:HM_0603" H 3288 4650 50  0001 C CNN
F 3 "~" H 3250 4800 50  0001 C CNN
	1    3250 4800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3100 4800 2900 4800
Wire Wire Line
	2900 4800 2900 5150
Connection ~ 2900 5150
Wire Wire Line
	3400 4800 3600 4800
Wire Wire Line
	3600 4800 3600 5150
Connection ~ 3600 5150
$Comp
L Device:C C?
U 1 1 6104629E
P 3250 6300
AR Path="/602E8AF8/6104629E" Ref="C?"  Part="1" 
AR Path="/603346A0/6104629E" Ref="C19"  Part="1" 
F 0 "C19" H 3365 6346 50  0000 L CNN
F 1 "100n" H 3365 6255 50  0000 L CNN
F 2 "hydromisc:HM_0603" H 3288 6150 50  0001 C CNN
F 3 "~" H 3250 6300 50  0001 C CNN
	1    3250 6300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3100 6300 2900 6300
Wire Wire Line
	2900 6300 2900 6650
Connection ~ 2900 6650
Wire Wire Line
	3400 6300 3600 6300
Wire Wire Line
	3600 6300 3600 6650
Connection ~ 3600 6650
$Comp
L Device:R_US R?
U 1 1 6104F3DC
P 3800 5500
AR Path="/602E8AF8/6104F3DC" Ref="R?"  Part="1" 
AR Path="/603346A0/6104F3DC" Ref="R38"  Part="1" 
F 0 "R38" H 3868 5546 50  0000 L CNN
F 1 "1k" H 3868 5455 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 3840 5490 50  0001 C CNN
F 3 "~" H 3800 5500 50  0001 C CNN
	1    3800 5500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6104FB30
P 3800 7000
AR Path="/602E8AF8/6104FB30" Ref="R?"  Part="1" 
AR Path="/603346A0/6104FB30" Ref="R39"  Part="1" 
F 0 "R39" H 3868 7046 50  0000 L CNN
F 1 "1k" H 3868 6955 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 3840 6990 50  0001 C CNN
F 3 "~" H 3800 7000 50  0001 C CNN
	1    3800 7000
	0    -1   -1   0   
$EndComp
Text GLabel 4200 5500 2    50   Input ~ 0
PH_0
Text GLabel 4200 7000 2    50   Input ~ 0
PH_1
$Comp
L power:+5V #PWR0120
U 1 1 61051240
P 4850 5650
F 0 "#PWR0120" H 4850 5500 50  0001 C CNN
F 1 "+5V" H 4865 5823 50  0000 C CNN
F 2 "" H 4850 5650 50  0001 C CNN
F 3 "" H 4850 5650 50  0001 C CNN
	1    4850 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 61051C60
P 5750 6650
F 0 "#PWR0121" H 5750 6400 50  0001 C CNN
F 1 "GND" H 5755 6477 50  0000 C CNN
F 2 "" H 5750 6650 50  0001 C CNN
F 3 "" H 5750 6650 50  0001 C CNN
	1    5750 6650
	1    0    0    -1  
$EndComp
NoConn ~ 3600 2150
NoConn ~ 2500 3100
NoConn ~ 2600 3100
NoConn ~ 2700 3100
NoConn ~ 2800 3100
NoConn ~ 2900 3100
NoConn ~ 3000 3100
$Comp
L hydromisc:vref-diode IC6
U 1 1 6107B039
P 5150 6250
F 0 "IC6" H 5478 6150 50  0000 L CNN
F 1 "vref-diode" H 5450 6300 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 5200 6300 50  0001 C CNN
F 3 "" H 5200 6300 50  0001 C CNN
	1    5150 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6107B6E4
P 5300 5900
AR Path="/602E8AF8/6107B6E4" Ref="R?"  Part="1" 
AR Path="/603346A0/6107B6E4" Ref="R44"  Part="1" 
F 0 "R44" H 5368 5946 50  0000 L CNN
F 1 "1k" H 5368 5855 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 5340 5890 50  0001 C CNN
F 3 "~" H 5300 5900 50  0001 C CNN
	1    5300 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6107CC3B
P 5750 6350
AR Path="/602E8AF8/6107CC3B" Ref="C?"  Part="1" 
AR Path="/603346A0/6107CC3B" Ref="C25"  Part="1" 
F 0 "C25" H 5865 6396 50  0000 L CNN
F 1 "100n" H 5865 6305 50  0000 L CNN
F 2 "hydromisc:HM_0603" H 5788 6200 50  0001 C CNN
F 3 "~" H 5750 6350 50  0001 C CNN
	1    5750 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 6500 5750 6600
Wire Wire Line
	5750 6600 5300 6600
Wire Wire Line
	5300 6600 5300 6550
Connection ~ 5750 6600
Wire Wire Line
	5750 6600 5750 6650
Wire Wire Line
	5300 6150 5300 6100
Wire Wire Line
	5300 6100 5750 6100
Wire Wire Line
	5750 6100 5750 6200
Connection ~ 5300 6100
Wire Wire Line
	5300 6100 5300 6050
Wire Wire Line
	4850 5650 4850 5700
Wire Wire Line
	5300 5750 5300 5700
Wire Wire Line
	5300 5700 4850 5700
Connection ~ 4850 5700
Wire Wire Line
	4850 5700 4850 6000
Wire Wire Line
	5300 6600 4850 6600
Wire Wire Line
	4850 6600 4850 6400
Connection ~ 5300 6600
Wire Wire Line
	5800 6100 5750 6100
Connection ~ 5750 6100
Text GLabel 5800 6100 2    50   Input ~ 0
Vref
Text GLabel 2400 3100 3    50   Input ~ 0
DIG_0CK
Text GLabel 3200 3100 3    50   Input ~ 0
DIG_0IN
Text GLabel 3600 2750 2    50   Input ~ 0
DIG_0OUT
Wire Wire Line
	2150 3250 2150 3150
Wire Wire Line
	2150 3150 2300 3150
$Comp
L hydromisc:COAX_CONNECTOR CN3
U 1 1 610B4AAB
P 1250 5350
F 0 "CN3" H 1133 5373 50  0000 C CNN
F 1 "COAX_CONNECTOR" H 1400 5350 50  0001 C CNN
F 2 "hydromisc:HM_BNC_MOLEX_TH_RA" H 1250 5350 50  0001 C CNN
F 3 "" H 1250 5350 50  0001 C CNN
	1    1250 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 610B584A
P 1750 5500
AR Path="/602E8AF8/610B584A" Ref="R?"  Part="1" 
AR Path="/603346A0/610B584A" Ref="R40"  Part="1" 
F 0 "R40" H 1818 5546 50  0000 L CNN
F 1 "1k" H 1818 5455 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 1790 5490 50  0001 C CNN
F 3 "~" H 1750 5500 50  0001 C CNN
	1    1750 5500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 610B6166
P 1750 7000
AR Path="/602E8AF8/610B6166" Ref="R?"  Part="1" 
AR Path="/603346A0/610B6166" Ref="R42"  Part="1" 
F 0 "R42" H 1818 7046 50  0000 L CNN
F 1 "1k" H 1818 6955 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 1790 6990 50  0001 C CNN
F 3 "~" H 1750 7000 50  0001 C CNN
	1    1750 7000
	0    -1   -1   0   
$EndComp
$Comp
L hydromisc:COAX_CONNECTOR CN14
U 1 1 610B66D8
P 1250 6850
F 0 "CN14" H 1133 6873 50  0000 C CNN
F 1 "COAX_CONNECTOR" H 1400 6850 50  0001 C CNN
F 2 "hydromisc:HM_BNC_MOLEX_TH_RA" H 1250 6850 50  0001 C CNN
F 3 "" H 1250 6850 50  0001 C CNN
	1    1250 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 5500 1950 5500
Wire Wire Line
	1900 7000 1950 7000
Text GLabel 3600 2650 2    50   Input ~ 0
DIG_1CK
Text GLabel 3600 2550 2    50   Input ~ 0
DIG_1IN
Text GLabel 3600 1650 2    50   Input ~ 0
DIG_1OUT
$Comp
L hydromisc:diode-led LED1
U 1 1 610EED08
P 6350 4400
F 0 "LED1" V 6500 4428 50  0000 L CNN
F 1 "diode-led" H 6750 4450 50  0001 C CNN
F 2 "hydromisc:HM_LED_CUBE_3MM" V 6650 4450 50  0001 C CNN
F 3 "" V 6650 4450 50  0001 C CNN
	1    6350 4400
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 610EF420
P 6300 4750
F 0 "#PWR0122" H 6300 4500 50  0001 C CNN
F 1 "GND" H 6305 4577 50  0000 C CNN
F 2 "" H 6300 4750 50  0001 C CNN
F 3 "" H 6300 4750 50  0001 C CNN
	1    6300 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 4700 6300 4750
Wire Wire Line
	6300 4350 6300 4400
Wire Wire Line
	6250 4000 6300 4000
Wire Wire Line
	6300 4000 6300 4050
$Comp
L hydromisc:HEADER_6 CN15
U 1 1 611410F8
P 1200 3900
F 0 "CN15" H 1158 4073 50  0000 C CNN
F 1 "HEADER_6" H 1400 4050 50  0001 C CNN
F 2 "hydromisc:HM_HEADER_6_0.100_INCH" H 1000 4000 50  0001 C CNN
F 3 "" H 1000 4000 50  0001 C CNN
	1    1200 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 61141947
P 1400 4500
F 0 "#PWR0124" H 1400 4250 50  0001 C CNN
F 1 "GND" H 1405 4327 50  0000 C CNN
F 2 "" H 1400 4500 50  0001 C CNN
F 3 "" H 1400 4500 50  0001 C CNN
	1    1400 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 3900 1400 3900
Wire Wire Line
	1400 3900 1400 4500
Wire Wire Line
	1300 4100 1350 4100
Wire Wire Line
	1350 4100 1350 3650
$Comp
L power:+3V3 #PWR0125
U 1 1 6114B426
P 1350 3650
F 0 "#PWR0125" H 1350 3500 50  0001 C CNN
F 1 "+3V3" H 1365 3823 50  0000 C CNN
F 2 "" H 1350 3650 50  0001 C CNN
F 3 "" H 1350 3650 50  0001 C CNN
	1    1350 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 4000 1300 4000
Wire Wire Line
	1600 4200 1300 4200
Wire Wire Line
	1600 4300 1300 4300
Wire Wire Line
	1600 4400 1300 4400
Text GLabel 1600 4000 2    50   Input ~ 0
ESP32_IO0
Text GLabel 1600 4200 2    50   Input ~ 0
ESP32_TXD0
Text GLabel 1600 4300 2    50   Input ~ 0
ESP32_RXD0
Text GLabel 1600 4400 2    50   Input ~ 0
ESP32_EN
Text GLabel 1800 2450 0    50   Input ~ 0
G_EC_M
Text GLabel 3100 3100 3    50   Input ~ 0
G_EC_P
$Comp
L hydromisc:MOLEX_2x2 CN?
U 1 1 6125BA75
P 9750 4100
AR Path="/6036C67E/6125BA75" Ref="CN?"  Part="1" 
AR Path="/603346A0/6125BA75" Ref="CN16"  Part="1" 
F 0 "CN16" H 9900 4173 50  0000 C CNN
F 1 "MOLEX_2x2" H 10200 4150 50  0001 C CNN
F 2 "hydromisc:HM_MOLEX_172448_2x2" H 9800 4100 50  0001 C CNN
F 3 "" H 9800 4100 50  0001 C CNN
	1    9750 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6125BA7B
P 9250 3900
AR Path="/602E8AF8/6125BA7B" Ref="C?"  Part="1" 
AR Path="/6036C67E/6125BA7B" Ref="C?"  Part="1" 
AR Path="/603346A0/6125BA7B" Ref="C29"  Part="1" 
F 0 "C29" H 9365 3946 50  0000 L CNN
F 1 "22u" H 9365 3855 50  0000 L CNN
F 2 "hydromisc:HM_1206" H 9288 3750 50  0001 C CNN
F 3 "~" H 9250 3900 50  0001 C CNN
	1    9250 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6125BA81
P 10300 3900
AR Path="/602E8AF8/6125BA81" Ref="C?"  Part="1" 
AR Path="/6036C67E/6125BA81" Ref="C?"  Part="1" 
AR Path="/603346A0/6125BA81" Ref="C30"  Part="1" 
F 0 "C30" H 10415 3946 50  0000 L CNN
F 1 "22u" H 10415 3855 50  0000 L CNN
F 2 "hydromisc:HM_1206" H 10338 3750 50  0001 C CNN
F 3 "~" H 10300 3900 50  0001 C CNN
	1    10300 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 4150 9250 4050
Wire Wire Line
	10150 4150 10300 4150
Wire Wire Line
	10300 4150 10300 4050
Wire Wire Line
	9250 3750 9250 3700
Wire Wire Line
	9250 3700 9200 3700
Wire Wire Line
	10300 3750 10300 3700
Wire Wire Line
	10300 3700 10250 3700
Text GLabel 9200 3700 0    50   Input ~ 0
EC_1P
Text GLabel 10250 3700 0    50   Input ~ 0
EC_1M
$Comp
L power:GND #PWR?
U 1 1 6125BA91
P 10300 4750
AR Path="/6036C67E/6125BA91" Ref="#PWR?"  Part="1" 
AR Path="/603346A0/6125BA91" Ref="#PWR0119"  Part="1" 
F 0 "#PWR0119" H 10300 4500 50  0001 C CNN
F 1 "GND" H 10305 4577 50  0000 C CNN
F 2 "" H 10300 4750 50  0001 C CNN
F 3 "" H 10300 4750 50  0001 C CNN
	1    10300 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6125BA98
P 7950 2600
AR Path="/6036C67E/6125BA98" Ref="#PWR?"  Part="1" 
AR Path="/603346A0/6125BA98" Ref="#PWR0128"  Part="1" 
F 0 "#PWR0128" H 7950 2350 50  0001 C CNN
F 1 "GND" H 7955 2427 50  0000 C CNN
F 2 "" H 7950 2600 50  0001 C CNN
F 3 "" H 7950 2600 50  0001 C CNN
	1    7950 2600
	1    0    0    -1  
$EndComp
Text GLabel 8650 1450 2    50   Input ~ 0
DIG_0CK
$Comp
L hydromisc:MOLEX_2x3 CN?
U 1 1 6125BA9F
P 8150 1400
AR Path="/6036C67E/6125BA9F" Ref="CN?"  Part="1" 
AR Path="/603346A0/6125BA9F" Ref="CN12"  Part="1" 
F 0 "CN12" H 8300 1473 50  0000 C CNN
F 1 "MOLEX_2x3" H 8600 1450 50  0001 C CNN
F 2 "hydromisc:HM_MOLEX_172448_2x3" H 8200 1400 50  0001 C CNN
F 3 "" H 8200 1400 50  0001 C CNN
	1    8150 1400
	1    0    0    -1  
$EndComp
Text GLabel 8650 1550 2    50   Input ~ 0
DIG_0IN
Text GLabel 8650 1650 2    50   Input ~ 0
DIG_0OUT
$Comp
L power:+12V #PWR?
U 1 1 6125BAA7
P 7850 1350
AR Path="/6036C67E/6125BAA7" Ref="#PWR?"  Part="1" 
AR Path="/603346A0/6125BAA7" Ref="#PWR0129"  Part="1" 
F 0 "#PWR0129" H 7850 1200 50  0001 C CNN
F 1 "+12V" H 7865 1523 50  0000 C CNN
F 2 "" H 7850 1350 50  0001 C CNN
F 3 "" H 7850 1350 50  0001 C CNN
	1    7850 1350
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:MOLEX_2x3 CN?
U 1 1 6125BAAD
P 8150 2250
AR Path="/6036C67E/6125BAAD" Ref="CN?"  Part="1" 
AR Path="/603346A0/6125BAAD" Ref="CN13"  Part="1" 
F 0 "CN13" H 8300 2323 50  0000 C CNN
F 1 "MOLEX_2x3" H 8600 2300 50  0001 C CNN
F 2 "hydromisc:HM_MOLEX_172448_2x3" H 8200 2250 50  0001 C CNN
F 3 "" H 8200 2250 50  0001 C CNN
	1    8150 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 2500 7950 2500
Wire Wire Line
	7950 2500 7950 2600
Wire Wire Line
	8050 1650 7950 1650
Connection ~ 7950 2500
$Comp
L power:+3V3 #PWR?
U 1 1 6125BAB7
P 7600 950
AR Path="/6036C67E/6125BAB7" Ref="#PWR?"  Part="1" 
AR Path="/603346A0/6125BAB7" Ref="#PWR0130"  Part="1" 
F 0 "#PWR0130" H 7600 800 50  0001 C CNN
F 1 "+3V3" H 7615 1123 50  0000 C CNN
F 2 "" H 7600 950 50  0001 C CNN
F 3 "" H 7600 950 50  0001 C CNN
	1    7600 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 1450 7850 1450
Wire Wire Line
	7850 1450 7850 1350
Wire Wire Line
	8050 2300 7850 2300
Wire Wire Line
	8050 1550 7600 1550
Wire Wire Line
	8050 2400 7600 2400
Text GLabel 8650 2300 2    50   Input ~ 0
DIG_1CK
Text GLabel 8650 2400 2    50   Input ~ 0
DIG_1IN
Text GLabel 8650 2500 2    50   Input ~ 0
DIG_1OUT
$Comp
L Device:R_US R?
U 1 1 6125BAC5
P 8600 1250
AR Path="/6036C67E/6125BAC5" Ref="R?"  Part="1" 
AR Path="/603346A0/6125BAC5" Ref="R35"  Part="1" 
F 0 "R35" H 8532 1204 50  0000 R CNN
F 1 "1k" H 8532 1295 50  0000 R CNN
F 2 "hydromisc:HM_0603" V 8640 1240 50  0001 C CNN
F 3 "~" H 8600 1250 50  0001 C CNN
	1    8600 1250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6125BACB
P 8600 2100
AR Path="/6036C67E/6125BACB" Ref="R?"  Part="1" 
AR Path="/603346A0/6125BACB" Ref="R36"  Part="1" 
F 0 "R36" H 8532 2054 50  0000 R CNN
F 1 "1k" H 8532 2145 50  0000 R CNN
F 2 "hydromisc:HM_0603" V 8640 2090 50  0001 C CNN
F 3 "~" H 8600 2100 50  0001 C CNN
	1    8600 2100
	-1   0    0    1   
$EndComp
Wire Wire Line
	7600 950  7600 1000
Wire Wire Line
	8600 1100 8600 1000
Wire Wire Line
	8600 1000 7600 1000
Connection ~ 7600 1000
Wire Wire Line
	7600 1000 7600 1550
Wire Wire Line
	8550 1450 8600 1450
Wire Wire Line
	8600 1400 8600 1450
Connection ~ 8600 1450
Wire Wire Line
	8600 1450 8650 1450
Wire Wire Line
	8550 1550 8650 1550
Wire Wire Line
	8550 1650 8650 1650
Wire Wire Line
	7950 1650 7950 2500
Wire Wire Line
	7850 1450 7850 2300
Connection ~ 7850 1450
Wire Wire Line
	7600 1550 7600 1850
Connection ~ 7600 1550
Wire Wire Line
	8600 1950 8600 1850
Wire Wire Line
	8600 1850 7600 1850
Connection ~ 7600 1850
Wire Wire Line
	7600 1850 7600 2400
Wire Wire Line
	8550 2300 8600 2300
Wire Wire Line
	8600 2250 8600 2300
Connection ~ 8600 2300
Wire Wire Line
	8600 2300 8650 2300
Wire Wire Line
	8550 2400 8650 2400
Wire Wire Line
	8550 2500 8650 2500
$Comp
L Device:R_US R?
U 1 1 6125BAF1
P 9250 3400
AR Path="/6036C67E/6125BAF1" Ref="R?"  Part="1" 
AR Path="/603346A0/6125BAF1" Ref="R46"  Part="1" 
F 0 "R46" H 9318 3446 50  0000 L CNN
F 1 "1k" H 9318 3355 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 9290 3390 50  0001 C CNN
F 3 "~" H 9250 3400 50  0001 C CNN
	1    9250 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6125BAF7
P 10300 3400
AR Path="/6036C67E/6125BAF7" Ref="R?"  Part="1" 
AR Path="/603346A0/6125BAF7" Ref="R47"  Part="1" 
F 0 "R47" H 10368 3446 50  0000 L CNN
F 1 "1k" H 10368 3355 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 10340 3390 50  0001 C CNN
F 3 "~" H 10300 3400 50  0001 C CNN
	1    10300 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 6125BAFD
P 9250 3150
AR Path="/6036C67E/6125BAFD" Ref="#PWR?"  Part="1" 
AR Path="/603346A0/6125BAFD" Ref="#PWR0131"  Part="1" 
F 0 "#PWR0131" H 9250 3000 50  0001 C CNN
F 1 "+3V3" H 9265 3323 50  0000 C CNN
F 2 "" H 9250 3150 50  0001 C CNN
F 3 "" H 9250 3150 50  0001 C CNN
	1    9250 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 3150 9250 3200
Wire Wire Line
	10300 3200 10300 3250
Connection ~ 9250 3200
Wire Wire Line
	9250 3200 9250 3250
Wire Wire Line
	10300 3550 10300 3700
Connection ~ 10300 3700
Wire Wire Line
	9250 3550 9250 3700
Connection ~ 9250 3700
Wire Wire Line
	9250 4150 9650 4150
Wire Wire Line
	10150 4250 10300 4250
$Comp
L hydromisc:MOLEX_2x2 CN?
U 1 1 61285A08
P 8050 4100
AR Path="/6036C67E/61285A08" Ref="CN?"  Part="1" 
AR Path="/603346A0/61285A08" Ref="CN4"  Part="1" 
F 0 "CN4" H 8200 4173 50  0000 C CNN
F 1 "MOLEX_2x2" H 8500 4150 50  0001 C CNN
F 2 "hydromisc:HM_MOLEX_172448_2x2" H 8100 4100 50  0001 C CNN
F 3 "" H 8100 4100 50  0001 C CNN
	1    8050 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61285A0E
P 7550 3900
AR Path="/602E8AF8/61285A0E" Ref="C?"  Part="1" 
AR Path="/6036C67E/61285A0E" Ref="C?"  Part="1" 
AR Path="/603346A0/61285A0E" Ref="C18"  Part="1" 
F 0 "C18" H 7665 3946 50  0000 L CNN
F 1 "22u" H 7665 3855 50  0000 L CNN
F 2 "hydromisc:HM_1206" H 7588 3750 50  0001 C CNN
F 3 "~" H 7550 3900 50  0001 C CNN
	1    7550 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61285A14
P 8600 3900
AR Path="/602E8AF8/61285A14" Ref="C?"  Part="1" 
AR Path="/6036C67E/61285A14" Ref="C?"  Part="1" 
AR Path="/603346A0/61285A14" Ref="C20"  Part="1" 
F 0 "C20" H 8715 3946 50  0000 L CNN
F 1 "22u" H 8715 3855 50  0000 L CNN
F 2 "hydromisc:HM_1206" H 8638 3750 50  0001 C CNN
F 3 "~" H 8600 3900 50  0001 C CNN
	1    8600 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 4150 7550 4050
Wire Wire Line
	8450 4150 8600 4150
Wire Wire Line
	8600 4150 8600 4050
Wire Wire Line
	7550 3750 7550 3700
Wire Wire Line
	7550 3700 7500 3700
Wire Wire Line
	8600 3750 8600 3700
Wire Wire Line
	8600 3700 8550 3700
Text GLabel 7500 3700 0    50   Input ~ 0
EC_0P
Text GLabel 8550 3700 0    50   Input ~ 0
EC_0M
Text GLabel 7500 4250 0    50   Input ~ 0
DCR
$Comp
L power:GND #PWR?
U 1 1 61285A24
P 8600 4900
AR Path="/6036C67E/61285A24" Ref="#PWR?"  Part="1" 
AR Path="/603346A0/61285A24" Ref="#PWR0132"  Part="1" 
F 0 "#PWR0132" H 8600 4650 50  0001 C CNN
F 1 "GND" H 8605 4727 50  0000 C CNN
F 2 "" H 8600 4900 50  0001 C CNN
F 3 "" H 8600 4900 50  0001 C CNN
	1    8600 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 61285A2B
P 7550 3400
AR Path="/6036C67E/61285A2B" Ref="R?"  Part="1" 
AR Path="/603346A0/61285A2B" Ref="R23"  Part="1" 
F 0 "R23" H 7618 3446 50  0000 L CNN
F 1 "1k" H 7618 3355 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 7590 3390 50  0001 C CNN
F 3 "~" H 7550 3400 50  0001 C CNN
	1    7550 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 61285A31
P 8600 3400
AR Path="/6036C67E/61285A31" Ref="R?"  Part="1" 
AR Path="/603346A0/61285A31" Ref="R37"  Part="1" 
F 0 "R37" H 8668 3446 50  0000 L CNN
F 1 "1k" H 8668 3355 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 8640 3390 50  0001 C CNN
F 3 "~" H 8600 3400 50  0001 C CNN
	1    8600 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 61285A37
P 7550 3150
AR Path="/6036C67E/61285A37" Ref="#PWR?"  Part="1" 
AR Path="/603346A0/61285A37" Ref="#PWR0133"  Part="1" 
F 0 "#PWR0133" H 7550 3000 50  0001 C CNN
F 1 "+3V3" H 7565 3323 50  0000 C CNN
F 2 "" H 7550 3150 50  0001 C CNN
F 3 "" H 7550 3150 50  0001 C CNN
	1    7550 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3150 7550 3200
Wire Wire Line
	8600 3200 8600 3250
Connection ~ 7550 3200
Wire Wire Line
	7550 3200 7550 3250
Wire Wire Line
	8600 3550 8600 3700
Connection ~ 8600 3700
Wire Wire Line
	7550 3550 7550 3700
Connection ~ 7550 3700
$Comp
L Device:R_US R?
U 1 1 61285A45
P 7850 3400
AR Path="/6036C67E/61285A45" Ref="R?"  Part="1" 
AR Path="/603346A0/61285A45" Ref="R24"  Part="1" 
F 0 "R24" H 7918 3446 50  0000 L CNN
F 1 "10k" H 7918 3355 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 7890 3390 50  0001 C CNN
F 3 "~" H 7850 3400 50  0001 C CNN
	1    7850 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3200 7850 3200
Wire Wire Line
	7850 3250 7850 3200
Connection ~ 7850 3200
Wire Wire Line
	7850 3200 8600 3200
Wire Wire Line
	7850 3550 7850 4250
Wire Wire Line
	7850 4250 7950 4250
Connection ~ 7850 4250
Wire Wire Line
	7550 4150 7950 4150
Wire Wire Line
	8450 4250 8600 4250
Wire Wire Line
	7500 4250 7600 4250
$Comp
L hydromisc:NFET Q?
U 1 1 612B9AD6
P 7300 5750
AR Path="/6036C67E/612B9AD6" Ref="Q?"  Part="1" 
AR Path="/603346A0/612B9AD6" Ref="Q20"  Part="1" 
F 0 "Q20" H 7544 5650 50  0000 L CNN
F 1 "NFET" H 7300 5750 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 7300 5750 50  0001 C CNN
F 3 "" H 7300 5750 50  0001 C CNN
	1    7300 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 5900 7200 5900
$Comp
L hydromisc:NFET Q?
U 1 1 612C2F4D
P 7900 5750
AR Path="/6036C67E/612C2F4D" Ref="Q?"  Part="1" 
AR Path="/603346A0/612C2F4D" Ref="Q21"  Part="1" 
F 0 "Q21" H 8144 5650 50  0000 L CNN
F 1 "NFET" H 7900 5750 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 7900 5750 50  0001 C CNN
F 3 "" H 7900 5750 50  0001 C CNN
	1    7900 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 5900 7900 5900
Wire Wire Line
	7500 6200 8100 6200
$Comp
L power:GND #PWR?
U 1 1 612EBA96
P 8100 6250
AR Path="/6036C67E/612EBA96" Ref="#PWR?"  Part="1" 
AR Path="/603346A0/612EBA96" Ref="#PWR0134"  Part="1" 
F 0 "#PWR0134" H 8100 6000 50  0001 C CNN
F 1 "GND" H 8105 6077 50  0000 C CNN
F 2 "" H 8100 6250 50  0001 C CNN
F 3 "" H 8100 6250 50  0001 C CNN
	1    8100 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 6250 8100 6200
Connection ~ 8100 6200
Wire Wire Line
	7500 5600 7500 5700
Wire Wire Line
	8100 5600 8100 5700
Text GLabel 8100 5600 1    50   Input ~ 0
EC_1M
Text GLabel 7500 5600 1    50   Input ~ 0
EC_0M
Text GLabel 7200 5900 0    50   Input ~ 0
G_EC_M
Text GLabel 9200 4250 0    50   Input ~ 0
DCR
Wire Wire Line
	9200 4250 9650 4250
Wire Wire Line
	9250 3200 10300 3200
Text GLabel 1800 2350 0    50   Input ~ 0
EC_1P
Text GLabel 1800 2050 0    50   Input ~ 0
EC_0P
Wire Wire Line
	7500 6000 7500 6200
Wire Wire Line
	8100 6000 8100 6200
Wire Wire Line
	7800 5900 7800 6100
Wire Wire Line
	7800 6100 7300 6100
Wire Wire Line
	7300 6100 7300 5900
Connection ~ 7300 5900
$Comp
L hydromisc:NFET Q?
U 1 1 60504E1B
P 9000 5750
AR Path="/6036C67E/60504E1B" Ref="Q?"  Part="1" 
AR Path="/603346A0/60504E1B" Ref="Q23"  Part="1" 
F 0 "Q23" H 9244 5650 50  0000 L CNN
F 1 "NFET" H 9000 5750 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 9000 5750 50  0001 C CNN
F 3 "" H 9000 5750 50  0001 C CNN
	1    9000 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 5900 8900 5900
$Comp
L hydromisc:NFET Q?
U 1 1 60504E22
P 9600 5750
AR Path="/6036C67E/60504E22" Ref="Q?"  Part="1" 
AR Path="/603346A0/60504E22" Ref="Q24"  Part="1" 
F 0 "Q24" H 9844 5650 50  0000 L CNN
F 1 "NFET" H 9600 5750 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 9600 5750 50  0001 C CNN
F 3 "" H 9600 5750 50  0001 C CNN
	1    9600 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 5900 9600 5900
Wire Wire Line
	9200 6200 9800 6200
$Comp
L power:GND #PWR?
U 1 1 60504E2A
P 9800 6250
AR Path="/6036C67E/60504E2A" Ref="#PWR?"  Part="1" 
AR Path="/603346A0/60504E2A" Ref="#PWR0135"  Part="1" 
F 0 "#PWR0135" H 9800 6000 50  0001 C CNN
F 1 "GND" H 9805 6077 50  0000 C CNN
F 2 "" H 9800 6250 50  0001 C CNN
F 3 "" H 9800 6250 50  0001 C CNN
	1    9800 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 6250 9800 6200
Connection ~ 9800 6200
Wire Wire Line
	9200 5600 9200 5700
Wire Wire Line
	9800 5600 9800 5700
Text GLabel 9800 5600 1    50   Input ~ 0
EC_1P
Text GLabel 9200 5600 1    50   Input ~ 0
EC_0P
Text GLabel 8900 5900 0    50   Input ~ 0
G_EC_P
Wire Wire Line
	9200 6000 9200 6200
Wire Wire Line
	9800 6000 9800 6200
Wire Wire Line
	9500 5900 9500 6100
Wire Wire Line
	9500 6100 9000 6100
Wire Wire Line
	9000 6100 9000 5900
Connection ~ 9000 5900
$Comp
L hydromisc:NFET Q?
U 1 1 6051CC29
P 8400 4400
AR Path="/6036C67E/6051CC29" Ref="Q?"  Part="1" 
AR Path="/603346A0/6051CC29" Ref="Q22"  Part="1" 
F 0 "Q22" H 8644 4300 50  0000 L CNN
F 1 "NFET" H 8400 4400 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 8400 4400 50  0001 C CNN
F 3 "" H 8400 4400 50  0001 C CNN
	1    8400 4400
	1    0    0    -1  
$EndComp
$Comp
L hydromisc:NFET Q?
U 1 1 6051E6A3
P 10100 4400
AR Path="/6036C67E/6051E6A3" Ref="Q?"  Part="1" 
AR Path="/603346A0/6051E6A3" Ref="Q25"  Part="1" 
F 0 "Q25" H 10344 4300 50  0000 L CNN
F 1 "NFET" H 10100 4400 50  0001 C CNN
F 2 "hydromisc:HM_SOT-23_123" H 10100 4400 50  0001 C CNN
F 3 "" H 10100 4400 50  0001 C CNN
	1    10100 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 4250 10300 4350
Wire Wire Line
	10300 4650 10300 4750
Wire Wire Line
	8600 4350 8600 4250
Text GLabel 8400 4550 0    50   Input ~ 0
G_EC_M
Text GLabel 10100 4550 0    50   Input ~ 0
G_EC_P
Wire Wire Line
	3950 7000 4000 7000
Wire Wire Line
	3950 5500 4000 5500
$Comp
L Device:C C?
U 1 1 6056AF17
P 4000 5750
AR Path="/602E8AF8/6056AF17" Ref="C?"  Part="1" 
AR Path="/603346A0/6056AF17" Ref="C31"  Part="1" 
F 0 "C31" H 4115 5796 50  0000 L CNN
F 1 "100n" H 4115 5705 50  0000 L CNN
F 2 "hydromisc:HM_0603" H 4038 5600 50  0001 C CNN
F 3 "~" H 4000 5750 50  0001 C CNN
	1    4000 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6056B4EE
P 4000 7250
AR Path="/602E8AF8/6056B4EE" Ref="C?"  Part="1" 
AR Path="/603346A0/6056B4EE" Ref="C32"  Part="1" 
F 0 "C32" H 4115 7296 50  0000 L CNN
F 1 "100n" H 4115 7205 50  0000 L CNN
F 2 "hydromisc:HM_0603" H 4038 7100 50  0001 C CNN
F 3 "~" H 4000 7250 50  0001 C CNN
	1    4000 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0136
U 1 1 6056B87B
P 4000 5950
F 0 "#PWR0136" H 4000 5700 50  0001 C CNN
F 1 "GND" H 4005 5777 50  0000 C CNN
F 2 "" H 4000 5950 50  0001 C CNN
F 3 "" H 4000 5950 50  0001 C CNN
	1    4000 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0137
U 1 1 6056BDE8
P 4000 7450
F 0 "#PWR0137" H 4000 7200 50  0001 C CNN
F 1 "GND" H 4005 7277 50  0000 C CNN
F 2 "" H 4000 7450 50  0001 C CNN
F 3 "" H 4000 7450 50  0001 C CNN
	1    4000 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 7400 4000 7450
Wire Wire Line
	4000 7100 4000 7000
Connection ~ 4000 7000
Wire Wire Line
	4000 5600 4000 5500
Connection ~ 4000 5500
Wire Wire Line
	4000 5900 4000 5950
$Comp
L Device:C C?
U 1 1 6059C503
P 7600 4550
AR Path="/602E8AF8/6059C503" Ref="C?"  Part="1" 
AR Path="/603346A0/6059C503" Ref="C33"  Part="1" 
F 0 "C33" H 7715 4596 50  0000 L CNN
F 1 "100n" H 7715 4505 50  0000 L CNN
F 2 "hydromisc:HM_0603" H 7638 4400 50  0001 C CNN
F 3 "~" H 7600 4550 50  0001 C CNN
	1    7600 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 4650 8600 4800
Wire Wire Line
	7600 4700 7600 4800
Wire Wire Line
	7600 4800 8600 4800
Connection ~ 8600 4800
Wire Wire Line
	8600 4800 8600 4900
Wire Wire Line
	7600 4400 7600 4250
Connection ~ 7600 4250
Wire Wire Line
	7600 4250 7850 4250
Text GLabel 6250 2200 2    50   Input ~ 0
G_SOL_6
Text GLabel 6250 2100 2    50   Input ~ 0
G_SOL_2
Wire Wire Line
	1350 5500 1600 5500
Text GLabel 3150 5850 2    50   Input ~ 0
Vref
Connection ~ 3000 5850
Wire Wire Line
	3000 5850 3150 5850
Wire Wire Line
	1900 5850 3000 5850
$Comp
L Device:R_US R?
U 1 1 610C46C5
P 1750 5850
AR Path="/602E8AF8/610C46C5" Ref="R?"  Part="1" 
AR Path="/603346A0/610C46C5" Ref="R41"  Part="1" 
F 0 "R41" H 1818 5896 50  0000 L CNN
F 1 "1k" H 1818 5805 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 1790 5840 50  0001 C CNN
F 3 "~" H 1750 5850 50  0001 C CNN
	1    1750 5850
	0    -1   -1   0   
$EndComp
Connection ~ 3000 7350
Wire Wire Line
	3000 7350 3150 7350
Wire Wire Line
	1900 7350 3000 7350
Text GLabel 3150 7350 2    50   Input ~ 0
Vref
$Comp
L Device:R_US R?
U 1 1 610C3BF6
P 1750 7350
AR Path="/602E8AF8/610C3BF6" Ref="R?"  Part="1" 
AR Path="/603346A0/610C3BF6" Ref="R43"  Part="1" 
F 0 "R43" H 1818 7396 50  0000 L CNN
F 1 "1k" H 1818 7305 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 1790 7340 50  0001 C CNN
F 3 "~" H 1750 7350 50  0001 C CNN
	1    1750 7350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1350 7350 1450 7350
Wire Wire Line
	1450 7350 1450 7250
Wire Wire Line
	1450 7100 1350 7100
Wire Wire Line
	1350 7250 1450 7250
Connection ~ 1450 7250
Wire Wire Line
	1450 7250 1450 7100
Wire Wire Line
	1350 7000 1600 7000
Connection ~ 1450 7350
Wire Wire Line
	1350 5600 1450 5600
Wire Wire Line
	1450 5600 1450 5750
Wire Wire Line
	1450 5850 1350 5850
Wire Wire Line
	1350 5750 1450 5750
Connection ~ 1450 5750
Wire Wire Line
	1450 5750 1450 5850
Wire Wire Line
	1450 7350 1600 7350
Wire Wire Line
	3000 7100 3000 7350
Wire Wire Line
	3000 5600 3000 5850
Wire Wire Line
	1450 5850 1600 5850
Connection ~ 1450 5850
Text GLabel 2450 5050 1    50   Input ~ 0
PH_0_SHIELD
Text GLabel 2450 6550 1    50   Input ~ 0
PH_1_SHIELD
$Comp
L hydromisc:diode-schottky D?
U 1 1 60E14C33
P 4050 5450
AR Path="/6036C67E/60E14C33" Ref="D?"  Part="1" 
AR Path="/603346A0/60E14C33" Ref="D22"  Part="1" 
F 0 "D22" V 4300 5550 50  0000 R CNN
F 1 "diode-schottky" H 4450 5500 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 4350 5500 50  0001 C CNN
F 3 "" V 4350 5500 50  0001 C CNN
	1    4050 5450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4100 5500 4100 5450
Wire Wire Line
	4000 5500 4100 5500
Wire Wire Line
	4200 5500 4100 5500
Connection ~ 4100 5500
$Comp
L hydromisc:diode-schottky D?
U 1 1 60E41F89
P 4050 6950
AR Path="/6036C67E/60E41F89" Ref="D?"  Part="1" 
AR Path="/603346A0/60E41F89" Ref="D23"  Part="1" 
F 0 "D23" V 4300 7050 50  0000 R CNN
F 1 "diode-schottky" H 4450 7000 50  0001 C CNN
F 2 "hydromisc:HM_SOD-123" V 4350 7000 50  0001 C CNN
F 3 "" V 4350 7000 50  0001 C CNN
	1    4050 6950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4100 7000 4100 6950
Wire Wire Line
	4000 7000 4100 7000
Wire Wire Line
	4200 7000 4100 7000
Connection ~ 4100 7000
$Comp
L power:+3V3 #PWR0139
U 1 1 60E6F0B4
P 4100 6650
F 0 "#PWR0139" H 4100 6500 50  0001 C CNN
F 1 "+3V3" H 4115 6823 50  0000 C CNN
F 2 "" H 4100 6650 50  0001 C CNN
F 3 "" H 4100 6650 50  0001 C CNN
	1    4100 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0140
U 1 1 60E70E48
P 4100 5150
F 0 "#PWR0140" H 4100 5000 50  0001 C CNN
F 1 "+3V3" H 4115 5323 50  0000 C CNN
F 2 "" H 4100 5150 50  0001 C CNN
F 3 "" H 4100 5150 50  0001 C CNN
	1    4100 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 60EB1729
P 2550 5550
AR Path="/602E8AF8/60EB1729" Ref="R?"  Part="1" 
AR Path="/603346A0/60EB1729" Ref="R48"  Part="1" 
F 0 "R48" H 2618 5596 50  0000 L CNN
F 1 "dnp" H 2618 5505 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 2590 5540 50  0001 C CNN
F 3 "~" H 2550 5550 50  0001 C CNN
	1    2550 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 60EB1D9C
P 2550 7050
AR Path="/602E8AF8/60EB1D9C" Ref="R?"  Part="1" 
AR Path="/603346A0/60EB1D9C" Ref="R49"  Part="1" 
F 0 "R49" H 2618 7096 50  0000 L CNN
F 1 "dnp" H 2618 7005 50  0000 L CNN
F 2 "hydromisc:HM_0603" V 2590 7040 50  0001 C CNN
F 3 "~" H 2550 7050 50  0001 C CNN
	1    2550 7050
	1    0    0    -1  
$EndComp
Connection ~ 2550 5400
$Comp
L power:GND #PWR0141
U 1 1 60EB30F0
P 2550 5700
F 0 "#PWR0141" H 2550 5450 50  0001 C CNN
F 1 "GND" H 2650 5600 50  0000 C CNN
F 2 "" H 2550 5700 50  0001 C CNN
F 3 "" H 2550 5700 50  0001 C CNN
	1    2550 5700
	1    0    0    -1  
$EndComp
Connection ~ 2550 6900
$Comp
L power:GND #PWR0142
U 1 1 60EC2000
P 2550 7200
F 0 "#PWR0142" H 2550 6950 50  0001 C CNN
F 1 "GND" H 2650 7100 50  0000 C CNN
F 2 "" H 2550 7200 50  0001 C CNN
F 3 "" H 2550 7200 50  0001 C CNN
	1    2550 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 5400 2550 5400
Wire Wire Line
	1900 5100 2450 5100
Wire Wire Line
	2450 5100 2450 5050
Wire Wire Line
	2450 5100 2450 5400
Connection ~ 2450 5100
Connection ~ 2450 5400
Wire Wire Line
	2450 6900 2550 6900
Wire Wire Line
	2450 6550 2450 6600
Connection ~ 2450 6900
Wire Wire Line
	1900 6600 2450 6600
Connection ~ 2450 6600
Wire Wire Line
	2450 6600 2450 6900
$EndSCHEMATC
