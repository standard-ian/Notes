# Class 3
## 2.0 Magnetic Equivalent Circuits
A wire wrapped around a magnetic material will cause magnetic field to flow through the material along a centerline, called the mean path length $l$.
![[Pasted image 20261010112159.png|818]]

In the above case the coil encircles a high  permeability path ($\mu_r > 1$).

We assume the field is contained within this material.

$$\int \vec{H}\cdot \vec{dl} = Ni [At] \tag{1}$$
For the given assumption, $\vec{H}$ is constant along the mean path. 
$$Hl = Ni$$
$$H = \frac{Ni}{l} \left[\frac{At}{m}\right] \tag{2}$$

Since $H$ is uniform along the path, it is not a vector.

For a given $H$, flux density is defined as:
$$B =\mu H \tag{3} $$

Where $\mu = \mu_0\mu_r$ and $\mu = 4\pi\times 10^{-7}\left[\frac{H}{m}\right]$

Substituting $2$ into $3$:
$$B = \frac{\mu Ni}{l}$$
$$\phi = \int\vec{B}d\cdot \vec{A} = BA = \left(\frac{\mu Ni}{l}\right)A \tag{4}$$
$$\phi = \frac{Ni}{\left(\frac{l}{\mu A}\right)} = \frac{\mathbb{F}}{\mathbb{R}} \tag{5}$$
Note: $\mathbb{F} = Ni = MMF$  - **it is NOT a force**

Other note: $\mathbb{R} = \frac{l}{\mu_0\mu_rA} = \text{ Reluctance} = \frac{A t}{Wb}$
It is analogous to resistance.
It can have an inverse: $\text{Permenace} = \mathbb{P} = \frac{1}{\mathbb{R}}$.

```tikz
\usepackage{circuitikz}

\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(0,0)
		to[vsource, V=$Ni$]++(0,2)
		to[short, i=$\phi$]++(3,0)
		to[generic, l="$R$"]++(0,-2)
		--++(-3,0);
	\end{circuitikz}
\end{document}
```
These elements can be used similar to elements of an electric circuit.
$$\mathbb{R}_{series} = \mathbb{R}_{S1} + \mathbb{R}_{S2}$$
$$\mathbb{R}_{parallel} = \frac{\mathbb{R}_{P1}\mathbb{R}_{P2}}{\mathbb{R}_{P1} + \mathbb{R}_{P2}} = \left[\frac{1}{\mathbb{R}_{P1}} + \frac{1}{\mathbb{R}_{P2}}\right]^{-1}$$
The flux linkage of the magnetic circuit occurs $N$ times.
$$\lambda = N\phi = N$$
It links back on itself, so we have $N^2$, then substituting in $4$:
$$\lambda = N^2\left(\frac{\mu Ni}{l}\right)A = \frac{N^2 \mu i A}{l}$$
Inductance:
$$L = \frac{\lambda}{i}\ [H] = \frac{N^2\mu A}{l} = \frac{N^2}{\frac{l}{\mu A}}$$
$$L = \frac{N^2}{\mathbb{R}}\tag{6}$$
If you have the inductance, you can calculate the voltage. The voltage in the coil is related to the time rate of change of the current:
$$e = \frac{d\lambda}{dt} = L\frac{di}{dt}$$
So, in a circuit, we could have some. The inductor's reluctance back onto the circuit. 
```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(0,0)
		to[vsource, invert]++(0,2)
		to[short, i=$i$]++(1,0)
		to[R=$R$]++(2,0)
		to[inductor, l=$L$, i<_="$R$"]++(0,-2)
		--++(-3,0);
	\end{circuitikz}
\end{document}
```
$$V = iR + L\frac{di}{dt}$$
Determine MEC (Magnetically Equivalent Circuit)

#### Fringing Flux
If there is an air gap as seen below, there is some fringing, where the magnetic field widens around the mean path.

![[Pasted image 20261012210143.png]]

The new area is $A_{eff} = (w + g)(d + g)$
Where $w$ and $d$ are the dimensions of the cross sectional area.

There is also some "leakage flux" from the windings.
This can be avoided by putting the windings as closely together as possible. You want the flux to flow through the core to the air gap.


#### Example
![[Pasted image 20261012214738.png|797]]
Relative permeability is $\mu_r =1200$


