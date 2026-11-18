# Midterm
# Class 13
## 6.1 Per-Unit System
Eliminates the need for units
Simplifies equations
Normalizes machine parameters
Useful sanity check

The most common base quantities are the rated quantities.

#### Primary Base Quantities
Subscript $B$ signifies "Base" and $R$, "Rated"
$$V_B = V_R = \text{rated RMS phase voltage} = \frac{V_{LL, R}}{\sqrt{3}}\tag{14}$$
We simply select that the rated is equal to the voltage base.
$$P_B = P_R = \text{rated $3\phi$ output power}\tag{15}$$
$$\omega_B = \omega_R = 2\pi fe = \text{rated electrical radian frequency} = \text{base frequency} = 2\pi fe$$
#### Secondary Base Quantities
$$I_B = \frac{P_B}{qV_B} = \frac{P_B}{3V_B},\ \ q = \text{num. of phases}\tag{17}$$
$$Z_B = \frac{V_B}{I_B} = \frac{3V_B^2}{P_B}\tag{18}$$
Mechanical Base (where $p$ = poles):
$$\omega_{mB} = \frac{\omega_B}{p} = \frac{\omega_R}{p}\tag{19}$$
Torque
$$T_B = \frac{P_B}{\omega_{B}} = \frac{P_BP}{\omega_R}\tag{20}$$
$$\text{Per unit quantity} = \frac{\text{actual quantity}}{\text{base value}}$$

Rated Induction Machine in Per-Unit
Rated power $P_R = T_R \omega_m$ is the output power
$$s = \frac{\omega_{sm} - \omega_m}{\omega_{sm}}$$
$$P_R = T_R\omega_m(1 - s_R)\tag{21}$$
Rated Torque
$$T_R = \frac{P_R}{\omega_m(1-s_R)}[Nm]$$
Rated Per-Unit Torque
$$T_{R, pu} = \frac{T_R}{T_B} = \left[\frac{P_R}{\omega_{sm}(1-s_R)}\right]\frac{1}{T_B}\tag{22}$$
From $20$
$$T_{R, pu} = \frac{\cancel{P_R}}{\cancel{\omega_{sm}}(1-s_R)}\frac{\cancel{\omega_{sm}}}{\cancel{P_R}}$$
$$T_{R, pu} = \frac{1}{1 - S_R}\tag{23}$$
Since 
$$s = \frac{\omega_e-\omega_r}{\omega_w}$$
$$\omega_r = \text{mechanical frequency in electrical frame}$$
$$s\omega_e = \omega_e - \omega_r = \text{slip frequency}$$
![[Pasted image 20261116205735.png|806]]

Note: For Induction Machines, if we apply $1pu$ phase voltage to the machine, that does not mean the I.M. will operate at $1pu$ current, and $1pu$ torque.

If there was no slip, $s_R$ would be 0, and everything would be 1 - but this is a simpler, synchronous machine.

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[generic, l=$r_1$, i>^=$i_1$]++(2,0)
	to[inductor, l=$jX_1$]++(2,0)
	coordinate(A);
	
	\draw[<->](0,-0.1)--++(0,-1.8)
	node[midway, label=left:$V_1$]{};
	
	\draw(A)
	--++(1,0)
	to[inductor, l=$jX_2$, i^>=$i_2$]++(2,0)
	to[generic, , l=$\frac{r_2}{s}$]++(0,-2)
	--++(-7,0);
	
	\draw(A)--++(0,-0.25)
	--++(0.5,0)
	to[inductor, l=$jX_m$]++(0,-1.5)
	--++(-0.5,0)
	--++(0,-0.25)
	++(0,0.25)
	--++(-0.5,0)
	to[R, l=$r_2$]++(0,1.5)
	--++(0.5,0);
	
	\draw[red,dashed](A)
	++(1.25,1)
	--++(0,-4)
	node[midway, label=right:$P_{gap}$]{};
	
