# Class 7
## Multiple Winding Magnetic Circuits
Each winding has a current $i_n$, and a voltage represented by:
$$V_n = \frac{d\lambda _n}{dt} = N_n \frac{d\phi}{dt}$$
So, the magnetically equivalent circuit would be:
```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(0,0)
		to[vsource, l=$N_1i_1$, invert]++(0,2)
		to[generic, l=$\mathcal{R_C}$, i_>=$\phi$]++(4,0)
		to[vsource, l=$N_2i_2$]++(0,-2)
		--++(-4,0);	
	\end{circuitikz}
\end{document}
```

$$\mathcal{R}_C\phi = N_1i_1 + N_2i_2\tag{1}$$
Where:
$$\mathcal{R}_C = \frac{l_c}{\mu_0\mu_r A_C}$$
$$A_C = \omega d$$
So, because of the flux linkage the current is
$$i_1 = -\frac{N_2}{N_1}i_2 \tag{2}$$
Also, from Faraday's law
For each side:
$$V_1 = \frac{d\lambda _1}{dt} = N_1\frac{d\phi}{dt}$$
$$V_2 = \frac{d\lambda _2}{dt} = N_2\frac{d\phi}{dt}$$
$$\frac{V_1}{N_1} = \frac{V_2}{N_2}$$

$$V_1 = \left(\frac{N_1}{N_2}\right)V_2$$

## 3.2 Include Core Reluctance
From $1$
$$\phi = \frac{N_1i_1}{\mathcal{R}_C} + \frac{N_2i_2}{\mathcal{R}_C}$$




Flux linkage
$$\lambda_1 = N_1\phi = \frac{N_1^2}{\mathcal{R}_C}i_1 + \frac{N_1N_2}{\mathcal{R}_C}i_1\tag{4}$$
$$$$
$$\lambda_1 = N_1\phi = \frac{N_2N_1}{\mathcal{R}_C}i_2 + \frac{N_2^2}{\mathcal{R}_C}i_2\tag{5}$$
Lets define
$$L_m = \frac{N_1^2}{\mathcal{R}_C}\tag{6}$$
$5$ becomes
$$\lambda_1 = L_mi_1 + \left(\frac{N_2}{N_1}\right)L_mi_2 \tag{7}$$

$$\lambda_2 = \left(\frac{N_2}{N_1}\right)L_mi_1 + \left(\frac{N_2}{N_1}\right)^2L_mi_2 \tag{8}$$
Define 
$$m = \left(\frac{N_2}{N_1}\right)L_m$$
Then, 
$$\lambda_1 = L_mi_1 + mi_2\tag{9}$$
$$\lambda_2 = mi_1 + \left(\frac{N_2}{N_1}\right)^2L_mi_2\tag{10}$$

Therefore
$$V_1 = \frac{d\lambda_1}{dt} = L_m\frac{di_1}{dt} + m\frac{di_2}{dt}\tag{11}$$
$$V_2 = \frac{d\lambda_2}{dt} = m\frac{di_1}{dt} + \left(\frac{N_1}{N_2}\right)^2L_m \frac{di_2}{dt} \tag{12}$$

We can represent $11$ and $12$ using the equivalent circuit:

```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(0,0)
		to[vsource, invert, V=$V_1$]++(0,2)
		to[short, i=$i_1$]++(2,0)
		coordinate(A)
		to[inductor, l=$L_m$, i=$i_m$]++(0,-2);
		
		\draw(A)
		to[short, i=$i_p$]++(2,0)
		to[inductor]++(0,-2)
		--++(-4,0);
		
		\draw(A)++(1.75,-0.25)
		node[circ]{}
		++(1,0)
		node[circ]{};
		
		\draw(A)
		++(2.5,0)
		coordinate(B)
		to[short, i^<=$i_2$]++(2,0);
		
		\draw(B)
		to[inductor]++(0,-2)
		--++(2,0)
		to[vsource, invert, V=$V_2$]++(0,2);
		
	\end{circuitikz}
\end{document}
```

Check:

$$V_1 = L_m \frac{di_m}{dt} = L_m\frac{di}{dt}(i_1-i_p)$$
$$=L_m \frac{di_1}{dt} - L_m\frac{di_p}{dt}\tag{13}$$
Therefore, $11$ and $12$.

## 3.3 Including Leakage Flux
There are 2 additional paths the field can flow not represented by 3.2's model.
We'll also have:


