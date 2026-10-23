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

Reluctance as a function of time is a sine wave from min $R_d$ to $R_q$  - a sin wave
Inductance is a cos wave from $L_d$ (max) to $L_q$ (min)
$$L = \frac{N^2}{\mathcal{R}}$$

$$L_1 - \frac{L_dL_q}{2}\tag{0}$$
The inductance variation is given by
$$L(\theta) = L_0 + L_1\cos(2\theta) \tag{1}$$
Then assume
$$i_s(t) = I_S\cos(\omega_e t) \tag{2}$$
So there is some energy.
$$E = \frac{1}{2}L(\theta)i_s^2$$
$$\tau_e = \frac{\partial E}{\partial \theta}(i,\theta)$$
$$\tau_e = \frac{1}{2}i_s^2\frac{dL}{d\theta} \tag{3}$$
$1,2\longrightarrow 3$:
$$\tau_e = -L_1i_S^2\cos^2(\omega_et)\sin(2\theta)\tag{4}$$
The plot of $\tau_e$ vs. $t$ will be a bunch of humps for $\theta \neq \frac{\pi}{2},0$

Next, we'll consider if
	$$\theta = \omega_mt + \gamma \tag{5}$$

# Class 8

![[Pasted image 20261020185505.png|689]]
The above is a **salient** rotor, since as $\theta$ changes, the gap size and therefore $\mathcal{R}$ does also.
$$\theta = \omega_m t + \delta \tag{5} $$
$$\delta = \text{initial rotor agle at time t=0}$$
$$L(\theta) = L_0 + L_1 \cos(2\phi) \tag{1}$$

$$T_e = -L_1I_S^2\cos^2(\omega_et)\sin(2\theta)\tag{4}$$
Where $T_e$ is the torque.

$L$ and $\mathcal{R}$ are a sine and cosine wave respectively. 
$R_d$ is the min, $R_q$ is it's max
$L_q$ is the min $L_d$ is it's max.

A plot of $T_e$ shows that there is a torque that wants to push the rotor back to $\theta_0$ 

Substituting $5$ into $4$, we get
$$T_e = -I_S^2 L_1 \cos^2(\omega_et) \sin[2\omega_w t + 2\delta]$$
How could we create a non-zero torque as a function of time?
Using some trig ID's

$$\cos^2 A = \frac{1}{2}\left[1 + \cos(2A)\right]\tag{6}$$
$$\cos(A)\sin(B) = \frac{1}{2}\sin(A+B) - \frac{1}{2}\sin(A-B)\tag{8}$$
$7$ into $8$ gives
$$T_e = \frac{-I_S^2L_1}{2}\left[1 + \cos(2\omega_e t)\right]\sin(2\omega_mt + 2\delta) \tag{9}$$
Then:
$$T_e = \frac{-I_SL_1}{2}\sin(2\omega_mt + 2\delta) - \frac{I_s^2L_1}{2}\cos(2\omega_et)\sin(2\omega_mt + 2\delta) \tag{10}$$
If $\omega_m$ is zero, then the second term  will be what contributes to non-zero torque.
Using $8$, can re-write the second term, so:
$$T_e = \frac{-I_SL_1}{2}\sin(2\omega_mt + 2\delta) - \frac{I_s^2L_1}{2}\left\{\frac{1}{2}\sin[2(\omega_e+\omega m)t + 2\delta] - \frac{1}{2}\sin[2(\omega_e - \omega_m) t - 2\delta]\right\} \tag{10}$$
Each of these terms are sinusoidally time varying at $2\omega_m$, $2(\omega_e + \omega_m)$, $2(\omega_e - \omega_m)$. The average value of these sign terms is zero.

If we take $\sin[2(\omega_e - \omega_m)t - 2\delta]$ and set $\omega_e = \omega_m$, the terms cancel and we're left with $\sin(-2\delta)$
If $\omega_m = 0$ we get a nonzero answer also.

The average torque will be if $\omega_e = \omega_m$
$$T_{e, avg} = -\frac{1}{4}I_S^2 L_1\sin (2\delta)\tag{11}$$
There will still be oscillations from the first 2 terms, but the third will create an offset in phase that will only give a non-zero average at the synchronous speed.

Machines like this generally have more than 2 poles and are called **Reluctance Machines**
Stepper motors also work similarly with many many poles.

The torque will be a frequency double $\theta$ change because the salient rotor will essentially repeat position every 180.

Recall that the $L_1$ is the position between the max and the min
$$L_1 = \frac{L_d - L_1}{2}$$
So,
$$T_e = -\frac{1}{8}I_S^2(L_d - L_q)\sin(2\delta)$$
$L_d = \text{direct axis induction}$
$L_q = \text{quadrature axis inductance}$

If $L_d = L_q$ , have a non-salient rotor. To generate any torque, we need to have current through the rotor or permanent magnets. Windings, brushes, and commutator can achieve this. This is a DC motor.

But, if we combine reluctance motor with a DC motor, we can achieve a torque curve with a lower frequency.


## 5.0 Coupled Circuit Modeling of AC Machines
Winding functions -> flux linkage -> inductance

## 5.1 Winding and Turns Functions
Lets consider a 4-pole (2 pole pair) concentrated winding.
It has a $\mu_r \to \infty$ core, a tiny air gap, then another $\mu_r \to \infty$
A small air gap means less current needed to get a field. 
$$Ni = \phi \mathcal{R}$$
Assume:
1. Small uniform (no saliency) air gap and rotor radius large compared to the gap length.
2. Assuming ideal ferromagnetic material. $H=0$ in the material. $H = \frac{B}{\mu_0\mu_r} \to 0$
3. No slotting, smooth stator and rotor. 
4. No end or edge effects. We assume there is no field in the $z$ axis. 

The only reluctance is in the drop across the air gap. Because of the very high $\mu_r$ of the core material, the field is just as pleased travelling through the core away from the current source.

The windings are concentrated at 4 points equally spaced around the rotor, at $\frac{pi}{4}$, $\frac{3pi}{4}$, $\frac{5pi}{4}$, $\frac{7\pi}{4}$. Opposite windings have opposite current. The current generated MMF:
$$MMF = \mathcal{F} = N_wi_a$$
Applying Ampere's Law
$$\oint\vec{H}\cdot d\vec{l} = N_wi_a\tag{1}$$
The gap is so small, we'll assume the field is only crossing tangent to rotor. Any field that "doesn't make it" to the outer core is neglected.

$$H_r(\theta_m)g - H_r(\theta_0)g = \text{enclosed current}\tag{2}$$
Enclosed current is a function of theta.
