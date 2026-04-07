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
## Class 2
#### 1.5 Gradient
For a function with 1 variable, $f(x) = \frac{df}{dx}$ gives the slope of $f\ vs.\ x$ 

If we change $x$ by an amount $dx$ (a tiny amount), then $f$ changes by an amount $df$

$$df = \left(\frac{df}{dx}\right)dx$$
Where $\frac{df}{dx}$ is the **Proportionality Factor**

For a scalar function with three variables $T(x,y,z)$ (temp in room)...
How much does $T$ vary? 

If all three variables change by an infinitesimal amount $dx,dy,dz$

Then, the temperature $T$ will also change by $dT$. 

$$dT = \left(\frac{\partial T}{\partial x}\right)dx + \left(\frac{\partial T}{\partial y}\right)dy + \left(\frac{\partial T}{\partial z}\right)dz$$

Could also be represented as:
$$dT = \left[\frac{\partial T}{\partial x}\hat{x} + \frac{\partial T}{\partial y}\hat{y} + \frac{\partial T}{\partial z}\hat{z}\right]\cdot (dx\hat{x} + dy\hat{y} + dz\hat{z})$$
Where $dx\hat{x} + dy\hat{y} + dz\hat{z} = d\vec{l}$ 
$$\begin{equation}dT = \nabla T\cdot d\vec{l}\end{equation}$$
Where:
$$\nabla T = \frac{\partial T}{\partial x}\hat{x} + \frac{\partial T}{\partial y}\hat{y} + \frac{\partial T}{\partial z}\hat{z}$$
The gradient of $T$. This is called the **del** operator.

The gradient of a scalar is a vector.

$\nabla T$ is a vector function with a magnitude and direction.

From 
$$\begin{equation}dT = \nabla T\cdot d\vec{l}\end{equation}$$
$$dT = |\nabla T| |d\vec{l}|cos\phi$$
$\phi$ is the angle between $|\nabla T|$ and $|d\vec{L}|$

If $|d\vec{l}|$ has a fixed magnitude, maximum $dT$ occurs when $\phi = 0$ for a fixed $|d\vec{l}|$ dT is greatest when move in the direction $\nabla T$

The direction of $d\vec{l}$ will be aligned with $\nabla T$

- $\nabla T$ points in the direction of maximum increase of function $T$
- $-\nabla T$ points in direction of steepest decent

In cylindrical coordinates, 
$$\nabla\equiv \hat{r}\frac{\partial}{\partial r} + \hat{\phi}\frac{1}{r}\frac{\partial}{\partial\phi} + \hat{z}\frac{\partial}{\partial z}$$
##### Example
If the temperature is 
$$T(x,y,z) = 1 + x^2 + 2y^2 + \frac{3}{2}z^2  \ ^\circ C$$
In what direction does the temperature increase the most at $(1, 1, -2) = (x,y,z)$

$$\vec{u} = \nabla T(x,y,z) = \frac{\partial T}{\partial x}\hat{x} + \frac{\partial T}{\partial y}\hat{y} + \frac{\partial T}{\partial z}\hat{z}$$
Taking the partial derivative for all three directions...
$$ = zx\hat{x} + 4y\hat{y} + 3z\hat{z}$$
At $(1,1,-2)$
$$\vec{u} = \nabla T(1,1,-2) = 2\hat{x} + 4\hat{y} - 6\hat{z}$$
The maximum rate of change is $|\vec{u}| = |\nabla T(1,1,-2)| = \sqrt{2^2 + 4^2 + 6^2} = 2\sqrt{14} = 7.48^\circ C$

The unit vector direction:
$$\hat{u} = \frac{\vec{u}}{|\vec{u}|} = \frac{2\hat{x} + 4\hat{y} - 6\hat{z}}{2\sqrt{14}} = \frac{[\hat{x} + 2\hat{y} -3\hat{z}]}{\sqrt{14}}$$

#### 1.6 Divergence
The divergence of a vector $\vec{A}$ 
$$\vec{A} = A_x\hat{x} + A_y\hat{y} + A_z\hat{z}$$
is defined as:
$$\nabla\cdot \vec{A} = \left[\frac{\partial }{\partial x}\hat{x} + \frac{\partial }{\partial y}\hat{y} + \frac{\partial }{\partial z}\hat{z}\right]\cdot \left[A_x\hat{x} + A_y\hat{y} + A_z\hat{z}\right] = \frac{\partial A_x}{\partial x} + \frac{\partial A_y}{\partial y} + \frac{\partial A_z}{\partial z}$$
Note that divergence of a vector is a scalar

Divergence evaluates how much the vector $\vec{A}$ spreads out. 
![[Pasted image 20260402202624.png]]

The middle diagram represents a large $+ve$ divergence

An analogy for  positive divergence might be a fire sprinkler where the water is moving out in all directions and increasing in velocity due to gravity.

##### Cylindrical
$$\nabla \cdot \vec{A} = \frac{1}{r}\frac{\partial}{\partial r}(rA_r) + \frac{1}{r} \frac{\partial A_\phi}{\partial \phi} + \frac{\partial A_z}{\partial z}$$
#### 1.7 Curl
The **Curl** of a vector $A$ is defined as:

$$\vec{A} = A_x\hat{x} + A_y\hat{y} + A_z \hat{z}$$
$$\nabla \times\vec{A} =\left| \begin{matrix}\hat{x} & \hat{y} & \hat{z}\\\frac{\partial}{\partial x} & \frac{\partial}{\partial y} & \frac{\partial}{\partial z} \\ A_x & A_y & A_z\end{matrix}\right|$$
$$ = \hat{x}\left[\frac{\partial A_z}{\partial y} - \frac{\partial A_y}{\partial z}\right] - \hat{y}\left[\frac{\partial A_z}{\partial x} - \frac{\partial A_x}{\partial z}\right] + \hat{z}\left[\frac{\partial A_y}{\partial x} - \frac{\partial A_x}{\partial y}\right]$$

The curl of a vector is still a vector.

The curl measures how much the vector $\vec{A}$ twists around a point. A whirlpool has a large curl.

##### Example
Consider a function defined by 
$$\vec{A} = -y\hat{x} + x\hat{y}$$

| $x$  | $y$  | $\vec{A}$   |
| ---- | ---- | ----------- |
| $0$  | $1$  | $-\hat{x}$  |
| $0$  | $2$  | $-2\hat{x}$ |
| $0$  | $3$  | $-3\hat{x}$ |
| $0$  | $-1$ | $\hat{x}$   |
| $0$  | $-2$ | $2\hat{x}$  |
| $0$  | $-3$ | $3\hat{x}$  |
| 1    | $0$  | $\hat{y}$   |
| 2    | $0$  | $2\hat{y}$  |
| 3    | $0$  | $3\hat{y}$  |
| $-1$ | $0$  | $-\hat{x}$  |
| $-2$ | $0$  | $-2\hat{x}$ |
| $-3$ | $0$  | $-3\hat{x}$ |
```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
\begin{axis}[
    xlabel={$x$},
    ylabel={$y$},
    xmin=-4, xmax=4,
    ymin=-4, ymax=4,
    grid=both,
    grid style={line width=0.2pt, draw=gray!30},
    major grid style={line width=0.4pt, draw=gray!60},
    width=10cm, height=10cm,
    xtick={-3,-2,-1,0,1,2,3},
    ytick={-3,-2,-1,0,1,2,3},
]
% x=0, y>0: A = -y*xhat
\addplot[->, orange, very thick] coordinates {(0,1) (-1,1)};
\addplot[->, orange, very thick] coordinates {(0,2) (-2,2)};
\addplot[->, orange, very thick] coordinates {(0,3) (-3,3)};
% x=0, y<0: A = -y*xhat
\addplot[->, orange, very thick] coordinates {(0,-1) (1,-1)};
\addplot[->, orange, very thick] coordinates {(0,-2) (2,-2)};
\addplot[->, orange, very thick] coordinates {(0,-3) (3,-3)};
% y=0, x>0: A = x*yhat
\addplot[->, orange, very thick] coordinates {(1,0) (1,1)};
\addplot[->, orange, very thick] coordinates {(2,0) (2,2)};
\addplot[->, orange, very thick] coordinates {(3,0) (3,3)};
% y=0, x<0: A = x*yhat (negative)
\addplot[->, orange, very thick] coordinates {(-1,0) (-1,-1)};
\addplot[->, orange, very thick] coordinates {(-2,0) (-2,-2)};
\addplot[->, orange, very thick] coordinates {(-3,0) (-3,-3)};
\end{axis}
\end{tikzpicture}
\end{document}

```
In the figures previously pictured, there is 0 curl, in this image, there is clearly curl. 

We can use arrows at different points to represent the field flow.

The curl of $\vec{A}$ is:
$$\nabla \times\vec{A} =\left| \begin{matrix}\hat{x} & \hat{y} & \hat{z}\\\frac{\partial}{\partial x} & \frac{\partial}{\partial y} & \frac{\partial}{\partial z} \\ -y & x & 0\end{matrix}\right|$$
$$ = \hat{x}\cancel{\left[\frac{\partial 0}{\partial y} - \frac{\partial x}{\partial z}\right]} - \hat{y}\cancel{\left[\frac{\partial 0}{\partial x} - \frac{-\partial y}{\partial z}\right]} + \hat{z}\left[\frac{\partial x}{\partial x} - \frac{-\partial y}{\partial y}\right]$$
$$= 0\hat{x} + 0\hat{y} + (1+1)\hat{z} = 2\hat{z}$$
The divergence is given by:
$$\nabla\cdot \vec{A} = \left[\frac{\partial}{\partial x}\hat{x} + \frac{\partial}{\partial y}\hat{y} + \frac{\partial}{\partial z}\hat{z}\right]\cdot \left[-y\hat{x} + h\hat{y}\right]$$
$$ = 0 + 0 + 0$$
No spreading out.

If $\nabla \cdot \vec{A} = 0$ The field is called **Solenoidal**
If $\nabla \times \vec{A} = 0$ the field is called **irrotational** or a **conservative field**.

##### Cylindrical 
$$\nabla \times \vec{A}  = \hat{r}\left(\frac{1}{r}\frac{\partial A_z}{\partial \phi} - \frac{\partial A_\phi}{\partial z}\right) + \hat{\phi}\left(\frac{\partial A_r}{\partial z} - \frac{\partial A_z}{\partial r}\right) + \hat{z}\frac{1}{r}\left(\frac{\partial(r A_\phi)}{\partial r} - \frac{\partial A_r}{\partial \phi}\right)$$
$$\nabla \times \vec{A} = \left|\begin{matrix}\hat{r} & r\hat{\phi}  & \hat{z}\\ \frac{\partial}{\partial r} & \frac{\partial}{\partial\phi} & \frac{\partial}{\partial z} \\A_r & rA_\phi & A_z\end{matrix}\right|$$
