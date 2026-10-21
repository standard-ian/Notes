# Class 7
## Losses in a non-ideal transformer
### Core Losses (Iron)
1. Eddy current losses due to the current in the wire introducing a current in the iron
2. Hysteresis losses. $P_{core} = \frac{V_p^2}{R_r}$. Without a load, there is still some small excitation current. Proportional to the square of the applied voltage, independent of load.

### Coil Losses
1. $I^2R$ Losses. $P_{P/S} = I_{P/S}^2 R_{P/S}$ in primary and secondary windings.

### Flux Leakage
Some flux doesn't couple with the core, it leaks out at the windings.

### Excitation Current
Small amount of current leaking into the core even when there is no load

## Modeling Non-Idealities 
$$V = -N\frac{d\phi}{dt}$$
$$V_{LP} = -N_P\ d\frac{\phi_{LP}}{dt}$$
$$V_{LS} = -N_S\ d\frac{\phi_{LS}}{dt}$$
Can use a magnetically equivalent circuit to represent the reluctance through the air and the flux flow through that air. 
There is a need to model the area of the air the flux is flowing through and that is the challange.

$$V_{LP} = -N_P\frac{d}{dt} \left(\frac{i_P(t) N_P}{R_{air}}\right) = \frac{-(N_P^2)}{R_{air}}\frac{di}{dt}$$
$$V = -L\frac{di}{dt}\longrightarrow L = \frac{N_P^2}{R_{air}}$$
#### Phasor Domain
$$\bar{V}_{LP} = -jX\bar{I}_P$$
Where $X = 2\pi fL$
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[inductor, l=$jX_P$, i_>=$\bar{I}_P$]++(3,0);
\end{circuitikz}
\end{document}
```
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[inductor, l=$jX_S$, i_>=$\bar{I}_S$]++(3,0);
\end{circuitikz}
\end{document}
```

For a transformer, we can add an inductance to model the coil losses, and we can add a parallel $RL$ element on the primary to model the excitation current through core losses $R$ and induction flux $L$.

There are voltage drops across transformers and power loss.
$$\eta = \frac{P_{out}}{P_{in}} = \frac{P_{out}}{P_{out} + P_{loss}} = \frac{P_{out}}{P_{out} + P_{core} + P_{wire}}$$
Model $Q_{parasitic}$, $P_{parasitic}$ and do asset montoring.

```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(-3,0)
		node[label=left:$-$]{}
		++(0,2)
		node[label=left:$\bar{V}_p$]{}
		++(0,2)
		node[label=left:$+$]{}
		to[inductor, l=$jX_P$, i=$\bar{I}_P$]++(2,0)	
		to[R=$R_P$]++(2,0)
		coordinate(A)
		--++(1,0)
		to[inductor]++(0,-4)
		--++(-5,0);
	
		\draw(7,0)	
		node[label=right:$-$]{}
		++(0,2)
		node[label=right:$\bar{V}_s$]{}
		++(0,2)
		node[label=right:$+$]{}
		to[inductor, a=$jX_S$, i_<=$\bar{I}_s$]++(-2,0)
		to[R, a=$R_S$]++(-2,0)
		to[inductor]++(0,-4)
		--++(4,0);
		
		\draw(1.75,3.75)
		node[circ]{}
		++(1.5,0)
		node[circ]{};
	
		\draw(A)
		to[short, i=$\bar{I}_e$]++(0,-1)	
		--++(0.5,0)
		to[inductor, a=$jX_m$, i>_=$\bar{I}_m$]++(0,-2)
		--++(-0.5,0)
		--++(0,-1)
		++(0,1)
		--++(-0.5,0)
		to[R, l=$R_{core}$, i^<=$\bar{I}_{core}$]++(0,2)
		--++(0.5,0);
		
	\end{circuitikz}
\end{document}
```


We can make a simplified model called the cantilever equivalent circuit.
We can use a reflected impedance equation, and make an assumption about the excitation current.

$$\bar{Z}_{IN} = a^2 \bar{Z}_L$$
$$\bar{Z}_{eq,S} = R_{eq,S} + jX_{eq, S}$$
$$R_{eq,S} = a^2 R_S$$
$$X_{eq,S} = a^2 X_S$$

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[inductor, l=$jX_S$, i_>=$\bar{I}_S$]++(3,0);
\end{circuitikz}
\end{document}
```


```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(-3,0)
		node[label=left:$-$]{}
		++(0,2)
		node[label=left:$\bar{V}_p$]{}
		++(0,2)
		node[label=left:$+$]{}
		to[inductor]++(2,0)	
		to[R, i=$\bar{I}_P$]++(2,0)
		coordinate(A)
		--++(1,0)
		to[inductor, l=$ja^2X_S$, i=$\frac{\bar{I}_S}{a}$]++(2,0)	
		to[R=$a^2R_S$]++(2,0)
		node[ocirc, label=right:$+$]{}
		++(0,-2)
		node[label=left:$a\bar{V}_S$]{}
		++(0,-2)
		node[ocirc, label=right:$-$]{}
		--++(-9,0);
	
		
		\draw(1.75,3.75)
		node[circ]{}
		++(1.5,0)
		node[circ]{};
	
		\draw(A)
		to[short, i=$\bar{I}_e$]++(0,-1)	
		--++(0.5,0)
		to[inductor, a=$jX_m$, i>_=$\bar{I}_m$]++(0,-2)
		--++(-0.5,0)
		--++(0,-1)
		++(0,1)
		--++(-0.5,0)
		to[R, l=$R_{core}$, i^<=$\bar{I}_{core}$]++(0,2)
		--++(0.5,0);
		
	\end{circuitikz}
