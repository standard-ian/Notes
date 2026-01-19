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
#### Two View of Particle Interaction
Newtonian: Particles exert a force *directly* on other particles.
Field: Charged particles *distort* space, creating a field which penetrates all of space, and carries energy.
Another particle "knows" about the other particle in the field, so a force is exerted *indirectly*.

#### Relationship of Electric Force/Electric Field
Suppose a positive charge $q$ is at some $(x,y,z)$ location in space, and experiences an electric force.
$$\vec{E}(z,y,z) = \frac{\vec{F}_{on\ q}}{q}\color{orange}\frac{newton\ (N)}{coulomb\ (C)} $$ 
When representing the Electric field vector ($\vec{E}$) and the force vector ($\vec{F}$) their length cannot be compared and they are totally arbitrary in terms of length.
#### Electric Field of a Single Point Charge
From $\vec{E} = \frac{\vec{F}}{q}$, we can substitute in Coulomb's Law $\vec{F} = k\frac{q_1q_2}{r^2}\hat{r}$ to get $\vec{E} = k\frac{q_1 q_2}{r^2 q_2}\hat{r}$, then cancel $q_2$, to get:
$$\vec{E}(r) = k\frac{q}{r^2} \hat{r}$$ Where $q$ is the source charge, it is the source of the $E$ field.
#### Example
What is the electric field strength of the proton in a hydrogen atom on the electron, where the distance between them is $0.053\times 10^{-9} M$  and the charge strength of the proton is $e = 1.602 \times 10^{-19}$
$$\vec{E} = 8.988\times 10^9 \frac{1.602\times 10^{-19}}{(0.053\times 10^{-9})^2}(+1) = 5.13\times 10^{11}N/C$$
We can then find the electric force with $\vec{E} = \frac{\vec{F}}{q} \to \vec{F} = \vec{E}q$
$$\vec{F} = 5.13\times 10^{11} (1.602\times 10^-19) = 8.21\times 10^{-8}N$$
#### Multiple Charges and Superposition
The electric field at a point $P$ is the vector sum of the electric fields from all charges:
$$\vec{E}_P = \Sigma \vec{E}_{iP}$$
#### Electric Field from Continuous Charge Distribution
We can use numerical analysis methods to compute the electric field from charge distributions on some basic geometries like rods, rings, and disks.
###### Finite Line of Charge
$$\vec{E} = \frac{kQ}{r\sqrt{(\frac{L}{2})^2 + r^2}}\hat{r}$$
###### Infinite Line of Charge
$$\vec{E} = \frac{2k\lambda}{r}\hat{r}$$
###### Ring of Charge Along Line Through Center
$$\vec{E} = \frac{Qkz}{(R^2 + z^2)^{\frac{3}{2}}}\hat{k}$$
###### Disk of Charge Along Line Through Center
$$\vec{E} = sign(z) 2\sigma \pi(1-\frac{z}{\sqrt{R^2 + z^2}})\hat{k}$$
###### Infinite Sheet of Charge
$$\vec{E} = sign(z)\frac{\sigma}{2\epsilon_0}\hat{k}$$
#### Example: Deriving the Formula for Charge of a Finite "Line" of Charge
We can imagine breaking up a line of charges into a bunch of discrete charges. The total charge will be the sum of each of those pieces.
![[Pasted image 20260113123202.png]]
1. Establish coordinate system
2. ID point $P$ where we want to find the specific $\vec{E}$
3. Break up the line of charge $Q$ into smaller parts of charge $\Delta Q$
4. Draw the field at point $P$ for one or two small pieces of charge. ID distance and angles needed.
5. Look for symmetries that simplify the field. i.e. if we chose 2 points the same distance from origin, the y components will cancel, leaving only the x odirection.
6. Superposition: $\vec{E}_{line} = \Sigma E_{s_x}\hat{i}$,
	1. $E_{s_x} = E_{s}cos\theta_s$ 
	2. $E_s = \frac{k\Delta Q_s}{r^{2}_{s}}$ 
	3. $r_s = (y^2_s + x^2)^{\frac{1}{2}}$
7. Substitute back in:
   $=\Sigma_{s=1}^{N} \frac{x\Delta y}{(y^2 + x^2)^{\frac{3}{2}}}$
8. Let the sum become an integral where $N \to \infty$ $\Delta y \to dy$   
9. The limits of integration are $y = -\frac{L}{2}$ to $y = \frac{L}{2}$

## Class 2
#### Electric Dipole 
A dipole is an arrangement of two equal but opposite charges. 
![[Pasted image 20260119100915.png]]

**Dipole Moment:  
$$\vec{p} = q\vec{d} (Coulomb-meters)$$**
**Where $\vec{d}$ is the displacement vector that points from the negative to positive charge.**   

