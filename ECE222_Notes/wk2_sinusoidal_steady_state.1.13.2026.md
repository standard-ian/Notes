## Class 3

#### Recall from Week 1
The following circuit, with a $120sin(377t)$ also known as a ($60Hz$) source 
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
At $t = 0$ when the switch closes, the current is $0A$. The circuit responds to the voltage source with a total response in terms of current. 
$$i(t) = 3.128e^{-50t} + 3.16cos(377t-172.5^\circ)A$$
Since the time constant in an $RL$ circuit is $\frac{L}{R}$ when there is a $\tau$ that makes $e^{-1}$. In the above example $t = \tau$ at $0.02s$. 
After the transient dies out, which is very much the case by $0.1s$ (5 time constants), the transient behavior dies out, and the circuit is in the steady state.
$$i_{ss}(t) = 3.16cos(377t-172.5^\circ)A$$
The source is $v_s(t) = 120cos(377t - 90^\circ) = 120sin(377t) V = 120V @ 60Hz$ We notice that the source voltage and the current have phase difference of $82.5^\circ$, with the current lags behind the voltage. This is because of the inductor. Inductance resists the change in current, observed by it's $i-v$ relationship: $V_{L} = L\frac{di_{L}}{dt}$

The voltage in the components is determined by the properties of the components themselves.

Knowing the steady-state current, the steady-state voltages of the resistor and inductor can be derived:
$$V_R(t) = 15.78cos(377t - 172.5^\circ) V$$
$$V_L(t) = 119.1cos(377t - 82.5^\circ)V$$
By $KVL$:
$$v_{s}(t) = v_{R}(t) + v_{L} (t)$$
That is:
$$120sin(377t) = 120cos(377t - 90^\circ) = 15.78cos(377t - 172.5^\circ) + 119.1cos(377t - 82.5^\circ) V$$ 
Using chain rule to differentiate:
$$\frac{d}{dt} cos(wt + \phi) = -w\ sin(wt + \phi)$$
So, to find the voltage through the inductor, we can take:
$$\frac{d}{dt}3.16cos(377t - 172.5^\circ) = -\frac{377}{3.16}sin(377t + 172.5^\circ) = -119.1sin(377t - 172.5^\circ ) = -119.1 cos(377t - 172.5^\circ - 90^\circ) = -119.1cos(377t - 262.5^\circ)$$
We can confirm the voltages of the components sum to the source using the identities:
$cos(\alpha + \beta) = cos\alpha cos\beta - sin\alpha sin\beta$
$cos(\alpha - \beta) = cos\alpha cos\beta+sin\alpha sin\beta$
$sin(\alpha + \beta) = sin\alpha cos\beta + cos\alpha sin\beta$
$sin(\alpha - \beta) = sin\alpha cos\beta - cos\alpha sin\beta$

$$15.78cos(377t - 172.5^\circ) = 15.78[cos(377t)cos(172.5^\circ) + sin(377t) sin(172.5^\circ)] = 15.78[-0.9914cos(377t) + 0.1305sin(377t)]$$
$$119.1cos(377t - 82.5^\circ) = 119.1[cos(377t)cos(82.5^\circ) + sin(377t) sin(82.5^\circ)] = 119.1[0.1305cos(377t) + 0.9914sin(377t)]$$
$$119.1(0.1305cos(377t)) + 119.1(sin0.9914(377t)) + 15.78(-0.9914cos(377t)) + 15.78(0.1305sin(377t)) = 120.14sin(377t) - 0.102cos(377t)$$

We can complete this using the identity:
$$A\ sin(\omega t) + B\ cos(\omega t) = R \sin(\omega t + \phi)$$
Where $R = \sqrt{A^2 + B^2}$ and $\phi = arctan(\frac{B}{A})$

