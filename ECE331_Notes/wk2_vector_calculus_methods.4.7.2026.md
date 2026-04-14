## Class 3
#### 1.8 Line Integrals
Consider the work performed by a force $F$ to push a block, moving it from $P_1(x,y)$ to $P_2(x,y)$.

The force vector is:
$$\vec{F} = F_x\hat{x} + F_y\hat{y} = |\vec{F}|\cos(\alpha)\hat{x} + |\vec{F}|\cos(\beta)\hat{y}$$

The force can be separated into the force in the $x$ direction, and the $y$ direction.

$$w = \int_{x_1}^{x_2}F_x\ dx + \int_{y_1}^{y_2}F_y\ dy = \int_{x_1}^{x_2}|F|\cos(\alpha)\ dx + \int_{y_1}^{y_2}|F|\cos(\beta)\ dy $$
$$F_x = \vec{F}\cdot \hat{x} = |F|\cos(\alpha)$$
$$F_y = \vec{F}\cdot \hat{y} = |F|\cos(\beta)$$
Therefore, by the above the work done is the sum of the two integrals of the dot products in either direction.
$$w = \int_{x_1}^{x_2}\vec{F}\cdot \hat{x}\ dx + \int_{y_1}^{y_2}\vec{F}\cdot \hat{y}\ dy$$
But $d\vec{l} = \hat{x}\ dx + \hat{y}\ dy$, differential length vector.

$$w = \int_{P_1}^{P_2} \vec{F}\cdot d\vec{l} = \int_{(x_1, y_1)}^{(x_2, y_2)}\vec{F}\cdot d\vec{l}$$
#### 1.9 Surface Integrals
Consider water flowing through a square pipe at a constant velocity $v$.

Assuming velocity is uniform in flow rate $\frac{kg}{s}$ is 
$$w_1 = \rho S_1v$$
$\rho = density, \frac{kg}{m^3}$ 
$S_1 = area, m^2$ 
$v = velocity$
$\frac{kg}{m^3}m^2\frac{m}{s}$

$S_1$ is the area of the pipe normal to it's direction of flow.

Imagine the pipe is cut at an angle forming a surface area $S_2$
For the area $S_2$ the flow rate is:
$$w_1 = \rho(S_2\cos(\theta))v$$
Where $\theta$ is the angle between the normal vector of this new surface and the surface itself.
$$= \rho S_2|v|\cos(\theta)$$
$$w_1 = \rho S_2(\vec{v}\cdot \hat{n})$$
$$\vec{v}\cdot \hat{n} = |\vec{v}||\hat{n}|\cos(\theta)$$
If $\vec{v}$ is varying $\vec{v} = \vec{v}(x,y)$. $\vec{v}$ may be different depending on $(x,y)$ across $S_2$ then we must integrate over all of $S_2$ to get the overall rate of flow.
$$w_1 = \int_{S_2}\int \rho(\vec{v}\cdot \hat{n})\ ds$$
Mathematically, we can therefore write that the rate of flow of a vector field $\vec{A}$ over a surface $s$ can be written as:
$$Q = \int_{SC}\vec{A}\cdot \hat{n}\ ds$$
$ds = dx\ dy$

Where $\int_{SC}$ is a surface. (double integral, integrating $x$, then $y$)
May also be written.
$$Q = \int_{SC}\vec{A}\cdot d\vec{s}$$
Where $d\vec{s} = \hat{n}\ ds$
$\hat{n}$ is a normal unit vector to the surface being evaluated. It indicates the direction of positive flow.

$Q$ is often referred to as flux.

#### 1.10 Stokes Theorem
For  a vector field $\vec{A}$, Stokes Theorem states that the integral of the curl is equal to the line integral of the surface area vector with respect to the :
$$\int_S(\nabla \times \vec{A})\cdot \hat{n}\ ds = \oint\vec{A}\cdot d\vec{l}$$
Curl measures the twisting of vector $\vec{A}$. If the curl is large, there is a lot of swirling around that point.

The integral of that curl ($\nabla \times \vec{A}$) is the "total amount of twisting". A scalar magnitude.

We can measure this "twisting" by just going around the edge of the surface. This is the right hand side. 

The integral around the edge of the vector $\vec{A}$ is the total magnitude of curling. 

Normal vector is the direction of the thumb with fingers wrapping around the closed path, $+\hat{n}$

