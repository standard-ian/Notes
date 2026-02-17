## Class 1
#### Macroscopic Current
Is related to electron current by:
$$I = ei$$
$$\frac{C}{s} = C\times \frac{1}{s}$$
The electron current $i$ is the number of electrons $N_e$ that pass through a cross section over time $\Delta t$.
$$i = \frac{N_e}{\Delta t}$$
How is $i$ related to the drift speed $v_d$?

The number of electrons $N_e$ that pass through a cross section $A$ over time $\Delta t$ is:
$$N_e = (electron\ density)(vol.\ of\ electron\ sea)$$ $$=(n_e)(Volume) = (n_e)(Av_d\Delta t)$$
$$i = \frac{N_e}{\Delta t} = \frac{n_eAV_d\Delta t}{\Delta t} = n_eA v_d$$
##### Electron Current:
$$\color{orange} i = n_eAv_d$$
##### Macroscopic Current:
$$\color{orange}I = ei = en_eAv_d$$
#### What Determines the Drift Speed?
The drift speed depends on:
1. Mean time between collisions: $\tau$ 
2. Strength of the electric field: $E$

On average, how fast do electrons move?

$$v_f - v_i = acceleration \times time\ between\ collisions = a\tau$$
$v_i$ goes to 0 because we assume the electron starts from rest.

The electric field is creating acceleration.
$$a = \frac{F}{m} = \frac{eE}{m}$$
$$v_f = \frac{eE}{m}\tau$$
Where $\tau$ is determined by the material.

$$\color{orange} v_d = \frac{eE}{m}\tau$$
Combining the equation for electron current and electron drift speed.

$$ i = \frac{n_ee\tau A}{m}E$$
Everything except $E$ is a property of the conducting material.

#### Drift Speed is Rather Slow
But the electric field is set up at the speed of light inside the wire, almost instantly. Hence, when the a switch is closed, there is an immediate result.

#### Conductivity

$$ i = \frac{n_ee\tau A}{m}E$$
$$ I = \frac{n_ee^2\tau A}{m}E$$
We can define a current density $J$ (current per area):
$$J = \frac{I}{A} =\frac{n_ee^2\tau\cancel{A}}{m\cancel{A}}E = \frac{n_e\tau e^2}{m}E = \sigma(E)$$
$$\sigma = \frac{n_2\tau e^2}{m}$$

Conductivity $\sigma$ depends on the properties of the wire. The greater the conductivity, the more current it will conduct for a given electric field strength.

Unit of conductivity: $\frac{sC^2}{m^3kg}$ or $\ohm^{-1}m^{-1}$, where $1\ohm$ is:
$$1\frac{kg\ m^2}{C^2s}$$
Resistivity, in units $\ohm\ m$:
$$\rho = \frac{1}{conductivity}=\frac{1}{\sigma} = \frac{m}{n_e\tau e^2}$$
The resistivity is a material property, where resistance is dependent on the length, cross section, etc. of the form it is in.

Resistance:
$$R = \frac{(resistivity)(length)}{(cross\ sectional\ area)} = \frac{\rho L}{A}$$
#### Resistivity and Temperature
As conductors are heated, the ions vibrate faster, reducing the mean time between collisions.

The resistivity at temperature $T$ is given by: 
$$\rho = \rho_0(1 + \alpha(T-T_0))$$
