## Class 15

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
#### IW 15.1
Find the Laplace transform, $\mathcal{L}(f(t))$ for the  following functions.
##### A.
$$\mathcal{L}\left\{12e^{-5t}\right\} = V(s) = 12\frac{1}{s+5}$$
##### B. 

$$\mathcal{L}\left\{12e^{-2t}cos(2\pi t)\right\} = V(s) = 12\frac{s + 2}{(s + 2)^2+ (2\pi)^2}$$

There are some functions where we cannot simply use the table above to find the transform.
#### Impulse Function
Time duration approaches zero, so the derivative is infinite. 

The unit impulse is denoted as:
$$\delta(t)$$
It may also have a coefficient preceding it. 

$$\color{yellow}\int \delta(t) dt = 1$$
Because at $t=0$ $y$ is spiking to infinity. When we take the derivative, we include the impulse as  the sum of functions.
$$f(t) = f'(t) + \delta(t)$$
```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
\begin{axis}[
    width=10cm,
    height=10cm,
    grid=major,
    domain=0:20,
    samples=300,
    xmin=-1, xmax=1.5, ymin=-1, ymax=1.5,
    axis lines=middle,
    enlargelimits=true,
]

\addplot[orange, thick]{exp(-3*x)};
\addlegendentry{$f(t) = e^{-3t}$}

\addplot[red, thick]{-3*exp(-3*x)};
\addlegendentry{$f'(t) = -3e^{-3t}$}

\draw[yellow, thick, ->, >=latex] (axis cs:0,0) -- (axis cs:0,1);

\end{axis}
\end{tikzpicture}
\end{document}
```

```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
\begin{axis}[
    width=10cm,
    height=10cm,
    grid=major,
    domain=0:100,
    samples=300,
    xmin=-90, xmax=90, ymin=-3, ymax=3,
    axis lines=middle,
    enlargelimits=true,
]

\def\myomega{2}

\addplot[orange, thick]{cos(\myomega * x)};
\addlegendentry{$f(t) = cos(\omega t)$}

\addplot[green, thick]{-\myomega*sin(\myomega * x)};
\addlegendentry{$f(t) = -\omega sin(\omega t)$}

\draw[yellow, thick, ->, >=latex] (axis cs:0,0) -- (axis cs:0,1);

\end{axis}
\end{tikzpicture}
\end{document}
```
#### IW 15.2
Find:
$$\mathcal{L}\{f(t)\}\ and\ \mathcal{L}\{f'(t)\}$$
$$f(t) = sin(\omega t)$$
$$\frac{df}{dt}sin(\omega t) = cos(\omega t)$$
$$\mathcal{L}\{(cos(\omega t)\} = \frac{s}{s^2 + \omega^2}$$
$$\mathcal{L}\{(sin(\omega t)\} = \frac{\omega}{s^2 + \omega^2}$$
#### $s$ and $\frac{1}{s}$ encode differentiation and integration respectively
$$\mathcal{L}\left\{\frac{df}{dt}\right\} = s\cdot\mathcal{L}\{f(t)\} = s\cdot F(s)$$
$$\mathcal{L}\left\{\int f(t)\right\} = \frac{1}{s}\cdot\mathcal{L}\{f(t)\}=\frac{1}{s}\cdot F(s)$$
#### Ramp Function
$$f(t) = At$$
The Laplace of this:
$$\mathcal{L}\{f(t)\} = \frac{1}{s^2}$$
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[vsource, invert, V=$12V$]++(0,2)
	to[switch]++(1,0)
	to[R=$50\Omega$]++(1,0)
	to[capacitor, l=$1\mu F$]++(0,-2)++(0,2)--++(1,0)
	to[inductor, l=$0.01mH$]++(0,-2)--++(-3,0);
\end{circuitikz}
\end{document}
```
At a steady state, the transient will die out and the current will be $\frac{12}{50}A$ through the inductor **only.**

The transient will oscillate and converge around a value, and there is a ramp function component
$$k_1te^{-\frac{t}{\tau}} + k_2e^{-\frac{t}{\tau}}$$

#### Circuits
$$V= IR\ \to\ V(s) = I(s)\cdot R$$
Impedance is the ratio of voltage to current
###### Resistor
$$Z_R(s) = R$$
###### Inductor
$$I_C(t) = C\frac{dV_I}{dt}$$
$$\mathcal{L}\left\{v_L(t)\right\} = \mathcal{L}\left\{ L\frac{dI_L}{dt}\right\} \to V_L(s) = sL\cdot I_L(s)$$
$$Z_L(s) = \frac{V_L(s)}{I_L(s)} = sL$$
###### Capacitor 
$$V_L(t) = L\frac{dI_L}{dt}$$
$$\mathcal{L}\left\{I_C(t)\right\} = \mathcal{L}\left\{C\frac{dV_C}{dt}\right\}\to I_C(s) = sC \cdot V_C(s)$$
$$Z_C(s) = \frac{V_C(s)}{I_C(s)} = \frac{1}{sC}$$

#### S Domain Expression
For:
$$I_s(s) = \frac{V_s}{Z_{in}} = V_s(s)\frac{LCs^2+1}{RLCs^2 + Ls + R}$$
Switch on at $t=0$, $V_s = \frac{12}{s}$, which is a step. 


