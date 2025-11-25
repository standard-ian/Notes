#### 12.3 Dot Products
###### Example 1:
Determine if the angle between these 2 vectors is acute, right, or obtuse. Then, find the cosine of the angle and the angle itself in radians.
$<1, 1, 1>, <2, -1, 2>$ 

Given $\vec{u}$ and  $\vec{v}$ 
$\vec{u} \cdot \vec{v}  = ||\vec{u}||\cdot||\vec{v}|| cos\theta$ 
Where $\theta$ is the smallest positive angle between the 2 vectors

Product between 2 vectors is a **scalar** that is proportional to the 2 vectors and the cosine of the angle between them

Dot Product > 0: Acute
Dot Product = 0: Right

$<1, 1, 1> \cdot <2, -1, 2> = 3, \theta$ acute
$||<1,1,1>|| = \sqrt{1^{2} + 1^{2} + 1^{2}} = \sqrt{3}$
$||<2,-1,2>|| = \sqrt{2^{2} + (-1)^{2} + 2^{2}} = \sqrt{9} = 3$
$\vec{u} \cdot \vec{v}  = ||\vec{u}||\cdot||\vec{v}|| cos\theta$ 
$<1, 1, 1> \cdot <2, -1, 2> = 3 = \sqrt{3}\times 3 \times cos\theta$
$\frac{3}{\sqrt{3}\times3} = \frac{\sqrt{3}\times3\times cos\theta}{\sqrt{3}\times 3} = \frac{1}{\sqrt{3}} = cos\theta \rightarrow \frac{\sqrt{3}}{3} = cos\theta$ 
$arccos{\frac{\sqrt{3}}{3}} = \theta$

###### Example 2:
Use the properties of the dot product to evaluate the expression assuming that $\vec{u}\cdot\vec{v}=2$, $||\vec{u}|| = 1, ||\vec{v}|| = 3$
Relevant property: $\vec{u}\cdot\vec{u}=||\vec{u}||^{2}$
Evaluate: $(\vec{u}\cdot\vec{v}) \cdot\vec{v}$ 
$(\vec{u}\cdot\vec{v}) \cdot\vec{v} = \vec{u} \cdot \vec{v} + \vec{v} \cdot \vec{v} = 2 + 3^{2} = 11$ 


###### Example 3:
Given $\vec{u}$ and $\vec{v}$ as example 2, evaluate $2\vec{u}\cdot (3\vec{u}-\vec{v})$
$= (2\vec{u}) \cdot (3\vec{u}) - (2\vec{u})\cdot(\vec{v})$
$=(2\times3)(\vec{u}\cdot\vec{u})-(2)(\vec{u}\cdot\vec{v})$
$= (6)(2^{2})-(2)(2)$ 
$= 6-4 = 2$ j

###### Example 4:
Assume that $||\vec{v}|| = 2$, $||\vec{w}|| = 3$, and the angle between $\vec{v}$ and $\vec{w}$ is $120^{\circ}$. Determine:
1. $\vec{v} \cdot \vec{w} = ||\vec{v}|| \cdot ||\vec{w}||cos(120^{\circ}) = (2)(3)(-\frac{1}{2}) = -3$
2. $||2\vec{v} - 3\vec{w}||$ 
	What is $||2\vec{v} - 3\vec{w}||^{2}$ ?
	$||2\vec{v} - 3\vec{w}|| ^{2} = (2\vec{v} - 3\vec{w})\cdot(2\vec{v} - 3\vec{w})$
	$=(2\vec{v})\cdot(2\vec{v}) - (3\vec{w})\cdot(2\vec{v}) + (2\vec{v})\cdot(-3\vec{w}) +(-3\vec{w})\cdot(3\vec{w})$
	$=(4)(\vec{v}\cdot\vec{v}) - (6)(\vec{w} \cdot \vec{v}) - 6(\vec{v}\cdot\vec{w}) + (9)(\vec{w}\cdot\vec{w})$ 
	$=4(2^{2}) - (6)(-3)-(6)(-3) + 9(3^{2}) = 133 = ||2\vec{v} - 3\vec{w}||^{2}$
	so, $||2\vec{v} - 3\vec{w}|| = \sqrt{133}$ 

