# Class 13
## Transmission Lines
### Telegrapher's Equations
Pair of differential equations that describe voltage and current
$$\frac{dV(x,t)}{dx} = -L\frac{dI(x,t)}{dt} - RI(x,t)$$
Counterpart for current:
$$\frac{dI( x,t)}{dx} = -C\frac{dV(x,t)}{dt} - GV(x,t)$$
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$-$]{}
	++(0,2)
	node[label=left:$V(d)$]{}
	++(0,2)
	node[ocirc, label=left:$+$]{}
	--++(1,0)
	coordinate(A)
	--++(1,0)
	coordinate(B)
	to[R=$r$]++(2,0)
	to[inductor, l=$jX$]++(2,0)
	node[ocirc, label=right:$+$]{}
	++(0,-2)
	node[label=right:$V(d + dx)$]{}
	++(0,-2)
	node[ocirc, label=right:$-$]{}
	--++(-6,0);
	
	\draw(A)
	to[capacitor, l=$jB$]++(0,-4);
	
	\draw(B)
	to[R=$g$]++(0,-4);
	
\end{circuitikz}
\end{document}
```

$$\frac{dV_\omega(x)}{dx} = -L\omega \frac{dI_\omega(x)}{dt} = RI_\omega(x)$$
$$\frac{dI_\omega(x)}{dx} = -C\omega\frac{dV_\omega(x)}{dt} = GV_\omega(x)$$
$$\frac{d^2V_\omega(x)}{dx^2} = \gamma^2V_\omega(x)$$
$$\frac{d^2I_\omega(x)}{dx^2} = \gamma^2I_\omega(x)$$
$$\frac{\gamma}{d} = \sqrt{(R_\omega + j\omega L_\omega)(G_\omega + j\omega C_\omega)} = \alpha + j\beta$$
$$Z_0 = \sqrt{\frac{R_\omega + j\omega L_\omega}{G_\omega + j\omega B_\omega}}$$
$$\gamma = \sqrt{(r + j\omega l)(g + j\omega c)}$$
Assume "lossless" okay if $\omega >> r$ and $\omega c >> g$ 
Electrons are **not** actually moving - this would require an infinite amount of energy - they are really just a zero point  for energy **stored**.

$$\gamma = j\sqrt{\omega^2lc} = j\omega \sqrt{lc} = \frac{1}{s}\sqrt{\frac{\ohm }{\ohm}\cdot \frac{s^2}{m^2}} = \frac{1}{s}\sqrt{\frac{s^2}{m^2}}$$
$$l \to \frac{H}{m} = \frac{\ohm \cdot s}{m}$$
$$c \to \frac{F}{m} = \frac{\mho \cdot s}{m}$$
$$v = \frac{1}{\sqrt{lc}}$$
$$l = \mu_0 = 4\pi \times 10^{-7}\frac{H}{m}$$
$$c = \epsilon_0 = 8.85\times 10^{-12}$$
$$v = \frac{1}{\mu_0\epsilon_0} = \mathcal{c} = 2.99\times10^8\frac{m}{s}$$
$$X_L = 2\pi fL$$
$$X_C = \frac{1}{2\pi fC}$$
$$Z_0 = \frac{j\omega L}{j\omega_C}$$
$L = ld$
$C = cd$
$$Z_0 = \sqrt{\frac{ld}{cd}} = \sqrt{\frac{l}{c}}$$
$$Z_0 = \sqrt{\frac{\mu_0}{\epsilon_0}} = 377\ohm$$
### Avoiding Using Telegrapher's Equations (Power Engineering Goal)
Linear 2-port network
$$\bar{V}_S = \bar{A}\bar{V}_R + \bar{B}\bar{I}_R$$
$$\bar{I}_S = \bar{C}\bar{V}_R + \bar{D}\bar{I}_R$$
#### Small t-line Model
```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}
	\draw(0,4)
	node[ocirc, label=left:$+$]{}
	to[R=$R$, i>_=$\bar{I}_S$]++(3,0)
	to[inductor, l=$jX$, i_>=$\bar{I}_R$]++(3,0)
	node[ocirc, label=right:$+$]{};	

	\draw(0,0)	
	node[ocirc, label=left:$-$]{}
	--++(6,0)
	node[ocirc, label=right:$-$]{};	

	\draw(0,2)	
	node[label=left:$\bar{V}_S$]{}
	++(6,0)	
	node[label=right:$\bar{V}_R$]{};	
	
	\end{circuitikz}
