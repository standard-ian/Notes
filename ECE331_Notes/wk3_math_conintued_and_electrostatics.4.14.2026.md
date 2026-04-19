## Class 5
#### Continuing from Last Week's Example
##### Recap
Given a vector function
$$\vec{F}(x,y,z) = [3y + C_1 z]hat{x} +[C_2x - 2z]\hat{y}+ [C_3y + z]\hat{z} $$
Determine the constants $C_1, C_2, C_3$ if $\vec{F}$ is irrotational
Irrotational means the curl $\nabla \times \vec{F} = 0$ 
$$\nabla \times \vec{F} = \left|\begin{matrix}\hat{x} & \hat{y} & \hat{z} \\ \frac{\partial}{\partial x} & \frac{\partial}{\partial y} & \frac{\partial}{\partial z} \\ 3y + C_1z & C_2x-2z & C_3y + z\end{matrix}\right| = 0$$
$$ = [-C_3 + 2]\hat{x} - [0-C_1]\hat{y} - [C_2 - 3]\hat{z} = 0$$
So we can use this to find the constants.
$C_1 = 0$
$C_2 = 3$
$C_3 = 2$
$$\vec{F}(x,y,z) = \vec{F} = \hat{x}(3y + C_2z) + \hat{y}(C_2x - 2z) - \hat{z}(C_3y + z)$$
$$\vec{F} = [3y]\hat{x} + [3x-2z]\hat{y} - [2y + z]\hat{z}$$
 
Determine a scalar potential $U$ such that $\vec{F} = -\nabla U$
$$F = -\hat{x}\frac{\partial U}{\partial x} -\hat{y}\frac{\partial U}{\partial y} - \hat{z}\frac{\partial U}{\partial z}$$
We can use the following, then integrate with respect to each component.
###### 1.
$$F_x = -\frac{\partial U }{\partial x} = 3y\to -\int 3y \to$$
$$U = -3yx + f(y,z)$$
###### 2.
$$F_y = -\frac{\partial U }{\partial y} = -3x + 2z\to -\int3x-2z \to$$
$$U = -3xy + 2zy + f(x,z)$$
###### 3.
$$F_z = -\frac{\partial U}{\partial z} = -2y - z\to -\int-2y - z \to$$
$$U = 2yz + \frac{z^2}{2} + f(x,y)$$
Comparing equations:
We just group the terms that appear, including each term only once. This gives:
$$U = -3yx + 2yz + \frac{z^2}{2} + constant$$
To determine the constant, we would need defined boundary conditions, for example for each plane of a box, $U$ has a particular value at the boundary.
$\vec{F}$ is irrotational: 
$$\nabla \times \vec{F} = 0$$
To summarize, we used the the fact that $\nabla \times \vec{F} = 0$  to find $C_1, C_2, C_3$.

#### Laplacian Operator
$$\nabla \cdot \nabla U = \left[\frac{\partial}{\partial x}\hat{x} + \frac{\partial}{\partial y}\hat{y} + \frac{\partial}{\partial z}\hat{z}\right]\cdot \left[\frac{\partial U}{\partial x}\hat{x} + \frac{\partial U}{\partial y}\hat{y} + \frac{\partial U}{\partial z}\hat{z}\right]$$
##### For a Scalar
$$\nabla ^2U = \frac{\partial ^2 U}{\partial x^2} + \frac{\partial^2U}{\partial y} + \frac{\partial ^2 U}{\partial z}$$
Where:
$$\nabla ^2  = \left[\frac{\partial ^2}{\partial x^2} + \frac{\partial ^2}{\partial y^2} + \frac{\partial ^2}{\partial z^2}\right]$$
The **Laplacian Operator** $\Delta = \nabla ^2$

##### In Cylindrical
$$\nabla ^2 U = \frac{\partial^2 U}{\partial r^2 } + \frac{1}{r}\frac{\partial U}{\partial r} + \frac{1}{r^2}\frac{\partial ^2 U}{\partial \phi^2} + \frac{\partial ^2U}{\partial z^2}$$
For a vector 
$$\vec{A}(x,y,z) = A_x(x,y,z)\hat{x} + A_y(x,y,z) \hat{y} + A_z(x,y,z)\hat{z}$$
$$\vec{A} = A_x \hat{x} + A_y\hat{y} + A_{z} \hat{z}$$
$$\nabla ^2 \vec{A} = \hat{x} \nabla^2 A_x + \hat{y} \nabla ^2 A_y + \hat{z}\nabla^2 A_z$$
Where a single component for example  $\nabla^2A_y$ is:
$$\nabla^2A_y = \frac{\partial ^2A_y}{\partial x^2} + \frac{\partial ^2 A_y}{\partial y^2} + \frac{\partial ^2 A_y}{\partial z^2}$$
The Laplace Equation governs things where there is no source term:
$$\nabla ^2 U = 0$$
Poisson's Equation:
$$\nabla^2U = C$$
This concludes the math review portion, we'll now move on to electrostatics.

