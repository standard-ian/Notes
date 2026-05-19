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

All of the above could also have a $z'\hat{z}$ component

The magnetic flux density $d\vec{B}$ is now:
$$d\vec{B} = \frac{\mu_0}{4\pi}\frac{Id\vec{l}'\times (\vec{R} - \vec{R'})}{|\vec{R} - \vec{R'}|^3}\tag{2}$$
Where unit vector $\hat{R}$ is:
$$\hat{R} = \frac{\vec{R} - \vec{R'}}{|\vec{R} - \vec{R'}|}\tag{3}$$
We can also write
$$d\vec{B} = \frac{\mu_0}{4\pi}\frac{Id\vec{l}'\times \hat{R}}{|\vec{R} - \vec{R'}|^2}\tag{4}$$
This shows that we have a $\frac{1}{d^2}$ relationship, which is the same as the electric field.

However, the current filament has a total length comprised of **many** $d\vec{l}'$, so we need to integrate.

It has to be a loop, the total magnetic flux density for a current filament going from $a\to b$
$$\vec{B} = \frac{\mu_0}{4\pi}\int_a^b\frac{I\ d\vec{l}' \times \hat{R}}{|\vec{R} - \vec{R'}|^2}\ [T]\tag{5}$$
$$\vec{B} = \frac{\mu_0}{4\pi}\int_a^b\frac{I\ d\vec{l}' \times (\vec{R} - \vec{R'})}{|\vec{R} - \vec{R'}|^3}\ [T]\tag{6}$$
Just like electric fields, we also have magnetic intensity.
$$\vec{B} = \mu_0\vec{H}$$
Where $\vec{H}$ is the intensity.


## Class 14
Magnetic Field Intensity $\vec{H} = \frac{\vec{B}}{\mu_0}$ 

The cross product between $d\vec{l}$ and $\hat{R}$ is because the field is perpendicular to both the distance from the wire and the element length.

#### Example 1
Magnetic field of a filament wire with a length of $2m$ with a current flowing through it. 

Calculate the magnetic flux density $\vec{B}$ at the following points:

a. $r = 1,\ z=0$
b. $r =1, z=-1$

For now, consider flux density as some field quantity created by current. We will define flux shortly.

Using cylindrical coordinates will help with showing the resulting field behavior.

##### a $(r=1, z=0)$. 
POI
$$\vec{R} = 1\hat{r} + 0\hat{\phi} + 0\hat{z}$$
Parameterized location of infinitesimal point along filament
$$\vec{R'} = 0\hat{r} + 0\hat{\phi} + z'\hat{z}$$
Parameterized vector from filament to POI 
$$(\vec{R} - \vec{R'}) = 1\hat{r} - z'\hat{z}$$
Parameterized magnitude of vector from filament to POI 
$$|\vec{R} - \vec{R'}| = \sqrt{1 + z'^2}$$
Parameterized location of conductor
$$d\vec{l}' = dz'\hat{z}$$

$$d\vec{l} \times (\vec{R} - \vec{R'}) = \left|\begin{matrix}\hat{r} & \hat{\phi} & \hat{z}\\ 0 & 0 & dz'\\1& 0 & -z'\end{matrix}\right|$$
$$ = \hat{r}(0-0) -r\phi(0-dz') + \hat{z} (0-0) = (r)dz'\hat{\phi}\text{ (r = 1)}$$
$$d\vec{l}\times (\vec{R} - \vec{R'}) = dz'\hat{\phi}$$
$$\vec{B} = \frac{\mu_0}{4\pi}\int_a^b\frac{Id\vec{l}\times (\vec{R} - \vec{R'})}{|\vec{R} - \vec{R'}|^3} = \frac{I\mu_0}{4\pi}\int_{-1}^{1}\frac{dz'\hat{\phi}}{[1 + (z')^2]^{3/2}}$$
Notice already that $\vec{B}$ is only in the $\phi$ direction.
$$\vec{B} = \frac{I\mu_0}{4\pi}\hat{\phi}\int_{-1}^1\frac{1}{(1 + z'^2)^\frac{3}{2}}dz' = \frac{\mu_0I}{4\pi}\hat{\phi}\left[\frac{z'}{(1 + z'^2)^\frac{3}{2}}\right]_{-1}^1 = \frac{\mu_0 I}{4\pi}\hat{\phi}\left[\frac{1}{\sqrt{2}} - \frac{(-1)}{\sqrt{2}}\right]$$
$$\vec{B} = \frac{\mu_0I}{2\pi\sqrt{2}}\hat{\phi}$$
The field circulates around the wire, in the $\phi$ direction.

##### b. $(r =1, z=-1)$
POI
$$\vec{R} = 1\hat{r} + 0\hat{\phi} + 1\hat{z}$$
Parameterized location of infinitesimal point along filament
$$\vec{R'} = 0\hat{r} + 0\hat{\phi} + z'\hat{z}$$
Parameterized vector from filament to POI 
$$(\vec{R} - \vec{R'}) = 1\hat{r} - (1 + z')\hat{z}$$
Parameterized magnitude of vector from filament to POI 
$$|\vec{R} - \vec{R'}| = \sqrt{1 + (1 + z')^2}$$
Parameterized location of conductor
$$d\vec{l}' = dz'\hat{z}$$
$$d\vec{l} = dz'\hat{\phi}$$
$$\vec{B} = \frac{\mu_0 I }{4\pi}\int_{-1}^1\frac{\hat{\phi}}{(1 + (1 + z')^2)^\frac{3}{2}}dz'= \frac{\mu_0}{4\pi}\hat{\phi}\left[\frac{z' + 1}{\sqrt{(z' + 1)^2 + 1}}\right]_{-1}^1$$
$z'$ is 0 for this part, so:
$$\vec{B} = \frac{\mu_0 I}{4\pi}\frac{2}{\sqrt{5}}\hat{\phi}$$
#### 4.2 Ampere's Law
$$\oint_C\vec{B}\cdot d\vec{l} = I_{enc} \tag{1}$$
This is the integral form of Ampere's Law

It says: "The circulation of $\vec{H}$ around a closed path is equal to the current enclosed by the path." 

The integral form is difficult to use in many situations that aren't symmetric. 

The Biot-Savart Law is more useful for general cases Ampere's Law can be used for symmetric problems like the example above.

We can note that:
$$I_{enc} = \int\vec{J}\cdot d\vec{S}\tag{2}$$
Substituting $(2)$ into $(1)$:
$$\int_C\vec{H}\cdot d\vec{l} = \int_S\vec{J}\cdot s\vec{S}$$
Using Stokes theorem:
$$\int_S(\nabla \times \vec{H})\cdot d\vec{S} = \int_S\vec{J}\cdot d\vec{S}\tag{4}$$
or, the differential form of Ampere's Law:
$$\nabla \times \vec{H} = \vec{J}$$
$$\nabla \vec{B} = \mu_0\vec{J}\text{ (in free space)}$$

##### Example
Consider an infinitely long conductor with a radius $b$.
We will determine the magnetic flux density at some radius $r_1$.

We will also determine the magnetic flux (magnetic field density) outside the conductor at $r_2$.

We can use Ampere's Law because this is a symmetric problem.

$$\oint_C\vec{B}\cdot  d\vec{l} = \mu_0I_{enc}$$
The current density is:
$$J = \frac{I}{\pi b^2}$$
###### $\vec{B}$ inside at $r_1$
$$d\vec{l}_1 = r_1 d\phi \hat{\phi}$$ 
The field circulates around the wire.
$$\vec{B}_1 = B_\phi\hat{\phi}$$

$$\vec{B}_1\cdot d\vec{l} = B_\phi r_1\phi\hat{\phi}\hat{\phi}$$
Where $\hat{\phi}\hat{\phi} = 1$
$$\int_0^{2\pi}B_\phi r_1d\phi = \mu_0I_1\Longrightarrow B_\phi r_12\pi = \mu_0I_1$$
Note $I_1(r_1)$ is current as a function of $r_1$.
$$B_\phi(Rr_1) = \frac{\mu_0I_1(r_1)}{2\pi r_1}\tag{I}$$
The amount of enclosed current:
$$I_1 = \frac{I\pi r_1^2}{\pi b^2}\tag{II}$$
$(II)\to(I)$
$$B_\phi(r_1) = \frac{\mu_0I}{2\pi}\frac{r_1}{b^2},\ \ r_1 \leq b$$

###### $\vec{B}$ outside at $r_2$
$$\oint_C\vec{B}\cdot d\vec{l} = \mu_0I_{enc}$$
$$\int_0^{2\pi}B_\phi r_2d\phi = \mu_0I$$
$$B\phi(r_2) = \frac{\mu_0I}{2\pi r_2}$$
The whole current of the wire is enclosed.

The magnetic field increases as $r$ increases to $b$, then falls off exponentially outside the wire.







