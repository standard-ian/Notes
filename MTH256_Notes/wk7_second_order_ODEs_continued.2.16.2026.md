## Class 1
#### Relating Method of Solving Second Order ODE's back to Spring Mass System
1. Mass of mass $m$
2. Origin $x=0$
3. Displacement as a function of time $x(t)$
4. Force due to the spring in the positive $x$: $F_s = -kx$
5. Force due to damping in the negative $x$: $F_d = -\gamma x'$

Giving the differential equation:
$$mx'' + \gamma x' + kx = 0$$

The characteristic polynomial is:
$$m\lambda^2 + \gamma\lambda + k = 0$$Which has the roots/evals:
$$\lambda = \frac{-\gamma \pm \sqrt{\gamma^2 - 4mk}}{2m}$$
If there is no damping whatsoever, $\gamma$ will be 0, and $m$ and $k$ will be of equal sign?

With a spring mass system, $\gamma, m,$ and $k$ are all $>0$ which restricts the possible solutions.

For each of the three cases there is special terminology.

##### Case 1: Real and Distinct Eigen Value (Over Damped)
$$\gamma^2 - 4mk > 0$$
$$x(t) = C_1e^{\lambda_1t} + C_2e^{\lambda_2 t}$$
The result will be a slow decay to zero in the position vs. time graph.

##### Case 2: Real and Repeated Eigen Values (Critically Damped)
$$\gamma^2 = 4mk$$
$$x(t) = C_1e^{\lambda t} + C_2te^{\lambda t}$$
If $\gamma^2 = 4mk$ the Eigen values are real and equal. 

##### Case 3: Complex Eigen Values (Under Damped)
$$\gamma^2 - 4mk < 0$$
$$x(t) = e^{\alpha t}(C_1cos(\beta t) + C_2sin(\beta t))$$
Note that if solution is undamped, $\gamma = 0$. Solutions will be purely oscillatory.
##### Comparison
```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}[scale=1.5]
\begin{axis}[
    width=12cm,
    height=7cm,
    xlabel={Time (s)},
    ylabel={Displacement (m)},
    title={Comparison of Damping Cases},
    grid=major,
    legend pos=north east,
    domain=0:10,
    samples=200
]
\addplot[blue, thick] {exp(-0.3*x)*cos(deg(0.954*x))};
\addplot[red, thick] {(1 + x)*exp(-x)};
\addplot[green!50!black, thick] {1.077*exp(-0.268*x) - 0.077*exp(-3.732*x)};
\legend{Underdamped ($\gamma=0.3$), Critically Damped ($\gamma=1.0$), Overdamped ($\gamma=2.0$)}
\end{axis}
\end{tikzpicture}
\end{document}
```

##### Underdamped 
In the case of an underdamped spring mass system, the general solution can be written as
$$x(t) = Acos(\beta t - \phi)$$
Where amplitude is:
$$A = \sqrt{C_1^2 + C_2^2}$$
And the phase $\phi$ is given by:
$$\phi = arctan\left(\frac{C_2}{C_1}\right)$$
This follows the identity:
$$A cos(\beta - \phi) = Acos(\beta t) cos(\phi) + Asin(\beta t) sin(\phi)$$
Comparing to the original form, we see:
$$Acos(\phi) = C_1;\ Asin(\phi) = C_2$$
Thus, we can always write the purely oscillatory solution as:
$$x(t) = Acos(\beta t - \phi) = Acos(\beta(t - \frac{\phi}{\beta}))$$
A cosine with amplitude $A$, frequency $\beta$.
Period $\frac{2\pi}{\beta}$ 
Phase-shift $\frac{\phi}{\beta}$
#### Example
Consider the spring mass system determined by the IVP:
$$x'' + 5x = 0$$
$$x(0) = 2;\ x'(0) = 1$$
The Eigen values are:
$$\lambda = \pm \sqrt{5} i$$
The general solution is:
$$x(t) = C_1 cos(\sqrt{5} t) + C_2 sin(\sqrt{5}t)$$
Applying the initial conditions, we see that $C_1 = 2$ and $C_2 = \frac{1}{\sqrt{5}}$
$$x(t) = 2 cos(\sqrt{5}t) + \frac{1}{\sqrt{5}}sin(\sqrt{5}t)$$
From this solution, it is unclear what the oscillations look like, but we can write it in phase/amplitude form and the solution will be easier to visualize