### 2 Electrostatics
#### 2.1 Charge and Charge Density
The charge on an electron $e=1.6019\times 10^{-19}C$

Electrostatic devices will be important, it is good for all EEs to know some of these things.

When you have a charge and the area around it is large, we can represent the field that comes off of it as a **point** charge.

**Point Charge:**  a charge that occupies a volume of space may be considered a point charge if the volume containing the charge is small compared to the surroundings.

**Line Charge:** charge distribution along a line, for example, a thin wire. This has a small $\Delta l$  which has a small amount of charge $\Delta Q$ 
$$\lim_{\Delta l\to 0}\frac{\Delta Q}{\Delta l} = \frac{dQ}{dl} \left[\frac{c}{m}\right]$$
**Surface and Volume Charge Densities:** 
$$\rho_S = \frac{dQ}{ds} \left[\frac{c}{m^2}\right]$$
$$\rho_V = \frac{dQ}{dV} = \left[\frac{c}{m^3}\right]$$
#### 2.2 Electric Fields
From experiments, it has been determined that if charge $q$ is located at the origin, ($x,y,z = 0,0,0$), then an electric field is created that is defined as the:
$$\vec{E} = \frac{1}{4\pi R^2}\frac{q}{\epsilon_0}\hat{R} \left[\frac{V}{m}\right]\tag{1}$$

Where $R = \sqrt{x^2 + y^2 + z^2}$
$R^2=x^2 + y^2 + z^2$
$R = |R|$
$\epsilon_0 = 8.854\times 10^{-12}$ The permittivity of free space
$\epsilon_0 \approx \frac{1}{36\pi}\times 10^{-9}$
$\frac{1}{\epsilon_0} = 36\pi\times 10^{9}$

For a small $R$, $|E|$ is big.
For a vector field from a point charge, the arrows will be large close to the source, and as we radiate out further away, the arrows will fall off.
##### 2 Dimensions
The field from $(1)$ falls of by $\frac{1}{R^2}$. This hold true in 2 dimensions.

In 2 dimensions if the source is at $x,y = 0,0$, $n$ field lines pass through a circle drawn around the source.

$$\frac{n}{2\pi r} = \frac{n}{2\pi\sqrt{x^2 + y^2}}$$
The field is reducing by $\frac{1}{r}$

##### 3 Dimensions
The field from $(1)$ falls of by $\frac{1}{R^2}$. This hold true in 2 dimensions.
In 3 dimensions, we have a sphere. The surface area equation for a sphere is $4\pi r^2$. The surface surrounding $q$, the source, is a sphere.

$$\frac{n}{surface\ of\ sphere} = \frac{n}{4\pi R^2}$$
A point of the surface of a sphere can be described by $x,y,z$ coordinates.

We are interested in the field at some distance from that charge, say point $P(x,y,z)$, the **point of interest** (POI). We always want to think about the field at some location.

The distance to the POI from the origin is $R = \hat{x} x + \hat{y} y + \hat{z} z$ 
We can picture this to be a point somewhere on the surface of the sphere centered at the origin.

For a charge at the origin, referencing $(1)$ we have a unit vector 
$$\hat{R} = \frac{\vec{R}}{|R|}\ \text{from}\ (x,y,z) = (0,0,0)$$
Because of this,
$$\vec{E} = \frac{q}{4\pi \epsilon_0}\frac{\vec{R}}{|R|^3}\left[\frac{V}{m}\right] $$
If the charge **were not at the origin?**

#### 2.3 Electric Field Due to a Point Charge
For a $+5nC$ charge located at a point $P'(x',y', z') = (0.1, 0, 0.5)m$,
What is the electric field intensity ($\vec{E}$) at $P(x,y,z) = (1,0,0.8)$?

