There are three revisions of the PCB:

* rev A - I built this, and it works except that I forgot the pull-up on
ESP32_EN. Solder a 10k resistor from ESP32_EN to +3V3 (for example, near
CN15), or else the ESP32 module won't start when the programmer is
disconnected.

* rev B - This adds the missing pull-up, as R54. It also adds R55 and
R56 from Vuser to ground, enabling use of LM2596 parts from vendors
(e.g. ON Semi) that have much higher leakage current than the National/TI
original, up to 2 mA! A lightly-loaded Vuser may lose regulation when
Ileakage\*Rpulldown > Vsetpoint, and that R was previously just the
feedback divider.

* rev C - This adds capacitors to create a passive low-pass on the pH
inputs, improving 60 Hz (or 50 Hz) rejection and thus reducing noise
e.g. when the probe is connected with long wires. It also changes the
series resistors between Vref and the BNC shield from 1k to zero-ohm,
since the shunt regulator that makes Vref can survive a short-circuit
to ground with no problem and that resistance worsens noise performance.

The head revision in git is rev C; but I've never actually built this
revision, so it's possible there's still a mistake. That risk should be
very small, though. I'll amend this note if/when someone builds rev C
and reports back.

This is a two-layer board, designed to PCBWay's standard design rules.
Almost any vendor should be able to make this, though. 1.6mm thick,
1 oz/ft^2 copper.