The magnetically equivalent circuit is:
```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(0,0)
		to[vsource, V = $Ni$, invert]++(0,2)
		to[generic, i>_=$\phi_1$, l=$\mathcal{R}_{bafe}$]++(3,0)
		coordinate(B)
		node[circ, label=above:$b$]{}
		to[generic, i_<=$\phi_2$, l=$\mathcal{R}_{bcde}$]++(3,0)
		to[vsource, V = $Ni$]++(0,-2)
		--++(-6,0);
	
		\draw(B)
		to[generic, l=$\mathcal{R}_{be}$]++(0,-1)
		node[label=left:$\phi_g$]{}
		to[generic, l=$\mathcal{R}_{bg}$]++(0,-1)
		node[circ, label=below:$e$]{};
		
	\end{circuitikz}
\end{document}
```

$$\mathcal{R}_{bafe} = \frac{l_{bafe}}{A_{coil}\mu_0\mu_r} = \frac{0.52(3)}{0.02^2 (4\times 10^{-7})(1200)} = 2.586 \times 10^6 \left[\frac{At}{Wb}\right]$$
$$\mathcal{R}_{be} = \frac{l_{be} - l_g}{A_{coil}\mu_0\mu_r} = \frac{0.515}{0.02^2(4\pi \times 10^{-7})(1200)} = 0.82\times 10^{6}\left[\frac{At}{Wb}\right]$$
$$\mathcal{R}_{g} = \frac{l_{g}}{A_{coil}\mu_0} = \frac{5\times 10^{-3}}{0.02^2(4\pi \times 10^{-7})} = 9.95\times 10^{6}\left[\frac{At}{Wb}\right]$$
The core is very big compared to the gab, but the gap's $\mathcal{R}$ is **much** larger since there is no $\mu_r$.

$$\phi _g = \phi_1 \phi_2 \tag{a}$$
Using "KCL" to solve for $\phi_{1,2}$
$$\phi_1\mathcal{R}_{bafe} + \phi_g(\mathcal{R}_{be} + \mathcal{R}_g) = N_1i_1\tag{b}$$
$$\phi_2\mathcal{R}_{bcde} + \phi_g(\mathcal{R}_{be} + R_{g}) = N_2i_2$$
$$\phi_1 = \phi_2 = 2.07\times 10^{-4} [Wb]$$
$$\phi_g = 4.134\times 10^{-6} [Wb]$$

$$B_g = \frac{\phi_g}{A} = \frac{4.13\times 10^{-4}}{0.02^2} = 1.034 [T]$$
Note: $B \leq 2.5T$ when using normal materials never more then $2.5T$. That's only really possible in superconductors.

$$H_g = \frac{B_{g}}{\mu_0} = 0.81\times 10^{6}\left[\frac{A}{m}\right]$$

# Class 4
## Magnetic Energy
Recalling the previous example
$$\phi_g = 4.134\times 10^{-6} [Wb]$$
$$\phi_1 = 2.07\times 10^{-4}[Wb]$$
$$\mathcal{R}_{g} = 9.95\times 10^{6}\left[\frac{At}{Wb}\right]$$

$$\mathcal{R}_{bafe} = 2.586 \times 10^6 \left[\frac{At}{Wb}\right]$$
The total energy in an inductor
$$E_m = \frac{1}{2}Li^2 \tag{7}$$
Since:
$$L = \frac{N^2}{\mathcal{R}}\tag{6}$$
Putting $6$ into $7$
$$W_m = \frac{1}{2}\frac{N^2i^2}{\mathcal{R}}\tag{8}$$
from $8$
$$Ni = \phi\mathcal{R} \tag{5}$$
$5$ into $8$:
$$W_m = \frac{1}{2}\phi^2\mathcal{R} \tag{9}$$
From the previous example
For airgap:
$$E_g = \frac{1}{2}\phi^2_g \mathcal{R}_g = \frac{1}{2} (4.13\times 10^{-6})^2\times 9.95\times 10^{6} = 0.85[J]$$
For core:
$$E_c = \frac{1}{2}\phi_1^2 \mathcal{R}_{bafe} = \frac{1}{2}(2.07\times 10^{-4})^2\times 2.58\times 10^{6} = 0.055[J]$$
For electric machines, the airgap is minimized so that you don't have to make as many windings or try to put so much energy into the device.

Reluctance is the ratio of MMF to flux.
A magnet wants to be attracted to the fridge because it takes less energy to go through the steel than the air. There is less reluctance. 

## 2.1 Reluctance Force
We looked at Lorentz Force in Class 1 and 2
$$\vec{F} = \vec{l}\times \vec{B}$$
However, we'll now examine reluctance force, consider the actuator shown:
![[Pasted image 20261012223218.png]]

