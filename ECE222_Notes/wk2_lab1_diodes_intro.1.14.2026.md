## Lab 1
#### Introduction
###### Objective
Measure the current and voltage relationship of a diode: 1N 4148

###### Diodes
A diode conducts current, but the $i-v$ relationship is very different from ohmic resistors. This lab will focus on finding this relationship in two ways:
1. Using a potentiometer to control the voltage difference across the diode and thereby the current flowing through it. 
2. Using a function generator to vary the source voltage with a triangular wave.
###### 1N 4148 Information

| Rating                              | Value | Unit |
| ----------------------------------- | ----- | ---- |
| Max. Reverse Voltage                | $100$ | $V$  |
| Avg. Forward Current                | $200$ | $mA$ |
| DC Forward Current                  | $300$ | $mA$ |
| Recurrent Peak Forward Current      | $400$ | $mA$ |
| Non-repetetive Peak Forward Current | $1.0$ | $mA$ |
###### Materials
1. Diode: 1N 4148
2. $1k\ohm$ and $10k\ohm$ resistors, $100k\ohm$ potentiometer
3. Function generator, power supply, oscilloscope
4. Breadboard and connecting wires
#### Procedure
##### Part 1
###### Diagram
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

\draw(0,0)
node[label = left:$5V$]{}
to[R=$1k\Omega$]++(2,0)
to[potentiometer, label = $100k$]++(2,0)
to[diode, a=$1N4148$]++(0,-2)
node[ground, scale=2]{};

\end{circuitikz}
\end{document}
```
1. Make the circuit, ensure the DC source is grounded and connected to common ground.
2. Set the potentiometer at $100k$. Use a digital multimeter (e.g. M9803R) to measure the voltage across the combined resistor and potentiometer. Then use the DMM to measure the voltage across the diode $V_D$. Do they add up to $5V$?
3. Find the current through the diode ($I_D$). This could be done by measuring the voltage drop over the $1k\ohm$ resistor and dividing this by $1k$ because the current will be the same everywhere in the series circuit.
4. Record ($V_{D}, I_{D}$).
5. Step down the combined resistance to a lower value by dialing the potentiometer. Measure and record the corresponding ($V_D, I_D$)
6. Make two plots of the recorded ($V_D, I_D$). One is a linear plot and the other a semi-log plot.
###### Part 2
The second circuit has a voltage input $V_S$ provided by a function generator (e.g. AFG3052C). You will use a voltage input signal of a triangle wave form and make measurements using a 2014C scope.

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

\draw(0,0)
node[label = left:$V_{in}$]{}
to[R=$10k\Omega$]++(2,0)
to[diode, a=$1N4148$]++(0,-2)
node[ground, scale=2]{};

\end{circuitikz}
\end{document}
```
1. Make the circuit. Make sure all grounds use the AFG output ground (common).
2. Set the AFG for a ramp waveform of $60Hz$, $10V_{pp}$, with a $DC$ offset of $5V$. This gives a source voltage $V_{s}$ for the circuit going from $0V$ to $10V$. Check the display.
3. Connect $CH1$ of the scope to the input voltage $V_s$. Use $1.0V/div$ for the scale. Coupling: set the bandwidth limit to $20MHz$.
4. Connect $CH2$ to measure the diode voltage. Scale $100 mV/div$. Coupling: DC, bandwidth limit: $20MHz$.
5. Set the scope timebase: $5ms/div$
6. Flip scope to $XY$ mode. CH2 is $X$. Use math channel to have $Y$ being ($CH1-CH2$), $1V/div$. On the screen the $Y$-axis is labeled in volts but it gives current measurement. The resistor is $10k$, so the $1V$ division on the screen corresponds to $0.1mA$ of current.
#### Results
##### Part 1
###### $V_D$ vs. $I_D$ Data

| $V_D (V)$ | $I_D$   |
| --------- | ------- |
| 0.406     | 0.0495  |
| 0.450     | 0.05564 |
| 0.499     | 0.10806 |
| 0.555     | 0.33644 |
| 0.574     | 0.47450 |
| 0.601     | 0.83570 |
| 0.625     | 1.32940 |
| 0.647     | 2.0085  |
| 0.681     | 3.73400 |
###### $V_D$ vs. $I_D$ Liner Plot
```tikz
\usepackage{pgfplots}

\begin{document}
\begin{tikzpicture}
\begin{axis}[
    xlabel={$V_D$ [V]},
    ylabel={$I_D$ [mA]},
    grid=major,
    width=10cm,
    height=8cm,
]

\addplot [red, thick, no marks] coordinates {
    (0.406, 0.0495)
    (0.450, 0.05564) 
    (0.499, 0.10806)
    (0.555, 0.33644)
    (0.574, 0.47450)
    (0.601, 0.83570)
    (0.625, 1.32940)
    (0.647, 2.0085)
    (0.681, 3.73400)
};

\addplot [only marks, mark=*] coordinates {

    (0.406, 0.0495)
    (0.450, 0.05564) 
    (0.499, 0.10806)
    (0.555, 0.33644)
    (0.574, 0.47450)
    (0.601, 0.83570)
    (0.625, 1.32940)
    (0.647, 2.0085)
    (0.681, 3.73400)
};
\end{axis}
\end{tikzpicture}
\end{document}
```

###### $V_D$ vs. $I_D$ Semi-log Plot
```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
\begin{axis}[
    xlabel={$V_D$ [V]},
    ylabel={$I_D$ [mA]},
    ymode=log,
    grid=major,
    width=10cm,
    height=8cm,
]
\addplot [red, thick, no marks] coordinates {
    (0.406, 0.0495)
    (0.450, 0.05564) 
    (0.499, 0.10806)
    (0.555, 0.33644)
    (0.574, 0.47450)
    (0.601, 0.83570)
    (0.625, 1.32940)
    (0.647, 2.0085)
    (0.681, 3.73400)
};
\addplot [only marks, mark=*] coordinates {
    (0.406, 0.0495)
    (0.450, 0.05564) 
    (0.499, 0.10806)
    (0.555, 0.33644)
    (0.574, 0.47450)
    (0.601, 0.83570)
    (0.625, 1.32940)
    (0.647, 2.0085)
    (0.681, 3.73400)
};
\end{axis}
\end{tikzpicture}
\end{document}
```
##### Part 2
![[lab1_c2.png]]

#### Conclusion
Comparison of the two approaches to find the $i-v$ relationship

Manually measuring the data points and finding the current one measurement at a time was tedious and having the scope do this all in one go, while also generating the plot was really nice.

However, there was a lot of set up to get the scope dialed in to display the data in a way that showed something conclusive and useful.

The main observation is that until the voltage reaches a certain point (forward voltage) where the current suddenly spikes.
