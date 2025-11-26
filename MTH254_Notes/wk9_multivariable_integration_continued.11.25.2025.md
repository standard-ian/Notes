## 15.3/4 Triple Integrals, Polar, Cylindrical, and Spherical Coordinates

#### 15.3 #18 
Compute the integral if $f(x,y,z) = y^2$ over the region within the cylinder $x^{2}+ y^{2} = 4$, where $0 \leq z \leq y$

When  integrating over a rectangular box in 3-space:

$$\int_{x=e}^{x=f} \int_{y=c}^{y=d} \int_{z=a}^{z=b}f(x,y,z)\ dz\ dy\ dx$$
For other domains of integration we generally try to parameterize them as z-simple regions, then set limits of integration to $x$ and $y$.

$$\int_{x=a}^{x=b} \int_{y=h_1(x)}^{y=h_2(x)} \int_{z=g_1(x)}^{z=g_2(x)}f(x,y,z)\ dz\ dy\ dx$$

For any $(x,y)$: $0 \leq z \leq y$
For any $x$: $0 \leq y \leq \sqrt{4-x^2}$  (from: $x^2 + y^2 + 4 \to y=\pm\sqrt{4-x^2}$)
Range of possible x-values: $-2 \leq x \leq 2$

$$\int_{x=-2}^{x=2} \int_{y=0}^{y=\sqrt{4-x^2)}} \int_{z=0}^{z=y}y^2\ dz\ dy\ dx$$
$\int_{z=0}^{z=y} y^2 dz = y^2 \int_{z=0}^{z=y}1\ dz$
$=y^2[z]_{z=0}^{z=y}$
$=y^3$

$\int_{y=0}^{\sqrt{4-x^2}}y^3\ dy$
$=[\frac{y^4}{4}]_{y=0}^{y=\sqrt{4-x^2}}$
$=\frac{(\sqrt{4-x^2})^4}{4}$
$=\frac{(4-x^2)^2}{4}$

$\int_{x=-2}^{x=2} \frac{(4-x^2)^2}{4}\ dx$
$=\frac{1}{4}\int_{x=-2}^{x=2} 16-8x^2 + x^4\ dx$
$=[16x-\frac{8x^3}{3} + \frac{x^5}{5}]_{x=-2}^{x=2}$

#### 15.3 #21
Find the volume of the solid in the first octant bounded between the planes:
$$(1.)\ x+y+z = 1$$
$$(2.)\ x+y+2z=1$$
The first octant is where everything is non-negative ($x,y,z$ are all positive) we can use this as a limit.
In the first octant, the plane (1) is above (2)

$(2.)\ x+y+2z=1$
$z=\frac{1}{2}(1-x-y)$

$(1.)\ x+y+z=1$
$z=1-x-y$

To find the intersection of the boundary surfaces, solve for $x$ and $y$, eliminate $z$. 

$x+y+z=1$
$x+y+2z=1$

$-2(x+y+z=1)$

Elimination:
$-2x-2y-2z = -2$
$\ \ \ \ \  x+\ \ y+2z=\ \ \ 1$
$=$
$-x-y=-1$
$x+y=1$
$y=1-x$

Note if $x,y \geq 0$ and $x=y = 1$, $x$ and $y$ both range $0\leq x,y \leq 1$
$$V=\int_{x=0}^{x=1}\int_{y=0}^{y=1-x}\int_{z=\frac{1}{2}(1-x-y)}^{z=1-x-y}\ 1\ dz\ dy\ dx$$ 
#### Double and Triple Integrals in Polar, Cylindrical, and Spherical
$$\int\int\int_{\mathbb{R}}f(x,y,z)\ dx\ dy\ dz$$
The area of a sector of a circle is: $A=r\theta$ where $\theta$ is in radians.

$dx\ dy\ dz = dV =$ change in volume

$$\int\int f(x,y)dA = \int\int \hat{f}(r, \theta) r\ dr\ d\theta$$
$$\int\int\int f(x,y,z)dV = \int\int\int \hat{f}(r, \theta, z)\ r\ dz\ d\theta\ dr$$
$$\int\int\int f(x,y,z)dV = \int\int\int \tilde{f}(\rho, \theta, \phi)\rho^2sin\phi\ d\rho\ d\phi\ d\theta$$
#### 15.4 #22
The volume of the region $W$ shown in the figure, is between the upper hemisphere of $x^{2}+y^{2} + z^{2} = 6$ and the paraboloid $z=4- x^{2}-y^{2}$
The intersection of the two surfaces is a circle of radius $\sqrt{2}$. 
								![[thing.jpg]]
Recall, from rectangular to cylindrical, the relationship is:
$x^{2}+y^{2} = r^{2}$ 
$x=r cos(\theta)$
$y=rsin(\theta)$
$z=z$

Top: $z=4-r^2$
Bottom: $r^2+z^2 = 6$

$0\leq r \leq \sqrt{2}$
$0\leq \theta\leq2\pi$

$z^{2} = 6-r^{2}$
$z=\pm\sqrt{6-r^2}$

$$\int_{r=0}^{r=\sqrt{2}}\int_{\theta = 0}^{\theta = 2\pi}\int_{x=\sqrt{6-r^2}}^{z=4-r^2}r\ dz\ d\theta\ dr$$
$\int_{z=\sqrt{5-r^2}}^{z=4-r^2} r dz= r\int_{z=\sqrt{6-r^2}}^{z=4-r^2} dz$
$=r[4-r^2-\sqrt{6-r^2}]$
$=4r-r^3-r\sqrt{6-r^2}$

$\int_{\theta=0}^{\theta=2\pi}(4r-r^3-r\sqrt{6-r^2})d\theta$
$=(4r-r^3-r\sqrt{6-r^2})\int_{\theta=0}^{\theta=2\pi}d\theta$
$=(4r-r^3-r\sqrt{6-r^2})2\pi$

$=\int_{r=0}^{r=\sqrt{2}}2\pi(4r-r^3-r\sqrt{6-r^2})\ dr$
$=2\pi\int_{r=0}^{r=\sqrt{2}}(4r-r^3-r\sqrt{6-r^2})\ dr$
Next...find $\int r\sqrt{6-r^2} dr$
$u=6-r^2$
$du=-2r\ dr$
$-\frac{1}{2}du = r\ dr$
so $\int r\sqrt{6-r^2} dr$ = $\frac{1}{2}\int \sqrt{u}\ du$
$=(-\frac{1}{2})(\frac{2}{3})u^{\frac{3}{2}}$
Substitute $6-r^2$ back...
$=-\frac{1}{3}(6-r^2)^{\frac{3}{2}}$
Therefore, $\int_{r=0}^{r=\sqrt{2}}2\pi(4r-r^3-r\sqrt{6-r^2})\ dr = 2\pi[2r^2-\frac{r^4}{4} + \frac{1}{3}(6-r^2)^\frac{3}{2}]_{r=0}^{r=\sqrt{2}}$




