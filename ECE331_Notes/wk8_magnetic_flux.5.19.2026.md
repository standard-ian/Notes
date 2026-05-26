## Class 15
#### 4.3 Magnetic Flux
$$\vec{B} = \text{magnetic flux density}$$
The magnetic flux through some area $S$ is:
$$\Phi_B = \int_S\vec{B}\cdot d\vec{s}\ \ \left[Wb\text{  (Webbers) or } Tm^2\text{ (Tesla Meter Squared)}\right]$$ 
Magnetic flux gives the total magnetic field through an area.
$$B = \frac{\Phi_B}{A} = \frac{\text{flux}}{\text{area}}$$
![[Pasted image 20260521061806.png]]

##### Gauss's Law For Magnetic Flux
$$\Phi_B = \int_s\vec{B}\cdot d\vec{s}$$
For a **closed surface** around a source, the flux is going to be 0, because any field leaving also re-entering. Single poles cannot exist by themselves.

We can use divergence theorem to write, for a closed surface:
$$\oint_C\vec{B}\cdot d\vec{s} = \int_V\nabla \cdot \vec{B}\ dv = 0$$
Or the divergence is zero:
$$\nabla \cdot \vec{B} = 0$$

#### 4.4 Postulates of Magnetostatic Fields in Free Space
##### Differential Form
$$\nabla \cdot \vec{B} = 0$$
$$\nabla \times \vec{B} = \mu_0\vec{J}$$
Comparing to Electrostatic fields, where the divergence is non-zero and the curl **is zero**
##### Integral Form
$$\oint\vec{B}\cdot d\vec{s} = 0$$
$$\oint\vec{B}\cdot d\vec{L} = \mu_0I$$

##### Example
Calculate the flux through a loop placed next to an infinitely long wire.

The wire is in the $z$ direction. We know that the field circulates around the wire by the right hand rule. Since current is flowing up, the field comes out of the page on the left and into the page on the right.

On the right side of the wire, there is a rectangle, distance $a$ away from the conductor.

The rectangle has a dimension of $w$ (height) and $b$ (width) 

$$\phi_B = \int_S\vec{B}\cdot d\vec{s}\ \ [Wb]$$
###### Step 1:
We first find the equation for $\vec{B}$, then integrate that over the surface to find the flux.

Using Ampere's Law to find the field:
$$\oint\vec{B}\cdot d\vec{l} = \mu_0I$$
$$\vec{B} = B_\phi\hat{\phi}$$
$$d\vec{l} = r\hat{\phi}\ d\phi$$
Ampere's law with these quantities
$$\int_0^{2\pi}(B_\phi\hat{\phi})\cdot(\hat{\phi}r\ d\phi) = \mu_0I$$
$$= \int_0^{2\pi} B_\phi r\  d\phi = \left[B_\phi r\phi\right]_0^{2\pi}$$
$$\mu_0I = B_\phi 2\pi\ r\Longrightarrow B_\phi(r) = \frac{\mu_0I}{2\pi r}$$
###### Step 2:
Now, we can use this $\vec{B }$ to find the flux $\Phi_B$
The horizontal limit is the distance of the bottom left corner $a$ to the bottom right $a + b$ in the x direction 
$$\Phi_B = \int_{-\frac{w}{2}}^\frac{w}{2}\int_a^{a+b}B\cdot dr\ dz$$
$$d\vec{s} = dr\ dz$$
Substituting in $\vec{B}_\phi(r)$
$$\Phi_B = \int_{-\frac{w}{2}}^\frac{w}{2}\int_a^{a+b} \frac{\mu_0I}{2\pi r}\ dr\ dz = \frac{w\ \mu_0 I}{2\pi}\int_a^{a + b}\frac{1}{r} dr = \frac{w\ mu_0 I}{2\pi}\ln\left(\frac{b+a}{a}\right)$$

Since the height is not changing, the rectangle is centered evenly over $x$ axis, and there is no $z$ term in the integrand, the outer integral just becomes $w$.

