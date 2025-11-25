# Lab 3
## Materials

- Several 10 to $100k$ resistors
- Two resistors of about $500k$
- $10M$ or $9.1M$ resistors ($2x$ minimum)
## Task
Measure the internal resistance of the voltmeter multi-meter from last week
We use what we have learned about voltage dividers and loading effect to estimate the internal resistances of analog voltmeters and DMV in the lab. We need resistors that are close to these values.

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american]
	\draw(0,0)
	to[vsource, invert, v=$24V$](0,4)
	to[R=$12k\Omega$](3,4)
	to[R=$12l\Omega$](3,0)--(0,0);
	
	\draw(3,4)
	to[short](5,4)
	to[generic, l=$R_{L}$](5,0)--(3,0);
\end{circuitikz}
\end{document}
```


## Parallel Resistor Power: Check Understanding using LLM (Claude Sonnet 4.5, Anthropic, Conversation on October 29, 2025)
---
###### Maximum Safe Voltage for Parallel Circuits

Given equivalent resistance $R_{eq}$ and power rating $P_{max}$, the maximum safe voltage is:
$$V_{max} = \sqrt{P_{max} \times R_{eq}}$$
This comes from the power formula $P = \frac{V^2}{R}$, rearranged to solve for voltage.
###### Power Rating in Series vs Parallel
**Key Point:** Power ratings ADD in both series and parallel configurations.
For three $0.25W$ resistors:
- Total power capacity: $P_{total} = 0.25W + 0.25W + 0.25W = 0.75W$
- This is true for BOTH series AND parallel
**Important Caveat:** This assumes identical resistors OR that you verify each individual resistor doesn't exceed its own rating.

###### Non-Identical Resistors in Parallel
**Critical Issue:** Resistors with different values do NOT share power equally in parallel!
The resistor with the **lowest resistance** dissipates the **most power**.
## Voltage Divider: Check Understanding using LLM (Claude Sonnet 4.5, Anthropic, Conversation on October 29, 2025)
---
###### Voltage Divider with 100kΩ Resistors

###### Basic Configuration

To reduce 20V to 10V using two 100kΩ resistors:
$$V_{out} = V_{in} \times \frac{R_2}{R_1 + R_2} = 20V \times \frac{100k\Omega}{100k\Omega + 100k\Omega} = 10V$$
###### Measuring Internal Resistance of Voltmeters
When a voltmeter is connected across $V_{out}$, its internal resistance ($R_{meter}$) appears in **parallel** with the bottom resistor ($R_2$).
This creates a parallel combination:
$$R_{parallel} = \frac{R_2 \times R_{meter}}{R_2 + R_{meter}}$$
The new output voltage becomes:
$$V_{measured} = V_s \times \frac{R_{parallel}}{R_1 + R_{parallel}}$$
Given:
- $R_1 = R_2 = 100k\Omega$
- $V_s = 20V$
- $V_{measured}$ = voltage reading from the meter

The internal resistance can be calculated as:

$$R_{meter} = \frac{100k\Omega \times V_{measured}}{20V - 2 \times V_{measured}}$$
If an analog voltmeter reads **9.5V** instead of the expected 10V:

$$R_{meter} = \frac{100k\Omega \times 9.5}{20 - 19} = 950k\Omega$$

###### Expected Results

- **Analog voltmeter:** Lower internal resistance (hundreds of kΩ) → causes noticeable voltage drop
- **Digital multimeter (DMM):** Very high internal resistance (10+ MΩ) → causes minimal voltage drop, reading close to 10V

The higher the internal resistance of the meter, the less it "loads" the circuit and the closer the measured voltage will be to the ideal 10V.

---
## Experiment 1
Make a circuit of resistors such that the combined resistance is about 50-100 ohms. Estimate, by modeling and calculation, the equivalent resistance at two terminals. Vary the input voltage at the terminals and measure and currents. Plot the v-i curve of the circuit (at the terminals).

###### Diagram of Circuit with Calculated Currents at 4.9V
```tikz

