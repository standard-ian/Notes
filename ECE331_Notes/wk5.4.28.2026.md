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
#### Gauss's Law Example
A point charge $Q$ is at the center of a spherical shell.
We have region $III$ outside the shell
$II$ within the conductive shell
$I$ inside the center of the shell
$a$ is the distance from the center to the **inner** wall of the shell.
$b$ is the distance from the center to the **outer** wall of the shell.
##### What is $\vec{E}$ and $V$ as a function of radius

From Gauss's Law:
$$\oint(\vec{E}^{III}\cdot \hat{n})\ ds = \frac{Q_{enc}}{\epsilon_0}$$
###### For $R > b$
$$\int_0^{\pi}\int_0^{2\pi}E_r^{III}R^2\sin(\theta)\ d\phi\ d\theta \Longrightarrow E_r^{III}4\pi R^2 = \frac{Q}{\epsilon_0}$$
$$E^{III}_r = \frac{Q}{4\pi R^2\epsilon_0}$$
Same as if no conductor present.

###### For $R<a$
Applying Gauss's Law yeids:
$$E_r^{I} = \frac{Q}{4\pi R^2\epsilon_0}$$

###### For $a< R < b$
Charges distribute themselves on the surface, meaning the charge contained between $a$ and $b$ is 0. It is all on the inner and outer surfaces.
$$E^{II}_r = 0$$
###### Plot
```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
\begin{axis}[
  width=9cm, height=7cm,
  xmin=0, xmax=4.5,
  ymin=-0.2, ymax=2.2,
  axis lines=left,
  xlabel={$r$},
  ylabel={$E_r$},
  xtick={1.2, 2.4},
  xticklabels={$a$, $b$},
  ytick=\empty,
  %clip=false,
  thick,
  xlabel style={at={(axis description cs:1,0)}, anchor=west},
  ylabel style={at={(axis description cs:0,1)}, anchor=south},
]

%% Region I and III: same 1/r^2 curve
\addplot[red, domain=0.35:1.2, samples=80, thick] {0.5/(x^2)};
\addplot[red, domain=2.4:4.3,  samples=80, thick] {0.5/(x^2)};

%% Region II: E = 0
\addplot[domain=1.2:2.4, samples=2, thick] {0};

%% Dashed vertical at r = a
\draw[dashed] (axis cs:1.2, 0) -- (axis cs:1.2, {0.5/(1.2^2)});

%% Solid vertical at r = b
\draw[thick] (axis cs:2.4, 0) -- (axis cs:2.4, {0.5/(2.4^2)});

%% Region labels with arrows
\node at (axis cs:0.75, 0.45) {I};
\draw[<->] (axis cs:0.35, 0.3) -- (axis cs:1.2, 0.3);

\node at (axis cs:1.8, 0.45) {II};
\draw[<->] (axis cs:1.2, 0.3) -- (axis cs:2.4, 0.3);

\node at (axis cs:3.4, 0.45) {III};
\draw[->] (axis cs:2.8, 0.3) -- (axis cs:4.1, 0.3);

\end{axis}
\end{tikzpicture}
\end{document}
```
## Class 10
#### Continuing Gauss's Law Example from Class 9
##### What about Electric Potential?
###### For $R \geq b$
$$\vec{E}^{III} = -\nabla V^{III}$$
$$V^{III} = -\int_{\infty}^{R}\vec{E}\ d\vec{l}$$
It is a sphere, and the field is going radially out, so $\vec{E} = E_r\hat{R}$, $d\vec{l} = dR\hat{R}$