$$A = \sqrt{C_1^2 + C_2 ^2} = \sqrt{2^2 + \left(\frac{1}{\sqrt{5}}\right)^2} = \sqrt{4 + \frac{1}{5}} = \sqrt{\frac{21}{5}}$$
$$\phi = arctan\left(\frac{1}{2\sqrt{5}}\right)$$
Thus:
$$x(t) = \sqrt{\frac{21}{5}}cos(\sqrt{5}t  - 0.22) = \sqrt{\frac{21}{5}}cos\left(\sqrt{5}\left(t - \frac{0.22}{\sqrt{5}}\right)\right)$$
#### Example
Find the solution to the homogeneous equation
$$x'' + 2x' + 5x = 0$$
$$x(0) = 1;\ x'(0) = 3$$
The characteristic equation is:
$$\lambda^2 + 2\lambda + 5 = 0$$
Cannot factor
$$\lambda = \frac{-2\pm\sqrt{2^2 -4(1)(5)}}{2(1)} = \frac{-2\pm\sqrt{-16}}{2} = -1\pm 2i$$
Underdamped, because there is a real and complex, so:
$$x(t) = e^{-t}(C_1cos(2t) + C_2(sin(2t))$$
$$x(0) = 1 = C_1cos(0) + C_2sin(0) \to 1 = C_1$$
$$x'(t) = (1)(-e^{-t}cos(2t) - 2e^{-t}sin(2t)) + (C2)(-e^{-t}sin(2t) + 2e^{-t}cos(2t))$$
$$x'(0) = 3 = -1 + C_2\to C_2 = 2$$
Finally:
$$x(t) = e^{-t}(cos(2t) + 2sin(2t))$$
#### Non-Homogeneous Equations
Now we consider equations of the form:
$$ax'' + bx' + cx = f(t)$$
As with 1st order equations, the solution to linear 2nd order differential equations can be written in the form $x(t) = x_h(t) + x_p(t)$

Note that $x_p$ depends on $f(t)$ and:
$$x_h(t) = C_1 x_1(t) + C_2x_2(t)$$
Since $a, b$

Recall:

| $f(t)$                                                     | $x_p(t)$                                  |
| ---------------------------------------------------------- | ----------------------------------------- |
| $\alpha$                                                   |                                           |
| $\alpha e^{\beta t}$                                       | $A$                                       |
| Polynomial of degree n                                     | $Ae^{\beta t}$                            |
| $\alpha sin(\omega t)$; $\alpha cos(\omega t)$             | $A_nt^n + A_n-1t^{n-1} +...+A_1t + A_0$   |
| $\alpha e^{rt}sin(\omega t)$; $\alpha e^{rt}cos(\omega t)$ | $e^{rt}(Asin(\omega t) + Bcos(\omega t))$ |

If $x_p$ coincides with $x_h(t)$, multiply $x_p$ by the lowest power of $t$ that removes duplication.

#### Example
Find the general solution to:
$$x'' + 3x = 4e^{-5t}$$
Linear, second order ODE, constant coefficients, non-homogeneous.
##### 1. Find $x_h(t)$
Characteristic equation:
$$\lambda^2 + 3 = 0;\ \lambda = \pm\sqrt{3}$$
$$x_h(t) = C_1cos(\sqrt{3}t) + C_2sin(\sqrt{3} t)$$
##### 2. Find $x_p(t)$
Remember, $4e^{-5t}$ is our $f(t)$, so we guess $Ae^{-5t}$
Take 1st and 2nd derivative of $x_p$
$$x'_p(t) = -5Ae^{-5t}$$
$$x''_p(t) = 25Ae^{-5t}$$
$$x''_p + 3x_p = 25Ae^{-5t} + 3(Ae^{-5t}) = 4e^{-5t}$$
$$28A = 4\to A = \frac{1}{7}$$
$$x_p(t) = \frac{1}{7}e^{-5t}$$
$$x(t)= C_1cos(\sqrt{3}t) + C_2sin(\sqrt{3}t) + \frac{1}{7}e^{-5t}$$

#### Example IVP
Wait to apply initial conditions until the **entire** general solution is found.

Find the solution of the IVP:
$$x'' + 2x = sin(3t)$$
$$x(0)= 1;\ x'(0) = -1$$
$$\lambda^2 + 2= 0;\ \lambda = \pm 1$$
$$x_h(t) = C_1cos(\sqrt{2}t) + C_2sin(\sqrt{2} t)$$
$f(t) = sin(3t)$ So:
$$x_p(t) = Asin(3t) + Bcos(3t)$$
$$x'_p(t) = 3Acos(3t) - 3Bsin(3t)$$
$$x''_p(t) = -9Asin(3t) -9Bcos(3t)$$
$$x''p + 2x_p = -9Asin(3t) - 9Bcos(3t) + 2(Asin(3t) + Bcos(3t))$$
$$= -7Asin(3t) -7Bcos(3t) = 1sin(3t) + 0cos(3t)$$
$$A =\frac{1}{7};\ B = 0$$
So the general solution is:
$$x(t) = C_1cos(\sqrt{2}t ) + C_2 sin(\sqrt{2} t) - \frac{1}{7}sin(3t)$$
$$x(0) = 1 = C_1cos(0) + C_1sin(0) - \frac{1}{7}sin(0);\ C_1 = 1$$
$$x'(t) = -\sqrt{2}sin(\sqrt{2}t) + C_2\sqrt{2}cos(\sqrt{2} t) -\frac{3}{7}cos(3t)$$
$$x'(0) = -1 = \sqrt{2}C_2-\frac{3}{7}\to C_2 = \frac{-4}{7\sqrt{2}}$$
Finally:
$$x(t) = cos(\sqrt{2}t) - \frac{4}{7\sqrt{2}}sin(\sqrt{2}t) - \frac{1}{7}sin(3t)$$
#### Application RLC Circuit
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[R=$R$, i_>=$I$]++(0,2)
	to[inductor, l=$L$]++(2,0)
	to[capacitor, l=$C$]++(0,-2)
	to[switch]++(-1,0)
	to[vsource, l=$E(t)$, invert]++(-1,0);
\end{circuitikz}
\end{document}
```
$E(t) = Electromotive\ Force\ (V)$
The equation for the charge $Q(t)$ across the capacitor is:
$$LQ'' + RQ' + \frac{1}{C}Q = E(t)$$