This is an **Axial Reluctance Force Actuator**
For this example, we'll neglect core reluctances, leakage, and fringing. The actuator has:
Mass of core #2: $0.5kg$
Resistance of coil: $R = 5\ohm$
Width of cores: $w = 0.02m$
Depth of cores: $d = 0.02m$
Bearing thickness: $l_g = 0.001$
Bearing relative permeability: $\mu_r =1$ 
Spring rest position: $x_0 = 0.007m$
Spring constant: $K = 5000 \frac{N}{m}$
Number of turns: $N = 100 \text{turns}$

```tikz
\usepackage{circuitikz}

\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(0,0)
		to[vsource, invert]++(2,0)
		to[generic, l=$\mathcal{R}_g(x)$, i>^=$\phi_T$]++(2,0)
		coordinate(A)
		to[generic, a=$\mathcal{R}_l$]++(0,2)
		--++(-4,0)
		--++(0,-2);
		
		\draw(A)
		to[generic, l=$\mathcal{R}_l$]++(0,-2)
		--++(-4,0)
		--++(0,2);
		
	\end{circuitikz}
\end{document}
```
Equivalently...
```tikz
\usepackage{circuitikz}

\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(0,0)
		to[vsource, invert]++(2,0)
		to[generic, a=$\mathcal{R}_g(x)$, i>^=$\phi_T$]++(2,0)
		--++(0,-1)
		to[generic, l=$\mathcal{R}_{equiv}$]++(-4,0)--++(0,1);
		
	\end{circuitikz}
\end{document}
```

$$\mathcal{R}_{equiv} = \frac{\mathcal{R}_l\mathcal{R}_l}{\mathcal{R}_l + \mathcal{R}_l} = \frac{\mathcal{R}_l}{2}$$
$$\mathcal{R}_T(x) = \mathcal{R}_g + \frac{\mathcal{R}_l}{2} = \frac{x}{\mu_0Wd} + \frac{l_g}{2\mu_0wd } = \frac{2x + l_g}{2\mu_0 wd}\tag{10}$$

Total energy:
$$E(x) = \frac{1}{2}\phi_T^2\mathcal{R}_T(x)\tag{11}$$
Force tries to minimize energy
$$F_R = -\nabla E_m \tag{12}$$
$$F_R = -\frac{dE_m}{dx}\tag{13}$$
With $\phi_T$ fixed,
$$F_R = -\frac{1}{2} \phi_T^2 \frac{d\mathcal{R}_T}{dx}$$
This is called the **Reluctance Force Equation**
Nature wants to minimize the relutance energy of the fields.

Recall $6$:
$$L = \frac{N^2}{\mathcal{R}}$$
So we can re-write reluctance force in terms of inductance.
$$\mathcal{R}_T = N^2[L(x)]^{-1}$$
We have to be careful because we want to take the derivative of reluctance with respect to x.

$$\frac{d\mathcal{R}_t}{dx} = N^2[L(x)]^{-2}\frac{dL}{dx}$$
$$\frac{dR_T}{dx} = -\frac{N^2}{L(x)^2}\frac{dL}{dx} \tag{15}$$

Note: 
$$\lambda = N\phi_T\tag{16}$$
and $\phi_T = \frac{\lambda}{N}$

$15, 10 \to 16$
$$F_R = -\frac{1}{2} \frac{\lambda^2}{N^2}\left(\frac{-N^2}{L(x)^2}\right)\frac{dL}{dx}$$
$$F_R = \frac{1}{2} i^2  \frac{dL}{dx} \tag{17}$$
This is the Reluctance force equation again

$$E =\frac{1}{2} \phi^2 \mathcal{R}_T$$
as $x$ shrinks, so does $\mathcal{R}$.

And, $L = \frac{N^2}{\mathcal{R}}$, $L$ increases.

Force tries to reduce reluctance, to minimize the air gap and energy.
Can we use this reluctance force to **increase** the air gap based on this device?

We might initially think to reverse the current which reverses the flux. However, the current and therefore flux is squared. It's direction does not matter.

That is why the spring is there. A mechanical means to open the air gap.

From $10$ we have
$$\mathcal{R}_T(x) = \frac{2x + l_g}{\mu_0 wd 2} = \frac{2(0.002) + 0.001}{(4\pi \times 10^{-7})(0.02)(0.02)(2)} = 4.97\times 10^{6} \left[\frac{At}{Wb}\right]$$
$$i = \frac{V}{\mathcal{R}}$$
We can use $17$ to get the current. The downside, is that has the derivative of the inductance with respect to $x$. We have the reluctance with regard to $x$. It is easier to take the derivative of, but recall that:
$$Ni = \phi\mathcal{R}$$
$$\phi^2= \frac{(Ni)^2}{\mathcal{R}^2}$$
This will get quite messy.

