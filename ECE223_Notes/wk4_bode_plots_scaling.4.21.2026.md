## Class 7
#### Bode Plot
$\log_{10}$ scale means each power of 10 division becomes increasingly condensed as the $x$ axis moves from left to right.

#### Bilinear Transfer Function
$$T(s) = k\frac{s + z}{s + p} = k\frac{z}{p}\left(\frac{\frac{s}{z} + 1}{\frac{s}{p} + 1}\right)$$
Bilinear have at most 1 pole and one zero
![[bilinear_transfer_functions.png|697]]

#### Frequency Response from a Bilinear Transfer Function
$$T(j\omega) = k\frac{z}{p}\left(\frac{\frac{j\omega}{z} + 1}{\frac{j\omega}{p} + 1}\right)$$
$$|T(j\omega)| = \frac{\left|k\frac{z}{p}\right|\cdot \left|\frac{j\omega}{z} + 1\right|}{\left|\frac{j\omega}{p} + 1\right|}$$
$$20\log|T| = 20\log\left|k\frac{z}{p}\right| + 20\log\left|j\frac{\omega}{z} + 1\right| - 20\log\left|j\frac{\omega}{p} +1\right|$$
When $\omega = 0$, the second 2 terms cancel, leaving only the constant first term.

When mapping the transfer function to a Bode plot, we look for which is closer the origin, the pole, or the zero.
##### Zero Term
Starting with the second term, often called the $z-term$ $20\log\left|j\frac{\omega}{z} + 1\right|$:

When $\omega$ is nearly 0, 
$20\log\left|j\frac{\omega}{z} + 1\right| \approx 0$

When $\omega$ is high
$20\log\left|j\frac{\omega}{z}\right| = 20\log\left|\frac{\omega}{z}\right|$

When $\omega = z$
$20\log\left|j + 1\right| = 20\log|\sqrt{2}| = 3dB$
This is a zero term, so the slope will increase from $3dB$ with a knee at $\approx \omega = z$

###### Creating a Bode Plot of the Zero term from this
For the bode blot, our first corner is at $\omega = z$. Then we just draw a straight line to start, straight up to the point $(x,y) = (10z, 20dB)$ 

##### Pole Term
For the third term, the one with the pole dependancy:
$-20\log\left|j\frac{\omega}{p} +1\right|$

When $\omega = 0$, $0dB$
When $\omega = \infty$,  $-20\log\left|j\frac{\omega}{p}\right|$ 
When $\omega = p$, $-20\log\left|j+1\right| = 20\log\left|\sqrt{2}\right| = -3dB$
###### Creating a Bode Plot of the Pole term from this
Here, the knee is at $\omega = p$

#### IW 7.1
Bode asymptotes for:
$$T(j\omega)\text{ of } T = \frac{s + 0.5}{s + 3}$$
$$T(j\omega) = \frac{0.5}{3} \frac{\frac{j\omega}{0.5} + 1}{\frac{j\omega}{3} + 1}$$

$$20\log|T(j\omega)|$$
$$= 20\log\left|\frac{0.5}{3}\right| +  20\log\left|j\frac{\omega}{0.5} + 1\right| - 20\log\left|j\frac{\omega}{3} + 1\right|$$

## Class 8
#### Review of Magnitude Plots
The function that is the origin of the Bode plot asymptotes is:
$$T(j\omega) = k\frac{z}{p}\left(\frac{\frac{j\omega}{z} + 1}{\frac{j\omega}{p} + 1}\right)$$
If $k=z=2$ and $p=9$

$$T(j\omega) = 2\frac{2}{9}\left(\frac{j\frac{\omega}{2} + 1}{j\frac{\omega}{9} + 1}\right)$$
We can create a log form of the magnitude:
$$20\log\left|\frac{4}{9}\right| + 20\log\left|j\frac{\omega}{2} + 1\right| - 20\log\left|j\frac{\omega}{9} + 1\right|$$
Asymptotes at:
$$-7.04dB + 6.02dB - 6.02dB$$
```tikz
\usepackage{pgfplots}

\begin{document}
\begin{tikzpicture}

\begin{axis}[
	xmode=log,
	ymode=linear,
	xmin=0.00001,
	xmax=1000,
	grid=both,
	width=20cm,
	height=13cm,
]

\addplot[domain=0.00001:1000, samples=200, thick]{20*log10(4/9) + (20*log10((x/2) + 1) - 20*log10((x/9) + 1)};

\addplot[domain=0.00001:1000, dashed, thick, red]{20*log10(4/9)};
\addplot[domain=0.00001:1000, dashed, thick, green]{20*log10(2)};

\end{axis}

\end{tikzpicture}
\end{document}
```
#### Phase Plots
$$\angle T(j\omega) = \angle \frac{4}{9} + \angle j\frac{\omega}{2} + 1 -\angle j\frac{\omega}{9} + 1$$
$$=0^\circ + \tan^{-1}\left(\frac{\omega}{2}\right) - \tan^{-1}\left(\frac{\omega}{9}\right)$$
When $\omega$ is very small ($\approx 0$,) $\tan^{-1}\left(\frac{\omega}{2}\right) \approx 0$ 
When $\omega$ is very large ($\to \infty$), $\tan^{-1}\left(\frac{\omega}{2}\right) \to 90^{\circ}$ 
$$\tan^{-1}\left(\frac{\omega}{2}\right): 0\to90^\circ,\ \omega = 2: 45^\circ$$
$$-\tan^{-1}\left(\frac{\omega}{9}\right): 0\to-90^\circ,\ \omega = 9: -45^\circ$$
![[Pasted image 20260423100036.png]]

#### Realization
$$T(s) \to R,C,\text{Op-Amp}$$
We cannot have the idealized brick wall transfer function, we have to approximate one based on real constraints.

#### IW 8.1
Sketch the Asymptotic Bode plot for the following:
$$T(s) = -100\frac{s + 10^4}{s + 10^2}$$
$$T(j\omega)$$
$$= 20\log\left|-100\frac{10^4}{10^2}\right| + 20\log\left|j\frac{\omega}{10^4}+ 1\right | - 20\log\left|j\frac{\omega}{10^2}+ 1\right|$$