\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[vsource, invert, i_>=$94mA$, v=$V_{s}(4.9V) \leq V_{max}(5V)$](0,3)
	node[circ, label=above:$A$]{}
	to[short](3,3)
	to[R=$R_{1} {=} 100\Omega$, i_>=$51mA$, a_=$0.2401W$](3,0)--(0,0)
	node[circ, label=below:$B$]{};
	
	\draw(3,3)--(6,3)
	to[R=$R_{2} {=} 220\Omega$, i_>=$22mA$, a_=$0.109W$](6,0)--(3,0);
	
	\draw(6,3)--(9,3)
	to[R=$R_{3} {=} 220\Omega$, i_>=$22mA$, a_=$0.109W$](9,0)--(6,0);
\end{circuitikz}
\end{document}
```
$R_{par} = (\frac{1}{R_{1}} + \frac{1}{R_{2}}+\dots+\frac{1}{R_{n}})^{-1} = (\frac{1}{220} + \frac{1}{220} + \frac{1}{100})^{-1} \approx 52.38\ohm$

$P_{max} = 0.25A$
Since $P=\frac{V^{2}}{R}$, $V_{max} = \sqrt{P_{max}{R_eq}}$
Since this max supplied voltage is supplied equally to all resistors since they are in parallel (KVL), the max voltage is limited by the least resistive resistor
$V_{max}=\sqrt{0.25A(100\ohm)} = 5V$

$P_{R_1} = \frac{4.9V^2}{100} = 0.2401W$
$P_{R_2} = P_{{R_{3}}} =\frac{4.9V^2}{220} = 0.109W$
Therefore, we shouldn't push more than 5V through this circuit. To be safe, the max will be 4.9 for these tests

When calculating current through each resistor at 4.9V, we can just use $P=VI$, rearranged to $I=\frac{P}{V}$
$I_{R_1} = \frac{0.2401W}{4.9V}= 0.051A = 49mA$
$I_{R_2} = I_{R_{3}} =\frac{0.11W}{4.9V} = 0.022A = 22mA$
Current overall verifies KCL $I_{s} = \frac{4.9V}{52.38\ohm} = 0.094A = 94mA \approx 2(22mA) + 51mA$ 
#### Supplied Voltage and Current, Measured

| V_AB (V) | I_B (mA) |
| -------- | -------- |
| 0        | 0        |
| 0.5      | 9.37     |
| 1        | 18.76    |
| 1.5      | 28.18    |
| 3        | 56.56    |
| 4.9      | 92.79    |
```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}[scale=1.5]
\begin{axis}[
    width=12cm,
    height=8cm,
    xlabel={Voltage (V)},
    ylabel={Current (mA)},
    title={\Large I-V Characteristic Curve},
    grid=major,
    legend pos=north west,
    xmin=0, xmax=5,
    ymin=0, ymax=100,
]

% Measured Data
\addplot[
    only marks,
    mark=*,
    mark size=2.5pt,
    color=blue!70!black,
] coordinates {
    (0, 0)
    (0.5, 9.37)
    (1, 18.76)
    (1.5, 28.18)
    (3, 56.56)
    (4.9, 92.79)
};
\addlegendentry{Measured Data}

% Linear Fit
\addplot[
    thick,
    color=red,
    line width=1.5pt,
] coordinates {
    (0, 0.003)
    (4.9, 92.81)
};
\addlegendentry{Linear Fit}

\end{axis}
\end{tikzpicture}
\end{document}
```
---
## Experiment 2
Include an LED bulb in the circuit. Repeat process to produce a v-i plot of the circuit at a pair of chosen terminals.
```tikz

\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[vsource, invert, v=$V_{s}(4.9V) \leq V_{max}(5V)$](0,3)
	node[circ, label=above:$A$]{}
	to[short, l=$V_{s}$](3,3)
	to[R=$R_{1} {=} 100\Omega$, i_>=$\frac{4.9V-V_{LED}}{100\Omega}mA$, a_=$\frac{(4.9V-V_{LED})^{2}}{100\Omega} W$](3,0)
	to[led, color=red,i_>=$51.9mA$, l=$V_{LED}$](0,0)
	node[circ, label=below:$B$]{};
	
	\draw(3,3)--(6,3)
	to[R=$R_{2} {=} 220\Omega$, i_>=$\frac{4.9V-V_{LED}}{220\Omega}mA$, a_=$\frac{(4.9V-V_{LED})^{2}}{220\Omega} W$](6,0)--(3,0);
	
	\draw(6,3)--(9,3)
	to[R=$R_{3} {=} 220\Omega$, i_>=$\frac{4.9V-V_{LED}}{220\Omega}mA$, a_=$\frac{(4.9V-V_{LED})^{2}}{220\Omega} W$](9,0)--(6,0);
