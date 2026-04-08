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

