## Lab 2
#### Introduction
###### Objective
Learning that diode circuits can convert AC voltage source into DC.
###### Materials
1. 1N4148 Diode
2. 1k$\ohm$ resistor
3. $10, 47, 100, 470, 1000\micro F$ Capacitors
4. FAB60-01 Benches
5. Breadboard and Wires
#### Procedure 
##### Circuit 1
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[sV, l=$V_{ac}$]++(0,2)
	to[diode]++(2,0)--++(1,0)
	node[ocirc, label=right:$v_{out}$]{}--++(-1,0)
	to[R=$1k\Omega$]++(0,-2)--++(-2,0)++(2,0)
	node[ground]{};
\end{circuitikz}
\end{document}
```
1. Make the circuit.
2. Set the voltage source input as AC source with 10V peak-to-peak at $60Hz$. Set the output as the voltage across the resistor.
3. Observe the waveform of the voltage across the $1k\ohm$ resistor.
4. Find the forward voltage drop of the diode and find the peak current through the diode.
5. Explain what is going on in the circuit.
6. Use your reasoning to predict what you expect to see as the output waveform if the voltage source $V_{in}$ is doubled to $20V$ peak-to-peak at $60Hz$.
7. Check your prediction by changing the input and resulting output.
##### Circuit 2
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[sV, l = $V_{ac}$]++(0,2)
	to[diode]++(2,0)--++(1,0)
	to[capacitor, l=$C$]++(0,-2)--++(-1,0)++(1,2)--++(1,0)
	node[ocirc, label=right:$v_{out}$]{}--++(-2,0)
	to[R=$1k\Omega$]++(0,-2)--++(-2,0)++(2,0)
	node[ground]{};
\end{circuitikz}
\end{document}
```
1. Capacitor in parallel with the resistor. Voltage input is $V_{ac}$ with $20V_{pp}$ at $60Hz$. 
2. Make circuit with cap of $470\micro F$.
3. Observe the waveform of the voltage across the $1k\ohm$  resistor.
4. Expect to see "ripples" at the output voltage waveform. Measure and record the min and max of the ripples.
5. Identify and record the time it takes from $v_{max}$ to $v_{min}$. Compare the time with the time constant of the $RC$ circuit.
6. Explain what is going on in the circuit.
7. Replace the capacitor with a $100\micro F$. Observe and record the output waveform.
8. Repeat this with two more caps $10 \micro F$ and $1000 \micro F$.
9. Predict what you expect to see if the cap is $47\micro F$. Check prediction with the circuit.
10. Insert a $1\ohm$ resistor between the diode and the 1k. Measure the current. Is that reasonable?
#### Results

##### Circuit 1
##### Circuit 2
```tikz
\usepackage{pgfplots}

\begin{document}
\begin{tikzpicture}[scale=1.5]
\begin{axis}[
    width=14cm,
    height=7cm,
    xlabel={Time (ms)},
    ylabel={Voltage (V)},
    domain=100:150,
    samples=200,
    grid=major,
    ymin=0, ymax=12,
    legend pos=south east
]

\def\Vpeak{10}
\def\Vdiode{0.7}
\def\Vout{9.3} % Vpeak - Vdiode
\def\T{16.67} % Period in ms for 60Hz

% For capacitor with RC >> T: V(t) ≈ Vout * exp(-t/RC)
% Ripple = Vout * T/RC

% C = 1000µF, R = 100Ω, RC = 100ms
\addplot[blue, thick, domain=0:50, samples=500] {
    \Vout * exp(-mod(x, \T)/100)
};
\addlegendentry{C=1000µF, $V_{ripple}$=1.55V}

% C = 470µF, R = 100Ω, RC = 47ms  
\addplot[red, thick, domain=0:50, samples=500] {
    \Vout * exp(-mod(x, \T)/47)
};
\addlegendentry{C=470µF, $V_{ripple}$=3.3V}

% C = 100µF, R = 100Ω, RC = 10ms
\addplot[green!60!black, thick, domain=0:50, samples=500] {
    \Vout * exp(-mod(x, \T)/10)
};
\addlegendentry{C=100µF, $V_{ripple}$=5.9V}

\end{axis}
\end{tikzpicture}
\end{document}
```
#### Conclusion