\end{document}
```
Find $\bar{A}, \bar{B}, \bar{C}, \bar{D}$ 

**KCL**
$$\bar{I}_S = \bar{I}_R$$
$$\bar{C} = 0,\ \ \bar{D} = 1$$
**KVL**
$$+\bar{V}_S - \bar{I}_S(R + jX) - \bar{V}_R = 0$$
$$\bar{V}_S = \bar{I}_S(R + jX) + \bar{V}_R$$
$$ = \bar{V}_R + \bar{Z}\bar{I}_R$$
$$\bar{A} = 1,\ \ \bar{B} = \bar{Z}$$


#### Medium t-line Model
```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}
	\draw(0,4)
	node[ocirc, label=left:$+$]{}
	--++(1,0)
	coordinate(A)
	to[R=$R$, i>_=$\bar{I}_S$]++(3,0)
	to[inductor, l=$jX$, i_>=$\bar{I}_R$]++(3,0)
	coordinate(B)
	--++(1,0)
	node[ocirc, label=right:$+$]{};	
	
	\draw(A)
	to[capacitor, l=$\frac{\bar{Y}}{2}$]++(0,-4);
	
	\draw(B)
	to[capacitor, l=$\frac{\bar{Y}}{2}$]++(0,-4);

	\draw(0,0)	
	node[ocirc, label=left:$-$]{}
	--++(8,0)
	node[ocirc, label=right:$-$]{};	

	\draw(0,2)	
	node[label=left:$\bar{V}_S$]{}
	++(8,0)	
	node[label=right:$\bar{V}_R$]{};	
	
	\end{circuitikz}
