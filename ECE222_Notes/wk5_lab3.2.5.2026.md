## Lab 3

--- 
### Introduction
#### Objective
In this lab, the focus is the concepts of resonance and impedance through an LC circuit. The resonant frequency will be predicted/calculated for an RLC circuit, and verified with an oscilloscope.

The set up is a $10k\ohm$ resistor in series with a parallel inductor of $0.01H$ and a cap of $0.01\micro F$.

$V_{in} = 20V_{pp}$
The resonant frequency is $15.9kHz$

We will measure the input voltage and output voltage using the scope.

Once frequency at a time, the voltages will be measured, and the phase angle and gain.

Two plots will be created:
1. Gain (dB) vs. Frequency ($Hz$, log scale)
2. Phase (degrees) vs. Frequency ($Hz$, log scale)
#### Diagram of Circuit
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[scale=2, font=\Large]

	\draw(0,0)
	node[label=left:$V_{in}$]{}
	to[R=$10k\Omega$]++(3,0)--++(1,0)
	node[label=right:$V_{out}$]{}++(-1,0)--++(0,-1)--++(0.5,0)
	to[capacitor, l=$0.01\mu F$]++(0,-2)--++(-0.5,0)
	node[ground]{}--++(-0.5,0)++(0,2)--++(0.5,0)++(-0.5,0)
	to[inductor, a=$0.01H$]++(0,-2);
	
\end{circuitikz}
\end{document}

```

`
#### Materials
1. $10k\ohm$ Resistor
2. $0.01H$ Inductor
3. $0.01\micro F$ Capacitor
4. 60-01 Bench Equipment
#### Calculations
##### Impedance of Parallel Inductor and Capacitor
$$Z_{LC} = \frac{1}{\frac{1}{Z_C} + \frac{1}{Z_L}};\ Z_C = \frac{1}{j\omega C};\ Z_L = j\omega L$$
$$\frac{1}{Z_{LC}} = \frac{1}{j\omega L} + \frac{1}{\frac{1}{j\omega C}}  = \frac{1}{j\omega L}+j\omega C = \frac{1}{j\omega L} + j\omega C(\frac{j\omega L}{j\omega L})$$
$$=\frac{1 + j\omega C\times j\omega L}{j\omega L} = \frac{1 + j^2\omega^2LC}{j\omega L} = \frac{1-\omega^2LC}{j\omega L}$$
$$Z_{LC} = \frac{j\omega L}{1 - \omega^2 LC}$$
##### Resonance
When the denominator of the above impedance for the parallel portion (LC) approaches 0, $Z_{LC} \to \infty$. 

So, at resonance:
$$1 - \omega^2LC = 0\to\ \ 1 = \omega^2LC\to\ \ \omega = \sqrt{\frac{1}{LC}} = \frac{1}{\sqrt{LC}}$$
$$f_0 = \frac{1}{2\pi\sqrt{LC}}$$
For a $0.01\micro F$ capacitor and a $0.01H$ inductor:
$$f_0 = \frac{1}{2\pi\sqrt{1\times 10^{-10}}} = 15.915kHz$$
##### Transfer Function
$$H = \frac{Z_{LC}}{R + Z_{LC}}=\frac{\frac{j\omega L}{1 - \omega^2LC}}{R + \frac{j\omega L}{1 - \omega ^2 LC}}=\frac{\frac{j\omega L(1 - \omega^2LC)}{1 - \omega ^2LC}}{R(1 - \omega^2LC) + \frac{j\omega L(1 - \omega^2 LC)}{1-\omega^2LC}}$$
$$=\frac{j\omega L}{R(1-\omega^2LC) + j\omega L}$$
###### Multiply by Complex Conjugate
$$=\frac{j\omega L(R(1 - \omega^2LC)-j\omega L)}{(R(1-\omega^2LC) + j\omega L)(R(1-\omega^2LC) - j\omega L)} $$
###### Simplify
$$\frac{j\omega LR(1 -\omega^2LC)-(j\omega L)^2}{[R(1 -\omega^2LC)]^2-(j\omega L)^2} = \frac{j\omega LR(1 -\omega^2LC)+\omega^2 L^2}{[R(1 -\omega^2LC)]^2+(\omega L)^2}$$
$$H = \frac{\omega^2L^2}{R^2(1 - \omega^2LC)^2 + \omega^2L^2}\ (real) + \frac{\omega LR(1-\omega^2LC)}{R^2(1 - \omega^2LC)^2 + \omega^2L^2}\ (imaginary) $$
###### At Resonance
When $\omega^2 = \frac{1}{LC}$, $(1 - \omega^2LC) = 0$.
This makes the imaginary part 0.

