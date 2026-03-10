## Homework 6

#### 1. Transfer function definition

A transfer function is the ratio of a metric (voltage, current, etc) at a certain point in the circuit to to the same metric at another point, generally the point of supply, for example $V_{out}/V_{in}$.

In $s$ domain, this function is basically a representation of a theoretical 3D space where the $x,y$ plane is $\mathcal{Re,Im}$ plane and the $z$ axis is a surface with height representing the gain.

To say the zero of a transfer function is $\infty$ for some function means that when $s\to\infty$ the function's denominator, it scales at an exponentially greater magnitude than the numerator.

For example: $$H(s) = \frac{\frac{1}{2}s}{s^2 + s + \frac{1}{2}},\ \frac{1\ zero}{2\ poles},\ \frac{0, \infty}{-0.5\pm j0.5}$$ In the above function, when all $s$ are zero in the function, the output is obviously 0 since the numerator is 0.

Less obviously, when all $s$ are $\infty$, the denominator is a exponentially greater $\infty$, and so divides the numerator so greatly such that it approaches 0.

#### 2. Find Transfer Function for Each Circuit

##### A.

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

	\draw(0,0)
	to[vsource, invert, V=$V_1$]++(0,2)
	to[R=$50k\Omega {=} 50000$]++(2,0)--++(1,0)
	node[ocirc, label=right:$V_2$]{}++(-1,0)
	to[capacitor=$100\mu F {=}\frac{1}{s(100\times10^{-6})}$]++(0,-2)--++(-2,0);
	
\end{circuitikz}
\end{document}
```

$$V_2 = V_1\frac{\frac{1}{10^{-8}s}}{50000 + \frac{1}{10^{-8}s}}$$ $$\frac{V_2}{V_1} = H(s) = \frac{\frac{1}{10^{-8}s}}{50000 + \frac{1}{10^{-8}s}}$$ $$= \frac{\frac{1}{10^{-8}s}}{50000 + \frac{1}{10^{-8}s}} \left(\frac{10^{-8}s}{10^{-8}s}\right) = \frac{1}{5\times10^4\times10^{-8}s + 1}$$ $$H(s) = \frac{1}{5\times10^{-4}s + 1}$$ One pole that will make the denominator 0 at $s = -2000$ One zero at $s\to\infty$

```tikz
\usepackage{pgfplots}

\begin{document}

\begin{tikzpicture}
\begin{axis}[
    width=15cm,
    height=15cm,
    xlabel={$\{\mathcal{R}e(s)\}$},
    ylabel={$\{\mathcal{I}m(s)\}$},
    xmin=-2500, 
    xmax=2500, 
    ymin=-2500, 
    ymax=2500,
    grid=major,
    axis lines=middle,
    enlargelimits=true,
]
\addplot[orange, thick, only marks, mark=x, mark size=6pt] coordinates {(-2000, 0)};
\node[orange, rotate=45, above right, font=\Large] at (axis cs:-2000, 0) {$-2000$};

% 1. The "Path" to infinity
\draw[->, thick, dashed, green!70!black] (axis cs:2500,0) -- (axis cs:3000,0);

% 2. The Zero at Infinity (placed near the boundary)
\addplot[green!70!black, thick, only marks, mark=o, mark size=6pt] coordinates {(3000, 0)};

% 3. The Label
\node[green!70!black, below, font=\Large] at (axis cs:2500, 500) {$\infty$};

\end{axis}

\end{tikzpicture}
\end{document}
```

##### B.

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

	\draw(0,0)
	to[vsource, invert, V=$V_1$]++(0,2)
	to[capacitor=$100\mu F {=} \frac{1}{s100\times10^{-6}}$]++(2,0)--++(1,0)
	node[ocirc, label=right:$V_2$]{}++(-1,0)
	to[R=$50k\Omega {=} 50000$]++(0,-2)--++(-2,0);
	
\end{circuitikz}
\end{document}
```

$$V_2 = V_1\frac{50000}{50000 + \frac{1}{10^{-8}s}}$$ $$\frac{V_2}{V_1} = H(s) = \frac{50000}{50000 + \frac{1}{10^{-8}s}}\left(\frac{10^{-8}s}{10^{-8}s}\right)$$ $$H(s) = \frac{5\times10^{-4}s}{5\times10^{-4}s + 1}$$

