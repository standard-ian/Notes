## Class 17
#### IW 17.1

$$dB = 20log_{10}\left(\frac{V_2}{V_1}\right)$$
Fill in the missing values

| $3$ | $-3$    | $-6.02$       | $-10$   | $-20$          | $-40$           |
| --- | ------- | ------------- | ------- | -------------- | --------------- |
| $1$ | $0.708$ | $\frac{1}{2}$ | $0.316$ | $\frac{1}{10}$ | $\frac{1}{100}$ |
#### Example
Circuit and it's $s$ domain equivalent.
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[vsource, invert, V=$V_{in} {=} V_{in}(s)$]++(0,2)
	to[switch]++(1,0)
	to[R=$1\Omega {=} 1$]++(2,0)
	node[circ, label=above:$V_A$]{}
	to[inductor, l=$1H {=} s$]++(0,-2)++(0,2)
	to[R=$1\Omega {=} 1$]++(2,0)--++(1,0)
	node[circ, label=right:$V_{out}$]{}++(-1,0)
	to[capacitor, l=$1F {=} \frac{1}{s}$]++(0,-2)--++(-5,0);
\end{circuitikz}
\end{document}
```
Once in the $s$ domain, we can use KCL to evaluate that each node leaving/entering sums to 0.
At $V_o$:
$$\frac{V_o-V_A}{1} + \frac{V_o}{\frac{1}{s}} = 0$$
$$V_o - V_A + V_os \to V_A = V_o(1 + s)$$
At $V_A$:
$$\frac{V_A-V_i}{1} + \frac{V_A}{s} + \frac{V_A - V_o}{1} = 0$$
Substitute in $V_A = V_o(1+s)$:
$$\frac{(V_o(1+s))-V_i}{1} + \frac{V_o(1+s)}{s} + \frac{(V_o(1+s)) - V_o}{1} = 0$$
$$V_o + V_os -V_i +\frac{V_o}{s}+ \cancel{V_o} + V_o + V_os - \cancel{V_o} = 0$$
$$2V_os + 2V_o + \frac{V_o}{s}= V_i$$
$$V_o\left(2s + 2 + \frac{1}{s}\right) = V_i$$
$$\frac{V_o}{V_i} = \frac{1}{2s + 2 + \frac{1}{s}}\left(\frac{s}{s}\right) = \frac{s}{2s^2 + 2s + 1}$$
$$T(s) = \frac{V_o}{V_i} = \frac{\frac{1}{2}s}{s^2 + s + \frac{1}{2}}$$
Whenever you get a transfer function, the most important thing you want are poles and zeros. Poles are the roots of the denominator, zeros are the roots of the numerator.

With:
$$\frac{\frac{1}{2}s}{s^2 + s + \frac{1}{2}},\ \frac{1\ zero}{2\ poles},\ \frac{0, \infty}{-0.5\pm j0.5}$$
Get used to plotting poles and zeros on the complex plane:
```tikz
\usepackage{pgfplots}

\begin{document}

\begin{tikzpicture}
\begin{axis}[
    width=15cm,
    height=15cm,
    xlabel={$\{\mathcal{R}(s)\}$},
    ylabel={$\{\mathcal{I}(s)\}$},
    xmin=-2, xmax=2, ymin=-2, ymax=2,
    grid=major,
    axis lines=middle,
    enlargelimits=true,
]
\addplot[orange, only marks, mark=x, mark size=4pt] coordinates {(-0.5, 0.5) (-0.5, -0.5)};
\node[orange, rotate=45, above right] at (axis cs:-0.5, 0.5) {$pole_1 = 0.5$};
\node[orange, rotate=45, above right] at (axis cs:-0.5, -0.5) {$pole_2 = -0.5$};

\addplot[green, only marks, mark=x, mark size=4pt] coordinates {(0,0)};
\node[green, rotate=45, above right] at (axis cs:0, 0) {$zero = 0$};
\end{axis}

