## Class 1
#### Describing Harmonic Motion
##### Period
$$T = \frac{1}{f}$$
##### Frequency
$$f = \frac{1}{T}$$
##### Angular Frequency
$$\omega = 2\pi f = \frac{2\pi}{T}$$
##### Newton's Second Law
$$\frac{d^2x}{dt^2} = -\omega^2x$$
$$\omega = \sqrt{\frac{k}{m}}$$
**Solution:**
$$x(t) = Asin(\omega t) + A cos(\omega t)$$
For oscillating systems, we can use 1 term of the expression above. 
The expression selected from the above is dependent on the behavior at $t=0$.
For $t=0$ 
##### Phase Shift
A phase shift $\phi$ moves the function to the left by the angle of $\phi$

#### Example
Sitting on a surfboard with small waves, motion described by
$$y(t) = 1.8m \cos\left(\frac{1}{2.5s}t + \frac{\pi}{2}\right)$$
Amplitude: $A = 1.8m$
Angular frequency: $\omega = \frac{1rad}{2.5s} = 0.4 rad/s$
Frequency: $f = \frac{\omega}{2\pi} = 0.127Hz$
Phase constant: $\phi = \frac{\pi}{2}$
Period: $T = \frac{1}{f} = \frac{1}{0.127} = 7.87s$
Max velocity: $v_y = \frac{dy}{dt} = -\omega A\sin(\omega t + \phi)\to v_{max\ y} = \omega A = 0.72\frac{m}{s}$

## Class 2
#### Example
Find the maximum speed and maximum acceleration of a particle given by $x = 2.5m\ cos(\omega t)$ where $x$ is in meters, $t$ is in seconds, and $\omega = 2\ rad/s$

$$x'(t) = v(t) = -\omega 2.5m\ \sin(\omega t)$$
For $\omega = 2$
$$v(t) = -2(2.5) \sin(2 t) = -5\frac{m}{s}$$
$$a(t) = \omega^2 2.5m\ cos(\omega t) = -10\frac{m}{s^2}$$
#### Simple Harmonic Motion Continued
When PE is maximum KE = 0

Total Energy
$$E = U + K = \frac{1}{2}kA^2$$

#### Simple Pendulum
Restoring torque from gravity
$$|\vec{\tau_{weight}}| = MgX_{CM}$$
Newton's Second Law for Rotation
$$-MgC_{CM} = I\alpha$$
We can approximate the horizontal displacement by the arc length. $C_{CM} = \theta R_{CM}$ 
![[Pasted image 20260402154137.png]]

The right hand side is the moment of inertia $I$ times the second time derivative of the angle $\theta$
$$-MgR_{CM}\theta = I\frac{d^2\theta}{dt^2}\to \theta''(t) = \frac{-MgR_{CM}\theta}{I} $$
$$-\omega^2 \theta = \theta''(t);\ \ \omega = \sqrt{\frac{MgR_{CM}}{I}}$$
$$T = 2\pi\sqrt{\frac{I}{MgR_{CM}}}$$
#### Pendulum on the End of a String
##### Angular Frequency for a Simple Pendulum on a String
$$\omega = \sqrt{\frac{g}{L}}$$
##### Period for a Simple Pendulum
$$T = 2\pi\sqrt{\frac{L}{g}}$$
#### Rotating Disk Torsion Pendulum
$$\omega = \sqrt{\frac{k}{I}}$$
Experiences a restoring torque of $\tau = -k\theta$