```tikz
\usepackage{pgfplots}

\begin{document}

\begin{tikzpicture}
\begin{axis}[
    width=15cm,
    height=15cm,
    xlabel={$\{\mathcal{R}e(s)\}$},
    ylabel={$\{\mathcal{I}m(s)\}$},
    xmin=-2500, 
    xmax=2500, 
    ymin=-2500, 
    ymax=2500,
    grid=major,
    axis lines=middle,
    enlargelimits=true,
]
\addplot[orange, thick, only marks, mark=x, mark size=6pt] coordinates {(-2000, 0)};
\node[orange, rotate=45, above right, font=\Large] at (axis cs:-2000, 0) {$-2000$};

\addplot[green!70!black, thick, only marks, mark=o, mark size=6pt] coordinates {(0, 0)};
\node[green!70!black, rotate=45, above right, font=\Large] at (axis cs:0, 0) {$\ 0$};

\end{axis}

\end{tikzpicture}
\end{document}
```

##### C.

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

	\draw(0,0)
	to[vsource, invert, V=$V_1$]++(0,2)
	to[switch]++(1,0)
	to[R=$6\Omega {=} 6$]++(2,0)
	to[capacitor, a=$\frac{1}{3}F {=} \frac{3}{s}$]++(0,-2)++(0,2)--++(2,0)
	node[ocirc, label=right:$V_2$]{}++(-1,0)
	to[R=$6\Omega {=} 6$]++(0,-2)--++(-4,0);
	
\end{circuitikz}
\end{document}
```

Using KCL: $$\frac{V_2}{6} + \frac{V_2s}{3} + \frac{V_2 - V_1}{6}=0$$ $$V_2 + 2V_2s + V_2 - V_1=0$$ $$V_2(2 + 2s) = V_1$$ $$H(s) = \frac{1}{2+2s}$$

```tikz
\usepackage{pgfplots}

\begin{document}

\begin{tikzpicture}
\begin{axis}[
    width=15cm,
    height=15cm,
    xlabel={$\{\mathcal{R}e(s)\}$},
    ylabel={$\{\mathcal{I}m(s)\}$},
    xmin=-4, 
    xmax=4, 
    ymin=-4, 
    ymax=4,
    grid=major,
    axis lines=middle,
    enlargelimits=true,
]
\addplot[orange, thick, only marks, mark=x, mark size=6pt] coordinates {(-1, 0)};
\node[orange, rotate=45, above right, font=\Large] at (axis cs:-1, 0) {$\ -1$};


% 1. The "Path" to infinity
\draw[->, very thick, dashed, green!70!black] (axis cs:4,0) -- (axis cs:4.8,0);

% 2. The Zero at Infinity (placed near the boundary)
\addplot[green!70!black, thick, only marks, mark=o, mark size=6pt] coordinates {(4.8, 0)};

% 3. The Label
\node[green!70!black, below, font=\Large] at (axis cs:4.5, 1) {$\infty$};


\end{axis}

\end{tikzpicture}
\end{document}
```

##### D.

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

	\draw(0,0)
	to[vsource, invert, V=$V_1$]++(0,2)
	to[switch]++(1,0)
	to[capacitor, l=$0.5F{=}\frac{2}{s}$]++(1,0)
	to[inductor, l=$1H{=}s$]++(1,0)--++(1,0)
	node[ocirc, label=right:$V_2$]{}++(-1,0)
	to[R=$2\Omega {=} 2$]++(0,-2)--++(-3,0);
	
\end{circuitikz}
\end{document}
```

$$V_2 = V_1\frac{2}{2 + s + \frac{2}{s} }$$ $$\frac{V_2}{V_1} = H(s) = \frac{2}{2 + s + \frac{2}{s} }\left(\frac{\frac{1}{2}s}{\frac{1}{2}s}\right) = \frac{s}{\frac{1}{2}s^2 + s+1}$$

Zeros at $s=0, \infty$ Poles at: $$s = \frac{-1\pm\sqrt{1 - 2}}{2(\frac{1}{2})} = -1\pm j$$

