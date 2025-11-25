### 3.2 Adjugates and Inverses
##### Theorem 3.2.2
An $n \times n$ matrix is invert-able if and only if $det(A) \neq 0$ 
##### Theorem 3.2.3
If A is any square matrix, $det(A^{T}) = det(A)$ 

Orthogonal matrix: A matrix is this if $A^{T} = A^{-1}$ or $AA^{T} = 1$

##### Theorem 3.2.5
If $A$ is an invert-able $n \times n$ matrix,  the solution to the system $Ax = b$ 
of the equations on the variables $x_{1} = \frac{detA_{1}}{detA}, x_{2} = \frac{detA_{2}}{detA}...x_{n} = \frac{detA_{n}}{detA}$ 
where for each $k, A_{k}$ is the matrix obtained from $A$ by replacing column $k$ by **$b$** 

### 4.1 Vectors and Lines
##### Theorem 4.1.1
When $y = [x y z]^{T}$ (Vector)
1. Norm = $||v||$  = $\sqrt{x^{2} + y^{2} + z ^{2}}$ 
2.  $v = 0$ if and only if $||v|| = 0$ 
3. $||av|| = |a| \times ||v||$ for all scalars $a$.

##### Unit Vector
Unit vector: a vector $\vec{u}$ where $||\vec{e_{1}}|| =||\vec{e_{2}}||=||\vec{e_{3}}||=1$  
If given any vector $\vec{v}$, $\frac{\vec{v}}{||\vec{v}||}$ is the unique unit vector in the same direction as $\vec{v}$.
$-\frac{\vec{v}}{||\vec{v}||}$ is the unique vector in the opposite direction of $\vec{v}$.

Example:
Given $\vec{v}=\begin{pmatrix}1 \cr2 \cr3 \cr\end{pmatrix}$ , find the unit vector in the same directions as $\vec{v}$.
$||\vec{v}|| = \sqrt{1^{2} + 2^{2} + 3^{2}} = \sqrt{14}$
$\vec{u} = \frac{\vec{v}}{||\vec{v}||} = \frac{1}{\sqrt{14}}\begin{pmatrix} 1  \cr2 \cr 3 \end{pmatrix} = \frac{\sqrt{14}}{14}\begin{pmatrix} 1  \cr2 \cr 3 \end{pmatrix}$ 
##### Parallel Vectors
To identify if two vectors are parallel, check if they are a linear combination of one another. (i.e. a scalar multiple)

##### Lines in Space and Direction
The line parallel to $d\neq{0}$ through the point  through the point with vector $p_{0}$ is given by:
$\vec{p} = \vec{p_{0}} + t\vec{d}$  where $t$ is any scalar
In other words, the point $P$ with vector $\vec{p}$ is on the line if and only if a real number $t$ exists such that $\vec{p_{0}} + t\vec{d}$
The line through $P_{0}(x_{0}, y_{0}, z_{0})$ with direction vector $\vec{d} = \begin{pmatrix}a \cr b \cr c \end{pmatrix} \neq \vec{0}$ is given by:
$x = x{0} + t_{a}$
$x = y{0} + t_{b}$ where $t$ i any scalar
$x = z{0} + t_{c}$
In other words, the point $P(x, y,z)$ is on the line if and only if a real number $t$ exists such that $x=x_{0} + t_{a}, y = y_{0} + t_{b}, z = z_{0} + t_{c}$ 

Example: 

Find the equation of the line through the point $P_{0}(2,0,1)$ and $P_{1}(4, -1,1)$
$\vec{d} = \vec{P_{0}O_{1}} = \begin{pmatrix}4-2 \cr -1-0 \cr 1-1 \end{pmatrix} = \begin{pmatrix}2 \cr -1 \cr 0 \end{pmatrix}$
$\vec{p} = \vec{p_{1}} + t \vec{d} = \begin{pmatrix}2 \cr 0 \cr 1 \end{pmatrix} = t\ \begin{pmatrix}2 \cr -1 \cr 0 \end{pmatrix}$
$x = 2 + 2t$
$y = -t$
$z = 1$

Example:
Find the equation of the line through the point $P_{0}(3, -1, 2) parallel to the line with the equation:
$x = -1 + 2t$
$y = 1 + t$
$z = -3 + 4t$

Direction vector ($d$) $= \begin{pmatrix}2 \cr 1 \cr 4 \end{pmatrix}$
Passes through point $(-1, 1, -3)$

So, this can be represented by replacing the point in the original equation with the new point:
$\begin{pmatrix}x \cr y \cr x \end{pmatrix} = \begin{pmatrix} 3 \cr -1 \cr 2 \end{pmatrix} = t \begin{pmatrix}2 \cr 1 \cr 4 \end{pmatrix}$ 

We can find an intersection by setting two sets of equations equal and solving. 


### Projections and Planes
Given two vectors:
$v = \begin{pmatrix}x_{1} \cr x_{2} \cr x_{3} \end{pmatrix}$ and $w = \begin{pmatrix}x_{1} \cr x_{2} \cr x_{3} \end{pmatrix}$, their dot product $\vec{v} \cdot \vec{w}$ is a number defined:
$\vec{v} \cdot \vec{w} = x_{1}x_{2} + y_{1}y_{2} + z_{1}z_{2} = \vec{v}\ ^{T}\vec{w}$

