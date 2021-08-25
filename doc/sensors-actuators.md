
# Sensors and Actuators for Automated Hydroponics

An automated hydroponic system measures nutrient solution pH, EC, and
other quantities, and adds calculated amounts of water, fertilizer,
and pH up/down in response. The sensors and actuators required for that
are available from suppliers like Atlas Scientific or Hanna Instruments,
but at rather high prices.

They're also now available on Chinese markets, typically with poor
documentation and murky provenance but far cheaper. This is a summary
of my experiences (mostly good, occasionally bad) with those products.

I've included market links, but those may rot quickly. The listings are
usually from random small trading companies, and the actual manufacturer
is sometimes unclear. You may be able to match pictures or description
words to find new listings if necessary.

## pH Electrodes

![](https://raw.githubusercontent.com/hydromisc/hydromisc/master/doc/sa-ph-liquid.jpg)

<https://www.aliexpress.com/item/32813510050.html>

Liquid-filled pH electrode from Yieryi. It comes with calibration
standards, little sachets of powder that make pH = 4.0 and 6.9 buffers
when dissolved in distilled water. Settling is fast, seconds. The
measurement has drifted by a maximum of 0.15 units from initial
calibration over 8 months of use, continuously immersed in nutrient
solution except when calibrating.

No obvious way to refill, so this is a consumable, probably with life of
1-2 years. Failure will probably exhibit as either drifting calibration
or very slow settling. The electrode comes wet, with a small plastic cup
of liquid pressed over the end, and should never be allowed to dry out.
Ideally the probe should be stored in special storage solution (e.g.,
3 mol/L potassium chloride), but nutrient solution or tap water are
better than dry. Don't store in distilled water, which may accelerate aging.

![](https://raw.githubusercontent.com/hydromisc/hydromisc/master/doc/sa-ph-gel.jpg)

<https://www.aliexpress.com/item/4001075011664.html>

Gel-filled pH electrode from Yieryi. Very similar performance to the
liquid-filled, maybe a little slower to settle.

These pH electrodes interface directly to the hydromisc board. The listing
above includes an amplifier board suitable for interfacing to any micro's
ADC pin, though. Any electrode should work with any interface circuit,
with no special steps (beyond calibration, which is always required).

## EC Electrodes

![](https://raw.githubusercontent.com/hydromisc/hydromisc/master/doc/sa-ec-fancy.jpg)

<https://www.aliexpress.com/item/32818088740.html>

Fancy electrode, with platinum black on the contacts. This presents a
large effective surface area, and should decrease the rate of electrode
polarization and corresponding error resistance in series; though with
proper interface electronics I'd expect that to be negligible regardless
of contact material. The nominal cell constant is 1 cm, which means
e.g. that if the solution EC is 2 mS/cm, then the electrode will present
a conductance of 2 mS, which is a resistance of 500 &Omega;. The exact
cell constant is handwritten on a tag on the cable, presumably from a
factory calibration and test. No degradation in accuracy was observed
after 8 months continuously immersed.

This probe includes a temperature sensor, an NTC thermistor with resistance
around 10k around room temperature. The EC measurement itself is insensitive
to temperature, but the conversion factor between fertilizer concentration
and EC varies with temperature (by ~1.4%/&deg;C for me, but this will vary
with your nutrients and source water).

![](https://raw.githubusercontent.com/hydromisc/hydromisc/master/doc/sa-ec-cheap.jpg)

<https://www.ebay.com/itm/372674667406>

Cheap electrode, just stainless steel. Cell constant is also 1 cm, no
temperature sensor. You could make the same thing from some stainless
wire and RTV silicone; this just saves you the trouble of building and
figuring out the cell constant. Seems fine, though I tested only briefly.

These EC electrodes interface directly to the hydromisc board. To interface
to a standard micro, use two resistors and two capacitors as described
in the hydromisc circuit explanation.

## Nitrate Electrode - Not Successful

![](https://raw.githubusercontent.com/hydromisc/hydromisc/master/doc/sa-nitrate.jpg)

<https://www.aliexpress.com/item/1005002783499630.html>

If I translate the instructions correctly, this is intended for use with
a calomel reference electrode made by the same company. I didn't want
calomel anywhere near my food, so I used a silver chloride reference
electrode instead.

Unfortunately the first electrode I bought behaved like an open circuit. I
eventually hacksawed it open. I found no fill solution, and no evidence
(e.g., dried salts) that any fill solution had ever been present. That seems
like a manufacturing defect.

I bought a second electrode, which came with fill solution leaking around
the polymer membrane at the tip. That one behaved like a short circuit,
I suspect with current leaking along the same path that the fill solution
was. That seems like a second, different manufacturing defect. I may
try reworking that to seal the leak, but so far my experience has not
been good.

It's hard to believe the factory quality could be so bad, but the two
electrodes were from two different traders and I'm not sure what
else could be wrong. I'll probably try again with a different, more
expensive brand.

## Peristaltic Dosing Pump

![](https://raw.githubusercontent.com/hydromisc/hydromisc/master/doc/sa-dosing-pump.jpg)

<https://www.aliexpress.com/item/4001162555100.html>

<https://www.ebay.com/itm/353153163498>

Often used for dosing aquarium chemicals. The blue head snaps onto
the motor, and the housing of the blue head is itself held together by
snaps. The motor shaft presses against three rollers inside the head. The
small-diameter motor shaft turns quickly. The rollers pressed against the
shaft are much larger-diameter, so they turn slowly. The rollers press
against the silicon tubing, pumping the liquid peristaltically. Since
the liquid only ever touches the silicone tube, you can pump acids or
salt solutions without risk of corrosion.

In aquarium use these pumps just dump straight in to the tank, and they
can dump straight in to a hydroponic reservoir too. They can also develop
considerable pressure though (easily ~30 psi), and flow rate doesn't
vary strongly with that back-pressure. This makes them also suitable
for use as fertilizer injectors.

Speed matches pretty well (to within ~5%) between pumps, so that e.g. two
pumps can be relied upon to dose roughly equal volumes of fertilizer
Part A and Part B. Matching is best at full speed, and gets worse when
operating at lower voltage for lower speed. If lower speed is desired,
then it's better to slowly pulse the motors (e.g., 200 ms on, 800 ms off)
than to decrease the voltage or do high-speed PWM.

The tubing will eventually wear, though after 8 months mine still
looks new.  It's easily replaced if necessary, just with standard
silicone tubing of the desired diameter. I reworked some pumps with
smaller-diameter tubing for lower dosing rate, and that worked as
expected. If the new tubing is bigger then the head may be hard to
assemble, and if it's smaller then you may need to shim it (e.g., with
some packing tape on the inside of the blue housing).


## Air Pressure Sensor

![](https://raw.githubusercontent.com/hydromisc/hydromisc/master/doc/sa-pressure.jpg)

<https://www.aliexpress.com/item/33054432260.html>

I use this for my reservoir level gauge, measuring the hydrostatic
pressure in an air-filled tube at the bottom of the reservoir. To stop
the tube from slowly filling with water (due to leaks, air dissolving
in water, etc.), a slow trickle of air is bubbled through, from the same
aquarium pump used to aerate. This kind of "bubbler" level gauge is
commonly used in process industries.

Temperature coefficient is the dominant error, on the order of 1 cm
water column per &deg;C. The HX710B integrates a temperature sensor,
but a brief experiment looked noisy. I used a AM2301 placed very close
to the pressure sensor. Accuracy after linear temperature correction is
better than 1 cm, over a daily temperature swing around 20 &deg;C.

## Air Temperature and Humidity Sensor

![](https://raw.githubusercontent.com/hydromisc/hydromisc/master/doc/sa-am2301.jpg)

<https://www.aliexpress.com/item/32769460765.html>

Very popular, 0.1 &deg;C resolution, easy digital interfacing. 


