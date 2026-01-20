## Class 1
#### Gauss's Law
$$\oint \vec{E}\cdot d\vec{A} = \frac{q_{enclosed}}{\epsilon_o}$$
**The total flux that passes through any enclosed surface is proportional to the electric charge enclosed by that surface.**

#### Solid Insulator
Given Charge = $Q$, radius = $a$, Charge Density ($\rho = \frac{Q}{\frac{4}{3}\pi a^3}$)$
###### Electric Field Outside the Gaussian Shell
$$E = \frac{Q}{4\pi \epsilon_o r^2}, (r > a)$$
###### Electric Field Inside
$$E = \frac{\rho}{3\epsilon_o}r, (r < a)$$
#### Solid Conductor	
If the conductor is in equilibrium, the field is 0 inside the surface. 
$$E_{inside} = 0$$
$$q_{inside} = 0$$
All excess electric charge on any conductor of any geometry must reside on the surface.

Given a Gaussian sphere enclosing a point charge, there is an induced charge on the inside of the sphere, by the point charge. 
###### Inner Induced Charge
$$Q_{inner} = -q$$
$$\sigma_i = \frac{-q_o}{4\pi R_i^2}$$
###### Outer Induced Charge
$$Q_{outer} = Q + q_o$$
$$\sigma_o = \frac{Q +q_o}{4\pi R_o^2}$$
#### Solid Infinite Cylindrical Conductor
The charge must be distributed uniformly on the surface, so the field must be dependent on the radius.
$$E = \frac{\lambda}{2\pi \epsilon_o r}, (r > a)$$
#### Infinite Sheet of Charge with Uniform Charge Density $\sigma$
The field lines must be perpendicular to the sheet of charge. The magnitude of the field must be constant.
$$E = \frac{\sigma}{2\epsilon_o}$$
#### Summary
1. Gauss's Law can be used to calculate the Electric Field produced by several fundamental charge arrangements.
2. The field must reside on the surface of a conductor
3. Conductor:
	1. $E = 0$ inside (all charges re-distribute to cancel internal fields.)
	2. All charges reside on the surface
	3. Use surface charge density $\sigma$
	4. Field just outside: $E = \frac{\sigma}{\epsilon_o}$
4. Insulator
	1. $E \neq 0$
	2. Charge distributed throughout volume
	3. Use volume charge density $\rho$
	4. Field depends on position within material
5. Applying Gauss's Law
	1. Identify Symmetry
	2. Choose Gaussian Surfaces that exploit symmetry
	3. Determine where $E$ is perpendicular/parallel
	4. Calculate flux $\oint E \cdot dA$ (The net number of filed lines passing outward through the closed surface)
	5. Calculate enclosed charge $Q_{enclosed} = \int\rho dV$ (or $\sigma A$ for surface charge)
	6. Solve for $E$.

| Symmetries  | Dimensions | Field Line Density                      |
| ----------- | ---------- | --------------------------------------- |
| Spherical   | 3D         | $\frac{1}{A_{sphere}} (~\frac{1}{r^2})$ |
| Cylindrical | 2D         | $\frac{1}{A_{cylinder}} (\frac{~1}{r})$ |
| Planar      | 1D         | constant                                |

##### Example
A nonconducting slab with charge density $\rho$ has finite thickness between $z = -d$ and $z = \pm d$ and is infinite in the plane perpendicular to the $z$-axis. Calculate the expression for the electric field inside, above, and below the slab.

1. Symmetry is planar. It is an insulator so the charge is distributed within it's volume and the field inside depends on the position within.
2. The Gaussian surface here should be a cylinder with the parallel sides parallel the planes of the slab.
3. The E field is perpendicular on the parallel ends of the Gaussian surface. 
	1. $+\hat{z}$ direction for $z > 0$ and $-\hat{z}$ direction for $x < 0$. 
	2. On the curved sides, $E \perp dA$ or the field is perpendicular to the vector representing surface area at that point. $E\cdot dA = |E||dA|cos\theta$ and because the angle between $E$ and $dA$ is $90^\circ$, $cos\theta = 0$. 
