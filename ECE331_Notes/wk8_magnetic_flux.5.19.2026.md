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

Imagine a wire with $I_1 = 100A$  next to a loop with current $I_2 = 5A$ 
We can find the force of the wire on the loop using:
$$F = \int I_{II}\ d\vec{l}\times \vec{B}_{I}$$
