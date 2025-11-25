## 13.1 Vector Intersections 

#### Example 1
Find a vector parameterization of the line through $P=(3, =5, 7)$ and in the direction $\vec{v} = <3, 0, 1>$
$\vec{r}(t) = <3, -5 , 7> + t<3, 0, 1>$
$\vec{r}(t) = <3 + 3t, -5 - 0t, 7 + t>$

#### Example 2
Determine the radius, center, and plane containing the circle.
$\vec{r}(t)=7\vec{i} + 12cos(t)\vec{j} + 12sin(t)\vec{k}$ 
###### Review:
Circles in the $xy$ plane:
$x^{2} + y^{2} = r^{2}$, center $(0, 0)$
$(x-h)^{2} + (y-k)^{2} = r^{2}$, center $(h,k)$
Parameterized: 
$x(t) = r\ cos(t) + h$
$y(t) = r\ sin(t) + k$

For out circle in $\mathbb{R}^{3}$, all points have x coordinate 7, so the circle lies in the plane 
$x=7$
$radius = 12$
$center(7,0,0)$
#### Example 3
Use $cos(t), sin(t)$  with positive coefficients, to parameterize the intersection of the surfaces $x^{2} + z^{2} = 16$, and $y=3x^{2}$
Two variables squared and adding to a constant, is always a circle equation.

We could make either or both of the 4's and that would still make the same circle, it would just change how or where it is drawn.

There are many parameterizations for a single path or curve. Infinitely many.

We can parameterize the surface $x^{2} + x^{2} = 16$, a circle of radius 4, in the $xz$ plane  with $x(t) = 4cos(t)$ 
$y(t) = 4sin(t)$ 
$y(t) = 3(x(t))^{2}$
	$=3(4cos(t))^{2}$
	$=48cos^{2}(t)$
	$\vec{r}(t)=4cos(t)\vec{i} + 48cos^{2}(t)\vec{j} + 4sin(t)\vec{k}$

This works because we want functions that relate the two given equations.
![[intersection.jpeg]]


#### Example 4
Determine whether $\vec{r_{1}}(t)$ and $\vec{r_{2}}(t)$ collide or intersect, giving the coordinates of the corresponding point if they exist.

$\vec{r_{1}}(t)=<t, t^{2}, t^{3}>$
$\vec{r_{2}}(t)=<4t+6, 4t^{2}, 7-t>$

If we were to trace out each infinite curve, would they ever cross?

$\vec{r_{1}}$ and $\vec{r_{2}}$ intersect if there exist real numbers $t_{1}$ and $t_{2}$ such that $\vec{r_{1}}(t_{1}) = \vec{r_{2}(t_{2})}$ 

$\vec{r_{1}}$ and $\vec{r_{2}}$ collide if $t_{1} = t_{2}$ 
1. $t_{1} = 4t_{2} + 6$
2.  $t_{1}^{2} = 4t_{2}^{2}$
3. $t_{1}^{3} = 7-t_{2}$

These are not linear, so no matrix tricks, but $t_{1}$ is already in terms of $t_{2}$ 
By (1), $(4t_{2} + 16)^{2} = 4t_{2}^{2}$
$16t_{2}^{2} + 48t_{2} + 36 = 4t_{2}^{2}$
$12(t_{2} + 1)(t_{2} + 3)=0$

$t_{2} = -1$ and $t_{2} = -3$
$t_{1} = 2$ and $t_{1} = -6$ 
We get a couple possibilities, we then need to plug these back in to (3). 

$2^{3} = 7-(-1)$ and $(-6)^{3}=7-(-3)$
$8=8$ and $-216 \neq 10$, so the curves intersect but do not collide because $t_{1}$ and $t_{2}$ are not the same.

## 13.2 Now with derivatives!
#### Example 1
Compute the derivative $\frac{d}{dt}[\vec{r_{1}}(t) \cdot \vec{r_{2}}(t)]|_{t=1}$ 
$\vec{r_{1}}(t) = <t^{2}, 1, 2t>$ 
$\vec{r_{2}}(t)=<1, 2, e^{t}>$
Solution, by the dot product rule
$\vec{r_{1}}'(t) = <2t, 0, 2>$ 
$\vec{r_{2}}'(t)=<0, 0, e^{t}>$

$\frac{d}{dt}[\vec{r_{1}}(t) \cdot \vec{r_{2}}(t)] = \vec{r_{1}}(t) \cdot \vec{r_{2}}'(t) + \vec{r_{1}}'(t) \cdot \vec{r_{2}}(t)$
It's basically the product rule but with vectors and dot products

#### Example 2
Evaluate $\frac{d}{dt}\vec{r}(g(t))$ using the chain rule
$\vec{r}(t) = <t^{2}, 1, -t>$ , $g(t) = e^{t}$
$\frac{d}{dt}[\vec{r}(g(t))] = \vec{r}'(g(t)) \cdot g'(t)$

$\vec{r}'(t) = <2t, 0, -1>$
$g'(t) = e^{t}$

$\vec{r}'(g(t))\cdot g'(t)= <2e^{t}, 0, -1>\cdot e^{t}$ 

