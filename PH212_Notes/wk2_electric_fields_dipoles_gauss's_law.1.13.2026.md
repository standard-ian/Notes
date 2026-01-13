## Homework 1
#### Electric Fields
The force exerted at a certain point in relation to a charge per unit charge can be used to express the notion of an **Electric Field**

$$\vec{E}_1 \equiv \frac{\vec{F}_{12}}{q_2} = k\frac{q_1}{r^2}\hat{r}$$
The force on $q_1$ by $q_2$ is entirely dependent on the distance between the charges.

The direction of the force is always radial, pointing outward from the source of the charge.

The field strength decreases exponentially as the distance between the point charge and the source increases.

#### Electrical Dipole
A system of electric charges with the same magnitude, but opposite charge.

To calculate the electric filed produced by the dipole, take the vector sum of the fields (electromagnetic force) of each charge.

#### Electric Field Calculation Example
![[Pasted image 20260112150133.png]]
In the above example, the mass of the ball is 0.00285kg, and the angle $\theta$ is $9.80^\circ$ 
$L=1m$ 
$q=1.35C$

We are looking for the horizontal component of the tension, which is acting in direct opposition to the electric field's force ($N$).

In this case $E=\frac{tan(\theta)mg}{q}$ Because $tan(\theta) = \frac{qE}{mg}$ (the ratio of the field force to the gravitational force). 

Because we want this force per unit charge (Coulomb) we divide by $q = 1.35C$

The answer is $E=3.57\times 10 ^{-3}$

#### Electric Field of 2 Plates in a Capacitor Example
Given 2 plates or radius 7.22cm, with equal and opposite charges of magnitude $8.452\micro C$, assuming the separation distance is small relative to the diameter of the plates, calculate $E$ between them.

$8.452\micro C = 8.452\times 10^{-6}C$

For parallel plate capacitor with uniform charge distribution:
**The equation for electric field of parallel plates is $E = \frac{\sigma}{\epsilon_0}$, where $\sigma$ is the surface charge density and $\epsilon_0 = 8.854\times 10^{-12} \frac{C^2}{Nm^2}$**

$\sigma = \frac{Q}{A} = \frac{Q}{\pi r^{2}}$ (Charge per area)
$\sigma = \frac{8.452\times 10^{-6}}{\pi \times (0.0722m)^2}$
$\sigma = \frac{8.452\times 10^{-6}C}{0.01638m^2}$
$\sigma = 5.161\times 10^-4 C/m^2$

So $E = \frac{5.161\times 10^{-4}}{8.854\times 10^{-12}} = 5.83\times 10^7 N/C$


The plates are slowly pulled apart, doubling the separation distance. What changes occur with the field between the plates?
Electric field is not dependent on the distance between plates.
#### Example: Electric field at a Distance from Center of Disk
Given a disk of radius $R=9.54cm$ lying in the $zy$ plane with a surface charge density of $\sigma = 4.81 \times 10^{-6} C/m^2$ evaluate the electric field $E(x)$ produced by this disk along the $x$ axis at point $P = (1.46, 0.00)cm$ 

**For a uniform charged disk of radius $R$ with surface charge density $\sigma$, the electric field along the perpendicular axis at distance $x$ from the center is:**
$$E(x) = \frac{\sigma}{2\epsilon_0} \times [1-\frac{x}{\sqrt{x^2 + R^2}}]$$
The above equation comes from integrating the contributions of all charge elements on the disk using Coulombs Law.
A small charge element $dq$ on the disk at distance $r$ from the center creates a field $dE$ at point $P$ on the axis.

Divide the disk into concentric ring elements of radius $r$ and with width $dr$.  A ring radius $r$ has:
###### Part 1: Field form individual Ring Elements
Area: $dA = 2\pi r\ dr$
Charge: $dq = \sigma dA = \sigma(2\pi\ r\ dr)$

###### Part 2: Field Contribution
For a point on the axis at distance $x$ from the center, each element of the ring is at distance $\sqrt{x^2 + r^2}$ from point $P$, and only the $x$  component of the field is not canceled by symmetry. The field contribution from the ring is:
$dE_x = \frac{k dq}{x^2 + r^2}\times cos(\alpha)$
where $cos(\alpha) = \frac{x}{\sqrt{x^2 + r^2}}$ is the angle factor projecting onto the $x$-axis.

