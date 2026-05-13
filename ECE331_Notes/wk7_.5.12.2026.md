## Class 13
#### 3.4 Equation of Continuity
Recall 
$$\nabla \cdot \vec{J} = -\frac{\partial\rho_V}{\partial t}\tag{20}$$
Meaning if we integrate LHS over volume
$$\int_V\nabla\cdot J\ dv = \oint_{sC}\vec{J}\cdot \hat{n}\ ds$$
This is the divergence theorem.

We used the example of a tube, evaluating the current over the whole surface.

Net current out of surface is zero if the charge isn't changing, i.e. 
$$\frac{\partial \rho_v}{\partial t} = 0$$

For steady current $\frac{\partial \rho_v}{\partial t} = 0$
$$\frac{\partial J_x}{\partial x} + \frac{\partial J_y}{\partial y} + \frac{\partial J_z}{\partial z} = 0$$
$$\nabla \cdot \vec{J} = 0\tag{21}$$
For any enclosed surface:
$$\int_{V_c} \nabla \cdot \vec{J}\ dv = \oint_{S_C} J \cdot d\vec{s} = 0\tag{22}$$
**Kirchhoff's Current Law:** Net current flowing out of enclosed surface is 0.
or 
$$\sum I_j =0$$
In **Section 2.12: Conductors in Static Electric Field**
[[ECE331_Notes/wk5.4.28.2026#2.12 Conductors in a Static Electric Field]]
It was stated:
$$\rho_v = 0;\ \ \vec{E} = 0$$ Inside a conductor. Lets think about this using the equation of continuity.

Since $\vec{J} = \sigma \vec{E}$ in a conductor, substitute into $(20)$
$$\nabla \cdot \vec{J} = -\frac{\partial \rho_V}{\partial t}\Longrightarrow\sigma\nabla\cdot \vec{E} = -\frac{\partial \rho_V}{\partial t}\tag{20a}$$
But note from Gauss's Law
$$\nabla\cdot \vec{E} = \frac{\rho_V}{\epsilon_0}\tag{20b}$$
$(20b)$ into $(20a)$
$$\rho_V\frac{\sigma }{\epsilon_0} = -\frac{\partial \rho_V}{\partial t}$$
$$\rho_V(x,y,z,t)$$
The solution to this is 
$$\rho_V(t) = \rho_0e^{-\left(\frac{\sigma}{\epsilon_0}\right)t}$$
What is $\frac{\sigma}{\epsilon_0}$?

Where $\rho_0 =$ initial change at $t=0$
At $t = \frac{\epsilon_0}{\sigma}$, the charge density inside the conductor has decayed to
$$\rho = \rho_0e^{-1}=0.368\rho_0$$
The charge decayed to $0.368\rho_0$
For $\sigma$ of copper, $5.8\times 10^{7}$
$$t = \frac{8.85\times 10^{-12}}{5.8\times 10^7} = 1.52\times 10^{-19}$$
is when $\rho$ will be 36.8% of $\rho_0$

#### 4.0 Static Magnetic Fields
Timeline of static magnetics
#### 4.1 Biot-Savart Law
$$I = 0$$
When there is no current, the compass points towards true north.

When current flows through the axis of the compass, it will point perpendicular to the direction of the current.

We can think about this as a **current filament** so thin, it has "no" cross sectional area. It moves on some path through the $xy$ plane. 

It has a little tiny section $d\vec{l}'$ that contributes some to the magnetic field. 

We can imagine $d\vec{l}'$ is at $P'(x',y')$

We are interested in the field at a point of interest $P(x,y)$, and a vector to that POI, $\vec{R}$ in direction $\hat{R}$

Making angle $\psi$ with $d\vec{l}'$
If $\psi = 0$, that is saying the field contribution will be 0

$$I d\vec{l} \times \hat{R} = I|\ d\vec{l}'|\cdot|\hat{R}|\sin(\psi) $$
Shows maximum $d\vec{B}$ when $\psi = 90^\circ$

The element of magnetic flux density $d\vec{B}$ created by current element $I\ d\vec{l}'$ at $P(x,y)$ is:
$$d\vec{B} = \frac{\mu_0}{4\pi}\frac{I\ d\vec{l}'\times \hat{R}}{|R|^2}\tag{1}$$
Where:
$I\ d\vec{l}'$ is the current element
$|R| = \sqrt{x^2 + y^2}$
$\vec{B}$ is the magnetic flux density, in units of Teslas $[T]$
$\mu_0 = 4\pi\times 10^{-7}$ in units of Henrys per meter $[\frac{H}{m}]$(permeability of free space)

Note: In Ida 4th Ed, when stating equation 8.5, doesn't show the coordinate axis at $(x', y') = (0,0)$

For a $d\vec{l}'$ not at origin, $\vec{R}$ is the vector to the POI
$\vec{R'}$ is the vector to $d\vec{l}'$ 
We use $\vec{R} - \vec{R'}$

So:
$\vec{R} = x\hat{x} + y\hat{y}$
$\vec{R'} = x'\hat{x} + y'\hat{y}$
$|\vec{R} - \vec{R'}| = (x-x')\hat{x} + (y - y')\hat{y}$
$d\vec{l}' = dx\hat{x} + dy\hat{y}$

The magnetic flux density $d\vec{B}$ is now:
$$d\vec{B} = \frac{\mu_0}{4\pi}\frac{Id\vec{l}'\times (\vec{R} - \vec{R'})}{|\vec{R} - \vec{R'}|^3}\tag{2}$$
Where unit vector $\hat{R}$ is:
$$\hat{R} = \frac{\vec{R} - \vec{R'}}{|\vec{R} - \vec{R'}|}\tag{3}$$
We can also write
$$d\vec{B} = \frac{\mu_0}{4\pi}\frac{Id\vec{l}'\times \hat{R}}{|\vec{R} - \vec{R'}|^2}\tag{4}$$
This shows that we have a $\frac{1}{d^2}$ relationship, which is the same as the electric field.

However, the current filament has a total length comprised of **many** $d\vec{l}'$, so we need to integrate.

It has to be a loop, the total magnetic flux density for a current filament going from $a\to b$
$$\vec{B} = \frac{\mu_0}{4\pi}\int_1^b\frac{I\ d\vec{l}' \times \hat{R}}{|\vec{R} - \vec{R'}|^2}\ [T]\tag{5}$$
$$\vec{B} = \frac{\mu_0}{4\pi}\int_1^b\frac{I\ d\vec{l}' \times (\vec{R} - \vec{R'})}{|\vec{R} - \vec{R'}|^3}\ [T]\tag{6}$$
Just like electric fields, we also have magnetic intensity.
$$\vec{B} = \mu_0\vec{H}$$
Where $\vec{H}$ is the intensity.


## Class 14
