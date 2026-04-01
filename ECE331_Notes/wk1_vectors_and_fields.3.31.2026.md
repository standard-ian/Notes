## Class 1
#### 1.1 Vectors and Fields
##### Field
A field is a distribution in space of a quantity: scalar or vector
- Time dependent or independent
- Typically represented as an equation for example $f(x,y,z)$
- Every point in space depends on the function

##### Scalar
A field value specified by a magnitude and a sign, for example temperature.
- At every point in a room, there is a particular temperature. $T(x,y,z)$

##### Vectors
A field that is specified by a magnitude and direction
- Velocity $\vec{V}(x,y,z) = V_x(x,y,z)\hat{x} + V_{y}(x,y,z)\hat{y} + V_z(x,y,z)\hat{z}$ 
- $V=V_x\hat{x} + V_y\hat{y} + V_z\hat{z}$

#### 1.2 Scalar Multiplication (Dot Product)
For vector:
$\vec{A} = a_1\hat{x} + a_2\hat{y} + a_3\hat{z}$
$\vec{B} = b_1\hat{x} + b_2\hat{y} + b_3\hat{z}$

Then we define:
$\vec{A}\cdot \vec{B} = a_1b_1 + a_2b_2 + a_3b_3$

If we dot a vector with itself:
$$\vec{A}\cdot \vec{A} = a_1^2 + a_2^2 + a_3^2 = |\vec{A}^2|$$
$$|A| = \sqrt{\vec{A}\cdot \vec{A}}$$
A unit vector is defined as:
$$\hat{A} = \frac{\vec{A}}{|A|}$$
The magnitude of the unit vector is 1, $|\hat{A}| = 1$

It can be shown:
$$\vec{A}\cdot \vec{B} = |A||B|\cos(\phi)$$
$\phi$ is the angle between $\vec{A}$ and $\vec{B}$, if this is $90^\circ$, $\vec{A}\cdot \vec{B} = 0$ since $\cos(90^\circ) = 0$ 

#### 1.3 Vector Cross Product
For:
$$\vec{A} = a_1\hat{x} + a_2\hat{y} + a_3 \hat{z}$$
$$\vec{B} = b_1\hat{x} + b_2\hat{y} + b_3\hat{z}$$
$$\vec{A}\times\vec{B} = \left|\begin{matrix}\hat{x} & \hat{y} & \hat{z}\\a_1 & a_2 & a_3\\b_1 & b_2 & b_3\end{matrix}\right|$$
$$=\left(\det\left|\begin{matrix}a_2 & a_3\\b_2 & b_3\end{matrix}\right|\right) \hat{x} -\left(\det\left|\begin{matrix}a_1 & a_3\\b_1 & b_3\end{matrix}\right|\right) \hat{y} -\left(\det\left|\begin{matrix}a_1 & a_2\\b_1 & b_2\end{matrix}\right|\right) \hat{z}$$
$$\vec{A}\times \vec{B} = \hat{x}(a_2b_3 -a_3b_2)-\hat{y}(a_1b_3 - a_3b_1) + \hat{z}(a_1b_2 - a_2b_1)$$
For Unit Vectors
$$\hat{x}\times\hat{y} = \left|\begin{matrix}\hat{x} & \hat{y} & \hat{z}\\1 & 0 & 0\\0 & 1 & 0\end{matrix}\right| = \hat{x} -\hat{y} + \hat{z}$$
$\hat{x} \times \hat{y} = \hat{z}$
$\hat{y}\times\hat{z} = \hat{x}$
$\hat{z}\times \hat{x} = \hat{y}$
##### Right Hand Rule 
- Thumb points in direction of first term
- Fingers point in direction of second term
- Palm points in the resultant direction

$$\vec{A}\times \vec{B} = -\vec{B}\times \vec{A}$$
It can also be shown that:
$$|\vec{A}\times \vec{B}| = |A||B|\sin\phi$$
The cross product will be at a max when $\vec{A}$ and $\vec{B}$ are orthogonal ($90^\circ$)

#### 1.4 Orthogonal Coordinates
$$\vec{A}(x,y,z) = \hat{x}A_x(x,y,z) + \hat{y}A_y(x,y,z) + \hat{z}A_z(x,y,z)$$
An infinitesimal displacement vector from $x,y,z$ to $x + dx, y+dy, z+dz$ is defined as:
$$\vec{dl} = \hat{x}dx + \hat{y}dy + \hat{z}dz$$
$$\Delta l$$
Surface elements are defined as two dimensional planes of infinitesimal size that could be integrated.
$dS = \begin{matrix}dS_x = dydz\\ dS_y = dxdz\\dS_z = dxdy\end{matrix}$
##### 1.4.2 Cylindrical Coordinates
Consider a point $P$ on the $xy$ plane with coordinates $(x,y)$

To convert to cylindrical coordinates:
- $r = \sqrt{x^2 + y^2}$ 
- $\phi = \arctan\left(\frac{y}{x}\right)$
- $z = z$
From cylindrical to cartesian
- $x = r\cos\phi$
- $y = r\sin\phi$
- $z=z$

But for a vector
$$\vec{A}(r, \phi, z) = A_r(r, \phi, z)\hat{r} + A_\phi(r,\phi, z)\hat{\phi} + A_z(r, \phi, z)\hat{z}$$
Since the three coordinates are orthogonal:
$\hat{r}\times \hat{\phi} = \hat{z}$
$\hat{\phi}\times \hat{z} = \hat{r}$
$\hat{z}\times \hat{r} = \hat{\phi}$

So:
$$A_x = \vec{A}\cdot \hat{x} = A_r\hat{r}\cdot \hat{x} + A_\phi \hat{\phi}\cdot \hat{x} + A_z\hat{z}\cdot \hat{x}$$
$\hat{z}\cdot \hat{x} = 0$ Dot product of two orthogonal unit vectors is 0
$\hat{r}\cdot\hat{x} = |1||1|\cos\phi$
$\hat{\phi}\cdot\hat{x} =\cos\left(\frac{\pi}{2} + \phi\right) = -\sin(\phi)$
$$A_x = A_r\cos(\phi) - A_\phi\sin(\phi)$$
$$A_y = \vec{A}\cdot \hat{y} = A_r\hat{r}\cdot\hat{y} + A_\phi\hat{\phi}\cdot \hat{y} + A_z\hat{z}\cdot\hat{y}$$

$\hat{z}\cdot \hat{x} = 0$ Dot product of two orthogonal unit vectors is 0
$\hat{\phi}\cdot\hat{y} = |1||1|\cos\phi$
$\hat{r}\cdot\hat{y} =\cos\left(\frac{\pi}{2} - \phi\right) = -\sin(-\phi) = \sin(\phi)$
$$A_y = A_r\sin\phi + A_\phi\cos\phi$$
$$\begin{bmatrix}A_x\\A_y\\A_z\end{bmatrix} = \begin{bmatrix}\cos\phi & -\sin\phi & 0\\\sin\phi & \cos\phi & 0\\0 & 0 & 1\end{bmatrix}\begin{bmatrix}A_r\\A_\phi\\A_z\end{bmatrix}$$
The differential length in cylindrical coordinates is:
$$\vec{dl} = \hat{r}dr + \hat{\phi}d\phi + \hat{z}dz$$
Areas:
$$dS = \begin{matrix}dS_r = rd\phi dz\\dS_\phi = drdz\\dS_z = rd\phi dr\end{matrix}$$
