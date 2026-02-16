## Class 13
### Midterm Review
#### Transient RC Circuit
The voltage of a capacitor of capacitance $1\micro F$ in an RC circuit is measured to be $12e^{-500t}V$.
1. The cap charging equation is:
 $$V_C(t) = V_f + (V_i - V_f)e^{\frac{-t}{RC}}$$
 Since in the transient state the cap's voltage is 0 at $t=0$, for this to be true, the cap must be discharging, in other words, it's $V_f$ would be 0.
 $$V_C(t) = 0 + (V_i)e^\frac{-t}{RC} - (0)e^{\frac{-t}{RC}}$$
It stands to reason that $V_i = 12$ and as time progresses, $e^\frac{-t}{RC}$ will be $e^{increasingly\ larger\ \textbf{negative}\ number}$, therefore $V_i$ will be multiplied by an increasingly **smaller** fraction, and $V_C(t)$ will approach 0 (discharging).

2. Since:
 $$ln(e^\frac{-t}{RC}) = ln(e^{-500t})\to\frac{-t}{RC} = -500t\to\frac{1}{RC} = 500$$
 $$RC = \frac{1}{500}$$
 The time constant is inversely proportional to the rate of change of voltage in the capacitor. A **larger** time constant will mean that $e^\frac{-t}{\tau}$ will become a **smaller** fraction **more slowly**. As time goes on, the exponent on $e$'s numerator will increase linearly, but always be divided by a larger constant.
 
 3. The current of a capacitor is the derivative of the voltage because it races ahead.    
	$$V_C(t) = 12e^{-500t}$$
 $$I_C(t) = C\frac{d}{dt}12e^{-500t}= -500(12)Ce^{-500t}A$$
 $$= -6000(1\times 10^{-6})e^{-500t} = -6e^{-500t}mA$$
 This makes sense because when discharging, the current is flowing opposite of the source, negative.
#### Transient RL Circuit
The following RC circuit has a resistance of $100\ohm$
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[vsource, invert, l=$V_s$]++(0,2)
	to[switch]++(1,0)
	node[circ, label=above:$A$]{}
	to[R=$100\Omega$]++(1,0)
	to[inductor, l=$L$]++(0,-2)--++(-1,0)
	node[circ, label=below:$B$]{}--++(-1,0);
\end{circuitikz}
\end{document}

```
The switch closes at $t = 0$ and the voltage across the inductor is measured as $V_L(t) = 5e^{-1000t}V$ 
1. The time constant $\tau = \frac{L}{R}$. For an inductor circuit, the transient state as a function of time is:
   $$V_L(t) = V_f + (V_i - V_f)e^\frac{-t}{L/R}$$
If the voltage is measured as $5e^{-1000t}$
$$e^{-1000t} = e^{\frac{-t}{L/R}}\to1000 = \frac{1}{L/R} \to \tau = \frac{L}{R} = \frac{1}{1000}$$
2. The inductance would then be:
   $$\frac{L}{100} = \frac{1}{1000}\to L = 0.1H$$
3. After a long time, the voltage of the inductor will be 0.
$$0 + (V_i)e^{\frac{-t}{L/R}} - (0)e^{\frac{-t}{L/R}}$$
4. The current across the inductor at steady state will be the full current of the circuit, this will be the integral of the inductor voltage.
#### AC RLC Example 1
$$V_{ac}(t) = 100cos(10^4 t)V$$
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$V_{in}$]{}--++(1,0)
	to[R=$20\Omega$]++(0,-2)--++(3,0)++(-2.5,0)
	node[ground, scale=2]{}++(-0.5,2)--++(1.5,0)
	to[inductor, l=$2.5mH$]++(0,-2)++(0,2)--++(1.5,0)
	to[capacitor, l=$5\mu F$]++(0,-2)++(0,2)--++(1,0)
	node[ocirc, label=right:$V_{out}$]{};
\end{circuitikz}
\end{document}

```
1. Find the impedances of the resistor, inductor, and capacitor
	1. $Z_R = 20\ohm$ 
	2. $Z_L = j\omega L = 10000 \times 2.5 \times 10^{-3} = j25\ohm$ 
	3. $Z_C = \frac{-j}{\omega C} = \frac{-j}{10^4 \times 5\times 10^{-6}} = \frac{-j}{0.05} = -j20\ohm$  
