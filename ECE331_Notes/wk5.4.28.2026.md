## Class 9
#### 2.11 Electrostatic Energy
Scalar electric potential is related to work required to bring a positive charge in from infinity to a point $(x,y,z)$.

The electric potential at a point $(x_2,y_2,z_2)$ due to the charge at $q_1$ at $(x', y', z')$ is 
$$\frac{w}{q_1} = V_1\tag{1}$$
$$V_1 = \frac{q_1}{4\pi\epsilon_0|\vec{R_2}-\vec{R'_1}|}\tag{2}$$
Therefore, energy to bring a charge $q_2$ to point $(x_2, y_2, z_2)$ when $q_1$ is present at $(x', y', z')$ is :

$$w = q_2V_1 = \frac{q_2q_1}{4\pi\epsilon_0|\vec{R_{21}}|}\tag{2a}$$
Where $|\vec{R_{21}}| = |\vec{R_2} - \vec{R'_1}|$

Alternatively, the energy required to bring a point charge $q_1$ to $(x',y',z')$ when $q_2$ is at $(x_2, y_2, z_2)$ will be:
$$w = q_1V_2 = q_1\left(\frac{q_2}{4\pi\epsilon_0|\vec{R_{12}}|}\right)\tag{2b}$$
Where $|\vec{R_{12}}| = |\vec{R'_1} - \vec{R_2}|$

Note $(2a)$ and $(2b)$ are the same. 

Evidently the total energy contained in the system with two charges is:
$$w_2 = \frac{1}{2}q_2V_1 + \frac{1}{2}q_1V_1 = \frac{q_1q_2}{4\pi\epsilon_0|\vec{R_{12}}|}\tag{3}$$

If a third charge is brought in from $\infty$ to $(x_3, y_3, z_3)$ then the energy to do this is:
The $q_1$ and $q_2$ charges create a field, and to bring the third charge in from $\infty$ it will take a change in energy
$$\Delta w = q_3V_3$$
$$=q_3\left[\frac{q_2}{4\pi\epsilon_0 |\vec{R_{23}}|} + \frac{q_1}{4\pi\epsilon_0|\vec{R_{13}}|}\right]\tag{4}$$

Where $|\vec{R_{23}}| = |\vec{R_3} - \vec{R'_2}| = |\vec{R_2} - \vec{R_3}|$
and $|\vec{R_{13}}| = |\vec{R_1} - \vec{R_3}|$

There is already energy in $q_1$ and $q_2$, so we must add this to the $\Delta w$

$$w_3 = w_2 + \Delta w\tag{5}$$
We can sub $(3)$ and $(4)$ into $(5)$:
$$w_3 = \frac{1}{4\pi\epsilon_0}\left[\frac{q_1q_2}{|\vec{R_{21}}|} + \frac{q_2q_3}{|\vec{R_{23}}|} + \frac{q_1q_3}{|\vec{R_{12}}|}\right]$$
$$w_3 = \frac{1}{4\pi\epsilon_0}\left\{\begin{matrix}\frac{1}{2}q_1\left[\frac{q_2}{|\vec{R_1} - \vec{R_2}|} + \frac{q_3}{|\vec{R_1} - \vec{R_3}|}\right]\\ +\frac{1}{2}q_2\left[\frac{q_1}{|\vec{R_2} - \vec{R_1}|} + \frac{q_3}{|\vec{R_2}{-\vec{R_3}}}\right]\\ +\frac{1}{2}q_3\left[\frac{q_2}{|\vec{R_3} - \vec{R_2}|} + \frac{q_1}{|\vec{R_3} - \vec{R_1}|}\right]\end{matrix}\right\}$$
$$= \frac{1}{2}q_1V_1 + \frac{1}{2}q_2V_2 + \frac{1}{2}q_3V_3$$
Note: It is common to just use $R_{12}$ in place of $|\vec{R_{12}}|$.

Where, for example, 
$$V_1 = \frac{1}{4\pi\epsilon_0}\left[\frac{q_2}{|\vec{R_1} - \vec{R_2}|} + \frac{q_3}{|\vec{R_1} - \vec{R_3}|}\right]$$
This $V_1$ is due to charges $q_2$, $q_3$.

In general, total energy of $N$ electric charges is:
$$w_T = \frac{1}{2}\sum_{k=1}^Nq_kV_k\ \ [J]$$
This is interaction energy.


For a continuous charge distribution $\rho_V$, the total energy contained in the system is 
$$w_T = \int_V\rho_V(x,y,z) V(x,y,z)\ dx\ dy\ dz\ \ [J]$$
#### 2.12 Conductors in a Static Electric Field
Materials are classified as conductors, insulators, or dielectrics (semiconductors)

In conductors, electrons can of course move around very easily.

When an $\vec{E}$ is applied in the presence of a conductor, then the $\vec{E}$ inside the conductor is 0, as is the charge density.
$$\vec{E} = 0$$
$$\rho_V =0$$
The charges within a conductor distribute themselves on the conductor surface, making $\vec{E} =0$ inside.

##### 2.12.2 Normal Field $E_n$ on the conductor surface
We create a "**Gaussian Pillbox**" such that $h=0$, therefore $\Delta h=0$ so the sides of the pillbox contribute nothing. 

We can evaluate Gauss's Law
$$\oint_S\vec{E}\cdot \hat{n}\ ds = \frac{Q_{enclosed}}{\epsilon_0}$$
If $\Delta H\to0$, the sides contribute nothing, so $\rho_V = 0$, $\vec{E} = 0$ inside conductor, so 
$$\oint\vec{E} \cdot \hat{n}\ ds = E_n\Delta \cancel{S} = \frac{\rho_S \Delta \cancel{S}}{\epsilon_0}$$
Or
$$E_n = \frac{\rho_S}{\epsilon_0}$$
##### Example
A point charge $Q$ is at the center of a spherical shell.
We have region $III$ outside the shell
$II$ within the conductive shell
$I$ inside the center of the shell
What is $\vec{E}$ and $V$ as a function of radius.

$$E^{II} = 0,\ a < R < b$$
From Gauss's Law:

For $a< R < b$
$$\oint_{SC} = (E^{II}\cdot \hat{n})\ ds = \frac{Q_{enc}}{\epsilon_0}$$
$$Q_{enc} = Q$$
For $R > b$
$$\int_0^{\pi}\int_0^{2\pi}E_r^{III}R^2\sin(\theta)\ d\phi\ d\theta \Longrightarrow E_r^{III}4\pi R^2 = \frac{Q}{\epsilon_0}$$
$$E_r = \frac{Q}{4\pi R^2\epsilon_0}$$
Same as if no conductor present.

For $R<a$
$$E_r^{I} = \frac{Q}{4\pi R^2\epsilon_0}$$

## Class 10