#### Example 3
Let $\vec{r}(t) = <t^{2}, 1-t, 4t>$
Calculate the derivative of $\vec{r}(t)\cdot \vec{a}(t)$ at $t=2$, assuming that $a(2) = <1,3,3>$ and $a'(2)=<-1,4,1>$

$\frac{d}{dt}[\vec{r}(t) \cdot \vec{a}(t)]|_{t=2}$ $=\vec{r}(2) \cdot \vec{a}(2) + \vec{r}'(2) \cdot \vec{a}(2)$

$\vec{r}'(t) = <2t, -1, 4>$
$\vec{r}'(2) = <4, -1, 4>$
$\vec{r}(2) = <4, -1, 8>$

#### Example 3
Find a parameterization of the tangent line at the point indicated.
$\vec{r}(t)=<6t, 4t^{2}, 2t^{3}>, t=2$
We'll take the derivative of $\vec{r}(t)$ and plug in $t$, this will give the direction vector of the tangent line.

$\vec{L}(t)=\vec{v}t + \vec{v_{0}}$
$=\vec{r}'(-2)t + \vec{r}(-2)$
$\vec{r}'(t) = <6, 8t, 6t^{2}>$
$\vec{r}'(-2)=<6, -16, 24>$
$\vec{r}(-2) = <-12, 16, -16>$
$\vec{L} = <6, -16, 24> + <-12, 16, -16>$

---
#### Example 4: Hint - 13.2 #50
Integrate a vector value function one component at a time, just use normal integration rules.

Find the general solution to the differential equation and the solution given by the initial condition.

$\vec{r}'(t) = <sin(3t), sin(3t), t>$A
$\vec{r}(\frac{\pi}{2})=<2,4,\frac{\pi^{2}}{4}>$
$\vec{r}(t) = <-\frac{1}{3}cos(3t), -\frac{1}{3}cos(3t), \frac{1}{2}t^{2}> + \vec{C}$ 
$\vec{r}(\frac{\pi}{2})$ = above, but plug in $\frac{\pi}{2} + <a, b, c>$ 

## 13.3 Arc Length and Parameterization

#### Key Principles
- Position vector: $r(t) = \langle x(t), y(t), z(t) \rangle$
- Velocity vector: $r'(t) = \langle x'(t), y'(t), z'(t) \rangle$ (derivative of position)
- Speed: $||r'(t)||$ (magnitude of velocity)

#### Arc Length
The arc length from $t = a$ to $t = b$ is: $L = \int_a^b ||r'(t)|| \, dt$

#### Arc Length Function
Starting from $t = 0$: $s(t) = \int_0^t ||r'(u)|| \, du$

#### Arc Length Parameterization
1. Find $r'(t)$ and compute $||r'(t)||$
2. Integrate to get $s(t) = \int_0^t ||r'(u)|| \, du$
3. Solve for $t$ in terms of $s$: $t = t(s)$
4. Substitute back: $r(s) = r(t(s))$

#### Displacement from Velocity
$\int_a^b r'(t) \, dt = r(b) - r(a)$
If this integral equals zero, the object returns to its starting position.

#### Example 1
Given $r(t) = \langle 9t, 9t, t^2 + 4 \rangle$, find $||r'(t)||$:
- $r'(t) = \langle 9, 9, 2t \rangle$
- $||r'(t)|| = \sqrt{9^2 + 9^2 + (2t)^2} = \sqrt{162 + 4t^2}$
- Factor out 4: $\sqrt{4(81/2 + t^2)} = 2\sqrt{t^2 + 81/2}$
- Arc length: $L = \int 2\sqrt{t^2 + 81/2} \, dt$

## 13.4 Curvature

#### Unit Tangent Vector
$T(t) = \frac{r'(t)}{||r'(t)||}$
The unit tangent vector points in the direction of motion with magnitude 1.

#### Curvature (3D curves)
$\kappa(t) = \frac{||r'(t) \times r''(t)||}{||r'(t)||^3}$
Steps:
1. Find $r'(t)$ and $r''(t)$
2. Compute the cross product $r'(t) \times r''(t)$
3. Find $||r'(t) \times r''(t)||$ (numerator)
4. Find $||r'(t)||^3$ (denominator)
5. Divide: $\kappa(t) = \frac{||r'(t) \times r''(t)||}{||r'(t)||^3}$

#### Curvature (2D plane curves)
For $r(t) = \langle x(t), y(t) \rangle$: $\kappa(t) = \frac{|x'y'' - y'x''|}{(x'^2 + y'^2)^{3/2}}$

#### Example 2
Given plane curve $y = 3t^4$, parametrize as $r(t) = \langle t, 3t^4 \rangle$
Find curvature:
- $r'(t) = \langle 1, 12t^3 \rangle$
- $r''(t) = \langle 0, 36t^2 \rangle$
- $\kappa(t) = \frac{|1 \cdot 36t^2 - 12t^3 \cdot 0|}{(1^2 + (12t^3)^2)^{3/2}} = \frac{36t^2}{(1 + 144t^6)^{3/2}}$

#### Computational Trick
When computing $||r'(t)||$, it's often easier to:
1. Compute $||r'(t)||^2$ first (avoiding the square root)
2. Simplify the squared expression
3. Take the square root at the end