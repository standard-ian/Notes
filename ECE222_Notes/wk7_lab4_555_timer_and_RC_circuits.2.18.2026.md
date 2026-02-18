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
	\draw(C.pin 1)--++(-1.25,0)--++(0,1)
	to[vsource, V=$9V$, invert]++(4.77,0)
	to[short]++(0,-1)--(C.pin 8)++(1,0)
	to[R=$R_1$, bipoles/resistor/width=0.5]++(0,-0.55)--(C.pin 7)++(1,0)
	to[R=$R_2$, bipoles/resistor/width=0.5]++(0,-0.55)--(C.pin 6);
	
	\draw (C.pin 2)--++(-0.1,0)
	to[pC, invert, l=$10\mu F$]++(0,0.55)++(0,-0.55)
	to[crossing]++(0,-1.12)--++(0,-0.65)--++(2.4,0)--++(0,0.5)
	to[crossing]++(0,0.29)--++(0,0.42)
	node[circ]{};
	
	\draw (C.pin 5)--++(1,0)--++(0,-1)
	to[short]++(-4.77,0)
	to[capacitor, l=$10nF$]++(0,1.55)
	to[R=$\ \ 330\Omega$, bipoles/resistor/width=0.5]++(0.5,0)
	to[led, invert, color=red](C.pin 3)++(-1.25,0)--++(0,1.10);
	
	\draw (C.pin 4)--++(0,-0.5)--++(3.02,0)
	to[crossing]++(1,0)--++(0,3.18)--++(-0.5,0);
	% to[crossing]++(0,1)
	% to[crossing]++(0,0.12)
	% to[crossing]++(0,1)--++(0,0.05)
	% node[circ]{};
	
\end{circuitikz}
\end{document}
```
##### Setup
1. Connect Pin 8 ($V_{cc}$) of the 555 chip to the positive of a battery or a DC power source of $9V$ and connect Pin 1 ($GND$) to the negative rail.
2. Connect Pin 4 (Reset) to $V_{cc}$ and Pin 8.
3. Place $R_1 = 100k$ between $V_{cc}$ and Pin 7 (Discharge)
4. Place $R_2 = 100k$ between Pin 7 and Pin 6 (Threshold).
5. Connect Pin 6 and Pin 2 (Trigger)
6. Place the timing capacitor $C_1 = 10\micro F$ between Pin 2 and ground.
7. Connect the anode of your LED to Pin 3 (Output) via the $330\ohm$ resistor, and the cathode to $GND$.
8. Connect the $10nF$ capacitor ($C_2$) from Pin 5 to Ground.
##### Experiment
1. Observe the timing control capacitor voltage at Pin 2, referenced to the common ground at Pin 1 on CH1.
2. Observe the output voltage at Pin 3, referenced to common ground at Pin 1 on CH2.
3. Measure the duty cycle.
4. Compare the waveforms on Channel 1 and Channel 2. Observe that when the capacitor voltage touches $\frac{2}{3}V_{cc}$, the output on channel 2 drops to Low. When the capacitor voltage (CH1) touches the $\frac{1}{3}V_{cc}$, the output (CH2) jumps to high.
### Data and Analysis
**Charge Time (Output High):** $t_{high} = ln(2) \times \tau_{charging} = 0.693\times (R_1 + R_2)\times C_1$

**Discharge Time (Output Low):** 
$t_{low} = ln(2)\times \tau_{discharging} = 0.693 \times R_2 \times C_1$

**Total Period:** $T = t_{high} + t_{low}$

#### Make Estimations
**The frequency and duty cycle are determined by the charge and discharge times of $C_1 = 10\mu F$**

##### Charging:
$$\tau = (R_1 + R_2) \cdot C = 200\text{k} \cdot 10\mu F = 2\text{s}$$
$$t_{high} = \ln(2) \cdot 2 = 1.386\text{s}$$
##### Discharging:
$$\tau = R_2 \cdot C = 100\text{k} \cdot 10\mu F = 1\text{s}$$
$$t_{low} = \ln(2) \cdot 1 = 0.693\text{s}$$
##### Period and frequency:
$$T = t_{high} + t_{low} = 2.079\text{s}$$
$$f = \frac{1}{T} \approx 0.481\text{Hz}$$
##### Duty cycle:
Duty cycle is the fraction of one period that the output is HIGH. At 66.7%, the LED is on for 1.386s and off for 0.693s per cycle. Because $R_1$ only appears in the charging path, the duty cycle in this configuration is always above 50%.
$$D = \frac{t_{high}}{T} = \frac{R_1 + R_2}{R_1 + 2R_2} = \frac{200\text{k}}{300\text{k}} \approx 66.7\%$$
### Conclusions
###### 1. Explain the entire process of how the capacitor and the timer chip work to create a blinking LED.
Starting from a state where the cap is discharged...

Pin 6 is "monitoring" the following, where:
$$\tau_{charging{}} = (R_1 + R_2) \times C$$
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[vsource, V=$9V$, invert]++(0,2)
	to[R=$R_1$]++(1,0)
	to[R=$R_2$]++(1,0)
	to[short]++(1,0)
	node[ocirc, label=above:$V_{out}$]{}--++(1,0)
	node[ocirc, label=right:$Pin\ 6$]{}++(-1,0)--++(0,-0.5)--++(1,0)
	node[ocirc, label=right:$Pin\ 2$]{}++(-2,0.5)
	to[pC, l=$10\mu F$, invert]++(0,-2)
	to[short]++(-2,0);
\end{circuitikz}
\end{document}
```