##### Example
Given
$$\vec{A} = (2xz + 3y^2)\hat{y} + (4yz^2)\hat{z}$$
evaluate Stokes Theorem for the square surface on the $zy$ plane.

Stokes Theorem is:
$$\int_S(\nabla \times \vec{A})\cdot \hat{n}\ ds = \oint\vec{A}\cdot d\vec{l}$$
###### 1. Evaluate Curl
$$\nabla \times \vec{A} = \left|\begin{matrix}\hat{x} & \hat{y} & \hat{z}\\ \frac{\partial}{\partial x} & \frac{\partial}{\partial y} & \frac{\partial}{\partial z} \\ 0 & A_y & A_z\end{matrix}\right|$$
$$= \hat{x}\left(\frac{\partial A_z}{\partial y}- \frac{\partial A_y}{\partial z}\right) - \hat{y}\left(\frac{\partial A_z}{\partial x}- \frac{\partial A_x}{\partial z}\right) + \hat{z}\left(\frac{\partial A_y}{\partial x}- \frac{\partial A_x}{\partial y}\right)$$
$$= \hat{x}(4z^2 - 2x) - \hat{y}(0) + \hat{z}(2z)$$
###### 2. Determine Direction of $\hat{n}$
What way does $\hat{n}$ point? Use the right hand rule, wrap fingers counterclockwise (the path for the line integral on the right side), $\hat{n}$ points out of the $zy$ plane in the $+\hat{x}$ direction.

###### 3. Dot Product of $\nabla \times \vec{A}$ and $\hat{n}$

$$(\nabla \times \vec{A}) \cdot\hat{n} = [\hat{x}(4z^2 - 2x) + \hat{z}(2z)]\cdot \hat{x} = 4z^2 - 2x $$
###### 4. Take the Surface Integral (Left Side)
We're evaluating this at $x=0$
$$\int_S(\nabla \times \vec{A})\cdot \hat{n}\ ds = \int_0^1\int_0^1(4z^2 - 2x) dy\ dz$$
$$=\int_0^14z^2\ dz = \frac{4z^3}{3}|_0^1 = \frac{4}{3}$$
###### 5. Evaluate the Line Integral
$$\oint_{lc} \vec{A}\cdot d\vec{l}$$
$$d\vec{l} = \hat{x}\ dx + \hat{y}\ dy + \hat{z}\ dz$$
For the top and bottom sides, $d\vec{l} = dy\hat{y}$
For the left and right sides, $d\vec{l} = dz\hat{z}$

## Class 4
#### 1.11 Stokes Theorem
The curl evaluated over a surface represented by the direction normal to the surface yields a scalar (left).

This is equal to the line integral around the boundary of the surface (right).
$$\oint_S (\nabla \times \vec{A}) \cdot \hat{n}\ ds=\oint_l \vec{A}\cdot d\vec{l}$$
$$d\vec{l} = \hat{x}\ dx + \hat{y}\ dy + \hat{z}\ dz$$
Given $$\vec{A} = [2xz + 3y^2]\hat{y} + [4yz^2]\hat{z}$$
verify Stokes' Theorem.