4. For the flux calculations, we imagine the cylinder is within the constraints. 2 situations will be needed for above/below the slab, and within the slab.
	1. Above/below ($z \geq d$ or $z\leq -d$)
		1. Volume enclosed: $A\cdot(2d)$
		2. $Q_{enclosed} =\rho A(2d)$
		3. Gauss's Law: $2EA =\frac{\rho A (2d)}{\epsilon_o}$
		4. $E = \frac{\rho d}{\epsilon_o}$
	2. Inside ($-d \leq z \leq d$)
		1. Volume enclosed: $A\cdot(2z_0)$
		2. $Q_{enclosed} = \rho A(2z_{0})$
		3. Gauss's Law: $2E(z_0)A = \frac{\rho A (2z_0)}{\epsilon_o}$
		4. $E(z_0) = \frac{\rho z_0}{\epsilon_o}$
##### Example: Spherical Symmetry and Gauss's Law
A sphere of radius $R=0.245$ and uniform charge density $453nC/m^3$ lies at the center of a spherical, conducting shell of inner and outer radii $3.50R$ and $4.00R$ respectively. The conducting shell carries a total charge of $Q=-38.1nC$
![[Pasted image 20260119130818.png]]
Determine the magnitude $E(r)$ of the electric field at the given radial distances $r$ from the center of the charge distribution. 
$$Gauss's\ Law: \oint E\cdot dA = \frac{Q_{enclosed}}{\epsilon_o}$$

For spherical symmetry, $E(4\pi r^2) = \frac{Q_{enclosed}}{\epsilon_o}$. The electric flux through a closed spherical area is the sum of enclosed charges over the electric permittivity constant. Therefore:
$$E = \frac{Q_{enclosed}}{4 \pi r^2\epsilon_o}$$
###### Region 1: Inside the Charged Sphere
Only a fraction of the charged sphere. ($r < R$)
$\rho = 453\times 10^{-9}C$
$V_{sphere} = \frac{4}{3}\pi r^3$ 
$Q_{enclosed} = \rho (V) = \rho(\frac{4}{3}\pi  r^3)$
$$E(4\pi r^2) = \frac{\rho(\frac{4}{3}\pi  r^3)}{\epsilon_0}$$
$$E= \frac{\rho(\frac{4}{3}\pi  r^3)}{\epsilon_0(4\pi r^2) } = \frac{\frac{1}{3}\rho r}{\epsilon_0} =\frac{\rho r}{3\epsilon_0}$$
###### Region 2: Between Sphere and Shell
The entire charged sphere (radius R) **and** the empty space beyond, up to the shell (no charge)
$Q_{enclosed} = \rho (V) = \rho(\frac{4}{3}\pi  R^3)$
Note the above is a fixed value, describing only the enclosed charge of the charged center, because the region around it contributes no charge.
$$E(4\pi r^2) = \frac{\rho\frac{4}{3} \pi R^3}{\epsilon_{0}}$$
$$E = \frac{\rho\frac{4}{3} \pi R^3}{\epsilon_{0}(4\pi r^2)} = \frac{\rho R^3}{3\epsilon_0 r^2}$$
Field decreases as $\frac{1}{r^2}$, as we move more outside of the inner sphere, up to the conducting shell.
###### Region 3: Inside the Conducting Shell
The conductor evenly distributes the charges, they are in equilibrium, and the internal field cancels to 0.

$E = 0N/C$ based on the above principal of no field internally in a conductor.

###### Region 4: Outside the Shell
The entire charged sphere **and** the entire conducting shell.
$$Q_{enclosed} = Q_{sphere} + Q_{shell} = \rho \frac{4}{3} \pi R^3 + (-38.1\times 10^-9C\ (given))$$
$$= 27.9\times 10^{-9} - 38.1\times 10^{-9} = -10.2\times 10^{-9}C$$
$$E(4\pi r^2) = \frac{\rho \frac{4}{3} \pi R^3 + Q}{\epsilon_o}$$
$$E = \frac{\rho \frac{4}{3} \pi R^3 + Q}{\epsilon_o(4\pi r^2)}$$