\end{tikzpicture}
\end{document}
```

#### IW 17.2
##### Case 1: $V_i(t)$ is a step of $10V$
Step DC of $10V$, using the above example
$$V_i(s) = \frac{10}{s}$$
$$V_o(s) = V_i\cdot T(s) = \frac{10}{s}\cdot \frac{\frac{1}{2}s}{s^2 + s + \frac{1}{2}} = \frac{5}{s^2 + s + \frac{1}{2}} = 5\cdot \frac{1}{s^2+s+\frac{1}{2}}$$
Find $V_0(t)$
$$s = \frac{-1\pm\sqrt{1 - 2}}{2} = \frac{-1}{2}\pm\frac{i}{2}$$
$$5\left(\frac{1}{(s^2 + s + \frac{1}{2}) = \left(s + \frac{1}{2}\right)^2 + \left(\frac{1}{2}\right)^2}\right)$$
$$10\cdot\frac{0.5}{(s + 0.5)^2 + (0.5)^2} = 10e^{-0.5t}sin(0.5t)$$
$$V_0(t) = 10e^{-0.5t}sin(0.5t)$$
##### Case 2: $V_i(t) = 10sin(10t)$
$$V_i(s) = \frac{10}{s^2 + 1}$$
$$V_0 = \frac{10}{s^2 + 1}\frac{0.5s}{s^2 + s + 0.5}$$
$$\frac{5s}{(s^2+1)(s^2 + s + 0.5)} = \frac{As+B}{s^2 + 1}+\frac{Cs+d}{s^2 + 2 + 0.5}$$
$$5s = (As + B)(s^2 + s + 0.5) + (Cs + D)(Cs^2 + 1)$$
$$5s = (A + C)s^3 + (A + B + D)s^2 + (0.5A + B + C)s + (0.5B + D)$$
$0.5A + B + C =5$
$A + C = 0$
$A+B +D =0$
$0.5B + D = 0$
$A = -2, C=2, D =-2, B=4$
$$\frac{5s}{(S^2 + 1)(s^2 + s + 0.5)}$$
$$= -2\frac{s}{s^2 + 1} + 4\frac{1}{s^2 + 1} + 2\frac{s+0.5}{(s+0.5)^2+(0.5)^2} -6\frac{0.5}{(s+0.5)^2 + (0.5)^2}$$
$$V_0(t) = 2e^{-5t}cos(0.5t) - 6e^{-0.5t}sin(0.5t) + \left[-2cos(t) + 4sin(t)\right]$$
$V_{o,ss}(t) = -2cos(t) + 4sin(t)$ is the steady state.
$$=\frac{10}{\sqrt{5}}cos(t-116.6^\circ)$$
$$T(s) = \frac{\frac{1}{2}s}{s^2 + 2 + \frac{1}{2}}$$
$$T(j\omega) = \frac{0.5j\omega}{-\omega ^2  + j\omega + 0.5}$$
Where $\omega = 1$
$$T(j\cdot 1) = \frac{0.5j}{0.5-1+j} = \frac{1}{\sqrt{5}}\angle-26^\circ = \frac{1}{\sqrt{5}}e^{j(-26^\circ)}$$
This says:
$$|V_o| = \frac{10}{\sqrt{5}}, \angle V_o = -90^\circ - 26^\circ = -116^\circ$$
#### Personal Question: How do Eigen values of linear systems of differential equations relate to Gain and Resonance?

## Class 18

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=2, american, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$V_1$]{}
	to[R=$100\Omega {=} 100$]++(2,0)--++(1,0)
	node[ocirc, label=right:$V_2$]{}++(-1,0)
	to[capacitor, l=$5\mu F {=} \frac{1}{5\times10^{-6} s}$]++(0,-2)--++(-2,0)++(2,0)--++(1,0);
\end{circuitikz}
\end{document}
```
$$V_1(t) = 30cos(4000t + 25^\circ)V$$
1. At any given time amplitude of $V_R, V_1, V_2$ must sum and follow KVL
2. The phase angle will be different in all three points
3. The frequency will be the same in all three.

