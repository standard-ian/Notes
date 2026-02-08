## Homework 4
1. The RLC Circuit is supplied by an AC voltage source
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[sV, l=$V_s$, invert]++(0,2)
	to[inductor, l=$0.1H$]++(2,0)
	to[R=$100\Omega$]++(0,-2)++(0,2)
	to[capacitor, l=$5\mu F$]++(2,0)
	to[inductor, l=$0.1H$]++(0,-2)--++(-4,0);
\end{circuitikz}
\end{document}
```

Suppose the SC source is $V_s(t) = 100cos(1000t) V$. Find the input impedance seen at the source. 

Find the capacitor voltage and inductor current in real time.

2. This RLC circuit is different from the one you have seen in the recent lab:
   
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$V_i$]{}
	to[R=$1k\Omega$]++(2,0)--++(1,0)
	node[ocirc, label=right:$V_o$]{}++(-1,0)
	to[capacitor, l=$0.01\mu F$]++(0,-2)
	to[inductor, l=$0.01H$]++(0,-2)
	node[ground, scale=2]{};
\end{circuitikz}
\end{document}
```
The input voltage is $V_i$ and the output voltage $V_o$. Like the lab project we want to investigate the frequency response of this circuit in terms of the ratio $\frac{\tilde{V}_)}{\tilde{V}_i}$.
	1. Suppose the input is a sinusoidal signal $V_i cos(\omega t)$. Find the impedances of the three elements in the circuit.
	2. Use the concept of voltage divider to find the ratio $\frac{\tilde{V}_)}{\tilde{V}_i}$. Carry $\omega$ as a variable.
	3. Investigate the ratio with low $\omega$ and high $\omega$
	4. Is there an $\omega$ where the ratio is either smallest or largest?
	5. Sketch a plot with vertical axis to be the gain $\frac{|\tilde{V}_o|}{|\tilde{V}_i|}$ against the horizontal axis of $\omega$.