#### Torque on a Dipole 
##### Vector In an Uniform Electric Field
$$\vec{\tau}_{net}=\vec{p}\times \vec{E}$$
##### Torque Magnitude Given $\vec{E}$ and the Angle Between Electric Field ($\vec{E}$) and the Dipole ($p$),  ($\theta$)
$$|t| = |p||E|sin\theta$$
##### Potential Energy
$$U = -pEcos\theta$$
#### Molecules with no Intrinsic Electric Dipole
Given spring constant $k$, elementary charge pair $q = \pm1.602 \times 10 ^{-19}$, and a given $\vec{E}$
Force on charges $F = qE$ and $F=-qE$ respectively when in the electric field, creating a net stretching force.
At equilibrium, $qE = k\Delta d$, where $\Delta d$ is the displacement from the natural bond strength. 

$$\Delta d = \frac{qE}{k} = \frac{1.602\times 10 ^{-10}E}{k}$$
##### Example:
$q = 1.602 \times 10^{-19}$
$k = 0.000643 N/m$
$E = 7.35 \times 10 ^{5}$
$d = ???$
$$\Delta d = \frac{qE}{k} = \frac{(1.602\times 10 ^{-10})(7.35\times 10^{5})}{0.000643} = 1.83 \times 10^{-10}$$
$$$$
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

#### Electric Flux Through Surfaces
##### General Definition (Any Surface)
$$\Phi_E = \iint_S \vec{E} \cdot d\vec{A}$$
where $\vec{E}$ is the electric field vector and $d\vec{A}$ is the differential area vector normal to the surface.
##### Uniform Field, Flat Surface at Angle
$$\Phi_E = \vec{E} \cdot \vec{A} = |\vec{E}||\vec{A}|\cos(\theta)$$
where $\theta$ is the angle between $\vec{E}$ and the surface normal vector.
##### Field Perpendicular to Surface
$$\Phi_E = EA$$
where the field is perpendicular to the surface area $A$ (special case: $\theta = 0°$).
##### Field Parallel to Surface
$$\Phi_E = 0$$
The field is perpendicular to the surface normal (special case: $\theta = 90°$).
##### Flat Plane Tilted at Angle $\theta$ to Field
$$\Phi_E = EA\cos(\theta)$$
where $\theta$ is measured between the field direction and the surface normal. The effective area is $A_{\text{eff}} = A\cos(\theta)$.
##### Gauss's Law (Closed Surface)
$$\Phi_E = \oint_S \vec{E} \cdot d\vec{A} = \frac{Q_{\text{enc}}}{\varepsilon_0}$$
where $Q_{\text{enc}}$ is the total charge enclosed by the closed surface and $\varepsilon_0 = 8.854 \times 10^{-12}$ C²/(N·m²).
##### Spherical Surface (Point Charge at Center)
$$\Phi_E = \frac{Q}{\varepsilon_0}$$
For a point charge $Q$ at the center of a spherical surface, independent of radius.
##### Cylindrical Surface (Infinite Line Charge)
$$\Phi_E = \frac{\lambda L}{\varepsilon_0}$$
where $\lambda$ is linear charge density and $L$ is the length of the cylindrical surface (excluding end caps).
##### Rectangular Box in Uniform Field (No Enclosed Charge)
$$\Phi_E = 0$$
For a uniform field with no enclosed charge, flux entering equals flux exiting.
##### Rectangular Box with Field Perpendicular to End Faces
$$\Phi_{\text{net}} = 0$$
$$\Phi_{\text{one end}} = \pm E_0 WH$$
where $W$ and $H$ are the width and height of the end face. 

#### Example:
A thin metallic spherical shell of radius $0.427m$ has a total charge of $5.53\times 10^{-6}C$ placed on it. A point charge of $3.15\times 10^{-6}C$ is placed at the center of the shell. What is the electric filed magnitude $E$ at a distance $0.735m$ from the center of the spherical shell?

##### Solution using Gauss's Law
$r = 0.735m$
$\oint \vec{E} \cdot d\vec{A} = \frac{Q_{enclosed}}{\epsilon_o}$
Due to spherical symmetry: $E(4\pi r^2) = \frac{Q_{enclosed}}{\epsilon_o}$
The shell charge is included as an enclosed charge: $Q_{enclosed} = Q_{center} + Q_{shell} = 5.53\times 10^{-6} + 3.15\times 10^{-6} = 8.68\times 10^{-6}$
$$E = \frac{Q_{enclosed}}{4\pi \epsilon_o r ^2} = k \frac{Q_{enclosed}}{r^2} = 8.99\times 10^9 \frac{8.68\times 10^{-6}}{(0.735)^2} = 1.44\times 10^5 N/C$$
##### Solution using Coulombs Law
1. E field contribution from the point charge at the center at $0.735m$ away from center:
   $$\vec{E}_{center} = k\frac{q}{r^{2}} = 8.99\times 10^9 \frac{3.15\times 10^{-6}}{(0.735)^2} = 5.24\times10^{4}N/C$$
2. E field contribution from the point charge at the shell, by the shell theorem, the charge on the shell acts as if concentrated at the center.
   $$\vec{E}_{shell} = k\frac{q}{r^{2}} = 8.99\times 10^9 \frac{5.53\times 10^{-6}}{(0.735)^2} = 9.20\times10^{4}N/C$$
3. Sum of the two fields:
	$$\vec{E} = 5.24\times 10^4 + 9.20 \times 10^4 = 1.44 \times 10^5 N/C $$
