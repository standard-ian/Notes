## Homework 3
Consider the 2 circuits. 
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

	\draw(0,0)
	to[sV, l=$V_{in}$]++(0,2)
	to[capacitor, l=$C$]++(2,0)
	to[R, a=$R$, l=$V_{out}$]++(0,-2)--++(-2,0)++(1, -0.5)
	node[label=$Circuit\ A$]{};
	
	\draw(4,0)
	to[sV, l=$V_{in}$]++(0,2)
	to[R=$R$]++(2,0)
	to[capacitor, a=$C$, l=$V_{out}$]++(0,-2)--++(-2,0)++(1, -0.5)
	node[label=$Circuit\ B$]{};
	
\end{circuitikz}
\end{document}
```

The values of the components are:
$R = 10k\ohm$
$C = 0.01\micro F$

As you can see, it is the same circuit with different voltages being taken as the output.

Suppose the voltage source of $V_{in} = 40cos(\omega t)V$ drives both circuits.

We want to find the response of the circuit in terms of the ratio of amplitude of the output to the input, and the phase difference between them .

The input's phasor is $\tilde{V}_{in} = 40 e^{j0^\circ}$.

We want to find the output in these two circuits. Suppose the phasor at a particular frequency $f$ to be $\tilde{V}_{out}$. Then the ratio $\frac{\tilde{V}_{out}}{\tilde{V}_{in}}$ gives us the ratio of the output amplitude over the input amplitude and phase difference. The amplitude ratio and the phase difference at each frequency can be plotted as we sweep through the frequencies, which can be quite useful.

Consider the RC circuits $A$ and $B$ with a range of frequencies $100Hz < f < 100kHz$

 $Z_R = R = 10k\ohm$
 $Z_C = \frac{1}{j\omega C} = \frac{1}{j\omega 10^{-8}}$
 
 Circuit A
 $$\tilde{V}_{out} = \tilde{V}_{in}\frac{Z_R}{Z_R + Z_C}$$
$$\frac{\tilde{V}_{out}}{\tilde{V}_{in}} = \frac{Z_R}{Z_R + Z_C} = \frac{R}{R + \frac{1}{j\omega C}} = \frac{j\omega C R}{1 + j\omega C R} = \frac{j\omega C R(1- j\omega CR)}{(1+ j\omega C R)(1- j\omega CR)} = \frac{j\omega CR - (j\omega CR)^2}{1 -(j\omega CR)^2 }$$
 $$= \frac{j\omega RC - j^2(\omega R C)^2}{1 - j^2(\omega R C)^2} = \frac{j\omega RC - (-1(\omega RC)^2)}{1 - (-(\omega RC)^2)} = \frac{j\omega RC + (\omega RC)^2}{ 1 + (\omega RC)^2}$$
 Circuit B
$$\tilde{V}_{out} = V _{in}\frac{Z_C}{Z_R + Z_C}$$
$$\frac{\tilde{V}_{out}}{\tilde{V}_{in}} = \frac{Z_C}{Z_R + Z_C} = \frac{\frac{1}{j\omega C}}{\frac{1}{j\omega C} + R} =\frac{(j\omega C)\frac{1}{j\omega C}}{(j\omega C)\frac{1}{j\omega C} + R}  = \frac{1}{1 + j\omega RC} =$$
$$=\frac{1(1 - j\omega RC)}{(1 + j\omega RC)(1 - j\omega RC)} = \frac{1- j\omega RC}{1 + (\omega RC)^2}$$

1. Find the amplitude ratio and the phase difference at these particular frequencies.
	1. $100Hz$
		1. Circuit A:
			1. $\frac{\tilde{V}_{out}}{\tilde{V}_{in}} = \frac{(j200\pi \cdot 10000 \cdot 10^{-8}) + (200\pi \cdot 10000 \cdot 10^{-8})^2}{1 + (200\pi \cdot 10000 \cdot 10^{-8})^2} = \frac{0.003948}{1.003948}  + \frac{j0.0628}{1.003948} = 0.00393 + j0.0626$
			2. $|H| = |\frac{\tilde{V}_{out}}{\tilde{V}_{in}}| = \sqrt{(0.00393)^2+(0.0626)^2} = 0.0627$
			3. $\angle H  =\arctan(\frac{0.0626}{0.00383}) = 86.4^\circ$ 
		2. Circuit B:
			1. $\frac{\tilde{V}_{out}}{\tilde{V}_{in}} = \frac{1- (j200\pi \cdot 10000 \cdot 10^{-8})}{1 + (200\pi \cdot 10000 \cdot 10^{-8})^2} = \frac{1}{1.003948} + \frac{-j0.0628}{1.003948} = 0.9961 -j0.0626$
			2. $|H| = |\frac{\tilde{V}_{out}}{\tilde{V}_{in}}| = \sqrt{(0.9961)^2+(-0.0626)^2} = 0.998$
			3. $\angle H  =\arctan(\frac{-0.0626}{0.9961}) = -3.60^\circ$ 

2. $25\text{kHz}$
		1. Circuit A:
			1. $\frac{\tilde{V}_{out}}{\tilde{V}_{in}} = \frac{(j \cdot 2\pi \cdot 25000 \cdot 10000 \cdot 10^{-8}) + (2\pi \cdot 25000 \cdot 10000 \cdot 10^{-8})^2}{1 + (2\pi \cdot 25000 \cdot 10000 \cdot 10^{-8})^2} = \frac{246.740}{247.740}  + \frac{j15.708}{247.740} = 0.9960 + j0.0634$
			2. $|H| = |\frac{\tilde{V}_{out}}{\tilde{V}_{in}}| = \sqrt{(0.9960)^2+(0.0634)^2} = 0.9980$
			3. $\angle H  =\arctan(\frac{0.0634}{0.9960}) = 3.64^\circ$ 
		2. Circuit B:
			1. $\frac{\tilde{V}_{out}}{\tilde{V}_{in}} = \frac{1- (j \cdot 2\pi \cdot 25000 \cdot 10000 \cdot 10^{-8})}{1 + (2\pi \cdot 25000 \cdot 10000 \cdot 10^{-8})^2} = \frac{1}{247.740} + \frac{-j15.708}{247.740} = 0.00404 -j0.0634$
			2. $|H| = |\frac{\tilde{V}_{out}}{\tilde{V}_{in}}| = \sqrt{(0.00404)^2+(-0.0634)^2} = 0.0635$
			3. $\angle H  =\arctan(\frac{-0.0634}{0.00404}) = -86.36^\circ$

3. $50\text{kHz}$
	2. Circuit A:
		1. $\frac{\tilde{V}_{out}}{\tilde{V}_{in}} = \frac{(j \cdot 2\pi \cdot 50000 \cdot 10000 \cdot 10^{-8}) + (2\pi \cdot 50000 \cdot 10000 \cdot 10^{-8})^2}{1 + (2\pi \cdot 50000 \cdot 10000 \cdot 10^{-8})^2} = \frac{986.960}{987.960}  + \frac{j31.416}{987.960} = 0.9990 + j0.0318$
		2. $|H| = |\frac{\tilde{V}_{out}}{\tilde{V}_{in}}| = \sqrt{(0.9990)^2+(0.0318)^2} = 0.9995$
		3. $\angle H  =\arctan(\frac{0.0318}{0.9990}) = 1.82^\circ$ 
	3. Circuit B:
		1. $\frac{\tilde{V}_{out}}{\tilde{V}_{in}} = \frac{1- (j \cdot 2\pi \cdot 50000 \cdot 10000 \cdot 10^{-8})}{1 + (2\pi \cdot 50000 \cdot 10000 \cdot 10^{-8})^2} = \frac{1}{987.960} + \frac{-j31.416}{987.960} = 0.00101 -j0.0318$
		2. $|H| = |\frac{\tilde{V}_{out}}{\tilde{V}_{in}}| = \sqrt{(0.00101)^2+(-0.0318)^2} = 0.0318$
		3. $\angle H  =\arctan(\frac{-0.0318}{0.00101}) = -88.18^\circ$

4. $75\text{kHz}$
	2. Circuit A:
		1. $\frac{\tilde{V}_{out}}{\tilde{V}_{in}} = \frac{(j \cdot 2\pi \cdot 75000 \cdot 10000 \cdot 10^{-8}) + (2\pi \cdot 75000 \cdot 10000 \cdot 10^{-8})^2}{1 + (2\pi \cdot 75000 \cdot 10000 \cdot 10^{-8})^2} = \frac{2220.66}{2221.66}  + \frac{j47.124}{2221.66} = 0.9996 + j0.0212$
		2. $|H| = |\frac{\tilde{V}_{out}}{\tilde{V}_{in}}| = \sqrt{(0.9996)^2+(0.0212)^2} = 0.9998$
		3. $\angle H  =\arctan(\frac{0.0212}{0.9996}) = 1.22^\circ$ 
	3. Circuit B:
		1. $\frac{\tilde{V}_{out}}{\tilde{V}_{in}} = \frac{1- (j \cdot 2\pi \cdot 75000 \cdot 10000 \cdot 10^{-8})}{1 + (2\pi \cdot 75000 \cdot 10000 \cdot 10^{-8})^2} = \frac{1}{2221.66} + \frac{-j47.124}{2221.66} = 0.000450 -j0.0212$
		2. $|H| = |\frac{\tilde{V}_{out}}{\tilde{V}_{in}}| = \sqrt{(0.000450)^2+(-0.0212)^2} = 0.0212$
		3. $\angle H  =\arctan(\frac{-0.0212}{0.000450}) = -88.78^\circ$

5. $100\text{kHz}$
	2. Circuit A:
		1. $\frac{\tilde{V}_{out}}{\tilde{V}_{in}} = \frac{(j \cdot 2\pi \cdot 100000 \cdot 10000 \cdot 10^{-8}) + (2\pi \cdot 100000 \cdot 10000 \cdot 10^{-8})^2}{1 + (2\pi \cdot 100000 \cdot 10000 \cdot 10^{-8})^2} = \frac{3947.84}{3948.84}  + \frac{j62.832}{3948.84} = 0.9997 + j0.0159$
		2. $|H| = |\frac{\tilde{V}_{out}}{\tilde{V}_{in}}| = \sqrt{(0.9997)^2+(0.0159)^2} = 0.9999$
		3. $\angle H  =\arctan(\frac{0.0159}{0.9997}) = 0.91^\circ$ 
	3. Circuit B:
		1. $\frac{\tilde{V}_{out}}{\tilde{V}_{in}} = \frac{1- (j \cdot 2\pi \cdot 100000 \cdot 10000 \cdot 10^{-8})}{1 + (2\pi \cdot 100000 \cdot 10000 \cdot 10^{-8})^2} = \frac{1}{3948.84} + \frac{-j62.832}{3948.84} = 0.000253 -j0.0159$
		2. $|H| = |\frac{\tilde{V}_{out}}{\tilde{V}_{in}}| = \sqrt{(0.000253)^2+(-0.0159)^2} = 0.0159$
		3. $\angle H  =\arctan(\frac{-0.0159}{0.000253}) = -89.09^\circ$

6. Estimate the frequency at which $\frac{\tilde{V}_{out}}{\tilde{V}_{in}}$ is $\frac{1}{\sqrt{2}}$
	1. This should occur around $1.5kHz$
	
7. Plots
$$\frac{1}{\sqrt{2}} = 0.707 = |H|$$
```tikz
\usepackage{pgfplots}