\end{circuitikz}
\end{document}
```
The LED will have a voltage drop. 
This will reduce the voltage drop across the 3 parallel resistors, and therefore the current as indicated.
This means that the current through the main loop, i.e at $A$ will be reduced as shown in the diagram above and the table/graph below
$I_{LED}=51.9mA(Measured)$
$R_{par} = 52.38\ohm$
$R_{total} = \frac{4.9V}{0.0519A} =94.4\ohm$
$R_{LED}= 94.4-52.38 = 42.03\ohm$
$V_{LED}=0.0519A(42.03\ohm)=2.18V$

| $V_AB (V) | I_B (mA) |
| --------- | -------- |
| 0         | 0        |
| 0.5       | 0        |
| 1         | 0        |
| 1.5       | 0.0008   |
| 2         | 2.5      |
| 3         | 18.1     |
| 3.5       | 26.7     |
| 4         | 35.5     |
| 4.9       | 51.9     |
| 6         | 71.6     |
```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}[scale = 1.5]
\begin{axis}[
    width=12cm,
    height=8cm,
    xlabel={Voltage (V)},
    ylabel={Current (mA)},
    title={\Large Diode I-V Characteristic Curve},
    grid=major,
    legend pos=north west,
    xmin=0, xmax=6,
    ymin=0, ymax=75,
]

% Measured Data
\addplot[
    only marks,
    mark=*,
    mark size=2.5pt,
    color=blue!70!black,
] coordinates {
    (0, 0)
    (0.5, 0)
    (1, 0)
    (1.5, 0.0008)
    (2, 2.5)
    (3, 18.1)
    (3.5, 26.7)
    (4, 35.5)
    (4.9, 51.9)
    (6, 71.6)
};
\addlegendentry{Measured Data}

% Exponential Fit
\addplot[
    smooth,
    thick,
    color=red!90!black,
    line width=1.5pt,
    samples=50,
] coordinates {
    (0, 0)
    (0.5, 0.00001)
    (1, 0.0001)
    (1.5, 0.001)
    (2, 2.4)
    (2.5, 6.5)
    (3, 17.8)
    (3.5, 26.8)
    (4, 35.7)
    (4.5, 44.5)
    (4.9, 51.8)
    (5.5, 62.3)
    (6, 71.5)
};
\addlegendentry{Exponential Fit}

\end{axis}
\end{tikzpicture}
\end{document}
```

---
## Experiment 3 - Using Voltage Dividers of 1k, 10k, and 100k $\ohm$ to Estimate Resistance of Analog Voltmeter
Design three voltage dividers to step down an input voltage from 20V to 10V. First, make it with two 1k resistors and supply 20V as its input. Use an analog voltmeter to measure the output voltage. Repeat the procedure with resistors of 10k and 100k. Use the result to estimate the internal resistance of the analog voltmeter.
###### Diagrams
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, font = \Large, scale = 2]
	\draw(0,1)
	node[]{Voltage Divider 1};
	
	\draw(-1,0)
	node[label=left:$V_{s} {=} 20V$]{}--++(1,0)
	to[R=$1k\Omega$]++(0,-2)
	node[circ]{}--++(1,0)
	node[label=right:$V_{out} {=} 9.15V$]{}
	++(-1,0)
	to[R=$1k\Omega$]++(0,-2)
	node[ground]{};
	
	\draw(5,1)
	node[]{Voltage Divider 2};
	
	\draw(4,0)
	node[label=left:$V_{s} {=} 20V$]{}--++(1,0)
	to[R=$10k\Omega$]++(0,-2)
	node[circ]{}--++(1,0)
	node[label=right:$V_{out} {=} 8V$]{}
	++(-1,0)
	to[R=$10k\Omega$]++(0,-2)
	node[ground]{};
	
	\draw(10,1)
	node[]{Voltage Divider 3};
	
	\draw(9,0)
	node[label=left:$V_{s} {=} 20V$]{}--++(1,0)
	to[R=$R_{1} {=} 100k\Omega$]++(0,-2)
	node[circ]{}--++(1,0)
	node[label=right:$V_{out} {=} 3V$]{}
	++(-1,0)
	to[R=$R_{2} {=} 100k\Omega$]++(0,-2)
	node[ground]{};
	
\end{circuitikz}
\end{document}
```

