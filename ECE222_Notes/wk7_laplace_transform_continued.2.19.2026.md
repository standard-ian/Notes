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
 $$I_C(t) = C\frac{dV_C}{dt}12e^{-500t}= -500(12)Ce^{-500t}A$$
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
	Where $V_f$ is 0 (when steady state is reached)
If the voltage is measured as $5e^{-1000t}$
$$e^{-1000t} = e^{\frac{-t}{L/R}}\to1000 = \frac{1}{L/R} \to \tau = \frac{L}{R} = \frac{1}{1000}$$
2. The inductance would then be:
   $$\frac{L}{100} = \frac{1}{1000}\to L = 0.1H$$
3. After a long time, the voltage of the inductor will be 0.
$$0 + (V_i)e^{\frac{-t}{L/R}} - (0)e^{\frac{-t}{L/R}}$$
4. The current across the inductor at steady state will be the full current of the circuit, this will be $\frac{1}{L}$ times the integral of the inductor voltage **from t=0 to  t**.
$$I_L(t) = \frac{1}{L}\int_0^{t} V_L(t)\ dt$$

$$=\frac{1}{0.1} \int 5e^{-1000t} dt;\ u = -1000t;\ du=-1000dt;\ dt = \frac{-1}{1000}du$$
$$=\frac{1}{L}\frac{-5}{1000}\int e^{u} = \frac{-5}{1000(0.1)}\left[e^{u}\right] \Large|\small_0^{-1000t}= -0.05\left[e^{u}\right] \Large|\small_0^{-1000t}= -0.05[e^{-1000t} -  1]$$
$$I_L(t) = 0.05(1 - e^{-1000t})A$$
$$I_L(t) = I_f + (I_i)e^{-1000t} - (I_f)e^{-1000t} = I_f + (0)e^{-1000t} - (I_f)e^{-1000t} = I_f(1 - e^{-1000t})$$
$$I_L(t) = I_f(1-e^{-1000t})A$$
5. Since as $t \to \infty$, the voltage of the inductor approaches $0$
$$V_L(t) = L\frac{dI_L}{dt}$$
	Because at a steady state the current of the inductor is constant ($\frac{dI_L}{dt} = 0$).
	The entire voltage will be dropping across the resistor. Therefore, the voltage through the resistor will be:
	$$V = IR = 0.05\times100 = 5V$$
#### Another RC Example 1
Consider the circuit below. The switch has been closed for a long time, then opens at $t=0$
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[vsource, invert, l=$96V$]++(0,2)
	to[R=$3\Omega$]++(2,0)
	to[switch, invert]++(0,-2)++(0,2)
	to[R=$1\Omega$]++(2,0)
	to[capacitor, a=$\frac{1}{6}F$]++(0,-2)++(0,2)--++(1,0)
	to[R=$12\Omega$]++(0,-2)--++(-5,0);
\end{circuitikz}
\end{document}

```
1. Right before $t=0$ when the switch is still closed, what is the current through the $12\ohm$ resistor?
	1. The $12\ohm$ resistor sees $0A$ because with the switch closed before $t=0$, there is a short to ground, and a $1\ohm$ resistor to the rest of the circuit.
	2. The 0 impedance short will have all the current, and none will reach the $12\ohm$.
2. Right before the switch opens, there will be $0$ current through the capacitor, and it's voltage will be $0$ also.
3. Right after the switch opens at $t=0$, the voltage at the cap will be $0V$ 
4. After a long time, the capacitor will charge to the potential available after the 3 and 1$\ohm$ resistors:
   $$96\frac{12}{16} = 72V$$
5. After the switch is open for a long time, the capacitor will essentially be an infinite source of resistance, because it will be at the same potential as the node before it. Therefore, all current will flow through the $12\ohm$ the voltage across each resistor is:
	1. $R_{1\ohm} = 96\frac{1}{16} = 6V$
	2. $R_{3\ohm} = 96\frac{3}{16} = 18V$
	3. $R_{12\ohm} = 96\frac{12}{16} = 72V$

6. The Thevenin equivalent seen be the capacitor at $t=0$ is 
$$R_{TH} = \left(\frac{1}{4} + \frac{1}{12}\right)^{-1}= \frac{12}{4} = 3\ohm$$
7. The time constant of the circuit will be:
   $$R_{TH}\times C = \frac{3}{6} = 0.5s$$
8. The cap voltage as a function of time after $t=0$ will be:
   $$V_C(t) = V_f + (V_i-V_f)e^{-2t};\ V_f = 72V;\ V_i = 0V$$
$$V_C(t) = 72 + (0 - 72)e^{-2t} = 72 - 72e^{-2t} = 72(1 - e^{-2t})$$
This makes sense, because as $t\to \infty$, the $e^{-2t}\to 0$ and $V_C(t) \to 72V$ (Charging)
#### Another RC Example 2
Consider the circuit below. The switch has been closed for a long time, then opened at $t = 0$. 
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[vsource, invert, l=30V]++(0,2)
	to[R, a=$5k\Omega_1$]++(-2,0)
	to[switch, invert, mirror]++(-1,0)
	to[R=$2k\Omega$]++(0,-1)
	to[capacitor, l=$20\mu F$]++(0,-1)++(0,2)
	to[R, a=$6k\Omega$]++(-1,0)
	to[R, a=$5k\Omega_2$]++(0,-2)++(0,2)
	to[R, a=$20k\Omega$]++(-2,0)--++(0,-2)--++(6,0);
\end{circuitikz}
\end{document}
```
1. Right before $t = 0$ when the switch is still closed, what is the current through the $2k\ohm$ resistor?
	1. The current will be 0 because the capacitor is charged, since the switch as been closed for a long time.