$$H(s) = \frac{\frac{1}{0.000005s}}{100 + \frac{1}{0.000005s}}$$
$$H(j\omega) = \frac{\frac{1}{0.000005j\omega}}{100 + \frac{1}{0.000005j\omega}} = \frac{1}{1+ 0.0005j\omega}$$ 
$$\omega = 4000$$
$$\tilde{V_1} = 30\angle25^\circ$$
$$|H(j\omega)| = \frac{|1|}{\sqrt{1^2 + 2^2}} = \frac{1}{\sqrt{5}} = 0.4472$$
$$\phi = 0-\arctan\left(\frac{2}{1}\right) = -63.4^\circ$$
$$\tilde{V_2} = (0.4472\angle-63.4^\circ)(30\angle25^\circ) = 13.4\angle-38.4$$
$$\tilde{V_2} = (\tilde{V_1})\left(\left|\frac{1}{1+0.0005j\omega}\right|\angle\phi\right)$$
$$\tilde{V_2} = \tilde{V_1}\frac{1}{1+j0.0005\times4000} = \tilde{V_1}\frac{1}{1+j2}$$
$$V_2(t) = \frac{30}{\sqrt{5}}cos(4000t -38.4^\circ)V$$
#### IW 18.1
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[scale=2, american, font=\Large]

	\draw(0,0)
	node[ocirc, label=left:$V_1$]{}
	to[inductor, l=$0.1H {=} 0.1s$]++(2,0)
	to[R=$100\Omega {=} 100$]++(0,-2)++(0,2)--++(3,0)
	node[ocirc, label=right:$V_2$]{}++(-1,0)
	to[capacitor, l=$10\mu F {=} \frac{1}{10^{-5}s}$]++(0,-2)--++(-4,0);
	
	
\end{circuitikz}
\end{document}
```
$$V_1(t) = 10sin(1000t)V$$
Find $V_2$ at s.s. using Laplace transform

KCL
$$0=\frac{V_2-V_1}{sL}  + \frac{V_2}{R}+ V_2sC$$
$$0 = \frac{V_2}{sL} - \frac{V_1}{sL} + \frac{V_2}{R} + V_2sC$$
$$\frac{V_1}{sL} = V_2(\frac{1}{sL} + \frac{1}{R} + sC)$$
$$\frac{V_2}{V_1} = \frac{1}{1+\frac{L}{R}s + s^2LC}$$
$$H(s) = \frac{1}{LCs^2 + \frac{L}{R}s + 1}$$
$$H(s) = \frac{1}{10^{-6}s^2 + 0.001s + 1} = \frac{10^6}{s^2+1000s+10^6}$$
$$H(j\omega) = \frac{10^6}{(j\omega)^2 + 1000j\omega + 10^6}$$
$\omega = 1000$
$$H(j\omega) = \frac{10^6}{j^2(1000)^2 + j(1000)(1000) + 10^6} = \frac{10^6}{j10^6} = \frac{1}{j} = -j $$
$$|H(j\omega)| \angle\phi = 1\angle-90^\circ$$
$$V_1(t) = 10\sin(1000t)V = 10\cos(1000t - 90^\circ)V$$
$$\tilde{V_1} = 10\angle-90^\circ$$
$$\tilde{V_2} = (10\angle-90^\circ)(1\angle-90) = 10\angle-180^\circ$$
$$V_2(t) = 10cos(1000t - 180^\circ)V$$
#### IW 18.2 
$V_1$ is a step of $30V$ DC
$$V_2(t) 50e^{-8000t} - 20e^{-5000t}$$
What is the transfer function?
What is the steady state of $V_s(t)= 120cos(6000t)$
