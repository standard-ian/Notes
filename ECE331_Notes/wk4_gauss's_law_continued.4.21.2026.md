## Class 7
#### 2.4 Gauss's Law
Remember from last week:
$$\oint\vec{E}\ ds = \frac{Q_{enc}}{\epsilon_0}\tag{20}$$
The above is Gauss's Law in Integral Form

Note, if we use the Divergence Theorem:
$$\oint\vec{E}\cdot d\vec{S} = \int_V(\nabla \cdot \vec{E}) dv\tag{21}$$
$$Q_{enclosed} = \int_V\rho_V(x,y,z) dv\tag{22}$$
Substituting $(21)$ and $(22)$ into $(20)$:
$$\int_V(\nabla \cdot \vec{E})\ dv = \int_V \rho_V(x,y,z)\ dv$$
or, Gauss's Law in Differential Form:
$$\nabla \cdot \vec{E} = \frac{\rho_V}{\epsilon_0}\tag{23}$$
#### 2.8 Postulates of Electrostatics
Differential Form:
$$\nabla \cdot \vec{E} = \frac{\rho_V}{\epsilon_0}$$
$$\nabla \times \vec{E} = 0$$
Integral Form:
$$\oint\vec{E}\cdot d\vec{S} = \frac{Q_{enc}}{\epsilon_0}$$
$$\oint\vec{E}\cdot d\vec{l} = 0$$
#### 2.9 Gauss's Law Example
Determine the $\vec{E}$ field caused by a spherical cloud of electrons with a volumetric charge density:
$$\rho = \left\{\begin{matrix} -\rho _V,\ 0\leq R \leq b\\0,\ \ \ \ \ R \geq b \end{matrix}\right\}$$
$$\vec{E} = \frac{1}{4\pi\epsilon_0}\frac{1}{R^2}\hat{R}\left[\frac{V}{m}\right]$$
$\vec{E}$ is radially flowing:
$$\vec{E} = \hat{R}E_r\tag{2}$$
$E_r$ constant, with respect to angle.
$$d\vec{S} = \hat{R}dS\tag{3}$$
Substituting $(2)$ and $(3)$ into Gauss's Law

$$\oint\vec{E}\cdot d\vec{S} = \int(E_r\hat{R})\cdot(\hat{R}ds) = \oint E_rds\tag{4}$$
For inside sphere at $S_i$ surface
$$ds = R_id\theta R_i\sin(\theta)\ d\phi$$
$$ds = R_i^2\sin(\theta)\ d\theta\ d\phi \tag{5}$$
$$\oint\vec{E}\cdot d\vec{S} = E_r\int_0^\pi\int_0^{2\pi}R_i^2\sin(\theta)\ d\phi\ d\theta$$
$0\leq \theta \leq \pi$
$0\leq \phi \leq 2\pi$

$$ = -E_r2\pi R_i^2\cos(\theta)|_0^\pi = -2\pi R_i^2[-1-1]E_r$$
$$= 4\pi R_i^2E_r\tag{6}$$
$$\frac{Q_{enclosed}}{\epsilon_0}$$
$$= \frac{-1}{\epsilon_0}\int\rho_VdV = \frac{-1}{\epsilon_0}\int_0^{R_i}\int_0^\pi\int_0^{2\pi}\rho_VR^2\sin(\theta)\ d\phi\ d\theta\ dR$$
$$\frac{Q_{enclosed}}{\epsilon_0} = \frac{-4\pi}{3\epsilon_o}R_i^3\rho_V\tag{7}$$
Left hand side is equal to right hand side, $(6) = (7)$
$$4\pi R_i^2E_r = -\frac{4\pi}{3\epsilon_0}R_i^3\rho_V$$
$$E_r = \frac{-R_i\rho_V}{3\epsilon_0} = \frac{-R\rho_V}{3\epsilon_0}\hat{R},\ 0\leq R\leq b$$

For $R > b$
$$\oint\vec{E}\cdot d\vec{S} = -\int_V\frac{\rho}{\epsilon_0} dv$$
$$\oint E_r\hat{R}\cdot \hat{R}\ ds = \int_0^b\int_0^\pi\int_0^{2\pi}\frac{\rho_V}{\epsilon_0}R^2\sin(\theta)\ d\phi\ d\theta\ dR$$
$$E_r\oint ds = \frac{-\rho_V}{\epsilon_0}\frac{4\pi b^3}{3}$$
$$E_r\int_0^{\pi}\int_0^{2\pi}R_0^2\sin(\theta)\ d\phi\ d\theta = $$