2. The voltages across all the resistors will be:
	1. $R_{eq} = 5 + 6 + 4 = 15k\ohm$
	2. $R_{5k\ohm_1} = 30\frac{5}{15} = 10V$
	3. $R_{2k\ohm} = 0V$
	4. $R_{6k\ohm} = 30\frac{6}{15} = 12$
	5. $R_{20k\ohm} = 8V$
	6. $R_{5k\ohm_2} = 8V$
3. At this point, the capacitor voltage is $20V$
4. The moment the switch opens at $t=0$, the cap voltage across the cap is still briefly $20V$ but it begins discharging.
5. After a long time, the cap voltage will be $0V$
6. The time constant will be:
$$R_{TH} = 2 + 6 + 4 = 12k\ohm$$

$$\tau = RC = R_{TH}\times C = 12\times10^{3} \times 20\times 10^{-6} = 0.24$$
   7. The cap voltage as  a function of time is therefore:
      $$V_C(t) = V_f + (V_i - V_f)e^{-t/0.24} = 0 + (20- 0)e^{-t/0.24}$$
	$$V_C(t) = 20e^{-t/0.24}$$

#### Another RL Example
Consider the RL circuit below. The switch has been at position $1$ for a long time. Then the switch is moved to $2$ at $t=0$.
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[vsource, invert, l=$20V$]++(0,2)
	to[R=$40\Omega_1$]++(2,0)
	to[R, a=$40\Omega_2$]++(0,-2)++(0,2)
	to[switch, mirror, invert, l=$1$]++(1,0)++(-0.5,-0.25)
	node[ocirc, label=right:$2$]{}
	to[R=$10\Omega$]++(0,-1.75)++(0.5,2)
	to[R=$40\Omega_3$]++(1,0)
	to[inductor, l=$10mH$]++(0,-2)--++(-4,0);
\end{circuitikz}
\end{document}

```
1. Right before $t=0$ when the switch is still in position 1, what is the current through the $10\ohm$ resistor?
	1. The current through the $10\ohm$ is 0A because there is no path to ground through the $10\ohm$
2. The currents through all the $40\ohm$ resistors at that point are:
	1. $V_{40\ohm_1} = 20\frac{40}{60} = \frac{40}{3}V$
	2. $I_{40\ohm_1} = \frac{40}{40\times3} = \frac{1}{3}A$
	3. $V_{40\ohm_2} = V_{40\ohm_3} =  20\frac{20}{60} = \frac{20}{3}V$
	4. $I_{40\ohm_2} = \frac{20}{40\times 3} = \frac{1}{6}A$
3. The inductor voltage is $0V$ and the current is $I_{40\ohm_3} = I_L = \frac{1}{6}A$
4. Right after the switch moves to position 2, at $t=0$, the current through the inductor will release it's stored energy and maintain the current starting from $\frac{1}{6}A$, and decaying over time.
5. After a long time at position 2, the current will be $0A$ in the inductor, because there is no path from source to ground through it, and it will have reached a new steady state.
6. The time constant after the switch opens is:
   $$\tau = \frac{L}{R} = \frac{10\times10^{-3}}{50\ohm} = 0.0002s$$
7. The inductor current as a function of times can be written as:
   $$I_L(t) = I_f + (I_i - I_f)e^{-5000t} = 0 + \left(\frac{1}{6} - 0\right)e^{\frac{-t}{0.0002}}$$
$$I_L(t) = \frac{1}{6}e^{-5000t}A$$
$$V_L(t) = L\frac{dI_L}{dt} = 0.01\times\frac{-5000}{6}e^{-5000t} = \frac{-25}{3}e^{-5000t}V$$
Note that the voltage is negative, since the current keeps flowing in the same direction, and is "sourcing" the current.
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

#### Laplace Transform Continued
Transforming a time based function into a complex function that we can manipulate for an application.
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[battery, l=$9V$, invert]++(0,2)
	to[R=$40\Omega$, i=$I$]++(2,0)
	to[switch]++(1,0)
	to[R=$10\Omega$]++(0,-2)++(0,2)
	to[R=$10\Omega$]++(2,0)
	to[inductor, l=$10mH$]++(0,-2)--++(-5,0);
\end{circuitikz}
\end{document}
```