#### Magnetic Vector Potential (MVP)

Since 
$$\nabla \cdot \vec{B} = 0\tag{1}$$
Recall
$$\nabla \cdot (\nabla \times \vec{A}) = 0\tag{2}$$
We can therefore write
$$\vec{B} = \nabla \times \vec{A}\tag{3}$$
Aheronof-Bohrn Effect for $\vec{A}$ being read.
$\vec{A}$ being magnetic potential. It is often said this has no physical meaning - you can't measure it with a meter.

One actual physical meaning is:
$$\Phi_B = \int\vec{B}\cdot d\vec{s}\tag{4}$$
$(3)\to(4)$
$$\Phi_B = \int(\nabla \times \vec{A})\ ds\tag{5}$$
Using Stokes
$$\Phi = \oint_C \vec{A} \cdot d\vec{l}$$
The integral of $\vec{A}$ around a closed path gives you the flux.

#### 4.5 Magnetic Force
Recall, for electric fields:
$$\vec{F}_E = q\vec{E}$$
For magnetic field
$$F_M = q\vec{v}\times \vec{B}$$
$\vec{v}=$ velocity vector for the charge

These premises give the **Lorentz Force Equation**
$$\vec{F} = \vec{F}_E + \vec{F}_M = q\left[\vec{E} + (\vec{V}\times \vec{B})\right]$$
##### Example
Consider a conductor, and a little slice of that conductor with charge flowing through. It has a surface $dS'$, a cross section normal to the little slice $dl'$.