\end{document}
```
$$\bar{I}_P = \frac{\bar{I}_S}{a} + \bar{I}_S$$
Note $R_{core}$  and $X_m$ are VERY LARGE, so $\bar{I}_e << \frac{\bar{I}_S}{a}$

```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(-3,0)
		node[label=left:$-$]{}
		++(0,2)
		node[label=left:$\bar{V}_p$]{}
		++(0,2)
		node[label=left:$+$]{}
		to[inductor, l=$jX_P$]++(2,0)	
		to[R=$R_P$, i=$\bar{I}_P$]++(2,0)
		to[inductor, l=$ja^2X_S$]++(2,0)	
		to[R=$a^2R_S$]++(2,0)
		coordinate(A)
		to[short , i=$\frac{\bar{I}_S}{a}$ ]++(1,0)
		node[ocirc, label=right:$+$]{}
		++(0,-2)
		node[label=right:$a\bar{V}_S$]{}
		++(0,-2)
		node[ocirc, label=right:$-$]{}
		--++(-9,0);
	
		
	
		\draw(A)
		to[short, i=$\bar{I}_e$]++(0,-1)	
		--++(0.5,0)
		to[inductor]++(0,-2)
		--++(-0.5,0)
		--++(0,-1)
		++(0,1)
		--++(-0.5,0)
		to[R]++(0,2)
		--++(0.5,0);
		
	\end{circuitikz}
\end{document}
```
We can combine further using:
$$R_{eq,P} = R_P + a^2R_S$$
$$X_{eq, P} = X_P+a^2X_S$$

```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(-3,0)
		node[label=left:$-$]{}
		++(0,2)
		node[label=left:$\bar{V}_p$]{}
		++(0,2)
		node[label=left:$+$]{}
		to[inductor, l=$jX_{eq, P}$]++(2,0)	
		to[R=$R_{eq,P}$, i=$\bar{I}_P$]++(2,0)
		coordinate(A)
		to[short , i=$\frac{\bar{I}_S}{a}$]++(1,0)
		node[ocirc, label=right:$+$]{}
		++(0,-2)
		node[label=right:$a\bar{V}_S$]{}
		++(0,-2)
		node[ocirc, label=right:$-$]{}
		--++(-5,0);
	
		
	
		\draw(A)
		to[short]++(0,-1)	
		--++(0.5,0)
		to[inductor, a=$jX_m$]++(0,-2)
		--++(-0.5,0)
		--++(0,-1)
		++(0,1)
		--++(-0.5,0)
		to[R, l=$R_{core}$]++(0,2)
		--++(0.5,0);
		
	\end{circuitikz}
\end{document}
```
The above is the cantilever equivalent circuit.
Using a voltmeter and ammeter we can acquire $P, Q$

#### Open Circuit Test
The excitation current is very small. and there is no load, so $\bar{I}_e \approx \bar{I}_p$
$$I_P << I_{P, rated}$$
$$\bar{V}_{disp} \approx 0$$
Or, 
$$R_{eq, P}, X_{eq, P} << R_{core}, X_m$$

```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(-3,0)
		node[label=left:$-$]{}
		to[vsource, V=$\bar{V}_p$]++(0,4)
		node[label=left:$+$]{}
		--++(1,0)
		node[label=below:$+$]{}
		to[inductor, l=$jX_{eq, P}$]++(2,0)	
		node[label=below:$\bar{V}_{disp}$]{}
		to[R=$R_{eq,P}$, i=$\bar{I}_P$]++(2,0)
		node[label=below:$-$]{}
		--++(1,0)
		coordinate(A)
		--++(1,0)
		to[short , i=$\frac{\bar{I}_S}{a}$]++(1,0)
		node[ocirc, label=right:$+$]{}
		++(0,-2)
		node[label=right:$a\bar{V}_S$]{}
		++(0,-2)
		node[ocirc, label=right:$-$]{}
		--++(-8,0);
	
		
	
		\draw(A)
		to[short]++(0,-1)	
		--++(0.5,0)
		to[inductor, a=$jX_m$]++(0,-2)
		--++(-0.5,0)
		--++(0,-1)
		++(0,1)
		--++(-0.5,0)
		to[R, l=$R_{core}$]++(0,2)
		--++(0.5,0);
		
	\end{circuitikz}