#### 12.4 Cross Product
This really only works well in 3 dimensions.
The result of the cross product is a vector, while the result of the dot product is a scalar.

###### Example 1:
Calculate the cross product of $\vec{v} = <\frac{2}{3}, 1, \frac{1}{2}>$ $\vec{w} = <4, -6, 3>$

The cross product is a vector orthogonal to both $\vec{v}$ and $\vec{w}$ forming a right hand system.
We compute the $\vec{v}\times\vec{w}$ by the "symbolic determinant"
![[coord_systems.jpeg]]

$\begin{bmatrix}+ & - & +\\ \vec{i} & \vec{j} & \vec{k} \\ \frac{2}{3} & 1 & \frac{1}{2}\\ 4 & -6 & 3\end{bmatrix}$

For $\begin{bmatrix}a & b\\ c & d\end{bmatrix}$ , $a(d) - b(c) = determinant$ 

$= \vec{i}\begin{bmatrix}1 & \frac{1}{2} \\ -6 & 3 \end{bmatrix} - \vec{j}\begin{bmatrix}\frac{2}{3} & \frac{1}{2}\\4 & 3\end{bmatrix} + \vec{k}\begin{bmatrix}\frac{2}{3} & 1\\4 & -6\end{bmatrix}$ 

$= \vec{i} (3 - (-3)) - \vec{j}(2-2) + \vec{k}(-4-4)$ 

###### Example 2:
Calculate the cross product $(3\vec{u} + 4\vec{w})\times\vec{w}$
Assuming: $\vec{u}\times\vec{v} = <0,3,1>$ 

$=[(3\vec{u})\times\vec{w})] + [(4\vec{w}) \times \vec{w}]$ 
$=3(\vec{u}\times\vec{w}) + 4(\vec{w}\times\vec{w})$ 

The cross product of any 2 vectors that are pointing in the same or opposite direction have a cross product of 0. $\lambda\vec{u} \times \vec{u} = 0$ 

so, $= 3<0, 3, 1> + 4<0,0,0>$
$= <0, 9, 3>$

###### Example 3:
Use the cross product to find the area of the triangle in 3 space  defined by $\vec{P}=(1,2,-2)$ , $\vec{Q} = (3,4,2)$ and the origin.
Given two vectors spanning a triangle - the area is the magnitude of their cross product divided by 2
$A=\frac{||\vec{P}\times\vec{Q}||}{2}$

Create 2 vectors from the given points using the origin as their shared point

$\vec{OP} = <1, 2, -2>$ and $\vec{OQ} = <3,4,2>$
            +   -  +
$\vec{OP}\times\vec{OQ} = \begin{bmatrix}\vec{i} & \vec{j} & \vec{k} \\1 & 2 & -2 \\ 3 & 4 & 2\end{bmatrix}$  = $\vec{i}\begin{bmatrix}2 & -2 \\ 4 & 2\end{bmatrix} - \vec{j}\begin{bmatrix}1 & -2 \\ 3 & 2\end{bmatrix} +\vec{k}\begin{bmatrix}1 & 2 \\ 3 & 4\end{bmatrix} = <12, -8, -2>$ 

$||\vec{OP}\times\vec{OQ}|| = \sqrt{12^{2} + (-8)^{2} + (-2)^{2}}$ 

$\sqrt{144+64+4} = \sqrt{212}$

$A=\frac{\sqrt{212}}{2}$

###### Useful Shortcut for Cross Products
![[cp_shortcut.jpeg]]


#### 12.5 Planes in Three-Space
Plane through $P_{0} = (x_{0}, y_{0}, z_{0})$ with normal vector $n = (a, b, c)$:
- Geometrically: The tips of all vectors based at $P_{0}$ that are perpendicular to $n$
- Algebraically:
	**Vector form**:         $\vec{n} · (x, y, z) = d$
	**Scalar forms**:        $a(x - x_{0}) + b(y - y_{0}) + c(z - z_{0}) = 0$
			     $ax +by +cz = d$ where: $d = \vec{n} \cdot <x_{0}, y_{0}, z_{0}> = ax_{0} + by_{0} + cz_{0}$
			     
