## Class 1
#### Review From 221
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[vsource, v=$10V$]++(0,2)
	to[R=$200\Omega$]++(2,0)
	node[label=right:$A$, ocirc]{}
	to[R=$200\Omega$]++(0,-2)
	node[label=right:$B$, ocirc]{}
	to[short](0,0);
	
\end{circuitikz}
\end{document}


```
No formula used, intuitively know this is a voltage divider and $V_{AB} = 5V$ 

Flow of current is created by the difference in voltage connected by a conductor path

#### Time Based Circuits and Inductors
Elements of the circuits are related by rate of change.

Inductors will "resist" against large current influx or drain.

With capacitance, there is a time constant and a capacitance relationship.

Time becomes a crucial element moving forward.

With higher frequency voltage changes, this leaves little time for the capacitor to reach equilibrium, meaning it will not fully charge. This creates a filtering effect. 

#### Transient and Steady State
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[vsource, v=$12V$, invert]++(0,2)
	to[short]++(1,0)
	node[label=above:$A$, ocirc]{}++(0.25,0)
	to[R=$3\Omega$]++(0,-1)
	to[R=$9\Omega$]++(0,-1)--(0,0);
	
	\draw(1.5,2)
	node[label=above:$B$, ocirc]{}
	to[short]++(1,0)--++(0,-2)--(0,0);
	
\end{circuitikz}
\end{document}
```
At a certain time the switch moves to node A.  A current of 1A in flows. 


Given a resistor and capacitor in series, the moment the switch is closed, the capacitor begins charging and the voltage is across the resistor. As the capacitor builds charge, the voltage across the resistor will drop. We can say there is a transience as the capacitor reaches $12V$ (The steady state where current across the resistor is 0).
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[vsource, v=$12V$, invert]++(0,2)
	to[switch]++(1,0)
	to[R=$3\Omega$]++(1,0)
	to[capacitor, l=$C$]++(0,-2)--(0,0);
	
\end{circuitikz}
\end{document}
```
$$V_{c} = V_{f} + (V_{i}-V_{f})e^{\frac{-t}{R\cdot C}}$$
$V_f =$ Steady State
$(V_{i}-V_{f})e^{\frac{-t}{R\cdot C}} =$Transient 

#### IW 1.1
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[vsource, v=$12V$, invert]++(0,2)
	to[switch]++(1,0)
	to[R=$3\Omega$]++(1,0)
	to[capacitor, l=$C$]++(0,-2)--(0,0);
	
	\draw(4,0)
	to[vsource, v=$12V$, invert]++(0,2)
	to[switch]++(1,0)
	to[R=$3\Omega$]++(1,0)
	to[inductor, l=$L$]++(0,-2)--(4,0);
\end{circuitikz}
\end{document}
```
As a long time is passed after the switch is closed, that are the voltages and currents in the RC and RL circuits above?
What about the responses of voltages and currents in these two circuits over time after the switch closes?
Sketch plots of the currents and voltages over time to show your thoughts.

1. When the switch is initially closed, the voltage in the inductor is effectively $12V$. Current does not flow because the inductor creates a voltage to resist the increase of current.
2. How will the voltage over the resistor change as current flows through the inductor?
3. A voltage suddenly enters the inductor upon closing the switch, it will resist current, not changing instantaneously. 
4. As time passes this resistive voltage ($V_L$) will **decrease** and current will begin flowing exponentially (**increasing**). The flow of current is directly proportional to the voltage in the resistor ($V_R$, **increasing**).
5. Over time, $V_R + V_L$ will be a steady 12V.
#### Inductor and Capacitor Equations
Compare the relationships above with these equations, keeping in mind the steady state and the transient.

$$V_L = L\cdot\frac{di_L}{dt}$$
$$i_e = C \cdot\frac{dV_c}{dt}$$
#### Responses of Resistive Circuits to AC Sources

```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[sV, label=$24cos(377t)$]++(0,2)
	to[short]++(1,0)
	node[label=above:$A$, ocirc]{}++(0.25,0)
	to[R=$3\Omega$]++(0,-1)
	to[R=$9\Omega$]++(0,-1)--(0,0);
	
	\draw(1.5,2)
	node[label=above:$B$, ocirc]{}
	to[short]++(1,0)--++(0,-2)--(0,0);
	
\end{circuitikz}
\end{document}
```
With the switch at $A$, the current of the loop $=2cos(377t)A$
$3\ohm = 6Vcos(3377t)$
$3\ohm = 18Vcos(3377t)$

The resistor does not take time to change, it is immediately in steady state. Current and voltages are **in phase**.

To convert phase:
1. $18cos(wt+90^\circ)$
2. $18sin(wt) = 18cos(wt-90^\circ)$
3. These two signals have a phase difference of $180^\circ$

$$V_R = i_R \cdot R$$

```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[sV, label=$120sin(377t)$]++(0,2)
	to[switch]++(1,0)
	to[R=$3\Omega$]++(1,0)
	to[inductor, l=$0.1H$]++(0,-2)--(0,0);
\end{circuitikz}
\end{document}
```
The voltage source is sinusoidal specified as $v_s(t) =120sin(377t)V$. At $t-0$ the switch closes. At that time the current in the circuit is 0. The circuit responds to the input voltage with the following:
The voltages will oscillate around the same inductor curve as the DC circuit. At the steady state the voltage of the resistor will be 5 times the current. The voltage of the inductor will be the differentiation.
$$i(t) = 3.128e^{-50t} + 3.16cos(377t-172.5^\circ)A$$