If $x = 0.002m$, what voltage will be needed to hold core #2 against the force of the spring?
$$F_{spring} = -K(x-x_0) = 5000(x-x_0) = 25N$$
Equilibrium at $\sum F =0$ 
$$F_{\mathcal{R}} = -25N = \frac{1}{2}i^2 \frac{dL}{dx}$$
We first need $\frac{dL}{dx}$
We need inductance for this:
$$L(x) = \frac{N^2}{\mathcal{R}(x)} = N^2 \mu_0 (w)(d)(2)(2x + l_g)^{-1}$$
$$\frac{dL}{dx} = -N^2 \mu_0 (wd)(2)(2x - l_g)^{-2} (2)$$
$$= \frac{N^2 \mu_0 (wd)(4)}{(2x + l_g)^2}|_ {0.002} = \frac{-100^2 (4\pi \times 10^{-7})(0.02^2)(4)}{(2 (0.002) + 0.001)^2} = -0.804\left[\frac{H}{m}\right]$$
Now, we can use the current to find the voltage:
$$i = \sqrt{\frac{2F_{\mathcal{R}}}{\frac{dL}{dx}}} = \sqrt{\frac{2(-25)}{-0.804}} = 7.89A$$
Can the part inside the sqrt be a negatice? No, it cannot. It cannot be complex, it is just a DC current. Sign convention should keep the value in the sqrt positive.
$$V = iR = 7.89A(5\Omega) = 39.4V$$

Most machines that create a force use magnetic. Why is this? Why not use electrostatics?
Capacitors can produce force... so why not?
$$F = \frac{-4N^2 wd \mu_0}{2(2x + lg)^2} i ^2$$

Note: 
$F_{magnetic} \propto ()4\pi\times 10^{-7} = ()125\times 10^{6}$
$F_{electric}  \propto () 8.856 \times 10^{-12}$
$$\frac{\mu_0}{E_0} = 14.1929$$
Magnets provide a constant of almost 15 times greater. 

#### Lateral Reluctance Force Actuator
![[Pasted image 20261012234543.png]]

In this example $\mu_r = 1$
The flux will follow the path through the steel. at $x$ the width through the steel will be changing wrt $x$.
```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(3,0)
		to[vsource, invert]++(-3,0)
		to[generic, l=$\mathcal{R}_L$]++(0,2)
		to[short, i^>=$\phi$]++(3,0)
		to[generic, l=$\mathcal{R}_R$]++(0,-2);
		
	\end{circuitikz}
\end{document}
```

Function for reluctance with respect to the changing $x$.
$$\mathcal{R}_T(x) = \mathcal{R}_L + \mathcal{R}_R = \frac{l_g}{\mu_0 wd} + \frac{l_g}{\mu_0(w-x) d} = \frac{l_g}{\mu_0 d}\left[\frac{1}{w} + \frac{1}{w - x}\right]$$

Find the voltage to hold the bar at $x= 0.07m$.
$$F_{spring} = -K(x - x_0) = -50(0.07 - 0.1) = 1.5N$$
$$F_R = \frac{1}{2} \frac{di}{dx} i^2$$
$$L = \frac{N^2}{\mathcal{R}_T} = \frac{N^2 \mu_d}{l_g[w^{-1} + (w-x)^{-1}]}$$
$$= \frac{N^2 \mu_0 d}{l_g}[w^{-1} + (w-x)^{-1}]^{-1}$$
$$\frac{dL}{dx} = -\frac{N^2\mu_0 d}{l_g}\left[w^{-1} + (w-x)^{-1}\right]^{-1}\left[-(w-x)^2(-1)\right] = \frac{-N^2 \mu_0 d}{l_g}\frac{1}{\left(\frac{1}{w} + \frac{1}{w -x}\right)^2(w-x)^2}$$
$w - x = 0.03$

$$= \frac{-(600)^2 (4\pi \times 10^{-7}) (0.1)}{0.005}\frac{1}{\left(\frac{1}{0.1} + \frac{1}{.1 -.003}\right)^2(.003)^2} = -5.35\left[\frac{H}{m}\right]$$
$$F_{\mathcal{R}} = \frac{1}{2}\frac{dL}{dx}i^2$$
$$i = \sqrt{\frac{2(-1.5)}{-5.35}} = 0.75A$$
$$V = iR = 0.75 \times 5 = 3.75V$$

