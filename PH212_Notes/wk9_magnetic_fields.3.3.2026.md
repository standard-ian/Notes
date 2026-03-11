## Class 1


----
#### Charges in Magnetic Field
$$R = \frac{mv}{qB}$$
Magnetic Force is proportional to the charge, magnetic field, and the component of the velocity perpendicular to the magnetic field
$$\vec{F} = q\vec{v} \times \vec{B}$$
Right Hand Rule for $\color{orange}\vec{F}$
1. Fingers point in direction $\vec{v}$
2. Curl fingers toward $\vec{B}$
3. Thumb gives direction of $\vec{F}$

The expansion of the cross product $\vec{v}\times\vec{B}$:
$$\vec{v}\times\vec{B} = (v_yB_z-v_zB_y)\hat{i} + (v_zB_x - v_xB_z)\hat{j} + (v_xB_y-v_yB_x)\hat{k}$$
##### Charge Moving in a Magnetic Field
As a charged particle moves through a magnetic field, its trajectory changes due to the magnetic force.

The force is always perpendicular to the particle's velocity.

According to Newton's Second Law, the acceleration will also be perpendicular to the velocity
$$\vec{a} = \frac{\vec{F}}{m},\ \Delta \vec{v} = \vec{a}\Delta t$$

![[Pasted image 20260303121249.png]]

The magnetic force provides centripetal force
$$F_{centripetal} = |q|vB$$
In general, $F_c = \frac{mv^2}{r}$
$$\frac{mv^2}{r} = |q|vB$$
$$\color{orange}r = \frac{mv}{|q|B}$$
So, as a particle travels through a magnetic field, it will undergo uniform circular motion with a radius of curvature. This is dependent on a **completely uniform magnetic field**.

##### Cyclotron Application
As particles cross the gap, an electric field accelerates them, increasing $r$, until they are "ejected"
![[Pasted image 20260303122410.png]]

##### Period of Circular Motion
Time for a particle to complete one orbit.
###### Cyclotron Period
$$T = distance/velocity = circumference/velocity = \frac{2\pi m}{qB}$$
###### Orbital Frequency
$$f = \frac{1}{T} = \frac{qB}{2\pi m} rotations/s$$
###### Angular Frequency
$$\omega = 2\pi f = \frac{qB}{m} radians/s$$
----
#### Force on a Straight Wire in a Magnetic Field
A wire is composed of charges in motion, so we'd expect there to be some force on the wire. 


The net force is the vector sum of all the forces acting on the charges. This is just basically the average of the velocities of all the charges in a unit volume.
$$\vec{F} = q\Sigma \vec{v_i}\times \vec{B} = q(N\vec{v_{avg}}) \times \vec{B}$$
$$N = nAL$$
Where $n$ is the number of charges, and $AL$ is the volume of the wire, giving charge carrier density.
$$\vec{F}=qnAL\vec{v_{avg}}\times \vec{B}$$
$$I = nAqv_{avg}$$
## Class 2
----
#### Force on a Curved Wire in a Magnetic Field
We can use integration and the result in the former section sum the small components along a curved wire. 

This will demonstrate that the endpoints and the vector connecting them are all that matters in a uniform magnetic field.

$$\vec{F}_{wire} = I\vec{L}\times \vec{B}$$
The force on any current carrying loop in a magnetic field is 0.

While the net force on the loop is 0, the net torque is **not** 0.

Recall that torque on an object due to a force about a given axis is the cross product of the force with the distance between the force point and the axis.
$$\vec{\tau} = \vec{r}\times \vec{F}$$
$$Magnitude:\ \tau = rFsin\theta$$
The torque on any loop is:
$$\tau_{loop} = IABsin\theta$$
$$IA\vec{n} = \vec{\mu} = Magnetic\ Dipole\ Moment$$
$$\vec{\tau}_{loop} = -\mu B\hat{i}$$
----
#### Magnetic Dipole Moment
Combination of torque, current, and force in a loop.

Right hand rule for $\color{orange}\vec{A}$:
1. Curl fingers in direction of $I$
2. Thumb points in direction of $\vec{A}$