$$E_r R_0^24\pi = \frac{-\rho_V}{\epsilon_0}\frac{4\pi b^3}{3},\ \ R_i = b = R_0$$
$$E_r = \frac{-\rho}{\epsilon_0}\frac{b^3}{3R_0^2},\ \ R_0\geq b$$
$$E = \frac{\rho_V}{\epsilon_0}\frac{b^3}{3R^2}\hat{R},\ \ R\geq b$$

## Class 8
#### 2.10 Electric Potential
Recall that for a function $W(x,y,z)$
$\nabla W(x,y,z)$ is the steepest ascent
$-\nabla W(x,y,z)$ is the steepest descent

For a conservative system, force is in the direction that reduces the potential energy the most. ($\nabla \times W = 0$)

So for energy $U(x,y,z)$
$\nabla U(x,y,z)$ is the greatest increase with regard to position.
$-\nabla U(x,y,z)$ is the greatest decrease with regard to position.

So, force to minimize potential energy:
$$\vec{F} = -\nabla U\left[\frac{J}{m},\ N\right]\tag{1}$$

A conservative system is defined as one that is irrotational:
$$\nabla \times\vec{F} = 0\tag{2}$$
$$\nabla \times (-\nabla U) = 0\tag{3}$$
Consider now the static electric fields:
$$\nabla \times \vec{E} = 0\tag{4}$$
$$\nabla \times (-\nabla V) = 0\tag{5}$$
Where $V$ is a scalar.

##### For An Electric Field
$$\vec{F} = -\nabla U$$
We could evaluate this force over some length:
$$-\vec{F}\cdot d\vec{l} = dU\ \  \text{ where: } d\vec{l} = \hat{x} dx + \hat{y} dy + \hat{z} dz$$
Recall that $(\nabla U)\cdot d\vec{l} = -dU$

In electrostatics:
$$-q\vec{E} \cdot d\vec{l} = dU$$
If a charge moves along a path in the $\vec{E}$ field, then:
$$U = -q\int_a^b\vec{E}\cdot dl = w_b-w_a\left[\frac{N}{m}, J\right]\tag{6}$$
The amount of work will depend on the sign of $q$.

If we bring 2 positive charges together, they'll want to repel. It will take positive work to do this because it is increasing their potential energy.

Bringing opposite charge together decreases the work/potential energy.

Since the work required to move the charge in the field depends on the sign of the charge, we can instead write:
$$\frac{U}{q} = -\int_a^b\vec{E}\cdot d\vec{l} = \frac{U_a - U_b}{q} = V_b - V_a = V_{ba}\left[V, \frac{J}{C}, \frac{Nm}{C}\right]\tag{7}$$
$V_{ba}$ is called the potential difference or scalar electric potential or just **Electric Potential**.

##### Example
Consider two positive charges.
$+Q$ at $(0,0,0)$ and $+q$ at $(R, \theta, \phi) =(R_a, \theta_a, 0)$ to $(R, \theta, \phi) = (R_b, 0,0)$

We know:
$$\vec{E} = \frac{Q}{4\pi\epsilon_0}\frac{\hat{R}}{R^2}$$
From $(7)$:
$$V_{ab} = -\int_a^b\vec{E}\ d\vec{l}$$
###### From $a\to b'$, $d\vec{l} = dR\hat{R}$
$$\vec{E}\cdot d\vec{l} = \left(\frac{Q}{4\pi\epsilon_0}\frac{\hat{R}}{R^2}\right)\cdot \hat{R}\ dR$$
$$\vec{E}\cdot d\vec{l} = \frac{Q}{4\pi\epsilon_0}\frac{1}{R^2}\ dR\tag{8}$$
###### From $b'\to b, d\vec{l} = \hat{\theta} R_b\ d\theta$ 
$$\vec{E}\cdot d\vec{l} = \left(\frac{Q}{4\pi\epsilon_0}\frac{\hat{R}}{R^2}\right)\cdot \hat{\theta}R_b\ d\theta = 0;\ \ \text{ Since } \hat{R}\cdot \hat{\theta} =0$$
So:
$$V_{ba} = -\int_{R_a}^{R_b}\frac{Q}{4\pi\epsilon_0}\frac{dR}{R^2} = -\frac{Q}{4\pi\epsilon_0}\left[\frac{-1}{R}\right]_{R_a}^{R_b}$$
$$V_{ba} = \frac{Q}{4\pi\epsilon_0}\left[\frac{1}{R_b}\right] -\frac{Q}{4\pi\epsilon_0}\left[\frac{a}{R_a}\right] = V_b - V_a$$
Since $R_b < R_a$, $V_{ba}$ is positive. 
What if we bring the charge $q$ in from infinity?

