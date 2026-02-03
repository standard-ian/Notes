## Class 9
Use impedances and phasors to analyze RLC circuits at steady state.

Frequency responses of RLC circuits.

Filters: What passes and what's attenuated?

Given the ration of the RC circuit from the 3rd homework:
$$\frac{\tilde{V}_{out}}{\tilde{V}_{in}} = \frac{Z_C}{R + Z_C} = \frac{\frac{1}{j\omega C}}{R + \frac{1}{j\omega C}}$$
As capacitance and frequency increase, the gain above gets smaller and smaller.

The smaller capacitance and frequency get, larger $Z_C$ gets. Once $Z_C$ is significantly large, the gain approaches 1.

When frequency is small and/or capacitance is small, the filter will pass the frequency out.

When frequency increases, the ration becomes close to 0, attenuating the frequency.

#### IW 9.1
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[label=left:$\tilde{V}_{in}$]{}
	to[R=$R$]++(2,0)
	to[inductor, l=$L$]++(0,-2)
	node[ground, scale=2]{}++(0,2)--++(1,0)
	node[label=right:$\tilde{V}_{out}$]{};
\end{circuitikz}
\end{document}
```

Find $\frac{|\tilde{V}_o|}{|\tilde{V}_i|}$ as a function of $\omega$ and $\angle \frac{\tilde{V}_o}{\tilde{V}_i}$

$$\frac{|\tilde{V}_o|}{|\tilde{V}_i|} = \frac{Z_L}{R + Z_L} = \frac{j\omega L}{R + j\omega L}$$
$$=\frac{j\omega L}{R(\frac{j\omega L}{j\omega L}) + j\omega L} = \frac{1}{\frac{R}{j\omega L} + 1} = \frac{1}{1 - j\frac{R}{\omega L}} = \frac{1(1 + j\frac{R}{\omega L})}{1 - j\frac{R}{\omega L}(1 + j\frac{R}{\omega L})}$$
$$= \frac{1 + j\frac{R}{\omega L}}{1 - (j\frac{R}{\omega L})^2} =  \frac{1 + j\frac{R}{\omega L}}{1 - j^2(\frac{R}{\omega L})^2} = \frac{1 + j\frac{R}{\omega L}}{1 +(\frac{R}{\omega L})^2}$$
$$H = \left| \frac{1 + j\frac{R}{\omega L}}{1 +(\frac{R}{\omega L})^2}\right| =\frac{1}{\sqrt{1 + (\frac{R}{\omega L})^2}}$$

As frequency increases, the phase angle approaches $0^\circ$ from $90^\circ$
The gain approaches 1 from 0.

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
\addplot[red, thick, domain=1:1e6, samples=200] {90 - atan(x*2*pi*50/(2*pi*1000))};
\addlegendentry{High-pass}

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
\addplot[blue, thick, domain=1:1e6, samples=200] {(x*2*pi*50) / sqrt((2*pi*1000)^2 + (x*2*pi*50)^2)};
\addlegendentry{High Pass}

\end{axis}
\end{tikzpicture}
\end{document}
```
#### Lab 3 Background
With the RLC circuit in the lab, a peak around $15.13kHz$ will be formed as frequency increases. 

At the half power point, the distance between half power points will give **Bandwidth**

$\frac{1}{\sqrt{2}}$ is the gain of the Half Power Point.


## Class 10