$$R = \sqrt{120.14^2 +  (-0.102)^2} = \sqrt{14433.61} = 120.14$$
$$\phi = arctan(\frac{-0.102}{120.14}) = -0.048^\circ$$
Resulting in, where the $0.048^\circ$ is basically negligible:
$$120.14sin(377t-0.048^\circ)\approx 120sin(377t)$$
## Class 4
#### Complex Number Method
```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}[scale=2]
\begin{axis}[
    axis equal,
    axis lines=middle,
    axis line style={opacity=0.5},
    xmin=-2, xmax=2,
    ymin=-2, ymax=2,
    x tick label style={color=orange},
    y tick label style={color=orange},
    xtick={-1,0,1},
    ytick={-1,0,1},
    grid=none,
]
% Unit circle
\addplot[
    domain=0:360,
    samples=100,
    smooth,
    thick,
    black
] ({cos(x)}, {sin(x)});

% Radial lines
\draw[thin, gray] (axis cs:0,0) -- (axis cs:1,0);
\draw[thin, gray] (axis cs:0,0) -- (axis cs:0.866,0.5);
\draw[thin, gray] (axis cs:0,0) -- (axis cs:0.707,0.707);
\draw[thin, gray] (axis cs:0,0) -- (axis cs:0.5,0.866);
\draw[thin, gray] (axis cs:0,0) -- (axis cs:0,1);
\draw[thin, gray] (axis cs:0,0) -- (axis cs:-0.5,0.866);
\draw[thin, gray] (axis cs:0,0) -- (axis cs:-0.707,0.707);
\draw[thin, gray] (axis cs:0,0) -- (axis cs:-0.866,0.5);
\draw[thin, gray] (axis cs:0,0) -- (axis cs:-1,0);
\draw[thin, gray] (axis cs:0,0) -- (axis cs:-0.866,-0.5);
\draw[thin, gray] (axis cs:0,0) -- (axis cs:-0.707,-0.707);
\draw[thin, gray] (axis cs:0,0) -- (axis cs:-0.5,-0.866);
\draw[thin, gray] (axis cs:0,0) -- (axis cs:0,-1);
\draw[thin, gray] (axis cs:0,0) -- (axis cs:0.5,-0.866);
\draw[thin, gray] (axis cs:0,0) -- (axis cs:0.707,-0.707);
\draw[thin, gray] (axis cs:0,0) -- (axis cs:0.866,-0.5);

% Points at common angles
\addplot[only marks, mark=*, mark size=1.5pt, black] coordinates {
    (1,0) (0.866,0.5) (0.707,0.707) (0.5,0.866)
    (0,1) (-0.5,0.866) (-0.707,0.707) (-0.866,0.5)
    (-1,0) (-0.866,-0.5) (-0.707,-0.707) (-0.5,-0.866)
    (0,-1) (0.5,-0.866) (0.707,-0.707) (0.866,-0.5)
};

\draw (axis cs:1.5,0) node[font=\tiny] {$0^\circ, 0$};
\draw (axis cs:1.299,0.75) node[font=\tiny] {$30^\circ, \frac{\pi}{6}$};
\draw (axis cs:1.06,1.06) node[font=\tiny] {$45^\circ, \frac{\pi}{4}$};
\draw (axis cs:0.75,1.299) node[font=\tiny] {$60^\circ, \frac{\pi}{3}$};
\draw (axis cs:0,1.5) node[font=\tiny] {$90^\circ, \frac{\pi}{2}$};
\draw (axis cs:-0.75,1.299) node[font=\tiny] {$120^\circ, \frac{2\pi}{3}$};
\draw (axis cs:-1.06,1.06) node[font=\tiny] {$135^\circ, \frac{3\pi}{4}$};
\draw (axis cs:-1.299,0.75) node[font=\tiny] {$150^\circ, \frac{5\pi}{6}$};
\draw (axis cs:-1.5,0) node[font=\tiny] {$180^\circ, \pi$};
\draw (axis cs:-1.299,-0.75) node[font=\tiny] {$210^\circ, \frac{7\pi}{6}$};
\draw (axis cs:-1.06,-1.06) node[font=\tiny] {$225^\circ, \frac{5\pi}{4}$};
\draw (axis cs:-0.75,-1.299) node[font=\tiny] {$240^\circ, \frac{4\pi}{3}$};
\draw (axis cs:0,-1.5) node[font=\tiny] {$270^\circ, \frac{3\pi}{2}$};
\draw (axis cs:0.75,-1.299) node[font=\tiny] {$300^\circ, \frac{5\pi}{3}$};
\draw (axis cs:1.06,-1.06) node[font=\tiny] {$315^\circ, \frac{7\pi}{4}$};
\draw (axis cs:1.299,-0.75) node[font=\tiny] {$330^\circ, \frac{11\pi}{6}$};

\end{axis}
\end{tikzpicture}
\end{document}
```
#### IW 4.1
1. $v_1(t) = 1.5cos(2\pi t + \frac{\pi}{3})$ at $t = 0, 0,25, 0,5, 1$'
	```tikz
	\usepackage{pgfplots}
	
	\begin{document}
	\begin{tikzpicture}[scale=1.5]
	\begin{axis}[
	    axis equal,
	    axis lines=middle,
	    axis line style={opacity=0.5},
	    xmin=-2, xmax=2,
	    ymin=-2, ymax=2,
	    xtick={-1.5,0,1.5},
	    ytick={-1.5,0,1.5},
	    grid=none,
	]
	
	% Circle for v1 (radius 1.5)
	\addplot[
	    domain=0:360,
	    samples=100,
	    smooth,
	    thick,
	    blue,
	    dashed
	] ({1.5*cos(x)}, {1.5*sin(x)});
	
	% v1(t) = 1.5*cos(2*pi*t + pi/3)
	% At t=0: phase = pi/3 = 60 degrees
	% Position: (1.5*cos(60), 1.5*sin(60)) = (0.75, 1.299)
	\draw[->, thick, red] (axis cs:0,0) -- (axis cs:0.75,1.299);
	\addplot[only marks, mark=*, mark size=2pt, red] coordinates {(0.75,1.299)};
	\draw (axis cs:0.85,1.4) node[font=\tiny, red] {$v_1(0) {=} v_1(1) = \frac{\pi}{3}$};
	
	% At t=0.25: phase = 2*pi*0.25 + pi/3 = pi/2 + pi/3 = 5*pi/6 = 150 degrees
	% Position: (1.5*cos(150), 1.5*sin(150)) = (-1.299, 0.75)
	\draw[->, thick, green!60!black] (axis cs:0,0) -- (axis cs:-1.299,0.75);
	\addplot[only marks, mark=*, mark size=2pt, green!60!black] coordinates {(-1.299,0.75)};
	\draw (axis cs:-1.5,0.85) node[font=\tiny, green!60!black] {$t_1(0.25) {=} \frac{5\pi}{6}$};
	
	% At t=0.5: phase = 2*pi*0.5 + pi/3 = pi + pi/3 = 4*pi/3 = 240 degrees
	% Position: (1.5*cos(240), 1.5*sin(240)) = (-0.75, -1.299)
	\draw[->, thick, orange] (axis cs:0,0) -- (axis cs:-0.75,-1.299);
	\addplot[only marks, mark=*, mark size=2pt, orange] coordinates {(-0.75,-1.299)};
	\draw (axis cs:-0.85,-1.4) node[font=\tiny, orange] {$t_1(0.5) {=} \frac{4\pi}{3}$};
	
	\end{axis}
	\end{tikzpicture}
	\end{document}
	```
	1. $v_1(0) = $\frac{\pi}{3}$
	2. $v_1(0.25) = \frac{5\pi}{6}$
	3. $v_1(0.5) = \frac{4\pi}{3}$
	4. $v_1(1) =\frac{\pi}{3}$