The real part will be:
$$\frac{\frac{L^2}{LC}}{\frac{L^2}{LC}} = 1$$
So at resonance, the gain will be $\sqrt{1^2 + 0^2} = 1$ and $\tilde{V}_{out} = \tilde{V}_{in}$

###### Gain as a Function of $\omega$
The gain is the magnitude of the transfer function:
$$|H| = \sqrt{(real)^2 + (imaginary)^2}$$
$$|H| = \sqrt{\left[\frac{\omega^2L^2}{R^2(1 - \omega^2LC)^2 + \omega^2L^2}\right]^2 + \left[\frac{\omega LR(1-\omega^2LC)}{R^2(1 - \omega^2LC)^2 + \omega^2L^2}\right]^2}$$
$$|H| = \frac{\sqrt{[\omega^2L^2]^2 + [\omega LR(1-\omega^2LC)]^2}}{R^2(1 - \omega^2LC)^2 + \omega^2L^2}$$
$$[\omega^2L^2]^2 + [\omega LR(1-\omega^2LC)]^2 = \omega^4L^4 + \omega^2L^2R^2(1-\omega^2LC)^2$$
Factor out $\omega^2L^2$:
$$= \omega^2L^2[\omega^2L^2 + R^2(1-\omega^2LC)^2]$$
$$|H| = \frac{\sqrt{\omega^2L^2[\omega^2L^2 + R^2(1-\omega^2LC)^2]}}{R^2(1 - \omega^2LC)^2 + \omega^2L^2}$$
$$= \frac{\omega L\sqrt{\omega^2L^2 + R^2(1-\omega^2LC)^2}}{R^2(1 - \omega^2LC)^2 + \omega^2L^2}= \frac{\omega L}{\sqrt{R^2(1 - \omega^2LC)^2 + \omega^2L^2}}$$
###### Phase as a Function of $\omega$
The phase is the arctangent of imaginary part over real part:
$$\phi = \arctan\left(\frac{imaginary}{real}\right)= \arctan\left(\frac{\frac{\omega LR(1-\omega^2LC)}{R^2(1 - \omega^2LC)^2 + \omega^2L^2}}{\frac{\omega^2L^2}{R^2(1 - \omega^2LC)^2 + \omega^2L^2}}\right)
= \arctan\left(\frac{\omega LR(1-\omega^2LC)}{\omega^2L^2}\right)$$

Simplify by canceling $\omega L$:

$$\phi = \arctan\left(\frac{R(1-\omega^2LC)}{\omega L}\right)$$
This gives us $\phi$ in radians, multiply by $\frac{180}{\pi}$ for degrees.

---
### Procedure
#### Part 1
1. Find the resonant frequency. Sweep the input frequency until the channel you use as the output voltage reaches the max peak-to-peak.
2. Once the peak frequency is found, record the gain $\frac{V_{out}}{V_{in}}$ using the measure button.
3. Measure the phase between input and output. Alight cursor 1 with a 0-crossing for the $V_{in}$ signal and cursor 2 with a 0-crossing for $V_{out}$
#### Part 2
1. Sweep the frequencies in the table, recording $V_{in}$ at each $f$ because it may change due to the function generator's internal impedance. 
2. Record $V_{out}$ at each $f$.
3. Record the time shift between $V_{out}$ and $V_{in}$ for each $f$.
#### Notes
##### Half-Power Bandwidth
The bandwidth is the difference in $f$ between the two points on either side of the peak where the gain drops to $70.7\%$ ($-3dB$) of the peak ($resonance=f_r$)
##### Q Factor
May be defined as:
###### 1. 
$$Q= \frac{f_r}{BW}$$
###### 2. 
For a parallel LC circuit driven by resistance ($R$) in series with the source, the $Q$ can be calculated as:
$$Q = \omega_0RC = RC\frac{1}{\sqrt{LC}} = R\sqrt{\frac{C}{L}}$$
Where $\omega_0$ is the resonant frequency (in radians). Checking the unit of $Q$ with this definition, the unit is radians. The meaning being:

(Number of cycles required for energy to diminish to $e^{-1}$) $\times 2\pi$ 

For the R, L, and C of this circuit:
$$Q = 10000\sqrt{\frac{10^{-8}}{10^{-2}}} = 10000 \times 0.001 = 10$$
##### Scope Set Up
###### 1.
It is easy to estimate the phase shifts if the division is set such that the screen shows about 1.25 cycles.
###### 2. 
Oscilloscope and physical probe both set to $10x$. If the probe is at $1x$ the resonant frequency will be shifted downward.
###### 3. 
Connect all probes to a common ground. All black ground clips must go to the same node.