$V_{out}=(V_{s}\frac{R_{2}}{R_1+R_2})$
#### Measured Output Voltages with Analog Meter

| 1k$\ohm$ | 10k$\ohm$ | 100k$\ohm$ |
| -------- | --------- | ---------- |
| 9.15V    | 8V        | 3V         |

#### Resistance Calculations
At $100k\ohm$:
$V_{out}=(V_{s}\frac{R_{2}}{R_1+R_2})$
$V_{parallel} = 3V$
$I_{R_1} = \frac{20V-3V}{100000} = 170\micro A$
$I_{R_2}=\frac{3V}{100000} = 30 \micro A$
$I_{meter}=170-30 = 140\micro A$ by KCL
$R_{internal} = \frac{3V}{0.00014}=21.4k\ohm$

---
#### Experiment 4 - Using Voltage Dividers of 100k, 1M, and 10M $\ohm$ to Estimate Resistance of Digital Multimeter
Use a digital voltmeter in a digital multimeter to measure the output voltage of the last voltage divider, which is made of 100k resistors. Make two more voltage dividers to step down an input voltage from 20V to 10V. One with two resistors of 1M and another of about 10M. Use the digital meter to measure the output voltages. Use the result to estimate the internal resistance of the voltmeter.
###### Diagrams
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, font = \Large, scale = 2]
	\draw(0,1)
	node[]{Voltage Divider 1};
	
	\draw(-1,0)
	node[label=left:$V_{s} {=} 20V$]{}--++(1,0)
	to[R=$100k\Omega$]++(0,-2)
	node[circ]{}--++(1,0)
	node[label=right:$V_{out} {=} 10.065V$]{}
	++(-1,0)
	to[R=$100k\Omega$]++(0,-2)
	node[ground]{};
	
	\draw(5,1)
	node[]{Voltage Divider 2};
	
	\draw(4,0)
	node[label=left:$V_{s} {=} 20V$]{}--++(1,0)
	to[R=$1M\Omega$]++(0,-2)
	node[circ]{}--++(1,0)
	node[label=right:$V_{out} {=} 9.622V$]{}
	++(-1,0)
	to[R=$1M\Omega$]++(0,-2)
	node[ground]{};
	
	\draw(10,1)
	node[]{Voltage Divider 3};
	
	\draw(9,0)
	node[label=left:$V_{s} {=} 20V$]{}--++(1,0)
	to[R=$10M\Omega$]++(0,-2)
	node[circ]{}--++(1,0)
	node[label=right:$V_{out} {=} 6.764V$]{}
	++(-1,0)
	to[R=$10M\Omega$]++(0,-2)
	node[ground]{};
	
\end{circuitikz}
\end{document}
```
#### Measured Output Voltages

| 100k$\ohm$ | 1M$\ohm$ | 10M$\ohm$ |
| ---------- | -------- | --------- |
| 10.065V    | 9.622V   | 6.764V    |
#### Resistance Calculations
At $10M\ohm$:
$V_{out}=(V_{s}\frac{R_{2}}{R_1+R_2})$
$V_{parallel} = 6.764V$
$I_{R_1} = I_{circuit} = \frac{20V-6.764V}{10000000} = 1.32\micro A$
$I_{R_2}=\frac{6.6764V}{10000000} = 0.6764\micro A$
$I_{meter}=1.32\micro A - 0.6764\micro A = 0.6436\micro A$ by KCL
$R_{internal} = \frac{6.764V}{0.0000006436A}=10509633\ohm = 10.5M\ohm$

---
## Conclusion
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[circ, label=left:$V_{cc}$]{}
	to[R=$R_{1}$, i_>=$I_{1}$]++(3,0)--++(0,1)
	node[fill=white]{$V_{out}$}--++(0,1)
	to[qvprobe, t=v, a=$R_{meter}$, i_>=$I_{meter}$]++(3,0)--++(0,-2)++(-3,0)
	to[R=$R_{2}$, i_>=$I_{2}$]++(3,0)--++(1,0)
	node[ground, rotate=90]{};
\end{circuitikz}
\end{document}
```
Give the above circuit, the voltage is measured with the meter at $V_{out}$

