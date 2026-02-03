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
**The experimental peak frequency ($f_0$) was:** 
**The experimental phase angle at $f_0$ was:**
This compares well with the predicted frequency of $15.92kHz$ and phase angle of $0^\circ$

#### Part 2
##### Data Table

| Frequency ($Hz$) | $V_{in}$ ($V_{PP}$) | $V_{out}$    | $\Delta t$ ($\micro s$) | Gain                     | Gain $dB$                     | Phase $^\circ$ |
| ---------------- | ------------------- | ------------ | ----------------------- | ------------------------ | ----------------------------- | -------------- |
|                  |                     |              |                         | $\frac{V_{out}}{V_{in}}$ | $20log\frac{V_{out}}{V_{in}}$ | $360f\Delta t$ |
| **LOW**          | **----**            | **----**<br> | **----**                | **----**                 | **----**                      | **----**       |
| $100Hz$          |                     |              |                         |                          |                               |                |
| $1kHz$           |                     |              |                         |                          |                               |                |
| $3kHz$           |                     |              |                         |                          |                               |                |
| $4kHz$           |                     |              |                         |                          |                               |                |
| $10kHz$          |                     |              |                         |                          |                               |                |
| **MID**          | **----**            | **----**<br> | **----**                | **----**                 | **----**                      | **----**       |
| $13kHz$          |                     |              |                         |                          |                               |                |
| $14.5kHz$        |                     |              |                         |                          |                               |                |
| **PEAK**         | **----**            | **----**<br> | **----**                | **----**                 | **----**                      | **----**       |
| $15.6kHz$        |                     |              |                         |                          |                               |                |
| $15.9kHz$        |                     |              |                         |                          |                               |                |
| $16.2kHz$        |                     |              |                         |                          |                               |                |
| **POST-PEAK**    | **----**            | **----**<br> | **----**                | **----**                 | **----**                      | **----**       |
| $20kHz$          |                     |              |                         |                          |                               |                |
| $50kHz$          |                     |              |                         |                          |                               |                |
| $75kHz$          |                     |              |                         |                          |                               |                |
| $100kHz$         |                     |              |                         |                          |                               |                |

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
	(100,    89.77)
	(1000,   89.77)
	(3000,   85.00)
	(4000,   82.00)
	(7000,   78.00)
	(10000,  73.24)
	(13000,  56.31)
	(14500,  39.81)
	(15600,  13.50)
	(15900,  4.18)
	(16200,  -4.18)
	(20000,  -39.81)
	(50000,  -73.24)
	(75000,  -78.69)
	(100000, -81.82)
};
\addlegendentry{Experimental Phase Curve}


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
    legend style={font=\tiny, row sep=3mm},
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
\addlegendentry{Theoretical Gain Curve:$\frac{\omega L}{\sqrt{R^2(1 - \omega^2 LC)^2 {+} (\omega L)^2}}$}

\addplot[purple, thick] coordinates{
	% expected
	(100,    0.0004)
	(1000,   0.0039)
	(3000,   0.0060)
	(4000,   0.0135)
	(7000,   0.1200)
	(10000,  0.2847)
	(13000,  0.5668)
	(14500,  0.7698)
	(15600,  0.9370)
	(15900,  0.9927)
	(16200,  0.9927)
	(20000,  0.7311)
	(50000,  0.2847)
	(75000,  0.1905)
	(100000, 0.1433)	
};
\addlegendentry{Experimental Gain Curve}


\addplot[black, dashed, domain=1:100000] {0.707};

\draw[black, dashed] (axis cs:15915,0) -- (axis cs:15915,1.1);
\node[anchor=south, right] at (axis cs:15915,1.05) {$f_c = 15.92$ kHz};

\end{axis}
\end{tikzpicture}
\end{document}
```

---
### Conclusions