$$V^{III} = -\int_{\infty}^R E^{III}_r\ dR = -\int_\infty^R\frac{Q}{4\pi R_0^2\epsilon_0}\ dR_0 = \left[\frac{Q}{4\pi R_0\epsilon_0}\right]_\infty^R$$
$$V^{III} = \frac{Q}{4\pi \epsilon_0 R}$$
###### For $R<a$
$$V^I = -\int_\infty^R\vec{E}\ d\vec{l} = -\int_\infty^b\frac{Q}{4\pi \epsilon_0R_0^2}\ dR_0 - \int_b^a0\ dR - \int_a^R\frac{Q}{4\pi\epsilon_0R_1^2 dR_1}$$
$$V^I = \frac{Q}{4\pi\epsilon_0}\left[\frac{1}{b}\right] + \frac{Q}{4\pi\epsilon_0}\left[\frac{1}{R_1}\right]_a^R = \frac{Q}{4\pi\epsilon_0}\left[\frac{1}{b} + \frac{1}{R} - \frac{1}{a}\right]V$$
###### For $a< R < b$
$$V^{II} =-\int_\infty^b\vec{E}\ d\vec{l} - \int_b^{R} \vec{E} d\ \vec{l}$$
$$ = -\int_\infty^b\frac{Q}{4\pi R_0\epsilon_0}\ dR_0 - \int_b^R 0\ d\vec{l} = \frac{Q}{4\pi \epsilon_0 b}$$ 
The potential in this region is constant.

```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
\begin{axis}[
  width=9cm, height=7cm,
  xmin=0, xmax=4.5,
  ymin=-0.1, ymax=2.2,
  axis lines=left,
  xlabel={$r$},
  ylabel={$V$},
  xtick={1.2, 2.4},
  xticklabels={$a$, $b$},
  ytick=\empty,
  clip=false,
  thick,
  xlabel style={at={(axis description cs:1,0)}, anchor=west},
  ylabel style={at={(axis description cs:0,1)}, anchor=south},
]

%% Region I: 1/r - 1/a + 1/b (continuous at both a and b)
\addplot[red, domain=0.35:1.2, samples=80, thick] {1/x - 1/1.2 + 1/2.4};

%% Region II: flat at 1/b
\addplot[red, domain=1.2:2.4, samples=2, thick] {1/2.4};

%% Region III: 1/r
\addplot[red, domain=2.4:4.3, samples=80, thick] {1/x};

%% Vertical markers
\draw[dashed, thin] (axis cs:1.2, 0) -- (axis cs:1.2, {1/2.4});
\draw[dashed, thin] (axis cs:2.4, 0) -- (axis cs:2.4, {1/2.4});

%% Region labels
\node at (axis cs:0.75, 0.2) {I};
\draw[<->] (axis cs:0.35, 0.1) -- (axis cs:1.2, 0.1);

\node at (axis cs:1.8, 0.2) {II};
\draw[<->] (axis cs:1.2, 0.1) -- (axis cs:2.4, 0.1);

\node at (axis cs:3.4, 0.2) {III};
\draw[->] (axis cs:2.8, 0.1) -- (axis cs:4.1, 0.1);

\end{axis}
\end{tikzpicture}
\end{document}
```


#### 2.13 Permittivity
From Gauss's Law:
$$\oint\vec{E}\ d\vec{s} = \frac{Q_{enc}}{\epsilon_0}$$
$\vec{E}$ is Electric Field Intensity

Alternatively, we could say:
$$\oint_{S_C} \vec{D}\ d\vec{s} = Q_{enc}$$
Where $\vec{D} = \epsilon_0\vec{E} =$ **Electric Flux Density** $\frac{C}{m^2}$ 

In dielectric materials, the electric field interacts with electrons, and shifts them from their equilibrium point. 

For linear dielectrics, we have:
$$\vec{D} = \epsilon_0\epsilon_r\vec{E} = \epsilon\vec{E}$$
Where $\epsilon_r$ is relative permittivity, or the dielectric constant.


| Material        | $\epsilon_r$ | Dielectric Strength |
| --------------- | ------------ | ------------------- |
| Air             | 1.0006       | 3                   |
| Mineral Oil     | 2.3          | 15                  |
| Glass           | 4-10         | 30                  |
| Teflon          | ~2           | 60                  |
| Barium Titonate | 2000-10000   | 1-2                 |
The electrons are not flowing as they do in a conductor, they are just shifting from their equilibrium.

**Dielectric strength**
If the electric field is increased, then at some point, the electrons are puled out of the molecules and the dielectric acts as a conductor. If this occurs, then this is called **Dielectric Breakdown**.

