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
The capacitance is purely dependant on radius. The amount of charge on the shell does not affect the capacitance.

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
