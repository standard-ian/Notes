
# Lab 1
## Part 1:
Power Supply = $5V$
Resistor value = $150K\ohm$$

| Circuit | Total Resistance (Calcualted) | Total Resistance (Measured) | Current (Calculated)                               | Current (Measured) | Description                         |
| ------- | ----------------------------- | --------------------------- | -------------------------------------------------- | ------------------ | ----------------------------------- |
| 1       | $150K\ohm$                    | $150.55\ohm$                | $I=\frac{V}{R} = \frac{5V}{150K\ohm} = 33\micro A$ | $33.205 \micro$A   | 1 $150K \ohm$ resistor              |
| 2       | $75K\ohm$                     | $75.55\ohm$                 | $66\micro A$                                       | $65.989\micro A$   | 2 $150K \ohm$ resistors in parallel |
###### Circuit #1
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=1.5]
	\draw(0,0)
	to[vsource, invert, v=$5V$](0,2)--(3,2)
	to[R=$150k\Omega$](3,0)--(0,0);
\end{circuitikz}
\end{document}
```
###### Circuit #2
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=1.5]
	\draw(0,0)
	to[vsource, invert, v=$5V$](0,2)--(-2,2)
	to[R, a=$150k\Omega$](-2,0)--(2,0)
	to[R=$15k\Omega$](2,2)--(0,2);
\end{circuitikz}
\end{document}
```
###### Trend for measured current vs. voltage for circuit 1

| Voltage (V) | Current ($\micro$A) |
| ----------- | ------------------- |
| 1           | 6.632               |
| 2           | 13.272              |
| 3           | 19.914              |
| 4           | 26.552              |
| 5           | 33.195              |
## Part 2:
The function generator was connected to the oscilloscope. A function was genereated 

## Part 3:

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=1.5]
	\draw(0,0)
	to[vsource, invert, v=$5V$](0,2)
	to[led, color=yellow](3,2)--(3,0)
	to[R, l={\Large $\frac{5V-2.1}{20\times 10^{-3}} {=} 145\Omega$}](0,0);
\end{circuitikz}
\end{document}
```
$V = 5V$
Min resistance to avoid damage is $145\ohm$ calculated using the forward voltage equation given for the yellow LED.
We build the circuit using a 150$\ohm$ resistor. We don't have a 145$\ohm$, so 150$\ohm$ will be the best practical choice for maximum brightness of the provided yellow LED.
###### Questions:
Why use this forward voltage law? 
What is the 2.1 value representing?
Do different LEDs have different constants for their equation? 
Is the equation form the same and what does it represent?


