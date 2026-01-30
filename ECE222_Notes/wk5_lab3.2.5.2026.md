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