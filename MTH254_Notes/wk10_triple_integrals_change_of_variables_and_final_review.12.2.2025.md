## 15.4 Continued (Triple Integrals)
#### 15.4 #50
Use spherical coordinates to calculate the triple integral of f(x,y,z) over the given region:
$f(x,y,x) = \rho$
$x^2 +y^2 +z^2 \leq 4$
$z \leq 1$
$x \geq 0$

 This is a sphere with a $\rho$ of 2 and with the to $\frac{1}{4}$ chopped off, then the half divided vertically on the $x$ axis, everything on the positive $x$ side.
So, $-\frac{\pi}{2} \leq \theta \leq \frac{\pi}{2}$
$x=\rho sin \phi cos\theta$
$y=\rho sin \phi sin\theta$
$z=\rho cos\phi$

$\frac{-2}{cos\phi} \leq \rho \leq \frac{1}{cos\phi}$
$0 \leq \phi \leq \pi$

$$\int\int\int_R f(x,y,z)\ dV = \int_{\phi = 0}^{\phi=\pi}\int_{\theta=-\frac{\pi}{2}}^{\frac{\pi}{2}}\int_{\rho=\frac{-2}{cos\phi}}^{\frac{1}{cos\phi}}\ \rho\ \rho^2\ sin\phi\  d\rho\ d\theta\ d\phi$$
$\int_{\rho = \frac{-2}{cos\phi}}^{\rho = \frac{1}{cos\phi}} \rho^3 sin\phi\ d\rho = sin\phi\int_{\rho = \frac{-2}{cos\phi}}^{\rho = \frac{1}{cos\phi}}\rho^3 d\rho$
$=sin\phi[\frac{\rho^4}{4}]_{\frac{-2}{cos\phi}}^{\frac{1}{cos\phi}}$ 
$=\frac{1}{4} sin\phi[\rho^4]_{\frac{-2}{cos\phi}}^{\frac{1}{cos\phi}}$
$=\frac{1}{4} sin\phi[\frac{-15}{cos^4\phi}]$
$\frac{-15}{4}\frac{sin\phi}{cos^4\phi}$

$\int_{\theta=-\frac{\pi}{2}}^{\theta=\frac{\pi}{2}} \frac{-15}{4}\frac{sin\phi}{cos^4\phi}\ d\theta$
$\frac{-15}{4}\frac{sin\phi}{cos^4\phi}[\frac{\pi}{2} - (-\frac{\pi}{2})] = \frac{-15\pi}{4}\frac{sin\phi}{cos^4\phi}$

$\int_{\phi=0}^{\phi=\pi}\frac{-15\pi}{4}\frac{sin\phi}{cos^4\phi}$
$=-\frac{15\pi}{4}\int_{\phi=0}^{\phi=\pi}\frac{sin\phi}{cos^4\phi}\ d\phi$ 
$u=cos\phi$
$du=-sin\phi\ d\phi$
$(-1)du = sin\phi\ d\phi$
$=-\frac{15\pi}{4}\int_{u=1}^{u=-1}(-1)\frac{du}{u^4}$
$=\frac{15\pi}{4}\int_{u=1}^{u=-1}u^{-4}\ du$
$=\frac{15\pi}{4}[-\frac{1}{3}u^{-3}]_{u=1}^{u=-1}$
$=-\frac{5\pi}{4}[u^{-3}]_{u=1}^{u=-1}$
$=-\frac{5\pi}{4}[\frac{1}{u^{3}}]_{u=1}^{u=-1}$
$=-\frac{5\pi}{4}[\frac{1}{-1} - \frac{1}{1}]$
$=-\frac{5\pi}{4}(-2)$
$=\frac{5\pi}{2}$


## 15.6 Change of Variables
Consider $G(r,\theta) = (rcos\theta, rsin\theta)$

Given $[r_{1}, r_{2}]$ and $[\theta_{1},\theta_{2}]$ a rectangular region is formed.
Given the above mapping, onto the $x,y$ plane, assuming all angles are in the first quadrant, $G(R)$ would be a region between concentric arcs at $r_1$ to $r_2$ (annulus
If we have these limits, and we want to integrate a function $z=f(x,y)$:
$$\int\int_{D} f(x,y)\ dx\ dy$$
If there is a region $R$ in the $r\theta$-plane such that $G(R) = D$
This would be difficult in the x-y plane, we'd prefer to do this integration by using a mapping to change into $r\theta$

Remember he double integral is a limit of Riemann sums.
Instead of taking slices of the annulus and subdividing again across those slices at curves concentric to the curves, we can integrate the rectangular areas on the $r\theta$ mapping.

We'll use the area of the rectangular area combined with the properties of the $xy$ function.

The **Jacobian Determinant** of a map $G(u,v) = (x(u,v),\ y(u,v))$ is defined as:
$$Jac(G)= \begin{vmatrix}\frac{\partial x}{\partial u} & \frac{\partial x}{\partial v}\\ \frac{\partial y}{\partial u} & \frac{\partial y}{\partial v}\end{vmatrix} =\frac{\partial x}{\partial u}\frac{\partial y}{\partial v}-\frac{\partial x}{\partial v}\frac{\partial y}{\partial u} $$
What you end up with is computing Riemann Sums, and taking appropriate limits, we get that:
$$\int\int_{D} f(x,y)\ dx\ dy = \int\int_{D_0}f(x(u,v),\ y(u,v))\ Jac(G)\ du\ dv$$
Where $G$ is a mapping such that $G(D_0) = D$
We can convert an integral in the $xy$ to one in polar using a mapping, but we also need to find the Jacobian Determinant and multiply the new integrand by **that**

Note that the Jacobian for $G(r, \theta) = (rcos\theta, rsin\theta)$ is:
$$\begin{vmatrix}cos\theta & -rsin\theta \\ sin\theta & rcos\theta \end{vmatrix} = rcos^2\theta - (-rsin^2\theta) = r(cos^2\theta + rsin^2\theta) = r(1) = r$$

The actual proof of this is more in the scope of a numerical analysis course.

#### 15.6 #31
Compute $\int\int_{D} x + 33y\ dx\ dy$ where $D$ is the shaded region in figure 16. Hint: use the map of $G(u,v)=(u-2v,v)$

![[Pasted image 20251204120829.png]]

$x=u-2v$
$y=v$

We need our limits of integration in terms of $u$ and $v$.
The boundaries of $D$ in the $xy$-plane are defined by the equations:
$y=1$
$y=3$
$x+2y=6$
$x+2y = 10$

Substituting the recommended formulas gives :
$v=1$
$u-2v + 2v = 6$
$u=6$

$v=3$
$u-2v+2v = 10$
$u=10$

Now we need to compute the Jacobian.
$G(u,v) = (u-2v, v)$
$Jac(G) = \begin{vmatrix} 1 & -2 \\ 0 & 1\end{vmatrix} = 1$ 

$$\int\int_{D} x + 3y\ dx\ dy = \int_{u=6}^{u=10}\int_{v=1}^{v=3}\ (u-2v + 3v)(1)\ dv\ du  = \int_{u=6}^{u=10}\int_{v=1}^{v=3}\ u+v\ dv\ du$$

$$\int\int_{v=1}^{v=3} u + v\ dv = [uv + \frac{v^2}{2}]_{v=1}^{v=3} = 3u + \frac{9}{2} - (1u-\frac{1}{2})= 2u + 4$$
$$\int_{u=6}^{u=10} 2u + 4\ dv =[u^2 + 4u]_{u=6}^{u=10} = 100 + 40 - (36 + 24) = 140-60 = 80 $$
## 15.6 Continued and Final Review