Substituting the ring elements from part 1:
$dE_x = \frac{k\sigma 2\pi r dr}{x^2 + r^2} \times \frac{x}{\sqrt{x^2 + r^2}} = \frac{k\sigma 2 \pi xr dr}{(x^2 + r^2) ^ \frac{3}{2}}$

###### Part 3: Integrate over the Disk
$E(x) = \int_{0} ^ {R} \frac{k\sigma 2 \pi xr dr}{(x^2 + r^2) ^ \frac{3}{2}} = 2\pi k \sigma x \int_0^R \frac{r}{(x^2 + r^2)^\frac{3}{2}} dr$
This evaluates to $E(x) = 2\pi k \sigma[1 - \frac{x}{\sqrt{x^2 + R^2}}]$ using substitution $u = x^2 + r^2$

Since $k = \frac{1}{4\pi\epsilon_0}$, we have $2\pi k = \frac{1}{2\epsilon_0}$
$E(x) = \frac{\sigma}{2\epsilon_0} \times [1-\frac{x}{\sqrt{x^2 + R^2}}]$

In the example problem:
Disk Radius: $R= 9.54cm  = 0.0954m$
Surface charge density: $\sigma = 4.81 \times 10^{-6} C/m^2$
Point P is at $x = 0.0146m$ from the center
The disk list in $zy$, perpendicular to $P$

**Since we'd rather work with $k$, lets use $E(x) = 2\pi k \sigma[1 - \frac{x}{\sqrt{x^2 + R^2}}]$**

$$E(x) = 2\pi \times (8.988\times 10^9) \times (4.81\times 10^-6) \times (1 - \frac{0.0146}{\sqrt{0.0146^2 + 0.0954^2}}) = 2.31 \times 10^{5} N/C$$

#### Electric Field in Relation to a Rod
Where $L$ is the length of the rod
###### Perpendicular
where $r$ is the distance from the rod
$E = \frac{2k\lambda}{r} \cdot \frac{L}{\sqrt{L^2 + 4r^2}}= \frac{\lambda}{2\pi\epsilon_0 r} \cdot \frac{L}{\sqrt{L^2 + 4r^2}}$
###### On the Axis
where $x$ is the distance from the point to the nearest end of the rod.
$E = k\lambda\left[\frac{1}{x} - \frac{1}{x+L}\right]= \frac{\lambda}{4\pi\epsilon_0}\left[\frac{1}{x} - \frac{1}{x+L}\right]$
###### Infinite Rod
$E = \frac{\lambda}{2\pi\epsilon_0 r} = \frac{2k\lambda}{r}$
###### Point Charge Limit
$E \to \frac{kQ}{r^2}$

## Class 1
## Class 2
#### Electric Field Representation
$$\vec{E} = k\frac{q}{r^2} \hat r$$
We can imagine an electric field as a point with lines radiating out in all directions from the point.
If we imagine a sphere around the point, the charge lines pass through it at regular intervals
As the surface area of the sphere increases, the surface area of the sphere increases, therefor the density of the lines passing through decreases.
This is the same effect that the magnitude of the electric field.
$$E \propto \frac{N}{4\pi r^2}$$
Coulombs Law is often re-written to reflect this relationship:

$$E = \frac{1}{4\pi \epsilon_0}\frac{q}{r^2}$$ 
We can make the following substitution, $N\equiv \frac{q}{\epsilon_0}$, resulting in $E = \frac{N}{4\pi r^{2}}$


The number of field lines represents the magnitude of the charge that produces an electric field throughout space, whose direction is given by the direction of the lines and who's magnitude is given by the density of the lines.


#### Electric Flux
Quantifies the number of field lines through a surface

The model/representation in the previous example can be expanded. 
$E = \frac{1}{4\pi \epsilon_0}\frac{q}{r^2}$ or $E = \frac{N}{A}$ where $N \equiv \frac{q}{\epsilon_0}$ and $A = 4\pi r^2$.

Now we introduce **flux** ($\Phi$) where $\Phi \propto N = EA$ Phi is equal to the poduct of the electric field and the surface area of the sphere.

Given flux of field lines through surfaces as below:
![[Pasted image 20260112212005.png]]
We represent the flux as $\Phi  = \vec{E}\cdot\vec{A}$ when each surface is defined as a vector who's direction is perpendicular to the plane, and who's magnitude is equal to the surface area.

#### Gauss's Law