##### Theorem 4.2.1
Let $\vec{u}, \vec{v}$ and $\vec{w}$ denote vectors in $\mathbb{R}_{2}$ or $\mathbb{R}_{3}$ .
1. $\vec{v}·\vec{w}$ is a real number.
2. $\vec{v}·\vec{w} =\vec{w}·\vec{v}$
3. $\vec{v}·0=0=0·\vec{v}$
4. $\vec{v}·\vec{v} =||\vec{v}||2$
5. $(k\vec{v})·\vec{w} =k(\vec{w}·\vec{v})=\vec{v}·(k\vec{w})$ for all scalars k.
6. $u·(\vec{v}±\vec{w})=u·\vec{v}±u·\vec{w}$$

##### Theorem 4.2.2 - Angle Between Two Vectors
Let $\vec{v}$ and $\vec{w}$ be nonzero vectors. if $\Theta$ is the angle between $\vec{v}, \vec{w}$, then:
$\vec{v} \cdot \vec{w} = ||\vec{v}|| ||\vec{w}|| cos\Theta$ 
If $\vec{v}$ and $\vec{w}$ are nonzero, $cos \theta$ has the same sign as $\vec{v} \cdot \vec{w}$ so, 
$\vec{v} \cdot \vec{w} \gt 0$ if and only if $\theta$ is acute $(0 \leq \theta \lt \frac{\pi}{2})$ 
$\vec{v} \cdot \vec{w} \lt 0$ if and only if $\theta$ is obtuse $(\frac{\pi}{2} \lt \theta \leq 0)$   
$\vec{v} \cdot \vec{w} = 0$ if and only if $\theta = \frac {\pi}{2}$ 
Two vectors are said to be orthogonal if $\vec{v} = 0$ or $\vec{w} = 0$ or the angle between them is $\frac{\pi}{2}$ $(90^{\circ})$  
##### Theorem 4.2.3 - 
Two vectors $\vec{v}$ and $\vec{w}$ are orthogonal if and only if $\vec{v} \cdot \vec{w} = 0$ 
##### Theorem 4.2.4
Let $\vec{u}$ and $\vec{d}$ be vectors:
1. The projection of $\vec{u}$ on $\vec{d}$  is given by $prog_{\vec{d}}\ \vec{u} = \frac{\vec{u}\cdot\vec{d}}{||\vec{d}||^{2}}\ d$ 
2. The vector $\vec{u} - proj_{\vec{d}}\vec{u}$ is orthogonal to $\vec{d}$ 
![[Pasted image 20250512092748.png]]
Example: 
Find the shortest distance from point $P(1,3,-2)$ to the line through $P_{0}(2, 0, -1)$ with the direction vector $\vec{d} = \begin{pmatrix}1 \cr -1 \cr 0 \end{pmatrix}$ Also find the point $Q$ that lies on the line and is closest to $P$.
$\vec{P_{0}P} = \begin{pmatrix}-1 \cr 3 \cr -1 \end{pmatrix}$ 
$\vec{P_{0}Q} = proj_{\vec{d}}\vec{P_{0}P} = \frac{P_{0}P \cdot \vec{d}}{||\vec{d}||^{2}}\vec{d}$ 
$= \frac{-1 \times 1 + 3(-1) + (-1) 0}{1^{2} + (-1)^{2} + 0^{2}}\begin{pmatrix}1 \cr -1 \cr 0 \end{pmatrix} = -2 \begin{pmatrix}1 \cr -1 \cr 0 \end{pmatrix} = \begin{pmatrix} -2 \cr 2 \cr 0 \end{pmatrix}$ 
$\vec{QP} = \vec{P_{0}P} - \vec{P_{0}Q} = \begin{pmatrix}-1 \cr 3 \cr -1 \end{pmatrix} - \begin{pmatrix}-2 \cr 2 \cr 0 \end{pmatrix} = \begin{pmatrix}1 \cr 1 \cr -1 \end{pmatrix}$ 
Shortest distance is $||\vec{Q}p|| = \sqrt{1^{2} + 1^{2} + (-1)^{2}} = \sqrt{3}$ 
$Q \begin{pmatrix}x \cr y \cr z \end{pmatrix} - \vec{P_{0}Q} = \begin{pmatrix}x-2 \cr y-0 \cr z-(-1)\end{pmatrix} = \begin{pmatrix} -2 \cr 2 \cr 0 \end{pmatrix}$ 
$x = 0, y = 2, z = -1$, $Q(0, 2, -1)$ 

##### Theorem: Scalar Equation of a Plane
The plane through $P_{0}(x_{0}, y_{0}, z_{0})$ with normal $n = \begin{pmatrix}a \cr b \cr c \end{pmatrix} \neq 0$ as a normal vector is given by $a(x-x_{0}) + b(y - y_{0}) + c(z=z_{0}) = 0$ A
In other words, a point $P(x, y, z)$ is on this plane if and only if $x, y, z$ satisfy this equation.

Example: Find the equation of the plane through $P_{0}(1, -1, 3)$ with $\vec{n} = \begin{pmatrix}3 \cr -1 \cr 2 \end{pmatrix}$ as normal.
$3(x-1) + (-1)(y-(-1)) + 2(z -3) = 0$
$3(x-1) - (y + 1) + 2(z - 3) = 0$ 
Example: Find an equation through $P_{0}(3, -1, 2)$ that is parallel to the plane with equation $2x - 3y = 6$ 
So, the direction vector is shared between the planes (if they are parallel) $\vec{n} = \begin{pmatrix}2 \cr -3 \cr 0 \end{pmatrix}$ 

