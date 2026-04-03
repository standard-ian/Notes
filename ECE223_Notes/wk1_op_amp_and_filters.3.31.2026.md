## Class 1
#### RC Circuits and Analog Filters
In this class, mostly RC circuits will be used to create filters. 

#### Filter Design Process
##### Specification
Description of the desired behavior, in terms of what frequencies to pass and what to attenuate.
*To pass signals that are of frequencies below 3k Hz with little or no attenuation and to attenuate signals if 10kHz to almost nothing*
##### Approximation
Create a transfer function that approximates the specification. $T(s)$ or $T(j\omega)$ 
$$T(s) = \frac{\omega_0^4}{(s^2 + 0.765\omega_0 + \omega^2_0)(s^2 + 1.847\omega_0s+ \omega_0^2)}$$
with $\omega_0 = 2\pi \cdot 3000$ 
##### Realization
Choosing a circuit that can realize the transfer function.
*A circuit of two cascaded stages with each being a second order, active (op-amp) RC circuit*
##### Analysis and Verification
Run simulations and experiments to verify the results using different frequencies and values.

##### Skills Involved
1. Frequency response
2. Frequency content
3. Reality of filter behavior (Bode plots)
4. Translating specification to approximation

#### Transfer Function
$$T(s) = \left|T(j\omega)\right|\angle T(j\omega) = Re[T(j\omega)] + Im[T(j\omega)]$$
We can plot the magnitude as $dB = 20log|T(j\omega)|$ and phase as $^\circ$ against frequency $\omega$ to create two plots.

#### Filter Types Magnitude Plots
##### Low Pass
```tikz
\usepackage{pgfplots}

\begin{document}
\begin{tikzpicture}
\begin{axis}[
  width=5.5cm, height=4.5cm,
  axis lines=left,
  xmin=0, xmax=3.2,
  ymin=-0.15, ymax=1.25,
  xtick={0}, ytick={0,1},
  yticklabels={$0$,$1$},
  xticklabels={$0$},
  xlabel={$\omega$},
  ylabel={$|T|$},
  ylabel style={rotate=-90, anchor=south},
  title={Ideal lowpass},
  clip=false, thick,
]
  \addplot[thick] coordinates {(0,1)(1.5,1)(1.5,0)(3,0)};
  \draw[<->] (axis cs:0.05,0.5) -- (axis cs:1.45,0.5)
             node[midway, above, font=\small] {Pass};
  \draw[<->] (axis cs:1.55,0.5) -- (axis cs:2.95,0.5)
             node[midway, above, font=\small] {Stop};
  \node[below] at (axis cs:1.5,0) {$\omega_0$};
\end{axis}
\end{tikzpicture}

\end{document}
```

##### High Pass
```tikz
\usepackage{pgfplots}

\begin{document}
\begin{tikzpicture}

\begin{axis}[
  width=5.5cm, height=4.5cm,
  axis lines=left,
  xmin=0, xmax=3.2,
  ymin=-0.15, ymax=1.25,
  xtick={0}, ytick={0,1},
  yticklabels={$0$,$1$},
  xticklabels={$0$},
  xlabel={$\omega$},
  ylabel={$|T|$},
  ylabel style={rotate=-90, anchor=south},
  title={Ideal highpass},
  clip=false, thick,
]
  \addplot[thick] coordinates {(0,0)(1.5,0)(1.5,1)(3,1)};
  \draw[<->] (axis cs:0.05,0.5) -- (axis cs:1.45,0.5)
             node[midway, above, font=\small] {Stop};
  \draw[<->] (axis cs:1.55,0.5) -- (axis cs:2.95,0.5)
             node[midway, above, font=\small] {Pass};
  \node[below] at (axis cs:1.5,0) {$\omega_0$};
\end{axis}

\end{tikzpicture}
\end{document}
```
##### Band Pass
```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
\begin{axis}[
  width=5.5cm, height=4.5cm,
  axis lines=left,
  xmin=0, xmax=3.2,
  ymin=-0.15, ymax=1.25,
  xtick={0}, ytick={0,1},
  yticklabels={$0$,$1$},
  xticklabels={$0$},
  xlabel={$\omega$},
  ylabel={$|T|$},
  ylabel style={rotate=-90, anchor=south},
  title={Ideal bandpass},
  clip=false, thick,
]
  \addplot[thick] coordinates {(0,0)(0.9,0)(0.9,1)(2.1,1)(2.1,0)(3,0)};
  \draw[<->] (axis cs:0.05,0.5) -- (axis cs:0.85,0.5)
             node[midway, above, font=\tiny] {Stop};
  \draw[<->] (axis cs:0.95,0.5) -- (axis cs:2.05,0.5)
             node[midway, above, font=\tiny] {Pass};
  \draw[<->] (axis cs:2.15,0.5) -- (axis cs:2.95,0.5)
             node[midway, above, font=\tiny] {Stop};
  \node[below] at (axis cs:0.9,0)  {$\omega_1$};
  \node[below] at (axis cs:2.1,0)  {$\omega_2$};
\end{axis}
\end{tikzpicture}
\end{document}

```
##### Band Stop
```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
\begin{axis}[
  width=5.5cm, height=4.5cm,
  axis lines=left,
  xmin=0, xmax=3.2,
  ymin=-0.15, ymax=1.25,
  xtick={0}, ytick={0,1},
  yticklabels={$0$,$1$},
  xticklabels={$0$},
  xlabel={$\omega$},
  ylabel={$|T|$},
  ylabel style={rotate=-90, anchor=south},
  title={Ideal bandstop},
  clip=false, thick,
]
  \addplot[thick] coordinates {(0,1)(0.9,1)(0.9,0)(2.1,0)(2.1,1)(3,1)};
  \draw[<->] (axis cs:0.05,0.5) -- (axis cs:0.85,0.5)
             node[midway, above, font=\tiny] {Pass};
  \draw[<->] (axis cs:0.95,0.5) -- (axis cs:2.05,0.5)
             node[midway, above, font=\tiny] {Stop};
  \draw[<->] (axis cs:2.15,0.5) -- (axis cs:2.95,0.5)
             node[midway, above, font=\tiny] {Pass};
  \node[below] at (axis cs:0.9,0)  {$\omega_1$};
  \node[below] at (axis cs:2.1,0)  {$\omega_2$};
\end{axis}
\end{tikzpicture}
\end{document}
```

