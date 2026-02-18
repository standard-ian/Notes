## Lab 4
### Introduction
#### Objectives
1. Apply knowledge of circuits to build a timer circuit with a 555 IC
2. Control the timing using the transient behavior of RC circuits.
#### Materials
1. 555 Timer IC
2. $330, 1k, 10k, 22k, 100k, 220k, 500k \ohm$ resistors
3. Two capacitors, $10\micro F$ and $10nF$
4. LED
5. Breadboard
### Procedure
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

	\node[dipchip, scale=2, num pins=8, external pins width=0.3](C){555};
	\draw (C.pin 1)--++(-1,0)--++(0,1)
	to[vsource, V=$15V$, invert]++(4.52,0)
	to[short]++(0,-1)--(C.pin 8)++(1,0)
	to[R=$R_1$, bipoles/resistor/width=0.5]++(0,-0.55)--(C.pin 7)++(1,0)
	to[R=$R_2$, bipoles/resistor/width=0.5]++(0,-0.55)--(C.pin 6);
	
	\draw (C.pin 2)--++(-0.1,0)
	to[eC, l=$10\mu F$]++(0,0.55)++(0,-0.55)
	to[crossing]++(0,-1.12)--++(0,-0.65)--++(2.4,0)--++(0,0.5)
	to[crossing]++(0,0.29)--++(0,0.42)
	node[circ]{};
	
	\draw (C.pin 5)--++(1,0)--++(0,-1)
	to[short]++(-4.52,0)
	to[capacitor, l=$10nF$]++(0,1)
	to[led, , invert, color=red]++(0,0.55)
	to[R=$330\Omega$](C.pin 3)++(-1,0)--++(0,1.10);
	
	\draw (C.pin 4)--++(0,-0.5)--++(2.52,0)
	to[crossing]++(0,1)
	to[crossing]++(0,0.12)
	to[crossing]++(0,1)--++(0,0.05)
	node[circ]{};
	
\end{circuitikz}
\end{document}
```

1. Connect Pin 8 ($V_{cc}$) of the 555 chip to the positive of a battery or a DC power source of $9V$ and connect Pin 1 ($GND$) to the negative rail.
2. Connect Pin 4 (Reset) to $V_{cc}$ and Pin 8.
3. Place $R_1 = 100k$ between $V_{cc}$ and Pin 7 (Discharge)
4. Place $R_2 = 100k$ between Pin 7 and Pin 6 (Threshold).
5. Connect Pin 6 and Pin 2 (Trigger)
6. Place the timing capacitor $C_1 = 10\micro F$ between Pin 2 and ground.
7. Connect the anode of your LED to Pin 3 (Output) via the $330\ohm$ resistor, and the cathode to $GND$.
8. Connect the $10nF$ capacitor ($C_2$) from Pin 5 to Ground.
### Data and Analysis
**Make estimations:** The frequency and duty cycle are determined by the charge and discharge times of $C_1 = 10\mu F$

**Charge Time (Output High):** $t_{high} = 0.693\times (R_1 + R_2)\times C_1$
**Discharge Time (Output Low):** $t_{low} = 0.693 \times R_2 \times C_1$
**Total Period:** $T = t_{high} + t_{low}$

1. Observe the timing control capacitor voltage at Pin 2, referenced to the common ground at Pin 1 on CH1.
2. Observe the output voltage at Pin 3, referenced to common ground at Pin 1 on CH2.
3. Measure the duty cycle.
4. Compare the waveforms on Channel 1 and Channel 2. Observe that when the capacitor voltage touches $\frac{2}{3}V_{cc}$, the output on channel 2 drops to Low. When the capacitor voltage (CH1) touches the $\frac{1}{3}V_{cc}$, the output (CH2) jumps to high.
### Conclusions
1. **Explain the entire process of how the capacitor and the timer chip work to create a blinking LED.**
2. **Compare your estimates of charging and discharging time durations with your observations.**
3. **Explain how the transient of the RC circuit controls the duty cycle: the time duration of the output being high/low. Figure out the reason for the formulas used in estimating $t_{high}$ and $t_{low}$.**
4. **If you want to make the LED turn on over a much longer time, what would you change in the circuit? Verify by changing this in the circuit.**