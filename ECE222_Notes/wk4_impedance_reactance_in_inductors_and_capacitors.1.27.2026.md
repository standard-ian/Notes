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
$$e^{-j90^\circ} = cos(-90^\circ) + jsin(-90^\circ) = 0 -j = -j = \frac{1}{j}$$
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
$$e^{j\frac{\pi}{2} = j}$$
$$Z_L = \frac{\tilde{V}}{\tilde{I}} = \frac{V_me^{j(\theta + \frac{\pi}{2})}}{\frac{V_m}{\omega L}e^{j(\frac{\pi}{2})}} = j\omega L$$
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
## Class 8
#### Review of Reactance, Inductance in AC Capacitors, Inductors
###### Inductor
$$i_L(t) = I_m cos(\omega t + \theta)$$
$$V_L = L\frac{di_L}{dt} = \omega L I_m cos(\omega t + 90 + \theta)$$
$$\tilde{I}_L = I_me^{j\theta}$$
$$\tilde{V}_L = \omega LI_me^{j(\theta + \frac{\pi}{2})}$$
$$\frac{\tilde{V}_L}{\tilde{I}_L} = \omega L e^{j\frac{\pi}{2}}$$
$$e^{j(\frac{\pi}{2})} = j$$
$$\frac{\tilde{V}_L}{\tilde{I}_L} = \omega L j = Z_I = Impedance$$
$$\omega L = X_L = Reactance$$
###### Capacitor
$$V_C(t) = V_m cos(\omega t + \phi)$$
$$i_c(t) = C\frac{dV_c}{dt} = C V_m \omega cos(\omega t + \phi + \frac{\pi}{2})$$
$$\tilde{V}_C = V_me^{j\phi}$$
$$\tilde{I}_C = \omega C V_m e^{j(\phi + \frac{\pi}{2})}$$
$$\frac{\tilde{V}_C}{\tilde{I}_C} = \frac{1}{j\omega C} = Z_C = Impedance $$
$$\frac{1}{\omega C} = X_C = Reactance$$
#### IW 8.1 
The circuit is in a steady state, the voltage $v(t)$ is measured as $v(t) = 40cos(200000t) V$ 
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[scale=2, font=\Large]

	\draw(0,0)
	node[ocirc, label=left:${+}$]{}
	to[short, i = $i(t)$]++(1,0)
	to[R = $10\Omega$]++(0,-2)++(0,2)--++(1,0)
	to[R=$6\Omega$]++(0,-1)
	to[inductor, l=$40\mu H$]++(0,-1)++(0,2)--++(1,0)
	to[capacitor, l=$1\mu F$]++(0,-2)--++(-3,0)
	node[ocirc, label=left:${-}$]{};
	
	\draw(0,-1)
	node[label=$v(t)$]{};
	
\end{circuitikz}
\end{document}
```
$$\tilde{V}_s = 40e^{j} = 40$$
1. Determine the complex impedance of each branch
	1. $10\ohm$ Branch: 
		1. $Z_R = 10\ohm$
	2. $6\ohm + 40\micro H$ Branch: 
		1. $Z_{R+I} = 6 + (40\times 10^{-6})(j)(2 \times 10^5) = 6 + 80\times 10^{-1}j = 6 + 8j\ohm$   
	3. $1\micro F$ Branch: 
		1. $Z_C = \frac{1}{(j)(2\times 10^{5})(1\times 10^{-6})} = \frac{1}{0.2j} = -5j$
2. Determine the current phasor of each branch
	1. $10\ohm$ Branch: 
		1. $I_R = \frac{40}{Z_R} = \frac{40}{10} = 4A$
	2. $6\ohm + 40\micro H$ Branch: 
		1. $\tilde{V}_L = 40V$
		2. $Z_L = 6 + 8j$
		3. $\tilde{I}_L = \frac{\tilde{V}_L}{Z_L}$
		4. $\tilde{I}_C = \frac{40}{6 + 8j} =$
		5. $\tilde{I}_L =$
	3. $1\micro F$ Branch: 
		1. $\tilde{V}_C = 40V$
		2. $Z_C = -5j$
		3. $\tilde{I}_C = \frac{\tilde{V}_C}{Z_C}$
		4. $\tilde{I}_C = \frac{40}{-5j} = j8$
		5. $\tilde{I}_C = j8A$
3. Find the phasor of the current $i(t)$
4. Find the total impedance of the parallel impedances

#### Example

```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[scale=2, font=\Large]

	\draw(0,0)
	node[ground, scale=2]{}
	to[sV]++(0,2)
	node[label=left:$V_{in}$]{}
	to[capacitor, l = $0.01\mu F$]++(2,0)--++(1,0)
	node[circ, label=right:$V_{out}$]{}++(-1,0)
	to[R=$10k\Omega$]++(0,-2)
	node[ground, scale=2]{};
	
\end{circuitikz}
\end{document}
```
$$V_{in} = V_m\angle 0^\circ = V_me^{j0^\circ}$$
$$100Hz \lt \omega \lt 100000Hz;\ \omega = f2\pi$$
$$V_{out} = V_{in} \frac{10k}{10k + \frac{1}{j\omega C}}$$
$$\omega = 100\cdot 2\pi =  100000\cdot 2\pi$$
###### For $\omega = 100\times 2\pi$
$$\frac{V_{out}}{V_{in}} = \frac{10k}{10k+ \frac{1}{j\times 100\times 2\pi\times 0.01\times 10^{-6}}}$$
###### For $\omega = 100000\times 2\pi$
$$\frac{V_{out}}{V_{in}} = \frac{10k}{10k + \frac{1}{j\times 100000\times 2\pi\times 0.01\times 10^{-6}}}$$
This creates a voltage divider where a component's (capacitor's) impedance is forming a part of the divider.