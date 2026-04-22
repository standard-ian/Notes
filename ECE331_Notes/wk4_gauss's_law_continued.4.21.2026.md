## Class 7
#### 2.4 Gauss's Law
Remember from last week:
$$\oint\vec{E}\ ds = \frac{Q_{enc}}{\epsilon_0}\tag{20}$$
The above is Gauss's Law in Integral Form

Note, if we use the Divergence Theorem:
$$\oint\vec{E}\cdot d\vec{S} = \int_V(\nabla \cdot \vec{E}) dv\tag{21}$$
$$Q_{enclosed} = \int_V\rho_V(x,y,z) dv\tag{22}$$
Substituting $(21)$ and $(22)$ into $(20)$:
$$\int_V(\nabla \cdot \vec{E})\ dv = \int_V \rho_V(x,y,z)\ dv$$
or, Gauss's Law in Differential Form:
$$\nabla \cdot \vec{E} = \frac{\rho_V}{\epsilon_0}\tag{23}$$
#### 2.8 Postulates of Electrostatics
Differential Form:
$$\nabla \cdot \vec{E} = \frac{\rho_V}{\epsilon_0}$$
$$\nabla \times \vec{E} = 0$$
Integral Form:
$$\oint\vec{E}\cdot d\vec{S} = \frac{Q_{enc}}{\epsilon_0}$$
$$\oint\vec{E}\cdot d\vec{l} = 0$$
#### 2.9 Gauss's Law Example
Determine the $\vec{E}$ field caused by a spherical cloud of electrons with a volumetric charge density:
$$\rho = \left\{\begin{matrix} -\rho _V,\ 0\leq R \leq b\\0,\ \ \ \ \ R \geq b \end{matrix}\right\}$$
$$\vec{E} = \frac{1}{4\pi\epsilon_0}\frac{1}{R^2}\hat{R}\left[\frac{V}{m}\right]$$
$\vec{E}$ is radially flowing:
$$\vec{E} = \hat{R}E_r\tag{2}$$
$E_r$ constant, with respect to angle.
$$d\vec{S} = \hat{R}dS\tag{3}$$
Substituting $(2)$ and $(3)$ into Gauss's Law

$$\oint\vec{E}\cdot d\vec{S} = \int(E_r\hat{R})\cdot(\hat{R}ds) = \oint E_rds\tag{4}$$
For inside sphere at $S_i$ surface
$$ds = R_id\theta R_i\sin(\theta)\ d\phi$$
$$ds = R_i^2\sin(\theta)\ d\theta\ d\phi \tag{5}$$
$$\oint\vec{E}\cdot d\vec{S} = E_r\int_0^\pi\int_0^{2\pi}R_i^2\sin(\theta)\ d\phi\ d\theta$$
$0\leq \theta \leq \pi$
$0\leq \phi \leq 2\pi$

$$ = -E_r2\pi R_i^2\cos(\theta)|_0^\pi = -2\pi R_i^2[-1-1]E_r$$
$$= 4\pi R_i^2E_r\tag{6}$$
$$\frac{Q_{enclosed}}{\epsilon_0}$$
$$= \frac{-1}{\epsilon_0}\int\rho_VdV = \frac{-1}{\epsilon_0}\int_0^{R_i}\int_0^\pi\int_0^{2\pi}\rho_VR^2\sin(\theta)\ d\phi\ d\theta\ dR$$
$$\frac{Q_{enclosed}}{\epsilon_0} = \frac{-4\pi}{3\epsilon_o}R_i^3\rho_V\tag{7}$$
Left hand side is equal to right hand side, $(6) = (7)$
$$4\pi R_i^2E_r = -\frac{4\pi}{3\epsilon_0}R_i^3\rho_V$$
$$E_r = \frac{-R_i\rho_V}{3\epsilon_0} = \frac{-R\rho_V}{3\epsilon_0}\hat{R},\ 0\leq R\leq b$$

For $R > b$
$$\oint\vec{E}\cdot d\vec{S} = -\int_V\frac{\rho}{\epsilon_0} dv$$
$$\oint E_r\hat{R}\cdot \hat{R}\ ds = \int_0^b\int_0^\pi\int_0^{2\pi}\frac{\rho_V}{\epsilon_0}R^2\sin(\theta)\ d\phi\ d\theta\ dR$$
$$E_r\oint ds = \frac{-\rho_V}{\epsilon_0}\frac{4\pi b^3}{3}$$
$$E_r\int_0^{\pi}\int_0^{2\pi}R_0^2\sin(\theta)\ d\phi\ d\theta = $$

$$E_r R_0^24\pi = \frac{-\rho_V}{\epsilon_0}\frac{4\pi b^3}{3},\ \ R_i = b = R_0$$
$$E_r = \frac{-\rho}{\epsilon_0}\frac{b^3}{3R_0^2},\ \ R_0\geq b$$
$$E = \frac{\rho_V}{\epsilon_0}\frac{b^3}{3R^2}\hat{R},\ \ R\geq b$$

