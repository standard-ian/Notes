## Class 1
#### Sources of Magnetic Fields and Bio Savart Law
![[Pasted image 20260309211621.png]]
Right Hand Rule for $\Delta \vec{V}$:
1. Fingers in direction of $d\vec{l}$
2. Curl fingers towards $\vec{r}$
3. Thumb gives direction of $\Delta \vec{B}$
$$\Delta \vec{B} = \frac{\mu_0I}{4\pi}\frac{d\vec{l}\times \hat{r}}{r^2}$$
$\mu_0 = 4\pi \times10^{-7}$
$r=$ Distance from center of $d\vec{l}$ to the point

The magnetic field produced by a infinite, linear, current carrying wire is proportional to the current in the wire, and inversely proportional to the perpendicular distance to the wire.

$$B = \frac{\mu_0 I}{2\pi R}$$
##### Example 1
Given the following currents through wires arranged on corners of a square with side length $s$, determine the unit vector expression for the net force $\vec{F}_B$ per unit length $L$ on the lower left wire.
$I = I\hat{k}$
$I_1 = -I\hat{k}$
$I_2 = -12I\hat{k}$
$I_3 = \frac{5}{2}I\hat{k}$
![[Pasted image 20260310183931.png]]
We know that wires carrying current exert repellent force on one another when the current is opposite, and attractive when current is in the same direction.

So the force vectors on the lower left wire will be pointing as follows:
$F_1$ straight down, $-y$
$F_2$ $45^\circ$ between $-x$ and $-y$, since the sides are all $=s$
$F_3$ straight to the right $+x$ because $I$ and $I_3$ are in the same direction.

From here we can split $F_2$ into component vectors and sum the $y$ forces and $x$ forces.

Keep in mind the distance separating $I$ and $I_2$ is the hypotenuse of the right triangle with $s$ as the adjacent sides.

$$d_{I\to I_2} = \sqrt{s^2 + s^2} = s\sqrt{2}$$
And the angle of the right triangle of $F_2$ and $F_{2y}$ and $F_{2x}$ is the same as the angle in the $d$ triangle above, $\arctan\left(\frac{s}{s}\right) = \arctan(1) = 45^\circ$ 
$$\vec{F}_B = \frac{\mu_0 I_aI_b L:}{2\pi d}\to \frac{\vec{F}_B}{L} = \frac{\mu_0I_a I_b}{2\pi d}$$
###### Y component
$$\frac{F_x}{L} = \frac{5I}{2}\frac{\mu_0I}{2\pi s} + (-12I)\frac{\mu_0I}{2\pi s\sqrt{2}}\cos(45^\circ) = \frac{5\mu_0I^2}{4\pi s}-\frac{12\mu_0I^2}{2\pi s\sqrt{2}}$$
$$=\frac{\mu_0I^2}{4\pi s}\left(5 - \frac{24}{\sqrt{2}}\cos(45^\circ)\right) = \frac{\mu_0I^2}{4\pi s}(-7)\hat{i}$$

###### X component
$$\frac{F_y}{L} = (-1I)\frac{\mu_0I}{2\pi s} + (-12I)\frac{\mu_0I}{2\pi s\sqrt{2}}\sin(45^\circ) = -\frac{\mu_0I^2}{2\pi s} - \frac{12\mu_0 I^2}{2\pi s\sqrt{2}}$$
$$=\frac{\mu_0I^2}{4\pi s}\left(-2 -\frac{24}{\sqrt{2}}\sin(45^\circ)\right) = \frac{\mu_0I^2}{4\pi s}(-14)\hat{j}$$
Since all the currents are parallel to the $z$ axis, there is no $z$ component to the force.
$$\frac{F_B}{L} =  \frac{\mu_0I^2}{4\pi s}(-7\hat{i}-14\hat{j})$$

##### Example 2
In the following, we are looking for the total magnetic force $F_{B\ net}$ on the circuit segment at right in terms of just $\mu_0$ and the variables in the image.

$+y$ is to the right, $+z$ is up, and $+x$ is out of the screen.

![[Pasted image 20260310183945.png]]

We can apply the right hand rule for magnetic field from current in a straight wire, to find:
1. The magnetic field at the circuit, $l$ **from the closer of the two wires**, with current flowing down, is **out of the screen.**
2. From the **further of the two wires**, with current flowing up, it is **into the screen.**

Since the currents in the two wires to the left are equal, and one is closer to $l$ than the other, the prevailing $B$ direction will be **out of the screen.**

