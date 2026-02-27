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
$$V_L(t) = L\frac{dI_L}{dt}$$
$$\mathcal{L}\left\{v_L(t)\right\} = \mathcal{L}\left\{ L\frac{dI_L}{dt}\right\} \to V_L(s) = sL\cdot I_L(s)$$
$$Z_L(s) = \frac{V_L(s)}{I_L(s)} = sL$$
###### Capacitor 
$$I_C(t) = C\frac{dV_I}{dt}$$
$$\mathcal{L}\left\{I_C(t)\right\} = \mathcal{L}\left\{C\frac{dV_C}{dt}\right\}\to I_C(s) = sC \cdot V_C(s)$$
$$Z_C(s) = \frac{V_C(s)}{I_C(s)} = \frac{1}{sC}$$

#### S Domain Expression
For:
$$I_s(s) = \frac{V_s}{Z_{in}} = V_s(s)\frac{LCs^2+1}{RLCs^2 + Ls + R}$$
Switch on at $t=0$, $V_s = \frac{12}{s}$, which is a step. 


## Class 16
#### Warm Up
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$V_{in}$]{}
	to[R=$20\Omega$]++(2,0)--++(1,0)
	node[ocirc, label=right:$V_{out}$]{}++(-1,0)--++(0,-.5)++(-.5,0)--++(1,0)
	to[capacitor, l=$5\mu F$]++(0,-2)--++(-1,0)
	to[inductor, l=$2.5 mH$]++(0,2)++(0.5, -2)
	node[ground, scale=2]{};
	
\end{circuitikz}
\end{document}
```
$$V_{in} = 100cos(10^4 t) V$$
$$\tilde{Z}_L = j\omega L = j\times 10^4 \times 2.5\times 10^{-3} = j25\Omega$$
$$\tilde{Z}_C = \frac{j}{\omega C} = \frac{-j}{5\times 10^{-6}\times 10^4} = -j20\Omega$$
$$\tilde{V}_{in} = 100e^{j0^\circ}$$
$$V_{out} = V_{in}\times\frac{20}{20 + \left(j20 - j25\right)^{-1}}$$
If $Z_L$ were $j20\Omega$, the complex portion will cancel and $\tilde{I} = \frac{100\angle0^\circ}{20} = 5\angle0^\circ$.

The current of the above circuit will be out of phase with the voltage. 
It could be made in phase using $L = 2mH$ or $L = 0$.
#### $s$ Domain Functions
```tikz

\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$x(t)$]{}
	to[R=$R_1$]++(2,0)--++(1,0)++(-1,0)
	to[R, a=$R_2$]++(0,-2)--++(1,0)
	node[ground, scale=2]{}
	to[capacitor, a=$C$]++(0,2)--++(0.5,0)
	node[ocirc, label=right:$y(t)$]{};
\end{circuitikz}
\end{document}
```
We could use the Laplace transform to more easily derive the **Transfer** **Function**. 

The original signals $y(t)$ and $x(t)$ could be current and voltage, current and current, or voltage and voltage and this may still be a transfer function.

A linear circuit can be completely characterized by the transfer function.

$$H(s) = \frac{Y(s)}{X(s)}$$

Until now, we have only been able to look at linear circuits in a steady state. Using Laplace transform, then deriving the transfer function will extend our ability to analyze to the transient as well!

```tikz

\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$X(s)$]{}
	to[R=$R_1$]++(2,0)--++(1,0)++(-1,0)
	to[R, a=$R_2$]++(0,-2)--++(1,0)
	node[ground, scale=2]{}
	to[capacitor, a=$\frac{1}{sC}$]++(0,2)--++(0.5,0)
	node[ocirc, label=right:$Y(s)$]{};
\end{circuitikz}
\end{document}
```
Remember: $\frac{1}{sC}$ means:
1. The voltage is the integral of the current
2. The s-domain impedance is the ratio of $\frac{V}{I}$
$$v_C(t) = \frac{1}{C}\int i_C(t) \to_{\mathcal{L}}\ V_C(s) = I_C(s)\times\frac{1}{sC} \to\frac{V_C(s)}{I_C(s)}= \frac{\frac{I_C(s)}{sC}}{I_C(s)} = \frac{1}{sC}$$
$$Z_{R_2||C} = \frac{1}{R_2}+sC = \frac{1+R_2\times Cs}{R_2} = \frac{R_2}{R_2Cs + 1}$$
$$Y(s) = X(s)\times\frac{Z_{R_2||C}}{R_1 + Z_{R_2||C}} = X(s)\frac{R_2Cs + 1}{R_1 + \frac{R_2}{1 + R_2Cs}}$$
$$\frac{Y(s)}{X(s)} = \frac{R_2}{R_1R_2 Cs + R_1 + R_2}$$
Substitute:
$$= \frac{A}{Bs + C}$$
Can set poles and zeros:
**Pole** Set $B_s + C = 0$, $s = \frac{-B}{C}$
No **Zeros**
You can manipulate $R_1$, $R_2$ and $C$ to place the pole at a specific place when designing.

#### IW 16.1
##### $t$ Domain
```tikz

