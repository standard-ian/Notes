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