```tikz
\usepackage{pgfplots}

\begin{document}

\begin{tikzpicture}
\begin{axis}[
    width=15cm,
    height=15cm,
    xlabel={$\{\mathcal{R}e(s)\}$},
    ylabel={$\{\mathcal{I}m(s)\}$},
    xmin=-2, 
    xmax=2, 
    ymin=-2, 
    ymax=2,
    grid=major,
    axis lines=middle,
    enlargelimits=true,
]
\addplot[orange, thick, only marks, mark=x, mark size=6pt] coordinates {(-1, 1) (-1, -1)};
\node[orange, rotate=45, above right, font=\Large] at (axis cs:-1, 1) {$\ -1+j$};
\node[orange, rotate=45, above right, font=\Large] at (axis cs:-1, -1) {$\ -1-j$};


\draw[->, very thick, dashed, green!70!black] (axis cs:2,0) -- (axis cs:2.4,0);

\addplot[green!70!black, thick, only marks, mark=o, mark size=6pt] coordinates {(0,0) (2.4, 0)};

\node[green!70!black, below, font=\Large] at (axis cs:2.3, 0.5) {$\infty$};
\node[green!70!black, rotate=45, above right, font=\Large] at (axis cs:0, 0) {$\ 0$};


\end{axis}

\end{tikzpicture}
\end{document}
```

#### 3. Consider the Poles and Zeros of $C$ and $D$ Above

Assume the circuits have 0 zero energy when the switch is closed.

##### A.

**If $V_{1}$ is a constant DC source, what would the response of $V_{2}$ be in $C$ and in $D$?**

If the source is DC, there will be no oscillatory portion of the transfer function $s=0$.

###### Circuit $C$

In $C$, $H(0) = \frac{1}{2}$. This means that voltage at $V_2$ will be half of $V_1$. This makes sense because at steady state the capacitor will be charged, no current will flow through that parallel branch and we'll be left with a voltage divider of two equal value resistors!

###### Circuit $D$

In $D$, $H(0) = 0$. This means that no DC voltage will reach $V_2$ once the capacitor reaches a steady state. This makes sense because the capacitor will charge to $V_1$, and there will no longer be a potential difference causing current to flow past it.

##### B.

**If $V_{1}$ is a sinusoidal AC source, what would the response of $V_{2}$ be in $C$ and in $D$?** With an AC $V_1$, the denominator of the transfer function (the characteristic equation) matches the form of a decaying oscillator. This by itself is the transient response.

When multiplied with $V_1(s)$, we can see the total response of $V_2$ in the complex domain. We can convert $H(s)$ back to the time domain to see how the transient responds over time.

###### Circuit $C$

In the case of $C$, the denominator $2s + 2$ matches the form $s - a$ indicating pure decay with no oscillation, i.e. $Ae^{at}$.

$$V_2(t) = \frac{1}{2}e^{-t}V_1$$

This means that $V_2$ will be $\frac{V_1}{2}$ after the transient decays.

###### Circuit $D$

For $D$, with an AC circuit, and given a characteristic equation with complex roots $\alpha \pm j\omega$:

$$x(t) = e^{at}(A\cos(\omega t) + B\sin(\omega t))$$

Where $\alpha = -1$ and $\omega = 1$, which matches the poles found.

Since the denominator governs the overall pattern of oscillation and decay for a transfer function, we know $D$ will have a decaying oscillation over time as the transient dies away, since $\alpha = -1$.

$V_2$ will respond as a $V_1$ scaled by the magnitude of the transfer function, and shifted by $\arctan\left(\frac{\mathcal{Im}}{\mathcal{Re}}\right)$, which for an AC signal is dependent on the frequency $\omega$.

#### 4. Inverse Laplace Transform for Circuit D, $V_1 =12V\ DC$