2. Explain the concept of input impedance at the input source. 
	1. This can be though of as how much the circuit resists current flow. 
	2. $Z_{circ} = \left(\frac{1}{20\ohm} + \frac{1}{j25\ohm} + \frac{1}{-j20\ohm}\right)^{-1}$
	3. $=\frac{1}{0.05  -j0.04 + j0.05 } = \frac{1}{0.05 + j0.01}\ohm =\frac{0.05 -j0.01}{0.0025 -(j0.01)^2} = \frac{0.05 - j0.01}{0.0025 -j^2(0.0001)} = \frac{0.05}{0.0026} - \frac{j0.01}{0.0026} = 19.23 - j3.85\ohm$ 
3. The phasor of the source current?
	1. Phasor of source voltage: $\tilde{V}_{source} = 100e^{j0^\circ} = 100V$ 
	2. $|Z_{in}| = \sqrt{19.23^2 + 3.85^2} = 19.61$ 
	3. $\angle Z_{in} = arctan\left(\frac{-3.85}{19.23}\right) = -11.32^\circ$
	4. $\tilde{I}_{source} = \frac{100}{19.61\angle11.32^\circ} = 5.09\angle-(-11.32^\circ)$
	5. $11.32\times \frac{\pi}{180} = 0.198 rad$
	6. $I_{source} = 5.09cos(10^4t + 0.198)A$
	7. Source current leads the voltage.
4. What inductance would make the input impedance entirely real?
	1. If the inductor were instead $2mH$, we'd see $Z_{circ} = \frac{1}{0.05  -j0.05 + j0.05 }  = 20\ohm$
5. Resistor current?
	1. Original inductance
		1. Voltage across all parallel branches is still $100V$, meaning the resistor current is $5A$, just there is additional current with phase lead through the LC portion.
	2. Replaced inductance
		1. LC acts as infinite impedance, all current must go through $R$.
		2. $I_{circuit} = \frac{100V}{20\ohm} = 5A$
6. Inductor and Capacitor current in original circuit?
	1. Inductor
		1. $\tilde{I}_L = \frac{100}{j25} = -j4 = 4e^{-j90^\circ}$
	2. Capacitor
		1. $\tilde{I}_C = \frac{100}{-j20} = j5 = 5e^{j90^\circ}$
	For the replaced circuit, the these phasors would be equal and opposite, instead of slightly capacitive and opposite creating 0 current flow through the LC portion, no phase lag/lead.

#### AC RLC Example 2
The circuit below operates at $500 rad/s$ at steady state. We want to find the voltage drops, as real time functions, across each element in the circuit.

```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[sV, l=$100e^{j30^\circ}V$]++(0,2)
	to[R=$100\Omega$]++(1,0)
	to[inductor, l=$0.3H$]++(1,0)
	to[capacitor, l=$40\mu F$]++(0,-2)--++(-2,0);
\end{circuitikz}
\end{document}

```
1. Impedances of each element
	1. $Z_R = 100\ohm$
	2. $Z_L = j500 \times 0.3 = j150\ohm$ 
	3. $Z_C = \frac{-j}{500\times 40\times 10^{-6}} = -j50\ohm$
2. Input impedance of the circuit.
	1. $Z_{circ} = 100 + j100\ohm$ 
	2. $\tilde{Z}_{circ} = 141.4\angle 45^\circ$ 
3. Current phasor
	1. $\tilde{I}_{circ} = \frac{100\angle 30^\circ}{141.4\angle 45^\circ} = 707.2\angle{-15^\circ}mA$ 
	2. $I_{circ}(t) = 707.2cos(500t -15^\circ)mA$ 
4. Phasor Voltages of each element
	1. $\tilde{V}_R = 100\angle30\times \frac{\tilde{Z}_R}{\tilde{Z}_{circ}} = \frac{100\angle 30^\circ(100)}{141.4\angle45^\circ} = \frac{10000\angle30^\circ}{141.4\angle45^\circ} = 70.7\angle-15^\circ V$
	2. $\tilde{V}_L = 0.7072\angle-15^\circ(150\angle90) = 106.08\angle75^\circ$ 
	3. $\tilde{V}_C = 0.7072\angle-15^\circ(50\angle-90^\circ) = 35.36\angle-105^\circ$ 