The IC compares this $V_{out}$ to $V_{source}$. While $V_{out} < \frac{2}{3}V_{source}$, the IC outputs a HIGH signal on Pin 3. 

Once Pin 6 detects $V_{out} \geq \frac{2}{3}V_{source}$, an internal FF is reset, Pin 3 is dropped to LOW, and the "drain" at Pin 7 is opened.

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ground, rotate=180, scale=2]{}
	node[ocirc, label=left:$Pin\ 7$]{}--++(0,-0.5)--++(-1,0)
	node[ocirc, label=left:$V_{in} (9V)$]{}++(1,0)
	to[R=$R_2$, color=black]++(1,0)
	to[short]++(1,0)
	node[ocirc, label=above:$V_{out}$]{}--++(1,0)
	node[ocirc, label=right:$Pin\ 6$]{}++(-1,0)--++(0,-0.5)--++(1,0)
	node[ocirc, label=right:$Pin\ 2$]{}++(-2,0.5)
	to[pC, l=$10\mu F$, invert]++(0,-2)
	node[ground, scale=2]{};
\end{circuitikz}
\end{document}
```

With the "drain" at Pin 7 open, $V_{source}$ takes the path to $0V$ at Pin 7, no longer charging the cap. It begins discharging. 

The cap discharges through $R_2$ only, because there is a sink to ground between $R_1$ and $R_2$ at Pin 7. Therefore:
$$\tau_{discharging} = R_2\times C$$

On the discharging cycle, Pin 2 monitors $V_{out}$ and when $V_{out} \leq \frac{1}{3}V_{source}$, the flip flop switches Pin 3 HIGH once more, closes the drain, and the cycle is re-started.

###### 2. Compare your estimates of charging and discharging time duration's with your observations.

|                | Estimated | Experimental |
| -------------- | --------- | ------------ |
| $t_{high}$ (s) | 1.386     | 1.819        |
| $t_{low}$ (s)  | 0.693     | 0.610        |
| $T$ (s)        | 2.079     | 2.432        |
| $f$ (Hz)       | 0.481     | 0.411        |
| $D$ (%)        | 66.7      | 74.87        |
##### 3. Explain how the transient of the RC circuit controls the duty cycle: the time duration of the output being high/low. Figure out the reason for the formulas used in estimating $t_{high}$ and $t_{low}$.
Starting from the general RC transient equation:
$$V(t) = V_{final} + (V_{initial} - V_{final})e^{-t/\tau}$$
###### $t_{high}$, charging from $\frac{1}{3}V_{cc}$ toward $V_{cc}$, stopping at $\frac{2}{3}V_{cc}$
$$\frac{2}{3}V_{in} = V_{in} + \left(\frac{1}{3}V_{in} - V_{in}\right)e^{-t/\tau}$$
$$\frac{2}{3}V_{in} = V_{in} - \left(\frac{2}{3}V_{in} \cdot e^{-t/\tau}\right)$$
$$e^{-t/\tau} = \frac{\frac{2}{3}V_{in} - V_{in}}{- \frac{2}{3}V_{in}} = \frac{-\frac{1}{3}V_{in}}{\frac{2}{3}V_{in}} = \frac{1}{2}$$
$$\ln\left(e^{-t/\tau}\right) = \ln\left(\frac{1}{2}\right)$$
$$\frac{-t}{\tau} = \ln\left(\frac{1}{2}\right)\to\frac{t}{\tau} = \ln(2)\to t=\tau\ \ln(2)$$
$$t_{high} = \tau_{charging} \ln(2) = \ln(2)(R_1 + R_2)C$$
###### For $t_{low}$, discharging from $\frac{2}{3}V_{in}$ toward $0$, stopping at $\frac{1}{3}V_{in}$
$$\frac{1}{3}V_{in} = 0 + \frac{2}{3}V_{in} \cdot e^{-t/\tau}$$
$$e^{-t/\tau} = \frac{\frac{1}{3}V_{in}}{\frac{2}{3}V_{in}} = \frac{1}{2}$$

$$t_{low} = \tau_{discharging} \ln(2) = \ln(2) R_2 C$$
**Both cases reduce to $e^{-t/\tau} = \frac{1}{2}$ because the thresholds are symmetric around $\frac{1}{2}V_{cc}$ — the cap always traverses exactly half the remaining voltage gap in both phases.**
##### 4. If you want to make the LED turn on over a much longer time, what would you change in the circuit? Verify by changing this in the circuit.**
To increase $t_{high}$, the time the LED is on, the RC time constant of the charging path must be increased. From:

$$t_{high} = \ln(2)(R_1 + R_2)C$$

either $C$, $R_1$, or $R_2$ can be increased. However the effect depends on which component is changed:

- Increasing $C$ scales both $t_{high}$ and $t_{low}$ proportionally, period increases but duty cycle is unchanged.
- Increasing $R_2$ also scales both, since $R_2$ appears in both $t_{high}$ and $t_{low}$.
- Increasing $R_1$ increases $t_{high}$ only, since $R_1$ is bypassed during discharge. This increases both the period and the duty cycle.

To maximize LED on-time while keeping off-time fixed, increase $R_1$.
![[lab4.jpg]]