Dipole moment is:
$$\vec{\mu} = NI\vec{A}$$
and
$$\color{orange}\vec{\tau} = \vec{\mu}\times \vec{B}$$
The torque on a current loops depends on it's magnetic moment vector orientation with respect to the magnetic field. 

This may be used to rotate the loop and do work.

The work done in a rotation is found by integrating the torque over the angular displacement.

$$W = \int_{90^{\circ}}^{0^\circ}(-\mu Bsin\theta)\  d\theta$$
As the loop rotates between any two angles:
$$\Delta U = -W_{by\ B\ field}$$
$$\Delta U = \int_{\theta_1}^{\theta_2}(\mu Bsin\theta)\ d\theta$$
We usually use $\theta = 90^\circ$ to be the 0 of potential energy because it is the angle of maximum torque.

This gives that the potential energy as a function of $\theta$ is the **dot** product of the negative magnetic moment with the magnetic field.
$$U(\theta) = -\vec{\mu}\cdot \vec{B}$$
----
#### How Magnetic Fields are Produced Using Bio-Savart Law
$$d\vec{B} = \frac{\mu_0I}{4\pi}\frac{d\vec{s}\times \vec{r}}{r^2}$$
$$\mu_0 = 4\pi\times10^{-7}\frac{T\cdot m}{A}$$
Right Hand Rule for $\color{orange}d\vec{B}$:
1. Fingers point in direction of $d\vec{s}$
2. Curl fingers toward $\vec{r}$
3. Thumb gives direction of $d\vec{B}$
----
#### Magnetic Field Created by Current on Single Wire
##### Calculating magnetic field at point $P$ from a wire
Use the right hand rule, the vector $d\vec{B}$ points out of the screen.

We get the result that the magnetic field is proportional to the current in the wire, and inversely proportional to the distance from the wire 
$$B = \frac{\mu_0I}{2\pi R}$$
---
#### Magnetic Field from one Wire to Another
Right hand rule for $\color{orange}\vec{F}_1$:
1. Point thumb in direction of $I$ in other wire $I_1$
2. Point fingers in direction of $B_2$
3. Palm gives direction of $F_1$
![[Pasted image 20260302211046.png]]
$$F_2 = F_1 = \frac{\mu_0}{2\pi d}I_1I_2L$$
---
#### Magnetic Field of a Single Current Carrying Loop
For all points along the central axis of the loop
$$B=\frac{\mu_0I}{2}\frac{R^2}{(R^2 + z^2)^{\frac{3}{2}}}$$
For other points, the integrals are difficult. They can be computed numerically using computers and displayed as visual representations.

#### Torque on Current Carrying Loop in a Magnetic Field
Right Hand Rule:
1. Thumb in direction of torque
2. Fingers curl in direction of rotation

#### Hall Effect
A current passing through a sheet of metal has charge carriers moving at $v_d$.

The sheet polarizes, and this polarization increases until the electric force on the charge carrier equals in magnitude the magnetic force. 

The potential difference is the drift velocity times the width, times $B$
We can use this to detect the presence of a magnetic field
$$\color{orange} \Delta V = v_dwB$$
$$v_d = \frac{I}{n_eA_{cross}} = \frac{I}{n_ewd}$$
$w=width$
$d=depth$
Cross sectional Area: $A=wd$

---
#### Magnetic Flux
Defined identically to electric flux
$$\Phi_B = \int\vec{B}\cdot d\vec{A}$$
**Motional EMF** is just the time rate of change of magnetic flux through the circuit.

For a conducting bar moving perpendicularly through a magnetic field.
$$|\mathcal{E}| =\frac{d\Phi_B}{dt} = vBL$$
For a wire loop and straight current.
$$|\mathcal{E}| = \frac{d\Phi_B}{dt} = vL(B_{bottom} = B_{top})$$
In a generator, where a loop is rotating in a uniform magnetic field, the magnetic flux is the dot product of the magnetic field and the coil. 
$$\Phi_B = \vec{B}\cdot \vec{A} = BSsin(\omega t)$$
$$|\mathcal{E}| = \frac{d\Phi_B}{dt} = \omega BA \cos(\omega t)$$
#### Faraday's Law