---
### Results
#### Part 1
##### $\frac{V_{out}}{V_{in}}$ at $f_0$
**The experimental peak frequency ($f_0$) was:** $14.7kHz$
**The experimental phase angle at $f_0$ was:** $400 \times 10^{-9} s$
This compares relatively well with the predicted frequency of $15.92kHz$ and phase angle of $0^\circ$. The true peak frequency is surprisingly $1kHz$ lower than expected.

#### Part 2
##### Data Table

| Frequency ($Hz$) | $V_{in}$ ($V_{PP}$) | $V_{out}$    | $\Delta t$ ($s$) | Gain                     | Gain $dB$                     | Phase $^\circ$ |
| ---------------- | ------------------- | ------------ | ---------------- | ------------------------ | ----------------------------- | -------------- |
|                  |                     |              |                  | $\frac{V_{out}}{V_{in}}$ | $20log\frac{V_{out}}{V_{in}}$ | $360f\Delta t$ |
| **LOW**          | **----**            | **----**<br> | **----**         | **----**                 | **----**                      | **----**       |
| $100Hz$          | 10.1                | 0.018        | 0.0025           | 0.00178                  | -54.98                        | 90             |
| $1kHz$           | 10.1                | 0.076        | 0.000231         | 0.00752                  | -42.47                        | 83.16          |
| $3kHz$           | 10.1                | 0.216        | 0.0000799        | 0.02139                  | -33.40                        | 86.292         |
| $4kHz$           | 10.1                | 0.296        | 0.0000645        | 0.02931                  | -30.66                        | 92.88          |
| $10kHz$          | 10.1                | 1.12         | 0.0000223        | 0.11089                  | -19.10                        | 80.28          |
| **MID**          | **----**            | **----**     | **----**         | **----**                 | **----**                      | **----**       |
| $13kHz$          | 10.1                | 2.88         | 0.0000141        | 0.28515                  | -10.90                        | 65.988         |
| $14.5kHz$        | 10.3                | 6.4          | 0.0000029        | 0.62136                  | -4.13                         | 15.138         |
| **PEAK**         | **----**            | **----**<br> | **----**         | **----**                 | **----**                      | **----**       |
| $15.6kHz$        | 10.3                | 5.6          | -0.0000052       | 0.54369                  | -5.29                         | -29.2032       |
| $15.9kHz$        | 10.3                | 5.2          | -0.0000065       | 0.50485                  | -5.94                         | -37.206        |
| $16.2kHz$        | 10.3                | 4.88         | -0.0000074       | 0.47379                  | -6.49                         | -43.1568       |
| **POST-PEAK**    | **----**            | **----**<br> | **----**         | **----**                 | **----**                      | **----**       |
| $20kHz$          | 10.1                | 2.16         | -0.0001056       | 0.21386                  | -13.40                        | -76.032        |
| $22kHz$          | 10.3                | 1.6          | -0.0000099       | 0.15534                  | -16.17                        | -78.408        |
| $25kHz$          | 10.1                | 1.18         | -0.00000907      | 0.11683                  | -18.65                        | -81.63         |
| $50kHz$          | 10.1                | 0.8          | -0.00000771      | 0.07921                  | -22.02                        | -83.268        |
| $75kHz$          | 10.3                | 0.4          | -0.00000477      | 0.03883                  | -28.22                        | -85.86         |
| $100kHz$         | 10.3                | 0.2          | -0.00000243      | 0.01942                  | -34.24                        | -87.48         |




---
### Plots

#### Phase Plot: Calculated and Experimental