\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$x(t)$]{}
	to[R=$1000\Omega$]++(2,0)--++(1,0)++(-1,0)
	to[R, a=$250\Omega$]++(0,-1)
	to[inductor, a=$50mH$]++(0,-1)--++(1,0)
	node[ground, scale=2]{}
	to[capacitor, a=$1\mu F$]++(0,2)--++(0.5,0)
	node[ocirc, label=right:$y(t)$]{};
\end{circuitikz}
\end{document}
```
##### $s$ Domain
```tikz

\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$X(s)$]{}
	to[R=$1000\Omega$]++(2,0)--++(0.5,0)
	node[ocirc, label=above:$A$]{}--++(0.5,0)++(-1,0)
	to[R, a=$250\Omega$]++(0,-1)
	to[inductor, a=$sL {=} 0.05s$]++(0,-1)--++(1,0)
	node[ground, scale=2]{}
	to[capacitor, a=$\frac{1}{sC} {=} \frac{1}{10^{-6}s}$]++(0,2)--++(0.5,0)
	node[ocirc, label=right:$Y(s)$]{};
\end{circuitikz}
\end{document}
```
$$Z_L = 0.05s$$
$$Z_C = \frac{1}{10^{-6} s} = 10^{6}\frac{1}{s}$$
##### KCL at $A$
$$\frac{X(s) - Y(s)}{1000} = \frac{Y(s)}{250 + 0.05s} + \frac{Y(s)}{10^{6}\frac{1}{s}}$$
$$\frac{X(s) - Y(s)}{1000} = Y(s)\left[\frac{1}{250 + 0.05s} + \frac{s}{10^{6}}\right]$$
$$H(s) = \frac{Y(s)}{X(s)} = \frac{1000(s + 5000)}{s^2 + 6000s + 25\times10^6}$$
Two poles, one zero

#### Inverse Laplace
Given some example:

$$Y(s) = \frac{s + 3}{(s+1)(s^2 + 2s + 5)}$$
Find $y(t) = \mathcal{L}^{-1}\{Y(s)\}$.

The strategy is to reduce to a form that can be found in the table.

$$s^2 + 2s + 5 = 0\to (s + 1)^2+4 = 0$$
Recognize the form:
$$\frac{s+a}{(s+a)^2+\omega^2}$$
Back to the example:
$$\frac{s + 3}{(s+1)(s^2 + 2s + 5)} = \frac{K_1}{s+1} + \frac{K_2s+K_3}{s^2 + 2s + 5}$$
$$ = \frac{K_1}{s+1} + \frac{K_2s+K_3}{(s+1)^2 + 2^2}$$
The above is now in a form such that we can use 2 entries on the table, summed, to create the example function.

We now want to solve for $K_{1,2,3}$
Find a common denominator using cross multiplication:
$$\frac{K_1[(s+1)^2 + 2^2] + (K_2s+K_3)(s+1)}{(s+1)[(s+1)^2+2^2])}$$
Setting the numerators equal
$$s+3 = K_1[(s+1)^2 + 2^2] + (K_2s+K_3)(s+1)$$
We can choose a value of $s$ that will cancel an $s$. Let $s=-1$, resulting in:
$$2 = K_1(4) + 0\to K_1 = 0.5$$
Then, solve for other $K$
$$s + 3 = \frac{1}{2}[s^2 + 2s + 5] + (K_2s+K_3)(s+1)$$
Move the first term on the right over and cancel:
$$-0.5s^2 +0.5 = K_2s^2+(K_2+K_3)s + K_3$$
So to satisfy the left side equality:
$$K_2 = -0.5;\ K_3 = 0.5$$
$$Y(s) = \color{green}\frac{0.5}{s+1} \color{orange}+ \frac{(-0.5)s}{(s+1)^2 + 2^2} \color{red}+ \frac{0.5}{(s+1)^2 + 2^2}$$
$$Y(s) = \color{green}\frac{0.5}{s+1}  \color{orange}+(-0.5)\frac{s+1}{(s+1)^2 + 4} + \frac{0.5}{(s+1)^2+4}  \color{red}+ \frac{0.5}{(s+1)^2+2^2}$$
$$Y(s) = \color{green}\frac{0.5}{s+1} \color{orange}- 0.5\frac{s+1}{(s+1)^2 + 2^2}\color{red} + 0.5\frac{2}{(s+1)^2 + 2^2}$$
$$Y(t) = \color{green}0.5e^{-t}\color{orange}-0.5e^{-t}cos(2t) \color{red}+0.5e^{-t}sin(2t)$$