## Class 2
#### Lab 2 and 3
- Recommend TL071 Op-Amp
- Need potentially 2 audio jacks
- Lab 2 will be preparing audio files and speaker configuration
- Lab 3 will be constructing the breadboard circuit to filter a frequency.

#### Transfer Functions and Frequency Response Review
```
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american]
	
\end{circuitikz}
\end{document}
```
##### IW 2.1
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, font=\Large, scale=2]
	\draw(0,0)
	to[vsource, l=$v_1$, invert]++(0,2)
	node[circ, label=above:$A$]{}
	to[R=$R$]++(2,0)
	to[short, i=$i_2{=}0$]++(1,0)
	node[circ, label=right:$B$]{}++(-1,0)
	to[capacitor, l=$C$]++(0,-2)--++(1,0)
	node[circ, label=right:$B'$]{}++(-1,0)
	--++(-2,0);

	\draw(4,1)	
	node[label=left:$v_2$]{};
	
\end{circuitikz}
\end{document}
```

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, font=\Large, scale=2]
	\draw(0,0)
	to[vsource, l=$V_1$, invert]++(0,2)
	node[circ, label=above:$A$]{}
	to[generic=$Z_1$, i>_=$I$]++(2,0)
	to[short]++(1,0)
	node[circ, label=right:$B$]{}++(-1,0)
	to[generic, l=$Z_2$]++(0,-2)--++(1,0)
	node[circ, label=right:$B'$]{}++(-1,0)
	--++(-2,0);

	\draw(4,1)	
	node[label=left:$V_2$]{};
	
\end{circuitikz}
\end{document}
```
$Z_1 = R$
$Z_2 = \frac{1}{sC} = \frac{1}{j\omega C}$

$V_1=I\times \left( R + \frac{1}{sC}\right)$
$V_2 = I\times \frac{1}{sC}$

$$T(s) = \frac{Z_2}{Z_1 + Z_2} = \frac{\frac{1}{sC}}{R + \frac{1}{sC}} = \frac{1}{sRC + 1} = \frac{\frac{1}{RC}}{s + \frac{1}{RC}}$$
$$T(j\omega) = \frac{\frac{1}{RC}}{j\omega + \frac{1}{RC}}$$
The frequency of a circuit is it's sinusoidal steady state response. 

Frequency is the transfer function evaluated on the $j\omega$ axis.

A transfer function $T(s)$ can be converted into $j\omega$ domain by substituting $j\omega$ for $s$

The frequency response of the RC circuit is given by $T(j\omega) = |T(j\omega)|\angle{T(j\omega)}$


Plotting $T(j\omega)$ in Bode coordinates is the **Bode Plot**.

$$dB = 20\log|T(j\omega)|$$
At $-3dB$:
$$|T(j\omega)| = \frac{1}{\sqrt{2}}$$
This is called the **Cutoff Frequency** ($\omega_0$).

Given the transfer function:
$$T(j\omega) = \frac{\frac{1}{RC}}{j\omega + \frac{1}{RC}}$$

For single stage $RC$ circuits, let $\omega_0 = \frac{1}{RC}$
$$T(j\omega) = \frac{\omega_0}{j\omega + \omega_0} = \frac{1}{j\left(\frac{\omega}{\omega_0}\right) + 1}$$
$$|T(j\omega)| = \frac{1}{\left|j\left(\frac{\omega}{\omega_0}\right) + 1\right|} = \frac{1}{\sqrt{1 + \left(\frac{\omega}{\omega_0}\right)^2}}$$
When:
$\frac{\omega}{\omega_0} = 1$, $|T| = \frac{1}{\sqrt{2}}$, this is the cutoff of $-3dB$
$\frac{\omega}{\omega_0} << 1$, 1 dominates, $|T|$ is effectively 1
$\frac{\omega}{\omega_0} >> 1$, $\frac{\omega}{\omega_0}$ dominates, $|T|$ is effectively 0

At a frequency of $\omega_0$, gain of $\approx 70\%$ $|T|$, 
##### IW 2.2
Finding the Phase of $T(j\omega)$
$$T(j\omega) = \frac{\omega_0}{j\omega + \omega_0}$$
$$\angle T(j\omega) = \arctan\left(\frac{0}{\omega_0}\right) - \arctan\left(\frac{\omega}{\omega_0}\right)$$
$$\angle T(j\omega) = -\arctan\left(\frac{\omega}{\omega_0}\right)$$

At $\frac{\omega}{\omega_0} = 1$ = Cutoff, $\angle T(j\omega) = 45^\circ$


##### IW 2.3
If $\omega =10rad/s$

```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
\begin{semilogxaxis}[
    title={RC Low-Pass $|T(j\omega)|$},
    xlabel={$\omega$ (rad/s)},
    ylabel={$|T|$ (dB)},
    xmin=0.1, xmax=1000,
    ymin=-60, ymax=5,
    grid=both,
    grid style={line width=0.2pt, draw=gray!30},
    major grid style={line width=0.4pt, draw=gray!60},
    width=10cm, height=7cm,
    samples=200,
]
\addplot[blue, thick, domain=0.1:1000] {-10*log10(1 + (x/10)^2)};
\addplot[gray, dashed, thick] coordinates {(10,-60) (10,5)};
\end{semilogxaxis}
\end{tikzpicture}
\end{document}
```
```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
\begin{semilogxaxis}[
    title={RC Low-Pass $\angle T(j\omega)$},
    xlabel={$\omega$ (rad/s)},
    ylabel={$\angle T$ (degrees)},
    xmin=0.1, xmax=1000,
    ymin=-100, ymax=10,
    grid=both,
    grid style={line width=0.2pt, draw=gray!30},
    major grid style={line width=0.4pt, draw=gray!60},
    width=10cm, height=7cm,
    samples=200,
]
\addplot[blue, thick, domain=0.1:1000] {-atan(x/10)};
\addplot[gray, dashed, thick] coordinates {(10,-100) (10,10)};
\addplot[gray, dashed, thick] coordinates {(0.1,-45) (1000,-45)};
\end{semilogxaxis}
\end{tikzpicture}
\end{document}
```
###### a. 
$$T(j\omega) = \frac{10}{j\omega + 10};\ T(s) = \frac{10}{s + 10}$$
###### b. 
There is a pole at $s=-10$ and a zero as $s\to\infty$

If $\omega = 10k$ 
$$T(s) = \frac{10k}{s + 10k}$$
For $\omega = 31.4$  and $|T| = 10^5$
I believe there must some amplifying component to increase the gain above 1. 

For purely static components $Z_1, Z_2$ the ratio of gain cannot be over 1, so for it to be $10^5$, some amplification must be occuring.
$$T(s) = \frac{3.14\times 10^6}{s + 31.4}$$

#### Operational Amplifiers

```tikz
\usepackage{circuitikz}
    \def\opamp(#1)#2{%Customized opamp
    \begin{scope}[shift={(#1)}]
    %Component Shape
    \draw[line join=round] (0,0)++(-1,1.5)
        --++(2.5,-1.5) -- ++(-2.5,-1.5)-- cycle; 
    % Label and component identifier.
    \draw(0,0) node{\sf #2}; % IC LABEL
    % Draw the pins
    \draw(-1,1) node [anchor=180]{$-$} -- ++(-0.5,0)  coordinate (#2 IN-); % IN - 
    \draw(-1,-1) node [anchor=180]{$+$}  -- ++(-0.5,0) coordinate (#2 IN+); % IN +
    \draw(1.5,0)  -- ++(0.5,0) coordinate (#2 OUT); % OUT
    % Power supply pins
    \draw(0.25,0.77) -- ++(0,0.5) coordinate (#2 VCC); % VCC
    \draw(0.25,-0.77) -- ++(0,-0.5) coordinate (#2 VEE); % VEE
    \end{scope}
    }
    
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	% invoke the opamp	
	\opamp(0,0){U1}
	
	\path(U1 IN+) node[left]{$V_{+}$ Non-Inverting};
	\path(U1 IN-) node[left]{$V_{-}$ Inverting};
	
	\path(U1 OUT) node[right]{$V_{out}$};
	
	\path(U1 VCC) node[above]{$V_{CC}$};
	\path(U1 VEE) node[below]{$V_{EE}$};

	
\end{circuitikz}
\end{document}
```

The behavior of the Op-Amp is dependent on the circuit around it.

Inside the op-amp, $V+$ and $V-$ are compared, and the result is multiplied by a constant, spiking $V_{out}$ positive or negative. 
$$(V_+ - V_- )\times(Amplifying\ Constant)$$
The spike is limited to the $V_{CC}$ and $V_{EE}$ rails, as well as some internal limit.