The surface is a square in the $zy$ plane with sides $I, II, III, IV$
##### Left Side 
Details in **Class 3:** [[#4. Take the Surface Integral (Left Side)]] notes above
Evaluated at $x=0$
$$\int_S (\nabla \times \vec{A})\cdot \hat{n}dS = \frac{4}{3}$$

##### Right Side
$$\oint_l\vec{A}\cdot d\vec{l}$$
###### 1. For sides $I, III$ (top and bottom, parallel to $x$): $d\vec{l} = \hat{y}dy$
$$\vec{A}\cdot \hat y\ dy = [(2xz+3y^2)\hat{y} + (4yz^2)\hat{z}]\cdot \hat{y}\ dy = 3y^2\ dy$$
$$\hat{y}\cdot \hat{z} = 0$$
###### 2. For $I, IV$ (left and right, parallel to $y$): $d\vec{l} = \hat{z}dz$
$$\vec{A}\cdot \hat{z}\ dz = = [(2xz+3y^2)\hat{y} + (4yz^2)\hat{z}]\cdot \hat{z}\ dz = 4yz^2\ dz$$

###### 3. Taking the Integral
Evaluate each side individually, then sum them.
**Side 1**
$$\int_0^13y^2\ dy = y^3|_0^1 = 1$$
**Side 2**
In this case, on side $II$, $y=1$ so:
$$\int_0^14yz^2\ dz = \frac{4}{3}yz^3|_0^1 = \frac{4}{3}(1)z^3|_0^1 = \frac{4}{3}$$
**Side 3**
$$\int_1^03y^2\ dy = y^3|_1^0 = -1$$
**Side 4**
In this case, on side $IV$, $y=0$:
$$\int_1^04yz^2\ dz = \int_1^04(0)z^2\ dz = 0$$
**Summation**
$$1 + \frac{4}{3} - 1 + 0 = \frac{4}{3}$$
We can see this is equal to the left hand side.

#### 1.12 Volume Integral
A volume integral is an expression of the form:
$$M = \int_V\rho(x,y,z)\ dV \equiv \int\int\int\rho(x,y,z)\ dx\ dy\ dz$$
Imagine some mass density $\rho =  \frac{kg}{m^3}$ integrated over a sphere.

$\rho$ is a scalar and $dV = dx\ dy\ dz$ 
$M$ is the total mass.

#### 1.13 Fundamental Theory of Calculus
Given a function $f(x)$ then,
$$\left(\frac{df}{dx}\right)\ dx$$
is the infinitesimal change in $f$ when you go from $x$ to $x + dx$.

Then the **Fundamental Theorem of Calculus (FTC)** states that:
$$\int_a^b\left(\frac{df}{dx}\right)\ dx = f(b) - f(a)$$
or 
$$\int_a^b F(x)\ dx = f(b)-f(a)$$
Where $F(x) = \frac{df}{dx}$.

Suppose you want to determine the height of a set of stairs. You could chop up the staircase into pieces and sum them up to get the total height (left side), or you could measure the height of the top and subtract the ground level from that (right side).


#### 1.14 Fundamental Theory of Calculus in Three Dimensions (for Gradients)
Suppose we have a scalar function $T(x,y,z)$.

We previously noted that if we are at a point $P_1(x,y,z)$ and move an infinitesimal distance $d\vec{l_1} = dx, dy, dz$, function $T$ will change by an amount:
$$dT = (\nabla T)\cdot d\vec{l_1}$$ 
$$\nabla T = \frac{\partial T}{\partial x}\hat{x} + \frac{\partial T}{\partial y}\hat{y} + \frac{\partial T}{\partial z}\hat{z}$$

If we move a little bit more to $d\vec{l_2}$ then the incremental change in $T$ will be $(\nabla T)\cdot d\vec{l_2}$.

If we have a full path from $a$ to $b$:
$$\int_a^b(\nabla T)\cdot d\vec{l} = T(b) - T(a)$$
Where $a = (x_a, y_a, z_a)$ and $b = (x_b, y_b, z_b)$

The line integral path of a scalar is equal to the difference of $T$ at two different places.

#### 1.15 Divergence Theorem 
Also called Gauss's, Green's Theorem.

For a given vector field $\vec{A}$ the **Divergence Theorem** states that if we integrate the divergence over a volume, that is equal to the line integral of $\vec{A}$ over a surface:
$$\int_V(\nabla\cdot \vec{A})\ dv = \oint_S\vec{A}\cdot \hat{n}\ ds$$
This says that the divergence over a region of volume is equal to the value of the vector function normal to the boundary surface.

Divergence measures spreading out. Increasing divergence means increasing rate of spreading out of the vectors in vector field $\vec{A}$.

##### Example
Imagine a bathtub filling up. When the water reaches the top, it will begin flowing over the sides.

The top of the bathtub could be the surface on the right side of the equation. 

If you evaluate the flow of the water rushing out of that surface and over the sides, that would be equal to the **divergence** of the water **spreading out** from the volume of the tub.

This is **flux** in Emag.

#### 1.16 Vector Identities
##### 1. 
The curl of a gradient of any scalar field is zero.

$V$ is a scalar:
$$\nabla\times (\nabla V)\equiv 0$$

Therefore, if $\nabla \times \vec{E} = 0$, we can define a scalar field $V$ by:
$$\vec{E} = \nabla V;\ \ \vec{E} = -\nabla V$$
##### 2. 
The divergence of the curl of any vector field is zero.
$$\nabla \cdot (\nabla \times \vec{A}) \equiv 0$$
If $\nabla \cdot \vec{B} = 0$,  $\vec{B}$ expressed as:
$$\vec{B} = \nabla \times \vec{A}$$
#### 1.17 Helmholtz Theorem
A. vector field is determined (to within an additive constant) if both the divergence and the curl are specified everywhere. 

Helmholtz Theorem states that any vector field can be written as:
$$\vec{B} = -\nabla U + \nabla \times \vec{A} \tag{1}$$
##### Divergence of $(1)$
The red portion equals 0 by [[#1.]] above
$$\nabla \cdot\vec{B} = \nabla \cdot (\nabla U) + \color{red}\nabla\cdot (\nabla \times \vec{A})\tag{2}$$

$$\nabla \cdot \vec{B} = \nabla\cdot (\nabla U) = \nabla\cdot\left(\frac{\partial U}{\partial x}\hat{x} + \frac{\partial U}{\partial y}\hat{y} + \frac{\partial U}{\partial z}\hat{z}\right)$$
$$\nabla \cdot \vec{B} = \left(\frac{\partial}{\partial x}\hat{x} + \frac{\partial}{\partial y}\hat{y} + \frac{\partial}{\partial z}\hat{z}\right)\cdot \left(\frac{\partial U}{\partial x}\hat{x} + \frac{\partial U}{\partial y}\hat{y} + \frac{\partial U}{\partial z}\hat{z}\right)$$
The Laplacian $\nabla^2$ times $U$ is $\rho$. This is known as **Poisson's Equation**
$$\nabla^2U =\frac{\partial^2 U}{\partial x^2} - \frac{\partial^2 U}{\partial y^2} - \frac{\partial^2 U}{\partial z^2} = \rho$$
This can be used to describe the temperature in partial differential form.

The

##### Curl of $(1)$
The red portion is again 0 by [[#1.]]
$$\nabla \times \vec{B} = \textcolor{red}{\nabla \times (-\nabla U)}+ \nabla \times (\nabla \times \vec{A})$$
The following term does not have to be 0.
$$\nabla \times \vec{B} = \nabla \times \nabla \times \vec{A}$$
$$\nabla \times \vec{B} = \nabla \times \vec{J}$$
$$\vec{J} = \nabla \times \vec{A}$$
#### 1.18 Example
Given a vector function
$$\vec{F}(x,y,z) = [3y + C_1 z]hat{x} +[C_2x - 2z]\hat{y}+ [C_3y + z]\hat{z} $$
##### a.
Determine the constants $C_1, C_2, C_3$ if $\vec{F}$ is irrotational
Irrotational means the curl $\nabla \times \vec{F} = 0$ 
$$\nabla \times \vec{F} = \left|\begin{matrix}\hat{x} & \hat{y} & \hat{z} \\ \frac{\partial}{\partial x} & \frac{\partial}{\partial y} & \frac{\partial}{\partial z} \\ 3y + C_1z & C_2x-2z & C_3y + z\end{matrix}\right| = 0$$
$$ = [-C_3 + 2]\hat{x} - [0-C_1]\hat{y} - [C_2 - 3]\hat{z} = 0$$
So we can use this to find the constants.
$C_1 = 0$
$C_2 = 3$
$C_3 = 2$

$$\vec{F} = [3y]\hat{x} + [3x-2z]\hat{y} - [2y + z]\hat{z}$$
 
##### b. 
Determine a scalar potential $U$ such that $\vec{F} = -\nabla U$
$$F = -\hat{x}\frac{\partial U}{\partial x} -\hat{y}\frac{\partial U}{\partial y} - \hat{z}\frac{\partial U}{\partial z}$$
$$F_x = \frac{\partial U }{\partial x} = -3y;\ \ U = -3yx + f(y,z)$$
$$F_y = \frac{\partial U }{\partial y} = -3x + 2z;\ U = -3xy + 2zy + f(x,z)$$
$$F_z = \frac{\partial U}{\partial z} = 2y + z;\ U = 2yz + \frac{z^2}{2} + f(x,y)$$
Comparing equations:
$$U = -3yx + 2yz + \frac{z^2}{2} + constant$$
To determine the constant, we would need defined boundary conditions, for example for each plane of a box, $U$ has a particular value at the boundary.