Goal is to find the voltage across the resistor $V_2$ Starting from the transfer function: $$H(s) = \frac{V_2}{V_1} = \frac{s}{0.5s^2 + s + 1}$$ $$V_1 = 12V$$ The input voltage is a step of 12, so from the table: $$V_1(s) = \frac{12}{s}$$ $$V_2(s) = \frac{12}{s}\cdot\frac{2}{2}\cdot\frac{s}{0.5s^2 + s + 1} = \frac{24}{(s^2 + 2s + 2)}$$ Therefore (Completing the square): $$ =A\frac{\omega}{(s+\alpha)^2 + (\omega)^2 }= 24\frac{1}{(s + 1)^2 + (1)^2}$$ $$V_2(t)= 24e^{-t}sin(t)$$

If there had been more $s$ terms, we may have needed partial fraction expansion.

#### 5. Considering Circuits $A$ and $C$ Above

##### A.

Substituting $s=j\omega$ into the transfer function $T(s)$. Express the magnitude and phase angle.

###### Circuit $A$

$$H(s) = \frac{1}{5\times10^{-4}s + 1}$$ $$H(j\omega) = \frac{1}{1+ j5\times10^{-4}\omega}$$

**Magnitude** Goal: Get $H(j\omega)$ into a separable form, take magnitude with pythagorean. $$H(\omega) = \frac{1-j0.0005\omega}{(1+j0.0005\omega)(1-j0.0005\omega)} = \frac{1-j0.0005\omega}{1 - j^2(0.0005\omega)^2 }$$ $$=\frac{1-j0.0005\omega}{1+ 2.5\times10^{-7}\omega^2} = \left(\frac{1}{1+2.5\times10^{-7}\omega^2}\right) + j\left(\frac{5\times10^{-4}}{1+2.5\times10^{-7}\omega^2}\right)$$ $$|H(\omega)| = \sqrt{\left(\frac{1}{1+2.5\times10^{-7}\omega^2}\right)^2 + \left(\frac{5\times10^{-4}}{1+2.5\times10^{-7}\omega^2}\right)^2}$$

```tikz
\usepackage{pgfplots}

\begin{document}
	\begin{tikzpicture}
		\begin{axis}[
	    width=14cm,
	    height=10cm,
	    xlabel={Frequency ($\omega$)},
	    ylabel={$|H(j\omega)|$},
	    xmode=log,
	    ymode=linear,
	    grid=both,
	    grid style={opacity=0.3},
	    legend pos=north east,
	    legend style={
		    font=\small,
			inner sep=8pt
		},
	    xmin=1, xmax=10000000,
	    ymin=-0.1, ymax=1.1,
	    domain=1:10000000,
	    samples=200,
		]
		\addplot[blue, very thick]{
		sqrt( ( 1 / (1 + 0.00000025*x^2) )^2 + ( (-0.0005*x) / (1 + 0.00000025*x^2) )^2
		};
		\addlegendentry{$|T(j\omega)|$ Using the above}
		\addplot[yellow, dashed, thin]{
		1/sqrt(1+0.00000025*x^2)
		};
		\addlegendentry{$|T(j\omega)| = \frac{1}{\sqrt{1+2.5e-7\omega^2}}$}
		
		\end{axis}
	\end{tikzpicture}
\end{document}
```

Or more simply we can use: $$\left|\frac{A}{B}\right| = \frac{|A|}{|B|}$$ $$|H(\omega)| = \frac{|1|}{|0.0005j\omega + 1|} = \frac{1}{\sqrt{(0.0005\omega)^2 + 1^2}} = \frac{1}{\sqrt{1+2.5\times10^{-7}\omega^2}}$$ Much better!

**Phase** From the separated version, we could then: $$\phi(\omega) = arctan\left(\frac{\frac{5\times10^{-4}}{1+2.5\times10^{-7}\omega^2}}{\frac{1}{1+2.5\times10^{-7}\omega^2}}\right)$$ For phase, we can use a similar trick Given a transfer function $$H=\frac{A}{B}$$ $$\phi(\omega) = \angle A - \angle B$$ For $H(\omega) = \frac{1}{5\times10^{-4}j\omega + 1}$ $$A = 1 + j0^\circ\to\angle A = 0$$ $$B = 1+j0.0005\omega\to\angle B = \arctan\left(\frac{0.0005\omega}{1}\right)$$ $$\phi(\omega) = -\arctan(0.0005\omega)$$