This happens in lightning, the air breaks down and becomes conductive.

In order to study dielectric properties, we need to review boundary conditions. We'll also explore capacitors.

#### Interface Conditions for Electrostatic Fields
Consider an interface between two mediums.  Medium 1 has permittivity 1 $\epsilon_1 = \epsilon_{r1}\epsilon_0$ and Medium 2 has permittivity 2 $\epsilon_2 = \epsilon_{r2}\epsilon_0$

If we imagine a vector through the interface, and a loop around the border, loop $abcda$ with 2 sides normal to the border, and 2 sides tangential
$$\oint_{abcda} \vec{E}d\vec{l} = 0,\ \nabla \times \vec{E} = 0$$
If $\Delta h\to 0$
##### Tangential Components
$$\oint\vec{E}\ d\vec{l} = E_{1,\ tangential}\Delta W - E_{2,\ tangential} = 0$$
$$E_{2t} = E_{1t} [\frac{V}{m}]$$
$$\frac{D_{2t}}{\epsilon_2} = \frac{D_{1t}}{\epsilon_1}$$

##### Normal Components

$$\oint\vec{D}\ d\vec{s} = Q_{enc}$$
We can imagine a thin Gaussian "pillbox" around the interface condition. For the case when $\Delta h = 0$, the $D$ is uniform across this very tiny space.

$(\vec{D_1}\cdot \hat{n_1} + \vec{D_2}\cdot \hat{n_2})\Delta s = \rho_s\Delta s$ and $\hat{n_1} = -\hat{n_2}$, where $\rho_s$ is the surface charge density.
$\hat{n_1} \cdot \left(\vec{D_1}-\vec{D_2}\right) = \rho _s$

$D_{1n} - D_{2n} = \rho_s\left[\frac{C}{m^2}\right]$
Note if medium 2 is conductive, $D_{2n} = 0$
$D_{1n} = \rho_s$
$$E_{1n} = \frac{\rho_s}{\epsilon_0} \text{ sec. 2.11}$$
#### 2.15 Capacitance
Capacitance is defined as:
$$C = \frac{Q}{V}\ [\text{Farads},\ F]$$
$V$ is the electric potential between two conductors. 

On the left, a conductor $A$ with charge $-Q$ and on the right , $B$ with charge $+Q$.

There is a potential difference between them, so the capacitance is the difference between the plates.
$$C = \frac{|Q|}{|V_B - V_A|}$$
If the sheet $A$ is $\infty$ distance away, it's potential goes $\to 0$, so you could have:
$$C = \frac{|Q|}{V_B}$$
Lets consider an infinite positive charge sheet to evaluate capacitance.

We can then imagine a Gaussian pillbox in the center of the sheet, really far from the "edges" because the sheet goes to infinity. 

It will be extending above and below the charge sheet.

We know that the field will come off of the sheet normal to the surface.

Using the pillbox we can write Gauss's Law:
$$\oint_s \vec{E}\ d\vec{s} = \frac{Q_{enc}}{\epsilon_0}\tag{1}$$
##### Right Side
$$Q_{enc} = +\rho_s A_g\tag{2}$$
By symmetry $\vec{E}$ points away from the sides.
On top: 
$$d\vec{s} = \hat{y} Ag,\ \vec{E} = E_y^+\hat{y}$$
On bottom: 
$$d\vec{s} = -\hat{y}Ag,\ \ \vec{E}=-E_y^+\hat{y}$$

Note: something strange - for an infinite charge sheet field does not depend on $R$. Why?


| Uniform Charge On    |                 |
| -------------------- | --------------- |
| Sphere               | $\frac{1}{R^2}$ |
| Infinite Line Charge | $\frac{1}{R}$   |
| Infinite Plane       | No Fall off     |

When we apply this to two equal and opposite charge sheets, the field outside the sheets goes to zero, and we have fields only between the charge sheets.

$$E_y = E_y^+ + E_y^- = -\frac{\rho_s}{2\epsilon_0} - \frac{\rho_s}{2\epsilon_0}$$
