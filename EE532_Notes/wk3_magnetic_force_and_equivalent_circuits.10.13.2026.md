


# Class 5
## Review
Recall the actuators from last lecture:
#### Axial
![[Pasted image 20261012223218.png|661]]

#### Lateral 
![[Pasted image 20261012234543.png|667]]

$$\mathcal{R}_g = \frac{x}{\mu_0 A}$$
If careful about the design of the actuator, you can make force not a function of position.

For example:
![[Pasted image 20261013175322.png|469]]

$$\mathcal{R}_T = \frac{2l_g}{\mu_0d(w-x)}$$
$$L_T = \frac{N^2}{\mathcal{R}_T} = \frac{N^2\mu_0 d(w-x)}{2l_g}$$
$$F = \frac{1}{2}i^2\frac{dL_T}{dx} = -\frac{1}{2}\frac{i^2N^2\mu_0d}{lg}$$
The force is not a function of $x$. 

This means the force is smoother. It is really only possible with an axial actuator.

## 2.3 Magnetic Material
How does the flux change with current? We'll examine this in the context of the following example.
![[Pasted image 20261013175527.png|713]]
There is a mean path length in the middle of the toroid, $l$.

It can be modeled as a magnetically equivalent circuit:
```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(0,0)
		to[vsource, V=$Ni$]++(0,2)
		to[generic, i>^=$\phi$, l=$\mathcal{R}$]++(3,0)
		--++(0,-2)
		--++(-3,0);
		
	\end{circuitikz}
\end{document}
```

$$Ni = \phi\mathcal{R} \tag{1}$$
$$\frac{\phi}{i} = \frac{N}{\mathcal{R}}, \phi = \left(\frac{N}{\mathcal{R}}\right)i$$
OR

$$Ni = \int\vec{H}\cdot d\vec{l}\longrightarrow Ni = Hl \tag{2}$$
$$\mathcal{R} = \frac{l}{\mu_0\mu_r A_{coil}}$$
$$\frac{\lambda}{i} = \frac{N^2}{\mathcal{R}} = L (\text{inductance})$$
Magnetic field strength is equal to:
$$\phi = BA\longrightarrow B = \frac{\phi}{A}$$
The more current we put in the more flux. Instead, we can scale current by something (the number of turns) then divide by the length.
Also, 
$$i\left(\frac{N}{l}\right) = H$$
So if we have a plot of $(i,\phi)$, and we multiply the y axis $\phi$, by $\frac{1}{A}$, and we multiply the $x$ axis $i$, by $\frac{N}{l}$, we get a plot of $(H,B)$.

This is useful because it is only dependent on the material properties and not geometry.

$A$ and $l$ get removed.


Considering the $(i, \phi$) curve again, it would appear there is a linear increase in flux as current increases. However, there is a point where the current will saturate the ferromagnetic material and the flux will begin to curve down.

The same is true of the $(B,H)$ curve. 

If $\mu_r$ is not constant, then it is non-linear.
![[Pasted image 20261013182433.png|578]]

Ferromagnetic material is made up of many separate regions or **Magnetic Domains**.
Each sort of has a little bar magnet in it and they are all randomly directed. 
The sum is not pointing in any one way in this case.

However, if some current is added to the magnetic material, a flux will be created. This will create $H$ because:
$$\frac{Ni}{l} = H$$
As we increase the current, we'll get more field. Each "small magnet" has a torque associated with it because they want to rotate to align with the field direction.
We call each of these "rotating magnets" a **Magnetic Moment**. (moment is essentially a word for torque).
![[Pasted image 20261013183913.png|549]]
As current is applied, more and more align, then at a certain point, they are all perfectly aligned and cannot become any more so. (Saturation)

For $H>P_1$, domain wall rotation no longer reversible. For example if a $P$ the field is reversed, the field will not follow $P,P_1,0$ but $P,P'$ (dotted) path.

This phenomenon is called **Hysteresis**.
This means that there is flux left in the material even when there is no current. This is because the current aligned the magnetic moments and they want to stay aligned.

Remember that $H$ is a function of current. The $H,B$ curve represents changing permeability. So if we exit the linear region, we get less return on permeability for the current or $H$ input.
Most flux for supplied current if you keep a design in the linear region.

For $P_1\to P_2$, we are in an *approximately*  linear region. 
For $P_2\to P_3$, the domain wall rotation causes total alignment of magnetic moments.
The material is said to be fully saturated.

If the field is reduced from $P_3$, the field will not follow the path$P_3P_2P_1 0$ but $P_3B_rH_c$
We keep putting more current in, so $H$ keeps increasing, we end up past $P_3$, so we come back through $B_r$, or the **Residual Flux Density** or **Remnant Flux Density**
The current is $0$ now but all the moments are so aligned they produce a magnetic field and stay magnetized. This is how magnets are born.
In *hard* ferromagnetic material, this makes permanent magnet possible. Hard refers to how difficult it is to magnetize/demagnetize, not the material hardness.

**Soft** is something that you apply a small $H$ and get a big $B$. This is a magnet that is easy to de-magnetize. The BH curve is very skinny in the $H$ axis.

**Hard magnets** have a very wide BH curve on the $H$ axis. 





To get rid of this field, we need to now apply a current **in the opposite direction** to keep moving to $H_c$ (**Coercivity**). Now the applied field is 0.

# Class 6
## Discussion 2: Problem 2
![[Pasted image 20261013175527.png|713]]
Returning to the discussion example:

```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(0,0)
		to[vsource, V=$Ni$, invert]++(0,2)
		to[generic, i>^=$\phi$, l=$\mathcal{R}_c$]++(3,0)
		to[generic, l=$\mathcal{R}_g$]++(0,-2)
		--++(-3,0);
		
	\end{circuitikz}
\end{document}
```
$$\mathcal{R} = \mathcal{R}_c + \mathcal{R}_g$$
$$\mathcal{R}_T = \frac{2\pi r_c - g}{\mu_0\mu_rA_c} + \frac{g}{\mu_0 A_g}$$
$$A_g = \pi\left(\frac{d + g}{2}\right)^2 = 0.011^2 \pi$$ 
Using the curve below:
$$\mu_r = \frac{B}{\mu_0 H} = \frac{0.3}{4\pi \times 10^{-7} \times 600} \approx 400$$
$$\mathcal{R}_T = \frac{(2\pi \times 0.05) - 0.002}{4\pi \times 10^{-7} \times 400 \times (\pi 0.01^2)} + \frac{0.002}{4\pi \times 10^{-7} \times 0.011^2\pi} = 1976771 + 4186825 = 6.163\times 10^6\left[\frac{At}{wb}\right]$$
$$i = \frac{0.3(0.011^2\pi)6.163\times 10^6}{250} = 2.32A$$
New $\mu_r$ using the curve below:
$$\mu_r = \frac{0.6}{\mu_0(1400)} = 341$$

![[Pasted image 20261015174647.png|417]]
The relative permeability has gone down and that has an impact on the reluctance through the coil. The air gap's reluctance is unaffected.

To find the new $B$, we can use the new relative permeability, $B_C = 0.6T$:
$$\mathcal{R}_T = \frac{(2\pi \times 0.05) -0.0002}{\mu_0 \times 341 \times 0.01^2 \pi} + \mathcal{R}_g = 6.506\times 10^{6} \left[\frac{At}{Wb}\right]$$

$$i = \frac{B_CA_C\mathcal{R}_{T2}}{N} = \frac{0.6\pi(0.01^2)\times 6.506\times 10^6}{250} = 4.9[A]$$
We doubled the field or flux, but the current more than doubled which is a result of the permeability going down.

This could have been solved another way:
$$\oint \vec{H}\cdot d\vec{l} = Ni$$
$$H_Cl_C + H_gl_g = Ni$$
$$i = \frac{H_Cl_C + H_g l_g}{N}$$
The term we don't know is the $H_g$.

The key is that:
$$\phi_C = \phi_g$$
So:
$$B_CA_C = B_gA_g,\ \ B_g = \mu_0H_g = \frac{B_CA_C}{A_g}$$
$$H_g = \frac{B_CA_C}{A_g\mu_0} = \frac{0.6\pi0.01^2}{\mu_0\pi(0.11)^2} = 394599 \left[\frac{A}{m}\right]$$
$$i = \frac{(1400)((2\pi\times 0.05) - 0.002)}{250} + \frac{394599l_g}{N}$$
## 2.4 Sinusoidal Excitation
Suppose a sinusoidal voltage is applied to an inductor through the center of which is a ferric core, producing a current $i_e$

$$V(t) = V_0 \cos(\omega t) \tag{1}$$
Voltage is related to current:
$$V = R i_e + N\frac{d\phi}{dt}\tag{2}$$
This could also be written with flux linkage:
$$V = Ri_e + \frac{d\lambda}{dt}\tag{3}$$
Let us initially neglect the resistance, $R = 0$.
The voltage is approximately equal to the change in flux linkage with respect to time.

$$V \approx \frac{d\lambda}{dt}\tag{4}$$
$$\phi = \frac{Ni}{R}$$
$$\lambda = N\phi = \frac{N^2i}{R} = Li$$
$$\frac{d\lambda}{dt} = i_e\frac{dL}{dt} + L\frac{di_e}{dt}$$
We can re-write $4$ as
$$\lambda \approx \int V(t) dt \approx \frac{V_0\sin(\omega t)}{\omega}$$

Flux linkage is purely sinusoidal. The coil current $i_e$ must flow in such a way to maintain the sinusoidal flux density. 
This current is often called the excitation current. 

Inductance is nonlinear, so the current must distort to maintain sinusoidal flux linkage.

The current is distorted in both phase and magnitude because of the magnetic saturation. We can see that the fundamental component of this current is not in phase with the voltage. This is due to saturation. 

The current $i_e$ in phase with $V$ are the magnetic losses (core losses). We can represent these losses in a circuit form.
```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[scale=2, american, font=\Large]
		\draw(0,0)
		to[short, i=$i_e$]++(2,0)
		coordinate(A)
		to[R=$R_c$, i>_=$i_c$]++(0,-2);
		
		\draw(A)
		--++(2,0)
		to[inductor, l=$\omega L_m$, i_>=$i_m$]++(0,-2)
		--++(-4,0);
	\end{circuitikz}
\end{document}
```
$R_C$ = core loss resistance
$$i_e = i_CR_C + \omega_mL_mi_m$$
The core loss normally includes eddy current losses. The $R_C$ and $L_m$ are non-linear terms. But constant terms are often used.


![[Pasted image 20261015190128.png|540]]

## 3.0 Multiple Winding Magnetic Circuit
Most rotary machines have **multiple** sets of windings.

Transformers are an example of a machine, although not rotary, that has more than one winding. 
Each winding has a current $i_n$, and a voltage represented by:
$$V_n = \frac{d\lambda _n}{dt} = N_n \frac{d\phi}{dt}$$
For each side:
$$V_1 = \frac{d\lambda _1}{dt} = N_1\frac{d\phi}{dt}$$
$$V_2 = \frac{d\lambda _2}{dt} = N_2\frac{d\phi}{dt}$$

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