$R_a = \infty$
$$V_a = \lim_{R_a\to\infty}\left(\frac{Q}{4\pi\epsilon_0R_a}\right) = 0$$
So in this case:
$$V_b = \frac{Q}{4\pi\epsilon_0}\frac{1}{R_b}$$
We usually write
$$\boxed{V = \frac{Q}{4\pi\epsilon_0}\frac{1}{R}}\tag{10}$$
In other words, electric potential $V$ at point $R$ in an electric field is the work per unit charge to bring a unit of charge from $\infty$ to location $R$.

Note: $\vec{E} = -\nabla V = -\hat{R}\frac{\partial}{\partial R}\left[\frac{QR^{-1}}{4\pi\epsilon_0}\right] = \frac{Q\hat{R}}{4\pi\epsilon_0R^2}$

##### If Point Charge $Q$ is not at $(0,0,0)$
Then the electric potential $d$ at $POI(x,y,z)$ is:
$$V(x,y,z) = \frac{Q}{4\pi\epsilon_0|\vec{R} - \vec{R'}|}\tag{11}$$

##### For Distributed Charges
###### For Line Charge
$$V(x,y,z) = \frac{1}{4\pi\epsilon_0}\int_l\frac{\rho_l\ dl}{|\vec{R} - \vec{R'}|}\tag{12}$$
###### For Surface Charge
$$V(x,y,z) = \frac{1}{4\pi\epsilon_0}\int\int_S\frac{\rho_s\ ds}{|\vec{R} - \vec{R'}|}\tag{13}$$
###### If Multiple Point Charges
$$V(x,y,z) = \frac{1}{4\pi\epsilon_0}\sum_{n=1}^{N}\frac{Q_n}{|\vec{R} - \vec{R'}|}\tag{14}$$

##### Example
What is the electric field intensity $E$ and electric potential $V$ along the axis of a uniform line charge of length $L$ for $z > \frac{L}{2}$? The line charge has density $\rho_l$
$dl' = dz'$
$\vec{E} = ?$
$V = ?$

Since the field is the same at different angular $\phi$ positions, we want to use cylindrical coordinates. 

At POI, we have 
$$\vec{R} = r\hat{r} + \phi r\hat{\phi} + z\hat{z} $$
At the line charge
$$\vec{R'} = \hat{z}z'$$

$$\vec{R} - \vec{R'} = r\hat{r} + (z - z')\hat{z}$$
$$|\vec{R} - \vec{R'}| = [r^2 + (z-z')^2]^{\frac{1}{2}}$$
$$V = \frac{1}{4\pi\epsilon_0}\int_\frac{-L}{2}^\frac{L}{2}\frac{\rho_l\ dz'}{\sqrt{r^2 + (z-z')^2}}$$
$$V(r, \phi, z) = \left(\frac{\rho_l}{4\pi\epsilon_0}\right)\ln\left[(z'-z) + \sqrt{r^2 + (z-z')^2}\right]_\frac{-L}{2}^\frac{L}{2}$$
The charge is spread along the z axis. To add it all up, we need to integrate along the entire line $z$ from $-\frac{L}{2} \to \frac{L}{2}$

$$\vec{E} = -\nabla V$$
$$E_z = \frac{-dV}{dz} = \frac{\rho_lL}{4\pi\epsilon_0\left[z^2 - \left(\frac{L}{2}\right)^2\right]}$$
It is much easier to evaluate the scalar $V$ first, computationally or otherwise, then use that to differentiate and find $\vec{E}$ in a few specific points.