##### Example: Cylindrical Symmetry and Gauss's Law
##### Cylindrical Configuration
A long, conductive cylinder of radius $R_1 = 3.20$ cm and uniform charge per unit length $\lambda = 151$ pC/m is coaxial with a long, cylindrical, nonconducting shell of inner and outer radii $R_2 = 11.2$ cm and $R_3 = 12.8$ cm, respectively. The cylindrical shell carries a uniform charge density of $\rho = 115$ pC/m³.
![[Pasted image 20260119134209.png]]
Determine the magnitude $E(r)$ of the electric field at the given radial distances $r$ from the center of the charge distribution.
$$Gauss's\ Law: \oint E\cdot dA = \frac{Q_{enclosed}}{\epsilon_o}$$
For cylindrical symmetry, we use a Gaussian surface of radius $r$ and length $L$. The electric field is radial and constant at radius $r$:
$$E(2\pi r L) = \frac{Q_{enclosed}}{\epsilon_o}$$
The electric flux through a closed cylindrical surface equals the enclosed charge divided by the electric permittivity constant. Therefore:
$$E = \frac{Q_{enclosed}}{2 \pi r L\epsilon_o}$$
For a cylinder, we work with charge per unit length. The enclosed charge is $Q_{enclosed} = q_{enclosed} \times L$, where $q_{enclosed}$ is the charge per unit length enclosed.
###### Region 1: Inside the Conductive Cylinder
($r < R_1 = 3.20$ cm)
Inside a conductor in electrostatic equilibrium, the electric field is zero. All charge resides on the surface.
$$E = 0\ N/C$$
###### Region 2: Between Cylinder and Shell
($R_1 < r < R_2$, i.e., $3.20$ cm $< r < 11.2$ cm)
The Gaussian surface encloses the entire inner cylinder's charge per unit length:
$$q_{enclosed} = \lambda = 151 \times 10^{-12}\ C/m$$
$$E(2\pi r L) = \frac{\lambda L}{\epsilon_o}$$
$$E = \frac{\lambda L}{2\pi r L\epsilon_o} = \frac{\lambda}{2\pi r\epsilon_o}$$
Field decreases as $\frac{1}{r}$ (characteristic of infinite line charge).
###### Region 3: Inside the Nonconducting Shell
($R_2 < r < R_3$, i.e., $11.2$ cm $< r < 12.8$ cm)
The Gaussian surface encloses:
- Inner cylinder charge per unit length: $\lambda = 151 \times 10^{-12}$ C/m
- Portion of the shell from $R_2$ to $r$

For the shell portion, calculate charge per unit length:
- Volume per unit length of shell from $R_2$ to $r$: $V/L = \pi(r^2 - R_2^2)$
- Charge per unit length from shell: $q_{shell} = \rho \cdot \pi(r^2 - R_2^2)$
$$q_{enclosed} = \lambda + \rho\pi(r^2 - R_2^2)$$
$$E(2\pi r L) = \frac{[\lambda + \rho\pi(r^2 - R_2^2)]L}{\epsilon_o}$$
$$E = \frac{\lambda + \rho\pi(r^2 - R_2^2)}{2\pi r\epsilon_o}$$
###### Region 4: Outside the Shell
($r > R_3 = 12.8$ cm)
The Gaussian surface encloses:
- Inner cylinder: $\lambda = 151 \times 10^{-12}$ C/m
- Entire shell from $R_2$ to $R_3$

Shell charge per unit length:
$$q_{shell} = \rho \cdot \pi(R_3^2 - R_2^2)$$
$$q_{shell} = 115 \times 10^{-12} \cdot \pi[(0.128)^2 - (0.112)^2]$$
$$q_{shell} = 115 \times 10^{-12} \cdot \pi[0.0164 - 0.0125]$$
$$q_{shell} = 115 \times 10^{-12} \cdot \pi(0.0039) = 1.41 \times 10^{-12}\ C/m$$
Total enclosed charge per unit length:
$$q_{enclosed} = \lambda + q_{shell} = 151 \times 10^{-12} + 1.41 \times 10^{-12} = 152.41 \times 10^{-12}\ C/m$$
$$E = \frac{\lambda + \rho\pi(R_3^2 - R_2^2)}{2\pi r\epsilon_o}$$
###### Calculations:

$E(1.95$ cm$)$: Region 1, inside conductor
$$E = 0\ N/C$$
$E(9.76$ cm$)$: Region 2, between cylinder and shell ($r = 0.0976$ m)
$$E = \frac{151 \times 10^{-12}}{2\pi(0.0976)(8.85 \times 10^{-12})} = \frac{151 \times 10^{-12}}{5.43 \times 10^{-12}} = 27.8\ N/C$$
$E(12.0$ cm$)$: Region 3, inside shell ($r = 0.120$ m)
$$E = \frac{151 \times 10^{-12} + 115 \times 10^{-12} \cdot \pi[(0.120)^2 - (0.112)^2]}{2\pi(0.120)(8.85 \times 10^{-12})}$$
$$E = \frac{151 \times 10^{-12} + 115 \times 10^{-12} \cdot \pi(0.00144 - 0.01254)}{6.67 \times 10^{-12}}$$
$$E = \frac{151 \times 10^{-12} + 0.363 \times 10^{-12}}{6.67 \times 10^{-12}} = 22.7\ N/C$$
$E(18.9$ cm$)$: Region 4, outside shell ($r = 0.189$ m)
$$E = \frac{152.41 \times 10^{-12}}{2\pi(0.189)(8.85 \times 10^{-12})} = \frac{152.41 \times 10^{-12}}{10.51 \times 10^{-12}} = 14.5\ N/C$$
## Class 2
#### Electric Potential Energy
1. Work done by a Coulomb force on an object is independent of the path, making it a conservative force.
2. A charged particle's velocity can be calculated as it is released and affected by another charge.

Conservative Forces: Work only depends on initial and final positions.

#### Work Done to Move a Charge
Because two repelling charges have a force that decreases as they travel away, an integral is needed to determine the work done.
$$F_{E} = \frac{1}{4\pi \epsilon_0}\frac{q_1q_2}{r^2}\hat{r}$$
$$W_{A\to B} = \int_{r_A}^{r_B}\vec{F}\cdot d\vec{r}$$
Because the vectors $\vec{F}$ and $d\vec{r}$ are both in the same direction, the above can be re-written as: $W_{A\to B} = \int_{r_A}^{r_B}\vec{F} d\vec{r}$
And combining the equations yields:
$$W_{A\to B} =\int_{r_A}^{r_B}\frac{1}{4\pi \epsilon_0}\frac{q_1q_2}{r^2}  dr = \frac{q_1q_2}{4\pi \epsilon_0}\int_{r_A}^{r_B}\frac{1}{r^2}  dr = \frac{q_1q_2}{4\pi \epsilon_0}(\frac{1}{r_A}-\frac{1}{r_B})$$
#### Potential Energy
Because a charge movement is conservative, a charge's displacement, no matter the path, produces some potential ener:wgy.
$$U_r\equiv \Delta U_{\infty_r} = \frac{q_1q_2}{4\pi\epsilon_0r}$$
If the charges have the same sign, the forces are repulsive and the potential energy is positive.
If they have opposite signs, the forces are attractive, and the potential energy is negative.
The closer the charges are, the larger the magnitude of the electric potential energy.

#### Example
Calculate $v(x)$ the velocity of particle 2 as a result of the repulsive force from particle 1 as it travels an increasing distance $x$ from particle 1.
$$ \frac{q_1q_2}{4\pi \epsilon_0}(\frac{1}{x_{initial}}-\frac{1}{x_{final}}) = U_{initial} - U_{final}  = K_{final} = \frac{1}{2}m_2v^2$$

$$v = \sqrt{\frac{q_1q_2}{2\pi \epsilon_0m_2}(\frac{1}{x_{initial}}-\frac{1}{x_{final}})}$$
#### Potential Of Electric Field of System of Charged Particles
**Given 3 particles separated by equal distances:**
1. Positioning particle 1 takes no energy: $\Delta U_1 = 0$
2. Particle 2 takes $k\frac{q_1q_2}{d}$
3. Particle 3 $k\frac{q_1q_3}{d}+k\frac{q_1q_3}{d}$
So the entire system: $U_{system} =k\frac{q_1q_2}{d}+k\frac{q_1q_3}{d}+k\frac{q_1q_3}{d}$ 

$$U_{system} = k\Sigma_{i < j} \frac{q_1q_2}{r_ij}$$