For the magnetic field from a straight wire, at a point R distance away, accounting for the fact that the fields from the two wires are opposite one another, and therefore subtractive:
$$B = \frac{\mu_0I}{2\pi R} = \frac{\mu_0I}{2\pi R}\left(\frac{1}{R - \frac{d}{2}} - \frac{1}{R + \frac{d}{2}}\right)$$
$$= \frac{\mu_0I}{2\pi}\left(\frac{R + \frac{d}{2} -R + \frac{d}{2}}{R^2 - \frac{d^2}{4}}\right) = \frac{\mu_0I}{2\pi}\left(\frac{d}{R^2 - \frac{d^2}{4}}\right)$$
Since $d$ is so much smaller than $R$, we are told to approximate it away, leaving:
$$B \approx \frac{\mu_0Id}{2\pi R^2}$$
Using this knowledge of the direction of $B$, we can apply another right hand rule. With fingers in the direction of the current through $l$ ($I'$), curl fingers in the direction of $B$ (out of the screen). The thumb points **left, in the direction of the force ($F_B$) on $l$, in the negative $y$ direction.**
$$F_B = \vec{l}I'\times \vec{B}$$
Now that we know which way the force vector will point, it is just multiplication, and we can apply the direction and sign.

Since this is the only force on $l$, the only component vector will be $\hat{j}$.
$$F_B = (lI')\frac{\mu_0Id}{2\pi R^2} = -\frac{\mu_0II'ld}{2\pi R^2}\hat{j}$$
#### Magnetic Field at the Center of a Current Loop

$$\vec{B} = \frac{\mu_0I}{2}\frac{R^2}{(R^2 + z^2)^\frac{3}{2}}$$
Where $z$ is the distance from the center of the loop.

Assuming the loop lies in the $xy$ plane integrating the field from each segment over the entire loop. All directions cancel except the $+z$.

![[Pasted image 20260310194427.png]]

#### Magnetic Field from a Thin Rotating Disk
Disk Radius $R=12cm$
Charge $Q=40mC$
Angular Velocity of Rotation $\omega = 1rad/s$ around $z$ axis

Calculate magnetic field strength at distance $d=12m$ from the center.
Note that $d\gg R$.
The area $dA$, comprised of a **width** of rings of different radius $dr$:
$$dA = 2\pi r dr$$
The surface charge density is:
$$\sigma = \frac{Q}{\pi R^2}$$
The charge on each ring element is $dq$:
$$dq = \sigma dA = \frac{2Qr\ dr}{R^2}$$
The period is then $dq \times \frac{\omega}{2\pi}$ 
$$dI = \frac{dq}{T} = \frac{\omega\ dq}{2\pi} = \frac{\omega Qr\ dr}{\pi R^2}$$
Each $dI$ is the current contribution from each ring, constructing the surface. We can integrate these rings to get the total $B$. We'll use the magnetic field from a ring equation:

$$\Delta B = \frac{\mu_0dIr^2}{2(r^2 + d^2)^\frac{3}{2}}$$
Substituting in $dI$ and integrating:
$$B_{disk} = \int_0^R\frac{\mu_0r^2}{2(r^2 + d^2)^\frac{3}{2}}\cdot \frac{\omega Qr\ dr}{\pi R^2}$$
$$=\frac{\mu_0\omega Q}{2\pi R^2}\int_0^R\frac{r^3}{(r^2 + d^2)^{\frac{3}{2}}}\ dr$$
Since $d \gg R$ the denominator can simplify to $(d^2)^\frac{3}{2}$
$$=\frac{\mu_0\omega Q}{2\pi R^2}\int_0^R\frac{r^3}{d^3}\ dr = \frac{\mu_0\omega Q}{2\pi R^2d^3}\int_0^R r^3\ dr $$
Which is 
$$= \frac{\mu_0\omega Q}{2\pi R^2d^3}\left[\frac{R^{4}}{4} -\frac{0^4}{4}\right] = \frac{\mu_0\omega QR^2}{8\pi d^3}$$
$$B = \frac{\mu_0 (1)(40\times10^{-3})(12\times10^{-2})^2}{8\pi(12)^3} \approx 1.667\times 10^{-14}$$
## Class 2
#### Ampere's Law
$$\oint \vec{B}\cdot d\vec{s} = \mu_0I_{enc}$$
#### Ampere's Law for Magnetic Field Inside a Wire
The charge enclosed in a wire is:
$$I_{enc} = J\cdot \pi r^2 = J\cdot \pi r^2 = \frac{I\pi r^2}{\pi R^2} = \frac{Ir^2}{R^2}$$
When applied to a long straight wire, Ampere's law becomes 
$$\oint \vec{B}\cdot d\vec{s} = B\cdot 2\pi r = \mu_0I_{enc}$$
So,
$$B = \frac{\mu_0I_{enc}}{2\pi r}$$

