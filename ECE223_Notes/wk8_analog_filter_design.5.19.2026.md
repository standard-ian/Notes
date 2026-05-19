## Class 15
#### Problems of Filter Design
1. Specification
2. Approximation
3. Realization
4. Analysis and Verification

Bilinear have a $20dB$ per decade rolloff, but for sharper peaks, we may need something beyond bilinear.
Something with a steeper slope than $20dB$ per decade must be more complex than bilinear.


$$T(s) = \frac{(s + z_1)(s + z_2)}{(s + p_1)(s + p_2)} = (T_1(s))(T_2(s)) = \left(\frac{s + z_1}{s + p_1}\right)\left(\frac{s + z_2}{s + p_2}\right)$$
A passive circuit made only of resistors and capacitors has transfer functions with poles and zeros on the real axis only. Complex conjugate poles or zeros do not occur without inductors or active elements. This means that without inductor, there won't be oscillation, and there won't be changes on the imaginary axis. 

Resonance will never be created by passive elements (R and C only)

#### Transfer Functions of a Second Order 
These are second order transfer functions that cannot be split into multiple first order functions as discussed above.
$$T(s) = \frac{N(s)}{D(s)} = \frac{b_2s^2 + B_1s + b_0}{a_2s^2 + a_1s + a_0}$$
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$V_1$]{}
	to[R=$R$]++(2,0)
	to[inductor, l =$L$]++(2,0)
	--++(1,0)
	node[ocirc, label=right:$V_2$]{}
	++(-1,0)
	to[capacitor, l=$C$]++(0,-2)
	node[ground]{};
\end{circuitikz}
\end{document}
```
The resistor and capacitor above have resonance because they are pumping energy back and forth in terms of voltage and current.
$$\frac{V_2}{V_1} = \frac{Z_2}{Z_1 + Z_2}=\frac{\frac{1}{sC}}{\frac{1}{sC} + sL + R} = \frac{1}{1 + s^2LC + sRC} =\frac{\frac{1}{LC}}{s^2 + s\frac{R}{L} + \frac{1}{LC}}$$

This results in a low pass filter because
$$T(j\omega) = \frac{\frac{1}{LC}}{j\omega^2 + j\omega\frac{R}{L} + \frac{1}{LC}}\Longrightarrow |T(j\omega)| \text{ (when R=L=C=1)}= \left|\frac{1}{(1-\omega^2) + j\omega}\right| = \frac{1}{\sqrt{(1-\omega)^2 + \omega^2}}$$
At $\omega=0$, $T(j\omega) = 1$
At $\omega=\infty$, $T(j\omega) = \frac{1}{\infty} = 0$

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$V_1$]{}
	to[R=$R$]++(2,0)
	to[capacitor, l =$C$]++(2,0)
	--++(1,0)
	node[ocirc, label=right:$V_2$]{}
	++(-1,0)
	to[inductor, l=$L$]++(0,-2)
	node[ground]{};
\end{circuitikz}
\end{document}
```
$$T(s) = \frac{s^2}{s^2 + \frac{R}{L}s + \frac{1}{LC}}$$
High pass behavior
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$V_1$]{}
	to[capacitor, l=$C$]++(2,0)
	to[inductor, l =$L$]++(2,0)
	--++(1,0)
	node[ocirc, label=right:$V_2$]{}
	++(-1,0)
	to[R=$R$]++(0,-2)
	node[ground]{};
\end{circuitikz}
\end{document}
```
$$T(s) = \frac{\frac{R}{L}s}{s^2 + \frac{R}{L}s + \frac{1}{LC}}$$
Band Pass Behavior
#### Back to Low Pass Example
More generally:
$$\frac{1}{as^2 + bs + 1c}$$
We could use quadratic formula to find the poles
$$as^2 + b2 + 1c = 0\Longrightarrow s_{1,2}=\frac{-b \pm\sqrt{b^2 - 4ac}}{2a} = \frac{-1\pm\sqrt{-3}}{2} = -\frac{1}{2} \pm j\frac{\sqrt{3}}{2}$$

Or
$$\frac{1}{(s + 0.5b)^2 + (1-0.25b)} = \frac{1}{(s + \frac{1}{2})^2+(\sqrt{0.75})^2}$$

##### Example
$$s^2 + 2s + 4$$
If we pull out $(s + \frac{1}{2}b)^2 = s^2 + 2s + 1$, we still need another 3
$$(s + \frac{1}{2}(2))^2 + 3 = s^2 + 2s + 4 = 0$$
$$(s + 1)^2 =-3$$
$$s + 1 = \pm j\sqrt{-3}\Longrightarrow s_{1,2} = -1\pm j\sqrt{3}$$

##### Example 2
$$s^2 + 6s + 25 = 0$$
$$(s + 3)^2 + 16 = 0$$
$$(s + 3)^2 = -16$$
$$s + 3 = \pm j\sqrt{16}\Longrightarrow s_{1,2} = -3\pm j4$$
The condition that results in complex poles
$$\frac{s^2 + b_1s + b_0 = 0}{b_0>\left(\frac{b_1}{2}\right)^2}$$
$$\left(s + \frac{b_1}{2}\right)^2 + \left[b_0 - \left(\frac{b_1}{2}\right)^2\right] = 0$$
When $\left[b_0 - \left(\frac{b_1}{2}\right)^2\right] > 0$ so that when we subtract it to the right side, and take the $\sqrt{\ \ }$, we get a complex number $j$.

**Poles are**
Real if $b_0\leq \left(\frac{b_1}{2}\right)^2$
Complex if $b_0> \left(\frac{b_1}{2}\right)^2$
## Class 16