\end{circuitikz}
\end{document}
```
$$i_{1, pu} = 1 \text{ only if } PF = 1 \text{ and 100\% efficiency}$$

#### The induction machine per unit torque  (Not at Rated)
Developed Torque is the per unit developed power divided by the mechanical frequency in per-units
$$T_{dev, pu} = \frac{P_{dev, pu}}{\omega_{m, pu}} = \frac{\text{output power}}{\text{output mechanical angular speed}}\tag{24}$$
The power going out of the machine, across $P_{gap}$ power is flowing through the air gap. The power going out of the machine $P_{dev}$ before friction and windage is the power transmitted over the gap minus rotor power losses.
$$P_{dev, pu} = P_{gap} - |i_2|^2 r_2 $$ 

$$P_{dev, pu} = \frac{|i_2|^2r_2(1-s)}{s}\tag{25}$$
Recall, equation $23$ is only for rated, only if at rated torque will you be at rated slip.

In $pu$:
$$\omega_{m, pu} = \frac{\omega_m}{\omega_{mB}} = \omega_{sm}(1-s) = (1-s)\tag{26}$$
Now we have the mechanical speed per unit, and device power.

$25,26 \to 24$
$$T_{dev, pu} = \frac{|i_2|^2r_2}{s}\tag{27}$$
This is the torque in $pu$ not at at rated.
If at **rated** it is easy, see $23$.

Notice there are no pole pairs or phases anywhere in the calculations - don't include them it will become too confusing.

If not told what slip is, how could you begin?

Recall $25$...and assume we set developed power to 1 as the base...
$$P_R = P_{dev, pu} = \frac{|i_2|^2r_2 (1-s)}{s} = 1pu$$
We can then use $i$ and $r_2$ to solve for the only unknown $s$.

## 6.3 Approximate Equivalent Circuit

Adapting the previous model...
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
This is an approximation, but it models some very fundamental relationships for synchronous and induction machines.
The approximation gives very close results.
$r_1$ is small, so it is neglected, notice it is no longer present.
$jX_1$ is the stator's leakage inductance term, it makes it way easier to put this onto the same leg as the rotor's $jX_2$

#### Starting Torque (No Rotation)
$\omega_r =0$ and $s = 1$
$$i_2 = i_{starting} = \frac{V_1}{\frac{r_2}{s} + j(X_1 + X_2)}\tag{28}$$
Because at starting $s=1$,  we can neglect the now very small $\frac{r_2}{1} \approx 0$
Note this is only at starting.

Now:
$$i_{starting} \approx \frac{V_1}{j(X_1 + X_2)}\tag{29}$$
From $27$, the starting torque in $pu$:
$$T_{starting} = \frac{|i_{starting}|^2r_2}{s}$$
$29\to 27$ gives the starting torque - it is directly proportional to the applied voltage
$$T_{starting} = \frac{V_1^2r_2}{(X_1 + X_2)^2}\tag{30}$$
#### Max Torque
Normally this is a pain to calculate. 
The slip at max torque is equal to the power being transferred.

From $13$ - $|Z_{th}| = \frac{r_2}{S_{mT}}$
$$\frac{r_2}{s_{mT}} \approx X_1 + X_2 \tag{31}$$
$$s_{mT} \approx \frac{r_2}{X_1 + X_2}$$

#### Max Torque Speed Limit
From $27$ in $pu$
$$T_{dev, pu} = \frac{|i_2|^2r_2}{s\omega_e}$$
At max torque, we have 
$$T_{mT} = \frac{|I_{2, mT}|^2r_2}{s_{mT}\omega_e}\tag{32}$$
We know the slip at max torque from $31$ so we can substitute in.
$$S_{mT} \approx |i_{mT}|^2\frac{(X_1 + X_2)}{\omega_e}\tag{33}$$
From the approximate equivalent circuit
The max torque current is $i_2$ in the model.

$$i_{mT} \approx \frac{V_1}{\frac{r_2}{s} + j(X_1 + X_2)} \tag{34}$$
$$|i_{mT}|^2 \approx \frac{V_1^2}{\left(\frac{r_2}{s_{mT}}\right)^2 + (X_1 + X_2)^2}\tag{35}$$
$31\to 35$
$$|i_{mT}|^2 \approx \frac{V_1^2}{2(X_1 + X_2)^2}\tag{36} $$
$36\to 33$
$$T_{mT} \approx \frac{V_1^2}{2(X_1 + X_2)\omega_e}$$
Recall this is all in $pu$.
Normally in $pu$, $\omega_e = 1$.
But we could write this in terms of frequency
$$T_{mT} \approx \frac{V_1^2}{2(L_1 + L_2) \omega_e^2}$$
If voltage is fixed, to go above the rated speed, max torque must decrease exponentially by that speed.
$$T_{mT}\propto \frac{V_1^2}{\omega_e^2}$$
This shows that as long as $V_1$ can increase, max torque can be maintained. 

$$$$