\begin{document}
\begin{tikzpicture}
\begin{axis}[
    width=14cm,
    height=10cm,
    title={Phase Response: RC Circuits},
    xlabel={Frequency (Hz)},
    ylabel={Phase (degrees)},
    xmode=log,
    ymode=linear,
    grid=both,
    legend pos=north east,
    legend style={font=\small},
    xmin=1, xmax=100000,
    ymin=-95, ymax=95,
    domain=1:100000,
    samples=200,
]

\addplot[blue, thick] {atan(1/(2*pi*x*0.0001))};
\addlegendentry{Circuit A: High-pass}

\addplot[red, thick] {-atan(2*pi*x*0.0001)};
\addlegendentry{Circuit B: Low-pass}

\draw[black, dashed] (axis cs:1592,-95) -- (axis cs:1592,95);
\node[anchor=south, rotate=90] at (axis cs:1592,0) {$f_c = 1592$ Hz};

\end{axis}
\end{tikzpicture}
\end{document}
```



```tikz
\usepackage{pgfplots}
\begin{document}

\begin{tikzpicture}
\begin{axis}[
    width=14cm,
    height=10cm,
    title={Magnitude Response: RC Circuits},
    xlabel={Frequency (Hz)},
    ylabel={Magnitude $|H|$},
    xmode=log,
    ymode=linear,
    grid=both,
    legend pos=north west,
    legend style={font=\small},
    xmin=1, xmax=100000,
    ymin=0, ymax=1.2,
    domain=1:100000,
    samples=200,
]

\addplot[blue, thick] {(2*pi*x*0.0001) / sqrt(1 + (2*pi*x*0.0001)^2)};
\addlegendentry{Circuit A: High-pass}

\addplot[red, thick] {1 / sqrt(1 + (2*pi*x*0.0001)^2)};
\addlegendentry{Circuit B: Low-pass}

\addplot[black, dashed, domain=1:100000] {0.707};
\addlegendentry{cutoff}

\draw[black, dashed] (axis cs:1592,0) -- (axis cs:1592,1.1);
\node[anchor=south] at (axis cs:1592,1.05) {$f_c = 1592$ Hz};

\end{axis}
\end{tikzpicture}
\end{document}
```