```tikz
\usepackage{pgfplots}

\begin{document}
\begin{tikzpicture}[scale=1.5]
\begin{axis}[
    width=12cm,
    height=8cm,
    xlabel={Frequency (Hz)},
    ylabel={Phase ($^\circ$)},
    xmode=log,
    ymode=linear,
    grid=both,
    legend pos=south west,
    legend style={font=\small},
    xmin=100, xmax=100000,
    ymin=-95, ymax=95,
    domain=100:100000,
    samples=200,
]

\def\R{10000}
\def\L{0.01}
\def\C{1e-8}
\def\LC{1e-10}

\addplot[orange, thick] {
	atan(\R*(1-(2*pi*x)^2*\LC) / (2*pi*x*\L)) 
};
\addlegendentry{Theoretical Phase Curve: $arctan(\frac{R(1 -\omega^2LC)}{\omega L})$}

\addplot[purple, thick] coordinates {
	(100,    90)
	(1000,   83.16)
	(3000,   86.292)
	(4000,   92.88)
	(10000,  80.28)
	(13000,  65.988)
	(14500,  15.138)
	(15600,  -29.2032)
	(15900,  -37.206)
	(16200,  -43.1568)
	(20000,  -76.032)
	(22000,  -78.408)
	(25000,  -81.63)
	(30000,  -83.268)
	(50000,  -85.86)
	(100000, -87.48)
};
\addlegendentry{Experimental Phase Curve}

\addplot[green, thick] coordinates {
	(100,    90)
	(1000,   86.4)
	(3000,   75.816)
	(4000,   71.28)
	(10000,  32.688)
	(13000,  9.407)
	(14500,  0.877)
	(15600,  -8.424)
	(15900,  -10.589)
	(16200,  -12.422)
	(20000,  -30.6)
	(22000,  -36.828)
	(25000,  -43.92)
	(30000,  -53.352)
	(50000,  -68.400)
	(100000, -78.12)
};
\addlegendentry{$1k\Omega$ Experimental Phase Curve}

\draw[black, dashed] (axis cs:15915,-95) -- (axis cs:15915,95);
\node[anchor=south, rotate=90] at (axis cs:15915,0) {$f_c = 15.52$ kHz};

\end{axis}
\end{tikzpicture}
\end{document}
```
#### Gain Plot: Calculated and Experimental

```tikz
\usepackage{pgfplots}
\begin{document}

\begin{tikzpicture}[scale=1.5]
\begin{axis}[
    width=12cm,
    height=8cm,
    xlabel={Frequency (Hz)},
    ylabel={Gain $|H|$},
    xmode=log,
    ymode=linear,
    grid=both,
    legend pos=north west,
    legend style={font=\footnotesize, row sep=3mm},
    xmin=100, xmax=100000,
    ymin=0, ymax=1.2,
    domain=100:100000,
    samples=200,
]
\def\R{10000}
\def\L{0.01}
\def\C{1e-8}
\def\LC{1e-10}

\addplot[orange, thick] {
    (2*pi*x*\L) / sqrt((\R)^2*(1-(2*pi*x)^2*\LC)^2 + (2*pi*x*\L)^2)
};
\addlegendentry{Theoretical Gain Curve:$\frac{\omega L}{\sqrt{R^1(1 - \omega^2 LC)^2 {+} (\omega L)^2}}$}

\addplot[purple, thick] coordinates{
	% expected
	(100,    0.00178)
	(1000,   0.00752)
	(3000,   0.02139)
	(4000,   0.02931)
	(10000,   0.11089)
	(13000,  0.28515)
	(14500,  0.62136)
	(15600,  0.54369)
	(15900,  0.50485)
	(16200,  0.47379)
	(20000,  0.21386)
	(22000,  0.15534)
	(25000,  0.11683)
	(30000,  0.07921)
	(50000,  0.03883)
	(100000, 0.01942)	
};
\addlegendentry{Experimental Gain Curve}

\addplot[green, thick] coordinates {
	(100,    0.010905)
	(1000,   0.076235)
	(3000,   0.224280)
	(4000,   0.304527)
	(10000,  0.776000)
	(13000,  0.910891)
	(14500,  0.926733)
	(15600,  0.918812)
	(15900,  0.910891)
	(16200,  0.910891)
	(20000,  0.808000)
	(22000,  0.744000)
	(25000,  0.669895)
	(30000,  0.562691)
	(50000,  0.334694)
	(100000, 0.161616)
};
\addlegendentry{$1k\Omega$ Experimental Gain Curve}

\addplot[black, dashed, domain=1:100000] {0.707};

\draw[black, dashed] (axis cs:15915,0) -- (axis cs:15915,1.1);
\node[anchor=south, right] at (axis cs:15915,1.05) {$f_c = 15.92$ kHz};

\end{axis}
\end{tikzpicture}
\end{document}
```

---
### Conclusions
1. The actual peak frequency at which resonance occurred was ~$1kHz$ sooner than expected, around  $14.7kHz$
2. The real peak gain we could reach with the circuit as described was only about 0.64.
3. Apart from this, the expected Gain and Phase plots follow the theoretical quite nicely.
4. Substituting a $1k\ohm$ resistor in for the $10k$ works to get the gain up to nearly 1, but it makes the gain curve a less extreme exponential curve as seen in the plots. The transitions are also more gradual in the phase plot.
5. At resonance, the impedance of the "LC" portion of the circuit approaches infinity, and the full $V_{in}$ is passed to $V_{out}$
6. There is a resistance of the inductor that causes this peak to drop, i.e the full $V_{in}$ is not passed through.