\end{document}
```

Apply rated voltage, $V_{rated}$
$V_{OC}, I_{OC}, P_{OC}$ can be measured and used to find $P_{core}$ and $X_m$


```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(0,0)
		node[label=left:$-$]{}
		++(0,1)
		node[label=left:$V_{OC}$]{}
		++(0,1)
		node[label=left:$+$]{}
		to[short, i=$I_{OC}$]++(2,0)
		to[generic, l=$X_{OC} {=} R_{core}//jX_m$]++(0,-2)
		--++(-2,0);
		
		
	\end{circuitikz}
\end{document}
```
$$\bar{Z}_{OC} = Z_{OC}\angle \theta_{OC}$$
$$Z_{OC} = \frac{V_{OC}}{I_{OC}}$$
$$\theta_{OC} = \arccos\left(\frac{P_{OC}}{I_{OC}V_{OC}}\right)$$
$$\bar{Z}_{OC} = R_{OC} + jX_{OC}\neq R_{core} + jX_m$$
$$\bar{Y}_{OC} = \frac{1}{\bar{Z}_{OC}} = G_{OC} + jB_{OC} = \frac{1}{R_{core}} - j\frac{1}{X_m}$$
$$R_{core} = \frac{1}{G_{OC}},\ \ X_m = \frac{1}{B_{OC}}$$
#### Short Circuit Test
Short the load terminals, place a conductor that can handle the rated current

```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(-3,0)
		node[label=left:$-$]{}
		to[vsource, V=$\bar{V}_p$]++(0,4)
		node[label=left:$+$]{}
		--++(1,0)
		node[label=below:$+$]{}
		to[inductor, l=$jX_{eq, P}$]++(2,0)	
		node[label=below:$\bar{V}_{disp}$]{}
		to[R=$R_{eq,P}$, i=$\bar{I}_P$]++(2,0)
		node[label=below:$-$]{}
		--++(1,0)
		coordinate(A)
		--++(1,0)
		to[short , i=$\frac{\bar{I}_S}{a}$]++(1,0)
		node[ocirc, label=right:$+$]{}
		--++(0,-4)
		node[ocirc, label=right:$-$]{}
		--++(-8,0);
		\draw(A)
		to[short]++(0,-1)	
		--++(0.5,0)
		to[inductor, a=$jX_m$]++(0,-2)
		--++(-0.5,0)
		--++(0,-1)
		++(0,1)
		--++(-0.5,0)
		to[R, l=$R_{core}$]++(0,2)
		--++(0.5,0);
		
	\end{circuitikz}
\end{document}
```

$$\bar{Z}_L = 0$$
$$R_{core} // jX_m //0 = 0$$
Measure $V$ and $I$ for $R_{eq, P}$ and $X_{eq, P}$

1. Set $V_P = 0$ 
2. Short terminals of the secondary.
3. Slowly increase $V_P$ from 0 until $I_P = I_{rated}$
	If we were to apply the rated voltage we'd get far more than the rated current due to the small impedances.
4. Measure $V_{sc}$, $I_{sc}$, and $P_{sc}$.

$$\bar{Z}_{sc} = Z_{sc} \angle \theta_{sc}$$
$$Z_{sc} = \frac{V_{sc}}{I_{sc}}$$
$$\theta_{sc} = \arccos\left(\frac{P_{sc}}{V_{sc}I_{sc}}\right)$$
$$\bar{Z}_{sc} = R_{eq, P} + jx_{eq}, P$$
The test from the 208-240 xfmr
80kVA

| OC  | 208V (rated) | 15A  | 1200W |
| --- | ------------ | ---- | ----- |
| SC  | 11V          | 380A | 950W  |
$$Z_{sc} = \frac{11}{380A} = 29\Omega$$
$$\theta_{sc} = \arccos\left(\frac{950W}{11V \cdot 380A}\right) = 77^\circ$$
$$\bar{Z}_{OC} = \frac{1}{\bar{Y}_{OC}} = Y_{OC}\angle \theta_{OC} = \frac{I_{OC}}{V_{OC}} = \frac{15A}{208V} = 72m\mathcal{S}$$
$$\theta_{OC} = \arccos\left(\frac{1200W}{15A\cdot 208V}\right) = 67^\circ$$
$$\bar{Y}_{OC} = 72m\mathcal{S}\angle -67^\circ = 0.082 - j0.66\mathcal{S}$$
$$R_{core} = \frac{1}{G} = \frac{1}{0.082\mathcal{S}} = X_m = \frac{1}{B} = \frac{1}{0.66\mathcal{S}}$$