\end{document}
```
**KVL**
$$\bar{V}_S = \bar{Z}\bar{I}_Z + \bar{V}_R$$
KCL inside....
$$\bar{I}_Z = \bar{I}_R + \bar{V}_R\left(\frac{\bar{Y}}{2}\right)$$
$$\bar{V}_S = \left(\bar{I}_R + \bar{V}_R\frac{\bar{Y}}{2}\right)\bar{Z} + \bar{V}_R = \left(\frac{\bar{Y}\bar{Z}}{2} + 1 \right)\bar{V}_R + \bar{Z} \bar{I}_R$$
$$\boxed{\bar{A} = \frac{\bar{Y}{\bar{Z}}}{2}  +1,\ \ \bar{B} = \bar{Z}}$$
$$\boxed{\bar{C} =\bar{Y}\left(\frac{\bar{Y}\bar{Z}}{4} + 1\right) ,\ \ \bar{D} = \bar{A}}$$
**KCL**
$$\bar{I}_S = \bar{V}_S\frac{\bar{Y}}{2} + \bar{V}_R\frac{\bar{Y}}{2} + \bar{I}_R$$
We need $\bar{V}_S$ in terms of $\bar{V}_R$ and $\bar{I}_R$ 
$$\bar{V}_S = \left(\bar{I}_R + \bar{V}_R\frac{\bar{Y}}{2}\right)\bar{Z} + \bar{V}_R$$
$$\bar{I}_S = \left(\bar{I}_R\bar{Z} + \bar{V}_R\frac{\bar{Z}\bar{Y}}{2} + \bar{V}_R\right)\frac{\bar{Y}}{2} + \bar{V}_R\frac{\bar{Y}}{2} + \bar{I}_R$$
$$ = \left(\frac{\bar{Y}}{2} + \frac{\bar{Y}}{2} + \frac{\bar{Y}\bar{Z}\bar{Y}}{2}\right)\bar{V}_R + \left(1 + \frac{\bar{Y}{\bar{Z}}}{2}\right)\bar{I}_R$$
$$ = \bar{Y}\left(\frac{1}{2} + \frac{1}{2} + \frac{\bar{Y}\bar{Z}}{2}\right)\bar{V}_R + ... = \bar{Y}\left(1 + \frac{\bar{Y}\bar{Z}}{4}\right)\bar{V}_R + ...$$
#### Long t-line Model
```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}
	\draw(0,4)
	node[ocirc, label=left:$+$]{}
	--++(1,0)
	coordinate(A)
	to[R=$R$, i>_=$\bar{I}_S$]++(3,0)
	to[short, a=$\bar{Z}'$]++(0,0)
	to[inductor, l=$jX$, i_>=$\bar{I}_R$]++(3,0)
	coordinate(B)
	--++(1,0)
	node[ocirc, label=right:$+$]{};	
	
	\draw(A)
	to[capacitor, l=$\frac{\bar{Y}'}{2}$]++(0,-4);
	
	\draw(B)
	to[capacitor, l=$\frac{\bar{Y}'}{2}$]++(0,-4);

	\draw(0,0)	
	node[ocirc, label=left:$-$]{}
	--++(8,0)
	node[ocirc, label=right:$-$]{};	

	\draw(0,2)	
	node[label=left:$\bar{V}_S$]{}
	++(8,0)	
	node[label=right:$\bar{V}_R$]{};	
	
	\end{circuitikz}
\end{document}
```
$$\bar{Z}' = \bar{Z}\frac{\sinh(\gamma d)}{\gamma d}{}$$
$$\bar{Y}' = \bar{Y}\frac{\tanh\left(\frac{\gamma d}{2}\right)}{\frac{\gamma d}{2}}$$
![[Pasted image 20261109123320.png|557]]
$\bar{A},\bar{B},\bar{C},\bar{D}$ same for long model but put in $\bar{Z}'$ and $\bar{Y}'$
$$\bar{\gamma} = \sqrt{\bar{z}\bar{y}} = \sqrt{\frac{\bar{Z}\bar{Y}}{d}}$$
$$\bar{\gamma}d = \sqrt{\bar{Z}\bar{Y}}$$
$$\bar{Z} = \bar{z}d,\ \ \bar{Y} = \bar{y}d$$
$$\bar{Z} = r + jX = r + j2\pi fl$$
$$\bar{Y} = j2\pi f c$$
### Something Different?
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
\draw(0,0)
node[ocirc, label=left:$+$]{}
to[short, i=$\bar{I}$]++(1,0)
to[inductor, l=$jX$]++(2,0)
node[label=right:$+$]{}
to[generic, l=$\bar{V}_R$]++(0,-2)
node[label=right:$-$]{}
--++(-3,0)
node[ocirc, label=left:$-$]{};

\draw(0,-1)
node[label=left:$\bar{V}_S$]{};
\end{circuitikz}
\end{document}

```
$R = 0\to \text{lossless}$
$$\bar{V}_R = V_R \angle 0^\circ\tag{1}$$
$$\bar{I} = I \angle -\theta_L\tag{2}$$
$$\theta = \phi_V -\phi_I$$
$$\phi_I = -\theta \text{ with } \phi_V = 0$$
$$P_{IN} = P_{OUT}$$
$$\Delta V = jX\bar{I}\tag{3}$$
$$\bar{V}_S = \bar{V}_R + jXI\tag{4}$$
![[Pasted image 20261109123411.png|761]]
##### $\theta$
$$G = XI\cos\theta$$
##### $\gamma$
$$G = V_S\sin\gamma$$
$$XI\cos\theta = V_S\sin\gamma$$
$$xI\cos\theta = V_S\sin\delta \to I\cos\theta = \frac{V_S\sin\delta}{x}$$
$$P_{out} = 3V_RI\cos\theta $$
$$P_{IN} = 3V_RV_S\sin\delta$$
$$P_{IN} = P_{OUT} = P$$
$$P = 3V_RI\cos\theta$$
$$\boxed{P = \frac{3V_RV_S\sin\delta}{x}}$$
$$\boxed{Q = \frac{3V_S(V_S\cos\delta - V_R)}{x}}$$
Q is dependent upon a small change in the difference between $V_S$ and $V_R$ 
$P$ is dependent on a small change in $\delta$
$\delta$ is the difference in phase angle between $\bar{V}_R$ and $\bar{V}_S$
# Class 14