## Class 7
#### Capacitance
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=2, font=\Large]
	\draw(0,0)
	to[short, i = $i_C(t)$]++(2,0)
	to[capacitor, l = $v_C(t)$]++(0,-2)--++(-2,0);
\end{circuitikz}
\end{document}
```

$$i_C = C \cdot \frac{dV_C}{dt},\ v_C = \frac{1}{C}\int i_C dt$$
If:
$$i_C(t) = I_0cos\omega t\to v_C(t) = \frac{1}{C}\int i_C(t) dt = \frac{I_0}{\omega\cdot C}sin\omega t =  \frac{I_0}{\omega\cdot C}cos(\omega t - 90^\circ)$$
$$\tilde{I}_C = I_0e^{j0^\circ},\ \tilde{V}_C = \frac{I_0}{\omega\cdot C}e^{j(-90^\circ)}, \frac{|\tilde{V}|}{|\tilde{I}|} = \frac{I}{\omega C}$$
$|\tilde{V}|$ means the **amplitude** of the voltage

We think of the ratio of the amplitudes as something like resistance, but referred to as **reactance ($X$)**.

**The reactance of a capacitor**: $X_C = \frac{1}{\omega C}$

The energy buildup is due to energy storage. 
If the current is slowed, the voltage will increase.

When the voltage is high, the capacitor cannot react that fast. The voltage buildup in the capacitor will be inversely proportional to the voltage itself. 

##### Impedance of Capacitor
While the reactance is the ratio of the magnitudes of the phasors, Impedance is the ratio of the complex numbers themselves.
$$\frac{\tilde{V}_C}{\tilde{I}_C} = \frac{\frac{I_0}{\omega C}e^{j(-90^\circ)}}{I_0e^{j0^\circ}} = \frac{1}{\omega C}\cdot e^{j(-90^\circ)}$$
$$e^{-90^\circ} = cos(-90^\circ) + jsin(-90^\circ) = 0 -j = -j = \frac{1}{j}$$
$$Z_c = \frac{1}{j\omega C} = \frac{-j}{\omega C}$$
#### Inductance
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=2, font=\Large]
	\draw(0,0)
	to[short, i = $i_L(t)$]++(2,0)
	to[inductor, l = $v_L(t)$]++(0,-2)--++(-2,0);
\end{circuitikz}
\end{document}
```

$$V_L(t) = L\frac{di_L}{dt},\ i_L(t) = \frac{1}{L}\int V_L dt$$
$$V_L(t) = V_mcos(\omega t),\ i_L(t) = \int(\frac{1}{L})V_L(t) dt$$
$$i_L(t) = \int(\frac{1}{L})V_L(t) dt = \frac{V_m}{L\cdot m}sin(\omega t) = \frac{V_m}{\omega\cdot m} cos(\omega t - 90^\circ)$$
Reactance of an inductor is:
$$X_L = \frac{|\tilde{V}|}{|\tilde{I}|} = \omega L$$
Impedance of an inductor is:
$$Z_L = \frac{\tilde{V}}{\tilde{I}} = \frac{V_me^{j0^\circ}}{\frac{V_m}{\omega L}e^{90^\circ}} = j\omega L$$
#### Impedances of Resistor, Inductor, Capacitor
$$Z_R = R$$
$$Z_L = j\omega L$$
$$Z_C = \frac{1}{j\omega C} = \frac{-j}{\omega C}$$

###### Inductors: Current lags, voltage leads
Current is an integral of voltage, **an accumulation**.
Voltage is a derivative of current, **a surging rate of change in potential**.
###### Capacitors: Voltage lags, current leads
Voltage is an integral of current, an **accumulation of charges**. 
Current is a derivative of voltage, **surging while voltage must catch up**.

#### Example: Use of Impedance in Phasors
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=2, font=\Large]
	\draw(0,0)
	to[short, i = $i_L(t)$]++(1,0)
	to[R=$100\Omega$]++(1,0)
	to[inductor, a = $V_L$, l = $50mH$]++(0,-2)--++(-2,0);
\end{circuitikz}
\end{document}
```
$$i(t) = 50cos(1000t + 45^\circ)mA$$
The current is oscillating at 1000 radians per second, passing through the entire circuit.
This is going to generate a voltage across the resistor of $100\times 50 cos(1000t + 45^\circ) mV = 5cos(1000t + 45^\circ) V$
The voltage across the inductor is going to phase lead by $\frac{\pi}{2}$
$$\tilde V_{R} = 5e^{j\frac{\pi}{4}}V$$
$$\tilde{I} = 50e^{j\frac{\pi}{4}}$$
$$Z_L = j\omega L = j(1000)(50\times 10^{-3}) = j50\ohm$$
$$j = e^{j90^\circ} = e^{j\frac{\pi}{4}}$$
$$\tilde{V}_L = \tilde{I}\cdot Z_L = j50(50\times 10^{-3}e^{j\frac{\pi}{4}}) = j50(0.05e^{j\frac{\pi}{4}}) = 50e^{j\frac{\pi}{4}}(0.05)e^{j\frac{\pi}{4} }$$

$$=(50\times 0.05)e^{j(\frac{\pi}{2}+{\frac{\pi}{4}})} = 2.5e^{j(135^\circ)}$$


```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=2, font=\Large]
	\draw(0,0)
	to[short, i = $\tilde{I} {=} 50e^{j45^\circ}$]++(1,0)
	to[R=$100\Omega$]++(1,0)
	to[inductor, a = $j\omega L$, l = $j50\Omega$]++(0,-2)--++(-2,0);
\end{circuitikz}
\end{document}
```
$$\omega = 1000 \frac{rad}{s}$$