```tikz
\usepackage{pgfplots}

\begin{document}
	\begin{tikzpicture}
		\begin{axis}[
	    width=14cm,
	    height=10cm,
	    xlabel={Frequency ($\omega$)},
	    ylabel={Phase Angle ($^\circ$) $\phi(\omega)$},
	    xmode=log,
	    ymode=linear,
	    grid=both,
	    grid style={opacity=0.3},
	    legend pos=north east,
	    legend style={
		    font=\small,
			inner sep=8pt
		},
	    xmin=1, xmax=10000000,
	    ymin=-100, ymax=10,
	    domain=1:10000000,
	    samples=200,
		]
		\addplot[blue, very thick]{
		-atan( (0.0005*x / (1 + 0.00000025*x^2)) / (1 / (1 + 0.00000025*x^2)) )	
		};
		\addlegendentry{Phase $\phi(\omega)$ Using the separated transfer function}
		
		\addplot[yellow, dashed, thin]{
		-atan(0.0005*x)
		};
		\addlegendentry{Phase $\phi(\omega) = -\arctan(0.0005\omega)$}
		
		\end{axis}
	\end{tikzpicture}
\end{document}
```

###### Circuit $C$

**Magnitude** $$|H(\omega)| = \frac{|1|}{\sqrt{2^2+(2\omega)^2}} = \frac{1}{\sqrt{4 + 4\omega^2}}$$

```tikz
\usepackage{pgfplots}

\begin{document}
	\begin{tikzpicture}
		\begin{axis}[
	    width=14cm,
	    height=10cm,
	    xlabel={Frequency ($\omega$)},
	    ylabel={$|H(j\omega)|$},
	    xmode=log,
	    ymode=linear,
	    grid=both,
	    grid style={opacity=0.3},
	    legend pos=north east,
	    legend style={
		    font=\small,
			inner sep=8pt
		},
	    xmin=0.001, xmax=1000,
	    ymin=-0.1, ymax=0.6,
	    domain=0.001:1000,
	    samples=200,
		]
		\addplot[red, thick]{
		1/sqrt(4+(4*x^2))
		};
		\addlegendentry{$|T(j\omega)| = \frac{1}{\sqrt{4+4\omega^2}}$}
		
		\end{axis}
	\end{tikzpicture}
\end{document}
```

$$\phi(\omega)$$ **Phase**

$$\phi(\omega) = 0 - \arctan\left(\frac{2\omega}{2}\right) $$

```tikz
\usepackage{pgfplots}

\begin{document}
	\begin{tikzpicture}
		\begin{axis}[
	    width=14cm,
	    height=10cm,
	    xlabel={Frequency ($\omega$)},
	    ylabel={Phase Angle ($^\circ$), $\phi(\omega)$},
	    xmode=log,
	    ymode=linear,
	    grid=both,
	    grid style={opacity=0.3},
	    legend pos=north east,
	    legend style={
		    font=\small,
			inner sep=8pt
		},
	    xmin=0.001, xmax=10000000,
	    ymin=-100, ymax=10,
	    domain=0.001:10000000,
	    samples=200,
		]
		\addplot[red, very thick]{
		-atan(x)
		};
		\addlegendentry{Phase $\phi(\omega)$ Using $-\arctan(\omega)$}
		
		\end{axis}
	\end{tikzpicture}
\end{document}
```

##### B. Evaluate the Magnitude in $dB$ at:

$\omega = 0$ $\omega = |p|$ $\omega = 10|p|$

###### Circuit $A$

$$Pole = p = -2000\to |p| = 2000$$ $$20\log\left(\frac{1}{\sqrt{1+2.5\times10^{-7}(0)^2}}\right) = 20\log(1) = 0dB$$ $$20\log\left(\frac{1}{\sqrt{1+2.5\times10^{-7}(2000)^2}}\right) \approx 20\log(0.7071) \approx -3.010dB$$ $$20\log\left(\frac{1}{\sqrt{1+2.5\times10^{-7}(20000)^2}}\right) \approx 20\log(0.0995) \approx -20.043dB$$