The circuit starts with the switch at A, and the cap is charging.
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[vsource, v=$10V$, invert]++(0,2)
	to[R=$R_1$]++(2,0)
	node[label=above:$A$, ocirc]{}++(0.25,0)
	to[capacitor, l=$C_1$]++(0,-2);
	
	\draw(2.5,2)
	node[label=above:$B$, ocirc]{}
	to[inductor, l=$10mH$]++(2,0)
	to[R=$R_2$]++(0,-2)--(0,0);
	
\end{circuitikz}
\end{document}
```

After $t=0$, the and the switch is moved to B, the circuit becomes:
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[capacitor, l=$V_C$]++(0,2)
	to[inductor, i=$I$, l=$10mH$]++(2,0)
	to[R=$R_2$]++(0,-2)--(0,0);
	
\end{circuitikz}
\end{document}
```

With different values of $R_2$ the waveform decays at different rates, and can be represented as decaying sine waves.

$$V_C'' + \frac{R}{L}V_C' + \frac{1}{LC}V_C = 0$$
#### Performing the Laplace Transform
Given a time based function:
$$f(t);\ t \geq 0$$
The symbology to indicate Laplace Transform is:
$$\mathcal{L}\{f(t)\} = \int_0^\infty e^{-st}f(t)\ dt$$
Where $s$ is a complex variable, and the transform converts a time based function into a point $s$ on the ($\mathcal{Re}$, $\mathcal{Im}$) plane.

$$e^{-st} = e^{-(\alpha - j\beta) t} = e^{-\alpha t} \times e^{-j\ \beta t} = e^{-\alpha t}\left[cos(\beta t) - jsin(\beta t)\right]$$
Where as the real portion moves from $-\infty\to 0$, the decay approaches 0.

So, $e^{-st}$ is a representation of decay, that can be applied to a time function $f(t)$. 

We perform the integration of the product of $e^{-st}$ and $f(t)$ over the infinite time domain.

##### Example:
Starting from:
$$f(t) = Ae^{-\alpha t} cos(\omega t)$$
We can make the integration easier by converting $f(t)$ to a complex representation.
$$f(t) = A\ e^{-\alpha t} e^{j\omega t}$$
$$\mathcal{L}\{f(t)\} = \int_0^\infty e^{-st}(A\ e^{-\alpha t} e^{j\omega t})\ dt = \int_0^\infty A\times e^{-st}\times e^{-\alpha t}\times e^{j\omega t}\ dt $$
$$=\int_0^\infty Ae^{\lambda t}\ dt;\ \ \lambda = -s-\alpha+j\omega$$
$$= \frac{-A}{s + \alpha -j\omega}e^{\omega t}|_0^\infty = \frac{-A}{s + \alpha -j\omega}[1-0]$$
$$\mathcal{L}\{f(t)\} = \frac{A}{s + \alpha - j\omega}$$
The time domain has been eliminated and moved to an $s$ domain.
$$\mathcal{L}\{f(t)\}=\frac{A(s + \alpha)}{(s + \alpha)^2+ \omega ^2} + j\frac{A\omega}{(s + \alpha)^2+\omega^2}$$
##### Condensed Method
$$f(t) = Ae^{-2t}cos(100t)$$
$$\mathcal{L}\{f(t)\} = A\frac{s + \alpha}{(s + \alpha)^2 + (\omega)^2}=A\frac{s + 2}{(s + 2)^2 + (100)^2}$$
For only a sin function, we end up with just the j, or sin portion.
$$g(t) = Be^{-2t}sin(100t)$$

