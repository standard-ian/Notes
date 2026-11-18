# Class 14
## 6.4 Capability Curve
Recall the Approximate Equivalent Circuit
```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(0,0)
		to[sV, l=$V_1$]++(0,2)
		to[short, i=$i_1$]++(1,0)
		coordinate(A)
		to[inductor, l=$jX_m$]++(0,-2);
		
		\draw(A)
		to[inductor, l=$jX_1$]++(2,0)
		to[inductor, l=$jX_2$]++(2,0)
		to[generic, l=$\frac{r_2}{s}$]++(0,-2)
		--++(-5,0);
		
	\end{circuitikz}
\end{document}
```
$$T_{mT} \approx \frac{V^2}{2(L_1 + L_2) \omega_e^2}\tag{38}$$
$$T_{mT} \propto \frac{V_1^2}{\omega_e^2} \text{  or  } T_{mT} \propto\frac{V_1^2}{P_1^2\omega_{sm}^2}\tag{39}$$


![[Pasted image 20261117175257.png|729]]

Max torque can be maintained only up until the voltage limit of the motor.
At max voltage $V_1$ it is now fixed, if max $\omega_{sm}$, synchronous mechanical speed, continues to increase, the torque decrease exponentially, by $39$.


#### Rated Torque Relationships with Speed
Know:
$$P_R = T_R \omega_m = T_R\omega_{sm}(1-S_R)$$
$$T_R = \frac{P_R}{\omega_{sm}(1-S_R)}$$
When we reach rated power then at rated slip $S_R$, torque must decay by:
$$T_R \propto \frac{P_R}{\omega_{sm}}\tag{29}$$

For $T_{mT}$, voltage sets the limit. 
For $T_{R}$, power sets the limit. 
![[Pasted image 20261117181223.png|868]]
Generally, should not operate at $T_{mT}$

Under this exponential curve, the $T_{mT} \text{ vs. } S$ curve exists infinitely, with max height reaching only the $T_{mT}$ curve above.

## 6.5 Speed Control of Induction Machines
The speed can be changed with modulation of the following:
1. Electrical Frequency $\omega_e$
2. Poles 
3. Rotor Resistance $r_2$

Why does changing the voltage allow us to maintain torque for a given frequency?
$$V = \frac{Nd\phi}{dt}$$
$$\phi = \frac{1}{N}\int V(t) dt$$
If $V(t) = V_m\sin(\omega_et)$
$$\phi = \left(\frac{V_m}{N\omega_e}\right)\cos(\omega_et)$$
By increasing voltage proportional to frequency (**volt-hertz method**) you can maintain a constant torque as frequency changes.

## 6.6 Doubly Fed Induction Generator (DFIG)
Used in wind turbines
```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(0,0)
		to[sV, l=$V_1$]++(0,2)
		to[generic, a=$r_1$, i>_=$i_1$]++(2,0)
		to[inductor, l=$jX_1$]++(2,0)
		coordinate(A)
		to[inductor, l=$jX_m$]++(0,-2);
		
		\draw(A)
		to[inductor, l=$jX_2$]++(2,0)
		to[generic, a=$\frac{r_2}{s}$]++(2,0)
		to[sV, l=$V_2$]++(0,-2)	
		--++(-8,0);
		
	\end{circuitikz}
\end{document}
```

#### Option 1: DC -DC Frequency Converter
Gearbox can be optional if using magnets
![[Pasted image 20261117190125.png|994]]
Converter must be sized at the full rated power of the grid - LARGE!
#### Option 2: DFIG
![[Pasted image 20261117191021.png|992]]
By only controlling the slip frequency, the converter only has to be rated at a fraction of the rated power of the grid
We only need to control the difference in power relative to the rated value
# Class 15