1. $v_2(t) = 2 sin(2\pi t) = 2sin(2\pi t - \frac{\pi}{2}$ at $t = 0, 0,25, 0,5, 1$
	```tikz
	\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}[scale=1.5]
\begin{axis}[
    axis equal,
    axis lines=middle,
    axis line style={opacity=0.5},
    xmin=-2, xmax=2,
    ymin=-2, ymax=2,
    xtick={-2,0,2},
    ytick={-2,0,2},
    grid=none,
]
% Circle for v2 (radius 2)
\addplot[
    domain=0:360,
    samples=100,
    smooth,
    thick,
    blue,
    dashed
] ({2*cos(x)}, {2*sin(x)});
% v2(t) = 2*sin(2*pi*t) = 2*cos(2*pi*t - pi/2)
% At t=0: phase = -pi/2 = -90 degrees = 270 degrees
% Position: (2*cos(-90), 2*sin(-90)) = (0, -2)
\draw[->, thick, red] (axis cs:0,0) -- (axis cs:0,-2);
\addplot[only marks, mark=*, mark size=2pt, red] coordinates {(0,-2)};
\draw (axis cs:0.1,-1.7) node[font=\tiny, red, anchor=west] {$v_2(0) {=} -\frac{\pi}{2}$};
% At t=0.25: phase = 2*pi*0.25 - pi/2 = pi/2 - pi/2 = 0 degrees
% Position: (2*cos(0), 2*sin(0)) = (2, 0)
\draw[->, thick, green!60!black] (axis cs:0,0) -- (axis cs:2,0);
\addplot[only marks, mark=*, mark size=2pt, green!60!black] coordinates {(2,0)};
\draw (axis cs:1.7,0.1) node[font=\tiny, green!60!black, anchor=south] {$v_2(0.25) {=} 0$};
% At t=0.5: phase = 2*pi*0.5 - pi/2 = pi - pi/2 = pi/2 = 90 degrees
% Position: (2*cos(90), 2*sin(90)) = (0, 2)
\draw[->, thick, orange] (axis cs:0,0) -- (axis cs:0,2);
\addplot[only marks, mark=*, mark size=2pt, orange] coordinates {(0,2)};
\draw (axis cs:0.1,1.7) node[font=\tiny, orange, anchor=west] {$v_2(0.5) {=} \frac{\pi}{2}$};
% At t=1: phase = 2*pi*1 - pi/2 = 2*pi - pi/2 = 3*pi/2 = 270 degrees (same as t=0)
% Position: (2*cos(-90), 2*sin(-90)) = (0, -2)
\draw[->, thick, purple] (axis cs:0,0) -- (axis cs:0,-2);
\addplot[only marks, mark=*, mark size=2pt, purple] coordinates {(0,-2)};
\draw (axis cs:-0.1,-1.7) node[font=\tiny, purple, anchor=east] {$v_2(1) {=} -\frac{\pi}{2}$};
\end{axis}
\end{tikzpicture}
\end{document}
	```
	1. $v_2(0) = \frac{3\pi}{2}$
	2. $v_2(0.25) = 0$
	3. $v_2(0.5) = \frac{\pi}{2}$
	4. $v_2(1) = \frac{3\pi}{2}$
2. What is the difference between $v_1$ and $v_2$ over time?
	$v_2$ **lags** $v_1$ by $\frac{7\pi}{6}$
	Capacitors, voltage lags the current
	Inductors, current lags the voltage
3. Compute the sum $v_1 + v_2$. Find the amplitude, frequency, and phase of the sum.
	We'd use the complex trig ID method from last class. IW 4.2 will introduce a different method using phasors.
4. Do the amplitude and phase of the sum change over time?
	No, there will be a new amplitude and phase, but it will be constant over time because they have the same frequency $2\pi t$
```tikz

```
#### IW 4.2
Representing the signals as complex numbers (**phasors**, $\tilde{V}$), using Euler's formula: $V = Acos(\phi) + jAsin(\phi)$, where the $j$ component is an imaginary number.
1. Find the phasor representation of $v_1$
	1. $v_1 \to \tilde{v_1}  = 1.5(cos\frac{\pi}{3} + j sin\frac{\pi}{3}) = 1.5(\frac{1}{2} + j\frac{\sqrt{3}}{2})$
	2. $\tilde{v_1} = 0.75 + j \frac{1.5\sqrt{3}}{2}$
2. Find the phasor representation of $v_2$
	1. $v_2 \to \tilde{v_2} = 2(cos\frac{-pi}{2}) + jsin(\frac{-\pi}{2})$
	2. $\tilde{v_2} = -j2$
3. $\tilde{v_1} + \tilde{v_2} = 0.75 + 1.299j -2j = 0.75 - j0.701$
4. Converting back to polar form:
	1. $A = \sqrt{(real)^2 + (complex)^2} = \sqrt{(0.75)^2 + (-0.701)^2} = \sqrt{1.0535} = 1.027$
	2. $\phi = arctan(\frac{complex}{real}) = arctan(\frac{-0.701}{0.75}) = arctan(-0.935) = -43.08^\circ$ 
	3. $\tilde{V}_{sum} = 1.027(cos(0.75) - jsin(0.701))$
	4. $v_1(t) + v_2(t) = 1.027(cos(2\pi t) - 43.08^\circ)$