$$\mathcal{L}\{g(t)\} = B\frac{100}{(s + 2)^2+(100)^2}$$
$$e^{j\omega t} = cos(\omega t) +jsin(\omega t)$$
##### In Summary

The full transform on a $f(t)$ with both decay and oscillating components,**(Oscillation with decay)**:
$$\mathcal{L}\{Ae^{-\alpha t} cos(\omega t)\} = A\frac{s + \alpha}{(s + \alpha)^2) + \omega^2}$$
For a $f(t)$ with no oscillating portion, we can just think $\omega = 0$, making $cos(\omega t) = 1$ **(Pure decay)**:
$$\mathcal{L}\{Ae^{-\alpha t}\} = A\frac{1}{s + \alpha}$$
For no decay, we can consider $\alpha = 0$ **(Pure oscillation)**:
$$\mathcal{L}\{Acos(\omega t)\} = A\frac{s}{s^2 + \omega^2}$$
For a constant
$$\mathcal{L}\{A\} = \frac{A}{s}$$

##### Poles and Zeros
**Poles** where the denominator in a Laplace transform $= 0$.

Marked by $x$. Indicates where there is exponential decay. When $(s + \alpha) = 0$, or $s=-\alpha$

$\frac{A}{s}$ occurs where $(\mathcal{Re}, \mathcal{Im}) = (0,0)$

**Zeros** where the 


| Signals              | $f(t)$                         | $\mathcal{L}\{f(t)\}$                     | Poles and Zeros                                      |
| -------------------- | ------------------------------ | ----------------------------------------- | ---------------------------------------------------- |
| Decaying Cosine      | $Ae^{-\alpha t}\cos(\omega t)$ | $A\frac{s+\alpha}{(s+\alpha)^2+\omega^2}$ | Zero at $s=-\alpha$; poles at $s=-\alpha\pm j\omega$ |
| Decaying Sine        | $Ae^{-\alpha t}\sin(\omega t)$ | $A\frac{\omega}{(s+\alpha)^2+\omega^2}$   | No finite zeros; poles at $s=-\alpha\pm j\omega$     |
| Cosine               | $A\cos(\omega t)$              | $A\frac{s}{s^2+\omega^2}$                 | Zero at $s=0$; poles at $s=\pm j\omega$              |
| Sine                 | $A\sin(\omega t)$              | $A\frac{\omega}{s^2+\omega^2}$            | No finite zeros; poles at $s=\pm j\omega$            |
| Decaying Exponential | $Ae^{-\alpha t}$               | $A\frac{1}{s+\alpha}$                     | No finite zeros; pole at $s=-\alpha$                 |
| Step                 | $Au(t)$                        | $A\frac{1}{s}$                            | No finite zeros; pole at $s=0$                       |
| Decaying Ramp        | $Ate^{-\alpha t}$              | $A\frac{1}{(s+\alpha)^2}$                 | No finite zeros; double pole at $s=-\alpha$          |
| Ramp                 | $At$                           | $\frac{A}{s^2}$                           | No finite zeros; double pole at $s=0$                |
| Unit Impulse         | $\delta(t)$                    | $1$                                       | No poles, no finite zeros                            |
#### IW 14.1
1. Recognize the type and find the Laplace transform for each signal
###### $v(t) = 10e^{-\frac{t}{0.5}}$
$$\frac{10}{s + \frac{1}{0.5}} = \frac{10}{s + 2}$$
###### $v(t) = 5e^{-5t}$
$$\frac{5}{s+5}$$
###### $v(t) = 20e^{-2t}sin(10^4t)$
$$20\frac{10^4}{(s + 2)^2 + 10^8}$$
###### $v(t) = 5u(t) + 5cos(120\pi t)$
$$\frac{5}{s} + 5\frac{s}{s^2 + (120\pi)^2}$$
1. Recognize the type and find the corresponding time-domain signal from its Laplace Transform.
###### $\frac{10}{s + 10}$
$$10e^{-10t}$$
###### $\frac{1}{s^2 + 4}$
$$\frac{1}{2}sin(2t)$$
###### $\frac{s}{s^2 + 4}$
$$cos(2t)$$
###### $\frac{s+1}{(s+1)^2 + 4}$
$$e^{-t}cos(2t)$$
###### $\frac{s + 1}{s^2 + 4}$
$$\frac{s}{s^2 + 4} + \frac{1}{s^2 + 4}$$
$$cos(2t) + \frac{1}{2}sin(2t)$$