5. Diagram of phases
	```tikz
\usepackage{pgfplots}

\begin{document}
\begin{tikzpicture}[scale=2]
\begin{axis}[
    axis equal,
    axis lines=middle,
    axis line style={opacity=0.5},
    xmin=-120, xmax=120,
    ymin=-120, ymax=120,
    xtick={-100,-50,0,50,100},
    ytick={-100,-50,0,50,100},
    grid=none,
]

% Circle for V_source (radius 100)
\addplot[
    domain=0:360,
    samples=100,
    smooth,
    thick,
    black,
    dashed
] ({100*cos(x)}, {100*sin(x)});

% V_source = 100∠30^\circ = (86.6, 50)
\draw[->, thick, red] (axis cs:0,0) -- (axis cs:86.6,50);
\addplot[only marks, mark=*, mark size=2pt, red] coordinates {(86.6,50)};
\draw (axis cs:92,55) node[font=\tiny, red] {$V_{source} = 100\angle30^\circ$};

% V_R = 70.72∠-15^\circ = (68.3, -18.3)
\draw[->, thick, yellow] (axis cs:0,0) -- (axis cs:68.3,-18.3);
\addplot[only marks, mark=*, mark size=2pt, yellow] coordinates {(68.3,-18.3)};
\draw (axis cs:73,-23) node[font=\tiny, yellow] {$V_R = 70.72\angle-15^\circ$};

% V_L = 106.08∠75^\circ = (27.4, 102.5)
\draw[->, thick, green!60!black] (axis cs:0,0) -- (axis cs:27.4,102.5);
\addplot[only marks, mark=*, mark size=2pt, green!60!black] coordinates {(27.4,102.5)};
\draw (axis cs:32,107) node[font=\tiny, green!60!black] {$V_L = 106.08\angle75^\circ$};

% V_C = 35.36∠-105^\circ = (-9.15, -34.15)
\draw[->, thick, orange] (axis cs:0,0) -- (axis cs:-9.15,-34.15);
\addplot[only marks, mark=*, mark size=2pt, orange] coordinates {(-9.15,-34.15)};
\draw (axis cs:-14,-39) node[font=\tiny, orange] {$V_C = 35.36\angle-105^\circ$};

\end{axis}
\end{tikzpicture}
\end{document}
	```
6. Real time expression of voltages
	1. $V_R(t) = 70.72cos(500t - 15^\circ)V$ 
	2. $V_{L}(t) = 106.08cos(500t + 75^\circ)V$
	3. $V_{C}(t) = 35.36cos(500t -105^\circ)V$ 
#### AC RLC Example 3
The circuit operates at $10k \frac{rad}{s}$ at steady state.
Steps:
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[sV, l=$10e^{j0^\circ}V$]++(0,2)
	to[R=$400\Omega$]++(1,0)
	to[inductor, l=$0.03H$]++(1,0)
	to[capacitor, l=$0.01\mu F$]++(0,-2)--++(-2,0);
\end{circuitikz}
\end{document}

```
1. Find impedances of each element
	1. $Z_R = 400\ohm$
	2. $Z_{L} = j\omega L = j\times 10^4 \times 3\times 10^{-2} = j300\ohm$
	3. $Z_C = \frac{-j}{10^4 \times 10^{-8}} = \frac{-j}{10^-4} = -j10000\ohm$
2. Find input impedance
	1. $Z = 400-j9700\ohm$
	2. $\tilde{Z} = 9708.24\angle -87.6^\circ\ohm$ 
3. Find current on phasor and real time
	1. $\tilde{I} = \frac{10}{9708.24\angle -87.6^\circ}$
	2. $\tilde{I} = 0.00103\angle 87.6^\circ A$
	3. $I(t) = 1.03cos(10,000t + 87.6^\circ)mA$
4. Find phasor voltages by multiplying current phasor by inductance phasor.
	1. $V_R = 0.00103\angle 87.6^\circ (400) = 0.412\angle 87.6^\circ V$
	2. $V_L = 0.00103\angle 87.6^\circ(j300) = 0.309\angle(87.6^\circ + 90^\circ)$
	3. $V_L= 0.309\angle177.6^\circ$ 
	4. $V_C = 0.00103\angle 87.6^\circ(-j10000) = 10.3\angle-2.4^\circ$ 
5. Verification
	1. $V_R = 0.412cos(87.6) +j0.412sin(87.6) = 0.01725 + j0.4116$
	2. $V_L = 0.309cos(177.6) + j0.309sin(177.6) = -0.3087 + j0.0130$
	3. $V_C = 10.3cos(-2.4) + j10.3sin(-2.4) = 10.29 -j0.4313$
	4. By KCL, $V_R + V_L + V_C = V_{source}$
	5. $(0.01725 + 10.29 - 0.3087) + j(0.4116 + 0.0130 - 0.4313) = 9.999 - j0.0067$
	6. $\approx 10 + 0j$
6. Convert phasor voltages to real time
	1. $V_R = 0.412cos(10000t + 87.6^\circ)V$
	2. $V_L = 0.309cos(10000t + 177.6^\circ)V$ 
	3. $V_C = 10.3cos(10000t -2.4^\circ)V$
## Class 14
