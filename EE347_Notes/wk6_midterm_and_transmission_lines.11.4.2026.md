# Class 11
Midterm
# Class 12

| Transmission | Subtransmission | Distribution | Utilization |
| ------------ | --------------- | ------------ | ----------- |
| 765kV        | 138kV           | 34.5kV       | 120/280V    |
| 500kV        | 115kV           | 22.86kV      | 120/240V    |
| 345kV        | 69kV            | 13.9kV       | 277/480V    |
| 230kV        | 56kV            | 13.2kV       | 346/600V    |
|              | 46kV            | 12.47kV      |             |
|              |                 | 8.32kV       |             |
|              |                 | 4.17kV       |             |

### Transmission Lines Affected by:
1. Voltage regulation
2. Transmission efficiency
3. Power transmission limit
4. Stability

### Resistance
$$R_{DC} = \rho \frac{L}{A}[\ohm]$$
$$r_{cd} = \frac{R_{DC}}{L} = \frac{\rho}{A}\left[\frac{\ohm}{m}\right]$$
$$\rho_{T2} = \rho_{T1}\frac{T_2 + M}{T_1 + M} \text{ empirical estimate of $\rho$ as a funciton of $T$}$$
$M$ Material Constraint
$\rho_{T1}$ known $\rho$ at $T_1$ 
$\rho_{T2}$ known $\rho$ at $T_2$

Ag, Cu, Au, Al are the top primary conductors.

$R_{AC} > R_{DC}$  due to the skin effect. Essentially $A_{eff} < A_{geo}$, since the density of current is on the outside.


$d$ length of the transmission line
$l$ is line inductance
$r$ is radius of the coils
$D$ is space between conductors.

$$x_C = \frac{1}{2\pi fc}$$
$$b = \frac{1}{x_c} = 2\pi fc$$
$$B = 2\pi f c d$$
$$\bar{Y} = \cancel{G} + jB$$
$$\bar{Y}_r = jB[\mho]$$
$$c = \frac{\pi \epsilon_0\epsilon_r}{ln\left(\frac{D}{r}\right)}$$
Ideally $x\to 0$
$$x = 2\pi fl$$
This can be done with:
$D\to 0$ 
$r\to \infty$

Ideally $\bar{Y}_C\to 0$
$$\bar{Y}_C = jb \left[\frac{\mho}{m}\right]$$

This  can be  done with:
$D\to \infty$ 
$r\to 0$

$x_r = \infty$
$c = 0$

Looking at very long transmission lines, we want to find $r,x,y,g$ in $\frac{\ohm}{m}$.

### Example: 70mi Transmission Lines
$$c = \lambda f \left[\frac{m}{s}\right]$$
For ohms law to be valid, the voltage cannot vary across the distance
$$d < \frac{\lambda}{20}$$
This is called the lumped element approximation

If the transmission line is short enough, we don't need to 


#### Short T-Line Model
So short, $Y_C$ doesn't matter
```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(0,0)
		to[R=$rd$]++(2,0)
		to[inductor, l=$jxd$]++(2,0);
	\end{circuitikz}
\end{document}
```
#### Medium T Line Model
Short but $Y_C$ matters a bit
```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(0,0)
		--++(1,0)
		coordinate(A)
		to[capacitor, l= $\frac{\bar{Y}_C}{Z}$]++(0,-2);
		
		\draw(A)
		to[R=$R$]++(2,0)
		to[inductor, l=$jX$]++(2,0)
		to[capacitor, l= $\frac{\bar{Y}_C}{Z}$]++(0,-2)
		--++(-4,0);
	\end{circuitikz}
\end{document}
```

#### Long Model
Capacitance matters, affects $\Delta V = |\bar{V}_S - \bar{V}_Z|$ 
```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(0,0)
		--++(1,0)
		coordinate(A)
		to[capacitor, l= $\frac{\bar{Y'}_C}{Z}$]++(0,-2);
		
		\draw(A)
		to[R=$R'$]++(2,0)
		to[inductor, l=$jX'$]++(2,0)
		to[capacitor, l= $\frac{\bar{Y'}_C}{Z}$]++(0,-2)
		--++(-4,0);
	\end{circuitikz}
\end{document}
```
$R', X', Y_C'$ are modified by hyperbolics, $\cosh, \sinh, \tanh$ that are functions of $d$.

For 70 miles, note as $d$ increases, $x = xd$ increases.
The $\Delta V$ over the line increases.

As $d$ increases, $\bar{Y}_C = \bar{y}d$ increases.
$I$ increases as $\Delta V$ increases.

Every 70 miles along a transmission line there is a bank 