The family of parallel planes with given normal vector $n = (a, b, c)$ consists of all planes with equation $ax + by + cz = d$ for some $d$.

A plane is determined in each of the following cases. In each case a point on the plane and a normal vector to the plane can be determined in order to find an equation for the plane.
- Three noncollinear points
- Two lines that intersect in a point
- A line and a point not on it
- Two distinct parallel lines

The intersection of a plane $\rho$ with a coordinate plane or a plane parallel to a coordinate plane is called a trace. The trace in the $yz$-plane is obtained by setting $x = 0$ in the equation of the plane (and similarly for the traces in the $xz$- and $xy$-planes)

#### **Planes & Lines Quick Reference**
---
###### **1. Finding a Plane Through Three Points**
Given points P, Q, and R:
**Step 1:** Find two vectors in the plane
- **v₁** = Q - P
- **v₂** = R - P
**Step 2:** Find the normal vector (cross product)
- **n** = **v₁** × **v₂** = (a, b, c)
**Step 3:** Write the plane equation
- Using normal **n** = (a, b, c) and any point (x₀, y₀, z₀):
- **a(x - x₀) + b(y - y₀) + c(z - z₀) = 0**
- Simplify to: **ax + by + cz = d**
---
###### **2. Finding a Parallel Plane Through a Point**
Given plane **ax + by + cz = d₁** and point (x₀, y₀, z₀):
**Step 1:** Keep the same coefficients a, b, c (same normal vector)
**Step 2:** Find the new constant
- **d₂ = ax₀ + by₀ + cz₀**
**Step 3:** Write the parallel plane
- **ax + by + cz = d₂**
---
###### **3. Finding Line-Plane Intersection**
Given line through point **P₀** = (x₀, y₀, z₀) with direction **v** = (a, b, c) and plane **Ax + By + Cz = D**:
**Step 1:** Write parametric equations
- x = x₀ + at
- y = y₀ + bt
- z = z₀ + ct
**Step 2:** Substitute into plane equation and solve for t
- **A(x₀ + at) + B(y₀ + bt) + C(z₀ + ct) = D**
**Step 3:** Plug t back into parametric equations to find intersection point
**Special cases:**
- Identity (0 = 0) → line lies in the plane
- Contradiction (0 = k, k ≠ 0) → line is parallel, no intersection


#### **Coordinate System Conversions Quick Reference**
---
###### **Coordinate System Definitions**
**Rectangular (Cartesian):** (x, y, z)
**Cylindrical:** (r, θ, z)
- r = distance from z-axis (r ≥ 0)
- θ = angle from positive x-axis
- z = height (same as rectangular)
**Spherical:** (ρ, θ, φ)
- ρ = distance from origin (ρ ≥ 0)
- θ = angle from positive x-axis (azimuthal angle)
- φ = angle from positive z-axis (polar angle, 0 ≤ φ ≤ π)
---
###### **Rectangular ↔ Cylindrical**
**Rectangular to Cylindrical:**
- r = √(x² + y²)
- θ = tan⁻¹(y/x) (use atan2(y, x) for correct quadrant)
- z = z
**Cylindrical to Rectangular:**
- x = r cos(θ)
- y = r sin(θ)
- z = z
---
###### **Rectangular ↔ Spherical**
**Rectangular to Spherical:**
- ρ = √(x² + y² + z²)
- θ = tan⁻¹(y/x) (use atan2(y, x) for correct quadrant)
- φ = cos⁻¹(z/ρ) or tan⁻¹(√(x² + y²)/z)
**Spherical to Rectangular:**
- x = ρ sin(φ) cos(θ)
- y = ρ sin(φ) sin(θ)
- z = ρ cos(φ)
---
###### **Cylindrical ↔ Spherical**
**Cylindrical to Spherical:**
- ρ = √(r² + z²)
- θ = θ (same angle)
- φ = tan⁻¹(r/z) or cos⁻¹(z/√(r² + z²))
**Spherical to Cylindrical:**
- r = ρ sin(φ)
- θ = θ (same angle)
- z = ρ cos(φ)















