## Homework 1
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=below right:$+$]{}
	to[capacitor, l=$C$]++(2,0)--++(1,0)
	node[ocirc, label=below right:$+$]{}
	++(-1,0)
	to[R=$R$]++(0,-2)--++(1,0)
	node[ocirc, label=above right:$-$]{}
	++(-1,0)--++(-2,0)
	node[ocirc, label=above right:$-$]{}
	++(0,1)
	node[label=right:$V_1$]{}
	++(3,0)	
	node[label=right:$V_2$]{};
\end{circuitikz}
\end{document}

```

#### Transfer Function
$$T(s) = \frac{R}{R + \frac{1}{sC}} = \frac{sRC}{sRC + 1} = \frac{s}{\frac{1}{RC} + s}$$
#### Steady State response as a function of $\omega$
$$\frac{1}{RC} = \omega_0$$
$$T(j\omega) = \frac{j\omega}{\omega_0 + j\omega}$$
#### Examine the Gain at $\omega = 0, \infty$
##### At $\omega = 0$
The numerator 0, so the magnitude of the numerator over the magnitude of the denominator (gain) is 0.
$$|T(j\omega)| = \frac{\sqrt{0}}{\sqrt{\left(\frac{1}{RC}\right)^2}} = 0$$
##### At $\omega =\infty$
The imaginary terms in the numerator and denominator go to infinity and dominate $\frac{1}{RC}$, the magnitude of the transfer function is approximately 1.
$$|T(j\omega)| = \frac{\sqrt{\infty^2}}{\sqrt{\left(\frac{1}{RC}\right)^2 + \infty^2}} \approx 1$$

#### Cutoff Frequency
$$T(j\omega) = \frac{1}{\sqrt{2}} = \frac{j\frac{\omega}{\omega_0}}{1 + j\frac{\omega}{\omega_0}} = \frac{j\omega RC}{1 + j\omega RC}$$
At $\omega = \frac{1}{RC}$
$$T\left(j\frac{1}{RC}\right) = \frac{j}{1 + j}$$
$$\left|T\left(j\frac{1}{RC}\right)\right| = \frac{\sqrt{1^2}}{\sqrt{1^2 + 1^2}} = \frac{1}{\sqrt{2}}$$
#### Phase at $\omega = 0, \infty, \omega_0$ 
The purely imaginary numerator will always have a phase of $90^\circ$
$$\angle T(j\omega) = \arctan\left(\frac{\mathcal{I}m[numerator]}{\mathcal{R}e[numerator]}\right) - \arctan\left(\frac{\mathcal{I}m[denominator]}{\mathcal{R}e[denominator]}\right)$$
$$\angle T(j\omega) = 90^\circ - \arctan\left(\frac{\mathcal{I}m[denominator]}{\mathcal{R}e[denominator]}\right)$$
##### At $\omega = 0$ 
$$\angle T(j\omega) = 90^\circ - \arctan\left(\frac{0}{1}\right) = 90^\circ - 0^\circ = 90^\circ$$
##### At $\omega = \infty$ 
$$\angle T(j\omega) = 90^\circ - \arctan\left(\frac{\infty}{1}\right) = 90^\circ - 90^\circ = 0^\circ$$
##### At $\omega = \omega_0$ 
$$\angle T(j\omega) = 90^\circ - \arctan\left(\frac{1}{1}\right) = 90^\circ-45^\circ = 45^\circ$$

#### Bode Plot
![[step_response.png]]