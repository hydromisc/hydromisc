# Hydromisc

This a single PCBA with all the necessary I/O to automate a typical
small to mid-size hydroponic grow, controllable over Wi-Fi. It may also
be suitable for aquariums, ponds, or any other biological or chemical
process involving water treatment. Inputs and outputs include:

* 8x 12 V, 1 A outputs, intended for solenoid valves (but usable for other
actuators too)
* 6x 12 V, 0.5 A ouputs, intended for pumps, with current monitoring
* 4x 12 V, 0.25 A outputs, intended for peristaltic dosing pumps, with analog
voltage control
* 2x direct interfaces to a pH probe or other ion-selective electrode
* 2x direct interfaces to an EC probe, reading around 1000 uS
* 2x direct interfaces to a resistive sensor (thermistor, photoresistor,
etc.), reading around 10k
* 2x digital interface to a temperature and humidity sensor
* 2x digital interface to a strain gauge (to measure weight or pressure)

I'm using this now to control injector pumps in a drain-to-waste system,
and also to maintain pH and EC in a recirculating system.

![all connectors labeled](https://raw.githubusercontent.com/hydromisc/hydromisc/master/doc/pcba-top.jpg)

![power side pinout](https://raw.githubusercontent.com/hydromisc/hydromisc/master/doc/pcba-side-power.jpg)

![sensor side pinout](https://raw.githubusercontent.com/hydromisc/hydromisc/master/doc/pcba-side-sensors.jpg)

## Firmware

The board is managed by an ESP32. Install the
[ESP-IDF](https://github.com/espressif/esp-idf) framework from Espressif,
and build and load the firmware from an ESP-IDF command prompt.

The board is a Wi-Fi client. The name and password for its access point
must be compiled in to the program, in Espressif's usual way, with `idf.py
menuconfig`. The board will automatically get an IP address over DHCP,
so you'll probably want to configure your router or other DHCP server to
assign a static IP based on the MAC address. The MAC address is unique
per board, since that's serialized in the ESP32 module.

The current firmware implements a simple interface to read the sensors
and write the actuators over http. I'm currently sequencing everything with
some shell scripts initiated by cron jobs on a Raspberry Pi, which invoke
curl to command this board. Any device and programming language capable of
making http requests could be used, though.

The outputs are described as "solenoid", "pump", and "dosing pump",
because that's the purpose for which I'm personally using them, and the
present interface is named around that model. They can of course be
used for other types of load too. The software interface is easily
extended if the present commands are inadequate or too confusingly-named.


    $ curl 'http://hydromisc/solenoid?k=3&t=20&'\
    'dosingA=90&dosingB=90&dosingPh=210&dosingAux=0'
    { "result": "solenoiding" }

Solenoid output k is energized for t seconds. For the same period,
the four dosing pumps are also energized, with the respective duty
cycles from 0 (off) to 254 (full on, ~12 VDC). The voltage applied to
the dosing pump is very roughly linear in duty cycle, but both that map
and the map from voltage to speed are quite inexact. If you're closing
the loop (e.g., dosing acid to achieve a particular pH), then this may
not matter, since your control loop will automatically correct that. If
accuracy is important, then the pump should be calibrated, for example
by measuring the amount of liquid dispensed using a graduated cylinder
or weighing scale.

The solenoid output is powered for three seconds after the pumps stop.
This is to avoid closing the solenoid valves with pressure in the system,
since the pumps will continue to operate briefly after losing power. If
the dosing pumps feed directly into a single reservoir, then this and
everything else about the solenoids may be ignored.


    $ curl 'http://hydromisc/pump?k=4&t=15'
    { "result": "pumping" }

Pump output k is energized for t seconds. The measured current (up to about
500 mA) is recorded.


    $ curl 'http://hydromisc/current'
    { "result": "current","current": [ 71, 65, 74, 69, 78, 74, 80, 73, 63,
    73, 65, 68, 74, 64, 60 ] }

The current from the most recent /pump is reported, in units of milliamps
at one sample per second. If this hasn't yet completed, a full-length
trace is reported but future samples are 0.


    $ curl 'http://hydromisc/stop'
    { "result": "stopping" }

All (solenoid, pump, dosing pump) outputs are de-energized immediately.


    $ curl 'http://hydromisc/sensors'
    { "result": "sensors", "ec0": 984, "ec1": 47, "ph0": 41, "ph1": -320,
    "dcr0": 210000, "dcr1": 210000, "temp0": 25.7, "humidity0": 54.0,
    "temp1": -9999.9, "humidity1": -9999.9, "sg0": 0, "sg1": -1 }

All sensors are measured and reported.

The pH electrode voltage is returned in millivolts, and your software
must convert to pH. To a first order, the map from voltage to pH is
linear, with zero volts corresponding to pH = 7.0, and a slope around
59 mV/unit around room temperature (which may be calculated using the
Nernst equation).

You should calibrate by measuring the voltage in two solutions of known
pH (e.g., 4.0 and 6.9), and interpolating linearly between the two. For
example:

    const V69 = 8;      // millivolts in pH 6.9 calibration buffer
    const V40 = -152;   // millivolts in pH 4.0 calibration buffer

    const slope = (V69 - V40)/(6.9 - 4.0);

    let ph = 6.9 + (resp.ph0 - V69)*slope;

Your software must also correct for temperature if desired; though in
typical hydroponic applications, the pH is close enough to neutral that
it doesn't matter too much. To a first order, the slope changes with
temperature but the offset does not, so the tempco is very small when the
output voltage is small.

Other ion-selective electrodes (e.g., for nitrate, potassium, etc.) should
also work with this interface circuit. Consult the electrode documentation
for the calibration procedure, which should be specified in terms of
millivolts from the meter. The reference electrode would need to go to
the BNC shell (Vref ~ 1.2 V), not ground.

EC is returned directly in microsiemens, uS. For example, a resistance
of 1kohm is equal to 1000 uS. Your software must convert based on the
cell dimensions (to convert from uS to uS/cm; a cell constant of 1 cm
is typical so that may be trivial), and also perform any temperature
compensation if desired. If you already have a different EC meter,
then you can use that with a sample of hydroponic solution to transfer
calibration. If not, then you can calibrate in a solution of 1000 mg/L
sodium chloride (table salt), which has conductivity of 2000 uS/cm at
25 degrees Celsius.

In concept, any two wires the right length and distance apart (e.g.,
on the order of 1 cm) could be immersed in solution, and could serve
as your EC electrode. You may prefer to buy a purpose-built electrode,
though. That may have a plastic sheath that protects the electrodes
from mechanical damage with a slit to avoid trapping air bubbles. The
electrode material should also have good electrochemical properties.
Inexpensive electrodes will generally use stainless steel. The most
expensive electrodes will use a thin coating of platinum black, which
reduces error by reducing the series resistance due to electrode
polarization. Either is likely fine in practice.

Electrodes may also be inserted into media, in which case they measure
a product of the solution EC and the media water content. An EC channel
can also be used as a binary liquid level sensor, by placing the
electrodes just below the threshold level. In such use, take care that
the electrodes are far enough apart that surface tension can't hold
a drop of solution even when they aren't immersed.

To measure water (or other) temperature, you can use a thermistor. Some
EC or pH probes will have a thermistor integrated in the probe,
or you can buy one separately. The resistance of that thermistor
(or any other resistive sensor) is returned directly in ohms. Your
software must convert to temperature. For a typical NTC thermistor,
the logarithm of the resistance is proportional to the reciprocal of
absolute temperature. For example:

    // we calibrated at 22 degrees Celsius, and measured 10435 ohms
    const calLogR = Math.log(10435);
    const calTemp = 22;

    // from some random NTC thermistor datasheet, or you could also do a
    // two-point calibration
    const slope = 0.0002578;

    let Tinv = 1/(273 + calTemp) + slope*(Math.log(resp.dcr0) - calLogR);
    let T = 1/Tinv - 273;

I'm also using that interface with a photoresistor to count hours of sun,
though I'm doing a simple binary threshold (to distinguish direct sun
vs. shade) and not a full continuous calibration.

To measure air temperature and humidity, connect an AM2301 on either 2x3
position connector to ground (black), +3V3 (red), and DIG_xOUT (yellow).
Temperature is returned in degrees Celsius, and humidity in percent RH.
A pull-up resistor from red to yellow may be required if the wires are long,
since we otherwise just get the ESP32's on-chip pull-up.

To measure a strain gauge, connect an HX710 to ground, +3V3, DIG_xCK
(SCK), and DIG_xIN (DOUT). The result is returned in raw ADC units,
which you can calibrate to force or pressure with a linear offset and
scale. I use this to measure liquid level with a "bubbler" system,
measuring the hydrostatic pressure in an air-filled tube at the bottom
of the tank. (It's necessary to bubble a slow trickle of air through the
tube, or else tiny leaks will cause it to eventually fill with water; but
since I'm already aerating my tanks, that just takes a tee and a needle
valve. Such systems are common in process industries, crude but cheap
and reliable. My system is okay but not great, since the pressure sensor
has a large tempco. I used an additional AM2301 very close to the sensor
to compensate, but there's still an inch or so worth of residual error.)

You can simultaneously connect an HX710 and an AM2301 to the same
2x3 connector, since they use different data pins.


    $ curl 'http://hydromisc/conf?dosingAPhase=63&dosingBPhase=4032&'\
    'dosingPhPhase=4095&dosingAuxPhase=4095&runBigPump=1'
    { "result": "configured" }

By default, the dosing pumps run continuously during a /solenoid call.
Here they can also be configured to run intermittently, in 100 ms
intervals on a 12-interval (1.2 s) period. The operation of each dosing
pump may be specified here as a bitmap, 12 bits as a decimal number. For
example, the decimal number 63 is equal to 12'b000000111111, so dosing
pump A is on with duty cycle 1/2, 600 ms on followed by 600 ms off. The
decimal number 4032 is equal to 12'b111111000000, so dosing pump B is
also on with duty cycle 1/2 but with opposite phase.

When peristaltic pumps are used as fertilizer injectors, this intermittent
operation can achieve lower injection rates than can be reliably achieved
with low pump voltage (since the transfer characteristic from voltage to
flow varies a lot at low voltage). The phase may be chosen to minimize
risk of mixing before dilution.

By default, the output BIG_PUMP is energized during a /solenoid call. This
may be disabled by setting runBigPump=0.


## Getting Hardware

For the moment, this hardware isn't commercially available in assembled
form. (That may change, since this is open hardware that anyone can build
and sell; I'll add links if and when it does.) You'll therefore have to
buy the bare PCB and parts kit, and assemble yourself. This PCBA has no
leadless or fine-pitch components, so it can be hand-assembled with a
soldering iron and moderate skill.

Note that rev A of the PCB has an erratum, a missing pull-up on ESP32_EN.
I've fixed that in rev B (which is the head revision in git). This is a
small change that should present low risk, but it hasn't been tested yet.

Total cost to build one board is around:

Item | Cost
----------- | --------------
bare PCB, PCBWay | $30
components, Digi-Key | $60

All connectors are Molex Mini-Fit Jr., a very popular series. It's
possible to solder the cable-end connectors rather than crimping
them, but not recommended. The official crimp tool is expensive. I've used
a third-party "SN-28B", which isn't actually designed for that family
but is cheap and barely adequate, if I crimp first with the largest
die and then again with the middle one.

To program the board, use any USB-to-serial adapter with +3V3 logic levels,
for example an FT232R. Take care that you need access to RTS, which some
such boards and cables don't break out. On CN14, connect:

* ground to ground
* +3V3 to nothing
* USBSER_RX to ESP32_TXD0
* USBSER_TX to ESP32_RXD0
* USBSER_DTR to ESP32_IO0
* USBSER_RTS to ESP32_EN

Program with `idf.py flash` in the usual way. Disconnect digital expansion
devices when programming, since they can interfere.

For complete automated control of EC and pH, you might add:

Item | Cost
----------- | --------------
pH electrode, Yieryi | $15
EC electrode | $15
3x aquarium-type dosing pump | $30
water fill solenoid valve | $15

Then you might periodically (e.g., minutes to hours) measure EC and pH
with /sensors. You could also monitor solution level, using another EC
electrode positioned high in the tank or using a float switch. The board
has no binary digital inputs, but the DC resistance or EC channels work
with switch contacts too. Then using /solenoid, you could add water,
fertilizer, and acid as required to maintain desired liquid level,
EC and pH.

You would typically aim to keep pH constant, for example with simple
hysteretic (bang-bang) control--add phosphoric if the pH is too high,
or add potassium carbonate if the pH is too low, with a significant
deadband (e.g., 0.5 units) so the acid and alkali don't fight it out
and leave too much potassium phosphate in the solution. In most cases
the alkali would actually be unnecessary, since the natural alkalinity
of the water supplies all necessary pH rise. That's the reason why only
one dosing pump channel is labeled "pH", though the AUX channel could
be used for alkali if desired.

Control of EC is more complicated, since unwanted ions (e.g., sodium
and chloride) will accumulate over time in the solution. So constant EC
probably means rising unwanted ions but falling NPK, and will eventually
result in deficiency. If you maintain constant EC, then you'll need to
change the reservoir often. You can waste less water by allowing slow
rise, though managing that without detailed water analyses is somewhat
uncertain. In all cases, fertilizer should be dosed in a way that doesn't
risk mixing of Part A and Part B before they're fully diluted, to avoid
precipitation (nutrient lockout) from the reaction between calcium ions
and phosphate or sulfate. For example, dose at opposite ends of the tank,
or allow sufficient time to mix between parts.

Of course more complicated automation is possible too. For example, this
board could manage multiple reservoirs simultaneously, or sense EC and
pH both in the reservoir and in returning solution from NFT channels, or
manage fertilizer injectors for a drain-to-waste system. The large number
of inputs and outputs is intended to provide flexibility to interface to
almost any conceivable system's sensors and actuators, with the automated
behavior determined by the software that commands this board.


## Circuit Explanation

Input power is +12 V, which feeds the power outputs directly. It also
feeds a buck converter that makes our +5V, and a buck converter that
makes Vuser, arbitrarily adjustable with a trimpot. An LDO makes +3V3
from +5V, and all our logic runs from that.

The ESP32 is a module with integrated antenna. It would be better for
the antenna tuning if the board outline had a cutout for that, but I
preferred mechanical robustness over antenna range. The ESP32 drives
two 8-bit serial-input, parallel-output shift registers, which function
as GPIO expanders and gate drivers for the pump and solenoid power
FETs. Max current for the solenoid outputs is determined by thermals due
to I^2\*Rdson. I haven't measured that temperature rise, but something
around an amp should be quite safe. Max current for the pump outputs is
determinated by the 2.2 ohm low-side current-sense resistor, and could
be increased by decreasing that.

The dosing pump gates are driven directly by ESP32 PWM outputs. A
series LC makes the negative-ground equivalent of a buck converter
on those outputs, enabling us to drive the dosing pumps not with PWM
but with a programmable DC voltage. This decreases radiated emissions,
and provides something like a constant voltage output as long as the
converter remains in continuous conduction.

The pump outputs return their ground current through a current-sense
resistor, and an ESP32 ADC channel measures the voltage across that. This
enables us to measure pump current. For example, if pump current
is much higher when pumping water than when pumping air, this lets us
measure the volume of water pumped out of a tray by measuring when the
pump current drops. The current can also be used for health monitoring, to
confirm the pump is actually connected and operating with expected load.

A pH electrode develops a voltage around 0 V at pH 7, plus or minus
roughly 59 mV per pH unit at room temperature. Its output impedance may be
many megohms, so we measure that voltage with an electrometer-type opamp,
with femtoamp input current. To mitigate leakage resistance across our
PCB (e.g., due to ionic contamination from flux residue), we surround
the sensitive trace with a driven shield held at the same voltage as that
sensitive node. I've seen no trouble due to leakage even without cleaning
flux, though I live in a dry climate and it would be better to clean that.

Since the pH electrode voltage may be positive or negative and we don't
have a negative supply, we connect its "ground" to a 1.2 V reference. This
means that any electrical connection between our circuit ground and the
solution being measured will result in an incorrect measurement, though
we include series resistors so it at least won't result in permanent
damage. The shield of the BNC connectors is 1.2 V, not ground. As long as
the board is powered from an isolated power supply (for example, a typical
mains-operated power brick), no further attention should be required;
but take care not to de-isolate it, for example by attaching board ground
to any metal that touches the solution.

We pull both sides of the EC electrode up to +3V3 through 1k
resistors, so they both rest at +3V3 with respect to circuit ground, 0 V
differential. To measure EC, we pull one side to ground through an n-FET,
and then measure the voltage of the other, making a voltage divider
between the known 1k and the unknown resistance under test. We then
repeat the process for the other side, restoring zero DC voltage across
the electrode to avoid polarization. The EC electrode is also AC-coupled
through 22 uF ceramic capacitors, guaranteeing zero DC voltage even if
the software misbehaves or the resistors don't perfectly match and, more
importantly, presenting high imepedance at DC so the EC electrode doesn't
short out a pH electrode immersed in the same sample cup. Assuming EC
around 2 mS/cm and cell constant around 1 cm, we get a high-pass time
constant around 4 ms, which is much slower than our measurement period
of ~500 us. Electrolytic capacitors can't be used for that AC-coupling,
since the leakage current is too high.

A similar approach may be used to measure EC with almost
any microcontroller and no additional components beyond the
reference resistors and AC-coupling capacitors, by configuring that
microcontroller's I/O pin as an output low to ground it. I chose to use
the external FETs here because I'd run out of microcontroller pins, and
because the lower and more consistent Rdson improves accuracy at high EC
(since that appears in series with the resistance under test).


## Information Security

None whatsoever. Use this only behind a firewall (like a typical
residential NAT router), on a network with trusted users only. If you
need remote access, expose it through a properly-secured jump box or VPN,
not directly.


## Warranty and Life Safety

THERE IS NO WARRANTY FOR THIS SOFTWARE OR HARDWARE, TO THE EXTENT
PERMITTED BY APPLICABLE LAW. WE PROVIDE THE SOFTWARE OR HARDWARE "AS IS"
WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING,
BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
FOR A PARTICULAR PURPOSE.

DO NOT USE THIS SOFTWARE OR HARDWARE IN SITUATIONS WHERE ITS FAILURE COULD
RESULT IN DANGER TO HUMAN LIFE. For example, don't dose concentrated acid
and rely on correct operation of this board to safely dilute it--instead
dose a higher volume of less concentrated acid, or use safer chemistry
(monopotassium phosphate, etc.). Also think carefully about the risk of
overflowing water, dead plants or fish, and other damage, and don't rely
on software to prevent it.


## License

The firmware is licensed under the GPLv3 or later. The legal framework
for open hardware is poorly-established, but you may build and sell, give
away, or otherwise transfer any number of hydromisc boards, provided that:

* any software loaded on the board is free software (as defined by any
any OSI-approved license), and that software is not intended primarily
as a bootloader or other tool to load, program, or otherwise enable use
of non-free software; and

* you do not falsely claim ownership of the design, or any affiliation
with this project beyond your permission to build boards per above.


## Next steps

For now, this project is useful only to people with sufficient programming
skill to build and load the firmware, and to use the http interface
above. For future, it would be nice to:

* Integrate with existing control software (Mycodo, home automation packages,
etc.)

* And/or, add logic on the ESP32 itself for timed irrigations and
closed-loop dosing based on measured pH and EC, to allow this board
to work standalone with no need for the network except for initial
configuration. Firmware to log and graph (as a web page) sensors over
time would also be helpful in standalone use.

* Add a friendly mode to configure Wi-Fi settings, since those currently
must be compiled in. For example, if some combination of pins is jumpered
at startup, appear as a Wi-Fi access point to which the user can connect
and provide the real access point name and password. Then save those
credentials in flash, and use them after reset.

* Clean up how concurrency is managed in the firmware. The present code
seems to work, but it's a lazy hack that's hard to analyze for races.

I might eventually do some of that work myself, but I have limited time
and welcome other contributors. Please feel free to use GitHub issues to
discuss potential new features or anything else.


