# Class 1
## 10. Quasi Static Electromagnetic Fields


### Maxwell's Equations
1. Gauss's Law
2. Faraday's Law
$$\nabla \cdot \vec{B} = 0 \tag{1}\ \text{Where: } \vec{B} = Bx\hat{x} + By\hat{y} + Bz\hat{z}$$
$$\nabla \times \vec{E} = -\frac{d\vec{B}}{dt}\tag{2}$$
$$\nabla \times \vec{H} = \vec{J} + \cancel{\epsilon_0\epsilon_r\frac{d\vec{E}}{dt}} \tag{3}$$
$$\nabla \cdot \vec{E} = \cancel{\frac{\rho}{\epsilon_0}}\tag{4}$$
Where: 
$\epsilon_0$ = permittivity of free space = $8.85\times 10^{-12} \left[\frac{F}{m}\right]$ 
$\vec{B} = \mu_0\mu_r\vec{H}$, where $\mu_0 = 4\pi\times 10^{-7}\left[\frac{H}{m}\right]$ = permeability of free space
$\mu_r$ = relative permeability of material

Note $\epsilon_0$  is a very small number and $\epsilon_r$ is not super big.

$E = E_0\sin(\omega t)$, $\omega = 2\pi f$ 

So $\epsilon_0\frac{d\vec{E}}{dt}$ will effectively be 0 when $\omega$ is small. 


### Key Equations
Looking at $(1)$ above, we can integrate (volume) and the result is the flux equation:
$$\oint\vec{B} \cdot d\vec{A} = 0\tag{5}$$
For a closed surface. 
If we integrate over a closed surface then the sum of the field has to equal 0. In other words the magnetic field lines always close upon themselves.

Note: $d\vec{A} = \hat{n}dA$, the vector normal to the surface.

If we have a closed surface $S_C$ no net magnetic field passes into or out of the closed surface.

**If the surface is not closed...** $(5)$ is not necessarily true.

The total field passing through an area $S$ is called flux, note the sub-s indicating a non-closed surface (not $\oint$)

$$\phi = \int_S\vec{B}\cdot \hat{n} dA\tag{6}$$


Looking at $(3)$, and integrating with respect to a surface
$$\int_S\nabla \times \vec{H} d\vec{A} = \int_SJ\cdot d\vec{A} \to \textcolor{green}{\oint_C\vec{H}\cdot d\vec{l}} = \textcolor{red}{\int_S\vec{J}\cdot \hat{n}A} \tag{7}$$
This is Ampere's Law, it gives current. It says:
"$\textcolor{green}{\text{the integral of the tangential field around a closed path }C}  \text{ must be equal to} \textcolor{red}{\text{ the total current that passes through a surface }}s$"

If we Integrate both sides of $(2)$ we get Faraday's Law
$$\int_S(\nabla \times \vec{E})d\vec{A} = -\frac{\partial}{\partial t}\int\vec{B}\cdot d\vec{A}$$
In differential form:
$$e = \int\vec{E}\cdot d\vec{l} = -\frac{\partial \phi}{\partial t}\tag{8}$$

The change in flux $\phi$ with time will give rise to the induced voltage $e$ or "nature hates flux changing".

# Class 2
## 1.1 Lorentz Force
If the moving charges are in a conductor, then the force density
$$\vec{f} = \frac{\vec{F}}{V_0} = \vec{J}\times \vec{B} \left[\frac{N}{m^3}\right]$$
Where $V_0 = \text{volume}$ 
Cross product so $\vec{f}$ is the vector that results from the 3D vectors $\vec{J}$ and $\vec{B}$
$\vec{J}$ is current density, $\frac{A}{m^2}$

If we just have wire, the current density is uniform across  an area, or the wire is thin relative to the frequency of current change, then $\vec{J}dV_0 = \frac{A}{m^2}(m^3) =  A (m)$
So the force on a wire is:
$$\vec{F} = \int_a^b I d\vec{l}\times \vec{B}[N]$$
$d\vec{l}$ is a little bit of length on the wire. 
$I d\vec{l}$ is the direction of the current.

When evaluating this force, we need first the field value, then we can interact with some other current. $\vec{B}$ is needed first.

Force between two wires is outward when fields in the middle add (current different directions) and inward when the $\vec{B}$ fields subtract (current in same direction)