```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(0,0)
		to[vsource, l=$N_1i_1$, invert]++(0,2)
		to[short, i=$\phi_1$]++(2,0)
		coordinate(A)
		to[generic, l=$\mathcal{R}_{L1}$, i>_=$\phi_{L1}$]++(0,-2);
		
		\draw(A)
		to[generic, l=$\mathcal{R_C}$, i_>=$\phi$]++(4,0)
		coordinate(B)
		to[generic, l=$\mathcal{R}_{L2}$, i^<=$\phi_{L2}$]++(0,-2);
		
		\draw(B)
		--++(2,0)
		to[vsource, l=$N_2i_2$]++(0,-2)
		to[short, i=$\phi_2$]++(-2,0)
		--++(-6,0);
	\end{circuitikz}
\end{document}
```
$$\phi_1 = \phi + \phi_{L1}$$
$$\phi_2 = \phi + \phi_{L2}$$
Leakage flux (KVL)
$$\phi_{L 1} = \frac{N_1i_1}{\mathcal{R}_{L1}}\tag{17}$$
$$\phi_{L 2} = \frac{N_2i_2}{\mathcal{R}_{L2}}\tag{18}$$
The main flux determined by KVL around the outer loop
$$\phi = \frac{N_1i_1 + N_2i_2}{\mathcal{R}_C\tag{19}}$$
$17, 19\longrightarrow 15$
$$\phi_1 = \frac{N_1i_1}{\mathcal{R}_C} + \frac{N_2i_2}{\mathcal{R}_C} + \frac{N_1i_1}{\mathcal{R}_{L1}}\tag{20}$$
$18, 19\longrightarrow 16$
$$\phi_2 = \frac{N_1i_1}{\mathcal{R}_C} + \frac{N_2i_2}{\mathcal{R}_C} + \frac{N_2i_2}{\mathcal{R}_{L2}}\tag{21}$$
The flux leakage through the air gap is a large gap, so it is quite large. This is an intentional design decision so that the leakages are small.
$\mathcal{R}_{\angle1}, \mathcal{R}_{\angle2}$ are large
$\phi_{L1}, \phi_{L2}$ are therefore quite small, therefore, $L_{L1}, L_{L2}$ are also quite small.

$$\lambda_1 N_1\phi_1 = \textcolor{red}{\left(\frac{N_1}{\mathcal{R}_C}\right)} + \textcolor{green}{\left(\frac{N_1N_2}{\mathcal{R}_C}\right)} + \textcolor{blue}{\left(\frac{N_1^2}{\mathcal{R}_{L1}}\right)}\tag{22}$$
$$\textcolor{red}{\text{Self}} + \textcolor{green}{\text{Mutual}} + \textcolor{blue}{\text{Leakage}} $$
$$\lambda_1 = L_m i_1 + mi_2 + L_1i_1\tag{24}$$
Where 
$$L_1 = \frac{N_1^2}{\mathcal{R}_{L1}}\tag{23}$$

$$\lambda_2 = N_2\phi_2 = \frac{N_2N_1}{\mathcal{R}_C}i_1 + \left(\frac{N_2^2}{\mathcal{R}_{C}}\right)^2i_2 + \left(\frac{N_2^2}{\mathcal{R}_{L2}}\right)^2i_2\tag{25}$$
$$\boxed{\lambda_2 = mi_1 + \left(\frac{N_2}{N_1}\right)^2L_mi_2 + L_2i_2 }\tag{26}$$
Where 
$$L_ = \frac{N_2^2}{\mathcal{R}_{L2}}$$
Comparing $24, 26$ with $9,10$, we can see the only difference the leakage adds is an additional term. Therefore, also it adds a voltage drop.
Thus the equivalent circuit becomes:
```tikz

\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(-4,0)
		to[vsource, invert, V=$V_1$]++(0,2)
		%to[short, i=$i_1$]++(2,0)
		to[R=$R_1$, i>_=$i_1$]++(2,0)
		to[inductor, l=$L_1$]++(2,0)
		coordinate(A)
		to[inductor, l=$L_m$, i=$i_m$]++(0,-2);
		
		\draw(A)
		to[short, i=$i_p$]++(2,0)
		to[inductor]++(0,-2)
		--++(-6,0);
		
		\draw(A)++(1.75,-0.25)
		node[circ, label=below:$N_1$]{}
		++(1,0)
		node[circ, label=below:$N_2$]{};
		
		\draw(A)
		++(2.5,0)
		coordinate(B)
		to[inductor, l=$L_2$, i<^=$i_2$]++(2,0)
		to[R=$R_2$]++(2,0);
		
		\draw(B)
		to[inductor]++(0,-2)
		--++(4,0)
		to[vsource, invert, V=$V_2$]++(0,2);
		
	\end{circuitikz}
\end{document}
```
## 4.0 Reluctance Torque in a Single Excited Rotating Device
Consider an elementary reluctance machine
![[Pasted image 20261020185505.png|689]]
There should be some change in the reluctance as a function of angle, because the air gap is changing.
Min at $0^\circ$
Max at $90^\circ$

Assume stator and rotor poles are shaped such that reluctances vary sinusoidally.
