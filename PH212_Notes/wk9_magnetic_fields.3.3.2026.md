a## Class 1
#### Charges in Magnetic Field
![[Pasted image 20260302200752.png]]$$R = \frac{mv}{qB}$$
Magnetic Force is proportional to the charge, magnetic field, and the component of the velocity perpendicular to the magnetic field
$$\vec{F} = q\vec{v} \times \vec{B}$$
Right Hand Rule for $\color{orange}\vec{F}$
1. Fingers point in direction $\vec{v}$
2. Curl fingers toward $\vec{B}$
3. Thumb gives direction of $\vec{F}$
#### Force on a Straight Wire in a Magnetic Field
A wire is composed of charges in motion, so we'd expect there to be some force on the wire. 


The net force is the vector sum of all the forces acting on the charges. This is just basically the average of the velocities of all the charges in a unit volume.
$$\vec{F} = q\Sigma \vec{v_i}\times \vec{B} = q(N\vec{v_{avg}}) \times \vec{B}$$
$$N = nAL$$
Where $n$ is the number of charges, and $AL$ is the volume of the wire, giving charge carrier density.
$$\vec{F}qnAL\vec{v_{avg}}\times \vec{B}$$
$$I = nAqv_{avg}$$
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
#### Magnetic Dipole Moment
Combination of torque, current, and force in a loop.

Right hand rule for $\color{orange}\vec{A}$:
1. Curl fingers in direction of $I$
2. Thumb points in direction of $\vec{A}$

Dipole moment is:
$$\vec{\mu} = NI\vec{A}$$
and
$$\vec{\tau} = \vec{\mu}\times \vec{B}$$
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
## Class 2
#### How Magnetic Fields are Produced Using Bio-Savart Law
$$d\vec{B} = \frac{\mu_0I}{4\pi}\frac{d\vec{s}\times \vec{r}}{r^2}$$
$$\mu_0 = 4\pi\times10^{-7}\frac{T\cdot m}{A}$$
Right Hand Rule for $\color{orange}d\vec{B}$:
1. Fingers point in direction of $d\vec{s}$
2. Curl fingers toward $\vec{r}$
3. Thumb gives direction of $d\vec{B}$

#### Magnetic Field Created by Current on Single Wire
##### Calculating magnetic field at point $P$ from a wire
Use the right hand rule, the vector $d\vec{B}$ points out of the screen.

We get the result that the magnetic field is proportional to the current in the wire, and inversely proportional to the distance from the wire 
$$B = \frac{\mu_0I}{2\pi R}$$
#### Magnetic Field from one Wire to Another
Right hand rule for $\color{orange}\vec{F}_1$:
1. Point thumb in direction of $I$ in other wire $I_1$
2. Point fingers in direction of $B_2$
3. Palm gives direction of $F_1$
![[Pasted image 20260302211046.png]]
$$F_2 = F_1 = \frac{\mu_0}{2\pi d}I_1I_2L$$
#### Magnetic Field of a Single Current Carrying Loop
For all points along the central axis of the loop
$$B=\frac{\mu_0I}{2}\frac{R^2}{(R^2 + z^2)^{\frac{3}{2}}}$$
For other points, the integrals are difficult. They can be computed numerically using computers and displayed as visual representations.