```tikz
\usepackage{pgfplots}

\begin{document}
	\begin{tikzpicture}
		\begin{axis}[
	    width=14cm,
	    height=10cm,
	    xlabel={Frequency ($\omega$)},
	    ylabel={$|H(j\omega)|$ ($dB$)},
	    xmode=log,
	    ymode=linear,
	    grid=both,
	    grid style={opacity=0.3},
	    legend pos=south west,
	    legend style={
		    font=\small,
			inner sep=8pt
		},
	    xmin=100, xmax=100000,
	    ymin=-40, ymax=0,
	    domain=100:100000,
	    samples=200,
		]
		
		\addplot[blue, thick]{
		20* (ln(1/sqrt(1+0.00000025*x^2))/ln(10))
		};
		%\addlegendentry{$20\log|T(j\omega)| = 20\log\left(\frac{1}{\sqrt{1+2.5e-7\omega^2}}\right)$}
		
	% --- Vertical Lines at specific frequencies ---

    % Line at "DC" (using your xmin 0.001)
    \draw[dashed, black, thick] (axis cs:100, -40) -- (axis cs:100, 0) 
        node[pos=0.1, anchor=west, font=\small] {$\omega \approx 0$};

    % Line at omega = 1 (Corner Frequency)
    \draw[dashed, black, thick] (axis cs:2000, -40) -- (axis cs:2000, 0)
        node[pos=0.1, anchor=west, font=\small, color=black] {$\omega = |p|$};

    % Line at omega = 10
    \draw[dashed, gray, thick] (axis cs:20000, -40) -- (axis cs:20000, 0)
        node[pos=0.1, anchor=west, font=\small, color=gray] {$\omega = 10|p|$};	
		\end{axis}
	\end{tikzpicture}
\end{document}
```

###### Circuit $C$

$$Pole = p = -1\to |p| = 1$$ $$20\log\left(\frac{1}{\sqrt{4 + 4(0)^2}}\right) = 20\log\left(\frac{1}{\sqrt{4}}\right) = 20\log(0.5) \approx -6.02dB$$ $$20\log\left(\frac{1}{\sqrt{4 + 4(1)^2}}\right) = 20\log\left(\frac{1}{\sqrt{4 + 4}}\right) \approx 20\log(0.3536) \approx -9.03dB$$ $$20\log\left(\frac{1}{\sqrt{4 + 4(10)^2}}\right) = 20\log\left(\frac{1}{\sqrt{4 +400}}\right) \approx 20\log(0.04975) \approx -26.07dB$$

```tikz
\usepackage{pgfplots}

\begin{document}
	\begin{tikzpicture}
		\begin{axis}[
	    width=14cm,
	    height=10cm,
	    xlabel={Frequency ($\omega$)},
	    ylabel={$|H(j\omega)|$ ($dB$)},
	    xmode=log,
	    ymode=linear,
	    grid=both,
	    grid style={opacity=0.3},
	    legend pos=south west,
	    legend style={
		    font=\small,
			inner sep=8pt
		},
	    xmin=0.001, xmax=1000,
	    ymin=-70, ymax=0,
	    domain=0.001:1000,
	    samples=200,
		]
		\addplot[red, thick]{
		20*(ln(1/sqrt(4+4*x^2)) / ln(10))
		};
		%\addlegendentry{$20\log|T(j\omega)| = 20\log\left(\frac{1}{\sqrt{4+4\omega^2}}\right)$}
		
	% --- Vertical Lines at specific frequencies ---

    % Line at "DC" (using your xmin 0.001)
    \draw[dashed, black, thick] (axis cs:0.001, -70) -- (axis cs:0.001, 0) 
        node[pos=0.1, anchor=west, font=\small] {$\omega \approx 0$};

    % Line at omega = 1 (Corner Frequency)
    \draw[dashed, black, thick] (axis cs:1, -70) -- (axis cs:1, 0)
        node[pos=0.1, anchor=west, font=\small, color=black] {$\omega = |p|$};

    % Line at omega = 10
    \draw[dashed, gray, thick] (axis cs:10, -70) -- (axis cs:10, 0)
        node[pos=0.1, anchor=west, font=\small, color=gray] {$\omega = 10|p|$};	
		\end{axis}
	\end{tikzpicture}
\end{document}
```