We need a vector to define the location of the charge. We call this $\vec{R'}$.
All the prime terms are "$\ '$" are **location of charge**.

The POI location also is defined by a vector, called $\vec{R}$. 

The sphere we use to evaluate $\vec{E}$ is centered around $R'$ instead of the origin.
The distance between the vectors will be $\vec{R} - \vec{R'}$ 

The unit vector is coming off of the pathway between $\vec{R}$ and $\vec{R'}$, from $P'$ to $P$.
$$\hat{R} = \frac{\vec{R} - \vec{R'}}{|R - R'|}\tag{2}$$

$$\vec{E} = \frac{q\hat{R}}{4\pi \epsilon_0|R-R'|^3}\left[\frac{V}{m}\right]\tag{3}$$
or
$$\vec{E} = \frac{q(\vec{R} - \vec{R'})}{4\pi\epsilon_0|R-R'|^3} \left[\frac{V}{m}\right]\tag{4}$$
We need to keep track of what is the POI $(P)$ and what is the charge $(P')$.

POI, $P(x,y,z) = (1,0, 0.8)$:
$$\vec{R} = \vec{OP} = 1\hat{x} + 0.8\hat{z} $$
Charge, $P'(x,y,z) = (0.1, 0, 0.5)$:
$$\vec{R'} = 0.1\hat{x} + 0.5\hat{z}$$
Then evaluate by plugging in the vector terms and solving for $\vec{E}$.
Remember the field decreases at $\frac{1}{R^2}$

The distance between is:
$$\vec{R} - \vec{R'} = 0.9\hat{x} + 0.3\hat{z}$$
$$|R- R'| = \sqrt{0.9^2 + 0.3^2 } = 0.949m$$
$$\vec{E} = \left(\frac{1}{4\pi\epsilon_0}\right)q\cdot\frac{(\vec{R} - \vec{R'})}{|\vec{R}{ - \vec{R'}|^3}} = 5\times 10^{-9}\times \left(\frac{36\pi \times 10^{9}}{4\pi}\right)\times \left(\frac{0.9\hat{x} + 0.3\hat{z}}{(0.949)^3}\right)$$

$$\vec{E} = 52.65(0.9\hat{x} + 0.3\hat{z})$$
We may also want the direction $\hat{U}$ and the magnitude:
$$\hat{U} = \frac{\vec{E}}{|E|} = \frac{\vec{E}}{\sqrt{52.65(0.9^2 + 0.3^2)}} = \frac{\vec{E}}{49.95} = 0.949\hat{z} + 0.316\hat{z}$$
$$\vec{E} = (49.95)(0.949\hat{x} + 0.316\hat{x})$$
$49.95$ is the magnitude
$0.949\hat{x} + 0.316\hat{z}$ is the direction.

If there are $N$ point charges, then the total field intensity $\vec{E}$ is:
$$\vec{E} = \left(\frac{1}{4\pi\epsilon_0}\right)\left[\frac{q_1(\vec{R} - \vec{R_1'})}{|\vec{R} - \vec{R_1'}|^3} + \frac{q_2(\vec{R} - \vec{R_2'})}{|\vec{R} - \vec{R_2'}|^3} + ...\right]$$
$$\vec{E} = \frac{1}{4\pi\epsilon_0}\sum^N_{k=1} \frac{q_k(\vec{R}-\vec{R_k'}{})}{|\vec{R}-\vec{R_k'}|^3}\tag{5}$$

#### 2.3 Coulomb's Law
When a point charge $q_2$ is placed in the field of another point charge $q_1$ at the origin,  a force $F_{1\to2}$ is experienced by $q_2$.
$$F_{1\to 2} = q_2 E_{1\to 2} = \frac{q_2q_1}{4\pi \epsilon_0} \hat{R}\tag{6}$$
This is called **Coulomb's Law**

Force without contact. Electric field intensity defined as force per unit charge.
$$\vec{E} = \lim_{q\to 0}\frac{\vec{F}}{q}\left[\vec{V}{m}\right]\tag{7}$$
See Coulomb's torsional balance, page 157, Ida

If $q_1$ and $q_2$ have the same sign, the charges repel. If they are opposite, they will attract.
## Class 6
#### 2.4 Electric Field Due to a Continuous Distribution of Charge
We assume charge density is uniform on the line of charge. Density: $\rho_l = \frac{C}{m}$

If we have a line of charge, and a POI $P$, we know the location of the POI relative to a location is $R$.

We can think about a point on a line of charge, with a vector pointing to it, again called $R'$.

We can break down the line of charge into bits, 
$$dq' = \rho_l\ dl'\tag{8}$$
Remember for a single charge:
$$\vec{E} = \frac{q(\vec{R} - \vec{R'})}{4\pi\epsilon_0|R-R'|^3} \left[\frac{V}{m}\right]$$
$$d\vec{E} = \frac{1}{4\pi\epsilon_0} \frac{dq'(\vec{R} - \vec{R'})}{|\vec{R}- \vec{R'}|^3}\tag{8a}$$
We can sub $(8)$ into $(8a)$ to get:
$$d\vec{E} = \frac{1}{4\pi\epsilon_0} \frac{(\vec{R} - \vec{R'})}{|\vec{R}- \vec{R'}|^3}\rho_l\ dl'\tag{9}$$
All elements $dl$ along line charge contribute so integrating gives:
$$\vec{E} = \int_l\frac{(\vec{R} - \vec{R}')\rho_l}{4\pi\epsilon_0|\vec{R} - \vec{R'}|^3}dl'\tag{10} = \frac{\rho_l}{4\pi\epsilon_0}\int\frac{\vec{R}- \vec{R'}}{|\vec{R} - \vec{R'}|^3}dl'$$

##### Example
Determine the electric field intensity $\vec{E}$ of a 2m long line of wire in air with a line charge of uniform density $\rho_l$ centered at $(0,0,0)$.

We want to know what is the value of $\vec{E}$ at distance $r$ at $z=0$.

We can choose a POI, $P$ some arbitrary distance from the origin.

The field will be the same at the same distance $r$ away in any direction perpendicular to the $z$ axis. Since it is symmetric around the origin in a circumference, we can easily use cylindrical coordinates.
$$\vec{R} = r\hat{r} + 0\hat{\phi} + 0\hat{z}$$
$$\vec{E}\propto\frac{1}{R^2}$$
Since the charge is located along the $z$ axis, the location of the charge is dependent only on the $z$ coordinate.
$$\vec{R'} = 0\hat{r} + 0\hat{\phi} + z'\hat{z}$$
$$\vec{R} - \vec{R'} = \hat{r}(r - 0) + \hat{z}(0 - z') = r\hat{r} - z'\hat{z}$$
$$|\vec{R} - \vec{R'}| = [r^2 + (z')^2]^{\frac{1}{2}}$$
$$dl' = dz'$$
From equation $(10)$:
$$\vec{E} =  \frac{\rho_l}{4\pi\epsilon_0}\int\frac{r\hat{r} - z'\hat{z}}{|r^2 + (z')^2|^\frac{3}{2}}dz'$$
$$\vec{E} = E_r\hat{r} + E_z\hat{z}$$
As long as we are at the center of the line $(y,z) = (0,0)$, $E_z$ cancels from the equal and opposite $dq'$ on either side  of $(0,0)$

$$\vec{E} = \frac{\rho_l}{4\pi \epsilon_0}\int_{-1}^1\frac{r\hat{r}}{(r^2 + (z')^2)^{\frac{3}{2}}}\ dz' = \frac{\rho_l}{4\pi\epsilon_0}\left[\frac{z'\hat{r}}{r\sqrt{r^2 + (z')^2}}\right]_{-1}^{1}$$
$$= \frac{\rho_l}{4\pi\epsilon_0} \left(\frac{2\hat{r}}{2\sqrt{r^2 + 1}}\right)\hat{z}$$
##### Surface Charge
$$\vec{E} = \frac{1}{4\pi\epsilon_0}\int_S\frac{\rho_s (\vec{R} - \vec{R'} )}{|\vec{R} - \vec{R'}|^3}ds'\tag{11}$$
$$\rho_s = \frac{C}{m^3}$$
$$\vec{E} = \frac{1}{4\pi\epsilon_0}\int_{z_1}^{z_2}\int_{x_1}^{x_2}\frac{\rho_2(\vec{R} - \vec{R'})}{|\vec{R} - \vec{R'}^3|}\ dx\ dy$$
$$\vec{R} = x\hat{x} + y\hat{y} + z\hat{z}$$
$$\vec{R'} = x'\hat{x} + y'\hat{y} + z'\hat{z}$$

#### 2.5 Spherical Coordinates
:w