When $R_{1}=R_{2} = n\ohm$, the voltage here is measured as half of $V_{cc}$ assuming a nominal load on the circuit
 
As we "load" the  circuit, or as the impedance of the what is connected at $V_{out}$ approaches the output impedance of the circuit $\frac{R_{1} \times R_{2}}{R_{1} + R_{2}}$
For 2 $100k\ohm$ resistors, this would be $\frac{100k\ohm \times 100k\ohm}{100k\ohm + 100k\ohm} \frac{10,000,000,000}{200,000}= 50k\ohm$

 Using $R_1 = R_2$ gives (1) known reference voltage of exactly $V_s/2$, (2) simplified math, (3) maximum sensitivity when $R_{meter} \approx R_2$, and (4) easy comparison to see loading effects immediately.
 
So if the analog voltmeter connected at $V_{out}$ has an internal resistance of about $21k\ohm$, it will be loading the circuit pretty significantly.
This results in a voltage reading that is not what we expect, it also demonstrates the importance of considering output impedance when designing a circuit and the consideration of the impedance rating of components and their internal resistance. 

Digital multimeters have a much larger internal impedance and are preferable in this way!

When a measuring instrument is connected to a circuit, it becomes part of that circuit and can change the voltage/current being measured. This is why voltmeters need high internal resistance - to minimize their impact on the circuit.

Output impedance of a source should be ≤ 1/10 of the input impedance of the load to minimize loading effects. With this ratio, the voltage delivered to the load is $V_{load} = V_{source} \times \frac{10}{11} \approx 0.91 V_{source}$ (only ~9% drop). Without this rule (equal impedances), you get 50% voltage drop!

Digital multimeters (10MΩ) measuring a 100kΩ divider have 100× ratio → minimal loading, read ~10V. Analog meters (100kΩ) have 1× ratio → heavy loading, read ~6.67V. This demonstrates why high-impedance instruments and op-amp buffers (high input impedance, low output impedance) are essential in circuit design.

#### Connecting Algebraic and KCL Methods for Finding Meter Resistance

**Algebraic Method** starts with the voltage divider formula: $V_{measured} = V_s \times \frac{R_{parallel}}{R_1 + R_{parallel}}$ where $R_{parallel} = \frac{R_2 \times R_{meter}}{R_2 + R_{meter}}$. This describes how voltage splits based on resistance ratios, treating the meter and $R_2$ as one equivalent resistance.

**KCL Method** follows the physical current path: (1) Find $I_{R_2} = \frac{V_{measured}}{R_2}$, (2) Find voltage across $R_1$: $V_{R_1} = V_s - V_{measured}$, (3) Find total current: $I_{total} = \frac{V_s - V_{measured}}{R_1}$, (4) Apply KCL: $I_{meter} = I_{total} - I_{R_2}$, (5) Calculate $R_{meter} = \frac{V_{measured}}{I_{meter}}$.

**The Bridge:** Both methods describe the same current! Algebraic gives $I_{total} = \frac{V_s}{R_1 + R_{parallel}}$ while KCL gives $I_{total} = \frac{V_s - V_{measured}}{R_1}$. These are identical because: $V_s - V_{measured} = I_{total} \times R_1$ (voltage across $R_1$) and $V_{measured} = I_{total} \times R_{parallel}$ (voltage across parallel section). Adding these: $V_s = I_{total}(R_1 + R_{parallel})$, which rearranges to $I_{total} = \frac{V_s}{R_1 + R_{parallel}}$.

**Key Insight:** The voltage divider formula IS just KCL and Ohm's Law combined into a compact form. The KCL method shows the physics step-by-step using basic laws explicitly. The algebraic method uses the shortcut formula and works backwards through substitution. Both arrive at $R_{meter} = \frac{n\Omega \times V_{measured}}{20V - 2V_{measured}}$.

**Why KCL feels clearer:** It follows the physical current path, builds up from knowns to unknowns, and makes the circuit behavior visible at each step. The algebraic method is mathematically direct but hides the underlying physics behind the formulas.