$N$ electrons per unit volume
Volume $dv' = dS'dl'$
Number of charges in $dv'$ is $Ndv'$
Differential magnetic force from 
$$d\vec{F}_M = (dv')Nq\vec{B}\times \vec{B}$$
Recall current density
$$\vec{J} = \rho_V\vec{v}$$
$$J = Nq\vec{V}$$
So
$$d\vec{F}_M = (\vec{J}\times \vec{B})\ dv'$$
$$\vec{F}_M = \int_V(\vec{J}\times \vec{B})\ dv'$$

For a current filament:
$$I = \vec{J}\cdot d\vec{S}$$
$$Idl' = \vec{J}dv'$$
So
$$d\vec{F}_M = Id\vec{l'}\times \vec{B}$$
$$\vec{F}_M = \int_a^bId\vec{l}\times \vec{B}$$
The force is orthogonal to the direction of the current and the direction of the field. 

Need the direction of the conductor, crossed with the B, giving the force $90^\circ$ to the direction of both of them.
## Class 16
#### Example (Force)

Imagine an infinitely long wire along the $z$ axis with $I_1 = 100A$  next to a loop $x=1mm$ away,  with current $I_2 = 5A$ 

The loop is $w=9mm$ by $h=1m$

##### a. $\vec{B}$ due to $I_1$
Since we have an infinitely long wire, we can use Ampere's law
$$\int_0^{2\pi}\vec{B}\cdot d\vec{l} = \mu_0I_1$$
The field circulates
$$d\vec{l} = \hat{\phi}rd\phi,\ r=radius$$
$$\int_0^{2\pi}\vec{B}\cdot \hat{\phi}r\ d\phi = \mu_0I_1\Longrightarrow B_\phi(r) = \frac{\mu_0I_1}{2\pi r}$$
##### b. Force on the Wire Loop
We can find the force of the wire on the loop using:
$$\vec{F} = \int I_{2}\ d\vec{l}\times \vec{B}_{1}$$
$$d\vec{l}_2 = \hat{z}\ dz$$
$$\vec{B}_1(r) = \frac{\mu_0I_1}{2\pi r}$$
$$d\vec{l}_2 \times B_1 = \left|\begin{matrix}\hat{r} & \hat{\phi} & \hat{z}\\ 0 & 0 & 0\\ 0 & \frac{\mu_0I_1}{2\pi r} & 0 \end{matrix}\right| = \hat{r}\left(-\frac{\mu_0I_1}{2\pi r}\right)\ dz + \hat{\phi}0 + \hat{z}0$$
At this point, we can see that the $w=9mm$ sides of the loop, which are equal distance from $I_1$ with current running in equal and opposite directions. 

Pointing fingers in direction of $I_2$ bending in direction of $\vec{B}_1$, we can see the thumb points in the direction of the force. $+z$ for the lower leg where the current flows towards $I_1$, and $-z$ for the upper leg where it flows away, so they cancel one another out.

We need to then take the integral for the left and right legs.

For the inner side:
$$F_1 = I_2\int_{-0.5}^{0.5}-\frac{\hat{r}\mu_0I_1}{2\pi x} dz = \frac{-I_2I_1\mu_0\hat{r}}{2\pi x} = -\frac{(5)(-100)\mu_0\hat{r}}{2\pi (0.001)}$$
$$F_1 = \hat{r} 0.1\ [N]$$
For the outer:
$$F_1 = I_2\int_{-0.5}^{0.5}-\frac{\hat{r}\mu_0I_1}{2\pi x + w} dz = \frac{-I_2I_1\mu_0\hat{r}}{2\pi (0.01)} = -\frac{(-5)(-100)4\pi\times 10^{-7}}{2\pi(0.01)} = -0.01\hat{r}\ [N]$$

#### Why is Force the Cross of $I\times \vec{B}$ and not the Other Way? 
Force is in the direction of lowest energy. 

#### 5.0 Transmission Lines
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[sV, l=$V_g$]++(0,2)
	--++(1,0)
	node[circ, label=above:$A_p$]{}
	--++(2,0)
	node[circ, label=above:$B_p$]{}
	--++(1,0)
	to[generic, l=$Z_l$]++(0,-2)
	--++(-1,0)
	node[circ, label=below:$Z{=}0$]{}
	--++(-2,0)
	node[circ, label=below:$Z{=}l$]{}
	--++(-1,0);
	
	\draw[<->](1,-0.5)--(3,-0.5);

	\draw(2,-0.75)	
	node[]{$l$};
	
	\draw[<->](1,0.25)--(1,1.75);
	\draw(1,1.75)
	++(0,-0.75)
	node[label=left:$V_i$]{};
	
	\draw[<->](3,0.25)--(3,1.75);
	\draw(3,1.75)
	++(0,-0.75)
	node[label=left:$V_L$]{};
	
\end{circuitikz}
\end{document}
```
Consider the case when the voltage on the left is:
$$V_g (t) = V_0\cos(\omega t)\tag{1}$$
Where $\omega = 2\pi f$.

Assume circuit travels at the speed of light $c = 3\times 10^{8}\frac{m}{s}$

Time to travel length $l$
$$t_d = \frac{l}{c}$$
So the voltage at $B_p$ 
$$V_L(t) = V_0\cos\left[\omega\left(t = \frac{l}{c}\right)\right] = V_0\cos[\omega t - \phi_f]\tag{2}$$
Where $\phi_f = \frac{\omega l}{c}$ 
##### Example
$f = 1000Hz$
$l = 0.05m$
at $t=0$

$$V_g(0) = V_0$$
$$V_L(0) = V_0\cos\left[\frac{-2\pi 1000 \times 0.05}{3\times 10^{8}}\right] = V_0(0.99999999994)\approx V_0$$
But if $l=20\times 10^{3}m$ at $f=1000Hz$
$$V_L(0) = 0.91V_0$$

or if $l=0.05m$ and $f=1GHz$
$$V_L(0) = 0.5V_0$$

The phase factor determines impact
$$\phi_f = \frac{\omega l}{c} = \frac{2\pi f l}{c}$$
$c = \lambda f$
$\frac{1}{\lambda} = \frac{f}{c}$
$$\phi_f= 2\pi\frac{l}{\lambda}$$



