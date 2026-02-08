## Class 1
#### Electric Potential
##### Defining Electric Potential
Electric Potential is a scalar function defined at all points in space that can be used to determine all electrostatic effects produced by  a specified charge distribution.

##### Electric Potential Difference 
The change in electric potential between any 2 points is defined to be the energy required to move a unit positive charge between those two points.
The change in potential between two points is:
$$\Delta V_{A\to B} = -\int_{A}^{B}\vec{E}\cdot d\vec{l}$$
The Electric Potential at a given point is the change in potential between that point and an arbitrary point chosen to be the 0 of electric potential.
$$V(\vec{r})\equiv \Delta V_{\vec{r}_0\to \vec{r}} = -\int_{\vec{r}_0}^{\vec{r}}\vec{E}\cdot d\vec{l}$$
$$Where:\ V(\vec{r}_0) \equiv 0$$
##### Equipotential
Locus of points having the same potential. Always perpendicular to the electric field and their spacing indicated the strength of the field - how fast the potential is changing.

##### Electric Field from Electric Potential
The gradient function translates the potential to the field.
$$\vec{E} = -\vec{\nabla}V$$
The electric field is simply a measure of how fast the electric potential is changing.

## Class 2
#### Capacitance and Electric Potential
Capacitors consist of two opposite but equally charged plates who's potential difference creates an electric field between.
##### Charges in a Conductor
All charges are Equipotentials

##### Capacitance
The capacitance is defined in terms of the potential difference $C$
Where:
$$C \equiv \frac{Q}{\Delta V}$$
The electric field between capacitors acts as a storage of energy.
The energy density in an electric field $E$ is $u$:
$$u = \frac{1}{2}\epsilon_0E^2$$
In capacitors, this takes the forms:
$$U = \frac{1}{2}QV = \frac{1}{2}\frac{Q^2}{C} = \frac{1}{2}CV^2$$

#### Dielectric Materials
A material that can "resist" a certain degree of charge before becoming conductive.

Air is an example of a dielectric material.

#### Deriving Capacitance of a Spherical Shell
$$C = \frac{Q}{V} = \frac{coulombs}{volt}$$
We want to relate capacitance to a radius of the sphere. 

The potential for a spherical shell of radius $R$ is: 
$$V = \frac{kQ}{R}$$
So: 
$$C = \frac{Q}{V} = \frac{QR}{kQ} = \frac{R}{k}$$
The capacitance is purely dependent on radius. The amount of charge on the shell does not affect the capacitance.

#### Capacitance of a Plate Capacitor
Using the same equation for capacitance, where $Q = |Q|$ (the charge on either plate) and $V$ is the potential difference between two plates.

The area of the plate and the distance between them defines the capacitor.
So we need to work Area $A$ and distance $d$ into $C = \frac{Q}{V}$ 

We need to determine $V$ from the electric field between two plates.

$$V_+ - V_- = - \int_d^0\vec{E} \cdot d\vec{x}$$
What is $\vec{E}$ between the plates?

For a charged plate:
$$\vec{E} = \frac{\sigma}{2\epsilon_0}\hat{r}$$
The field will be doubled, in the same direction, from positive plate, to negative.
There is no field on the outside (positive and negative cancel)

$$\vec{E} = 2 \times \frac{\sigma}{2\epsilon_0}\hat{i} = \frac{\sigma}{\epsilon_0}\hat{i}$$

So, the potential difference between the plates is:
$$V_+ - V_- = - \int_d^0\vec{E} \cdot d\vec{x} = -\frac{\sigma}{\epsilon_0}\int_d^0(\hat{i}\cdot \hat{i})dx =\frac{\sigma}{\epsilon_0}x|_d^0  = \frac{\sigma d}{\epsilon_0} = \frac{Qd}{A\epsilon_0}$$
And:
$$C = \frac{Q}{V};\ V = \frac{Qd}{A\epsilon_0};\ C = \frac{QA\epsilon_0}{Qd} = \frac{A\epsilon_0}{d}$$
## Homework 4

#### Point Charge Equipotential Surfaces
For point charge: V = kq/r where k = 8.99 × 10⁹ N·m²/C²

Given: q = 5.77 × 10⁻¹¹ C, r₁ = 0.0189 m, V₁ = 27.5 V

For second surface with ΔV: If surface is farther, V₂ = V₁ - ΔV (potential decreases with distance). If ΔV = 12.0 V and surface farther: V₂ = 15.5 V, then r₂ = kq/V₂ = 0.0335 m

#### Connected Conducting Spheres
When spheres connected by wire, potentials equalize: Vₐ = Vᵦ
For conducting sphere: V = kQ/r, so Qₐ/rₐ = Qᵦ/rᵦ
Charge conservation: Qₐ + Qᵦ = Q_total

Given: rₐ = 0.565 m, rᵦ = 0.844 m, Q_total = -95.5 nC
Solve: Qᵦ(rₐ/rᵦ + 1) = Q_total
Qᵦ = Q_total × rᵦ/(rₐ + rᵦ) = -95.5 × 0.844/1.409 = -57.2 nC

#### Parallel Plate Capacitor Basics
C = ε₀A/d where ε₀ = 8.854 × 10⁻¹² F/m

**Unit conversion critical:** 1 cm² = 10⁻⁴ m² (not 10⁻²)

Given: A = 865 cm² = 0.0865 m², d = 31.9 cm = 0.319 m
C = (8.854 × 10⁻¹²)(0.0865)/0.319 = 2.40 × 10⁻¹² F = 2.40 pF

#### Electric Field from Energy
Energy stored: U = ½CV² = ½QV
Electric field: E = V/d

Given: s = 4.77 cm, A = (0.0477)² = 2.275 × 10⁻³ m², d = 4.73 × 10⁻⁴ m, U = 7.11 × 10⁻⁹ J

Step 1: C = ε₀A/d = 4.258 × 10⁻¹¹ F
Step 2: V = √(2U/C) = √(1.422 × 10⁻⁸/4.258 × 10⁻¹¹) = 18.27 V
Step 3: E = V/d = 18.27/(4.73 × 10⁻⁴) = 38,600 N/C

#### Work on Isolated Capacitor
When isolated (Q constant), changing capacitance changes energy: W = ΔU = U₂ - U₁
With constant Q: U = Q²/(2C)

Given: C₁ = 5.35 × 10⁻⁶ F, C₂ = 1.91 × 10⁻⁶ F, Q = 8.25 × 10⁻³ C

U₁ = Q²/(2C₁) = (8.25 × 10⁻³)²/(2 × 5.35 × 10⁻⁶) = 6.36 J
U₂ = Q²/(2C₂) = (8.25 × 10⁻³)²/(2 × 1.91 × 10⁻⁶) = 17.8 J
W = 17.8 - 6.36 = 11.4 J

Work is positive because separating charged plates requires energy input.