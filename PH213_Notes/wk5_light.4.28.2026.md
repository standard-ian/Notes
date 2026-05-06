## Class 9
#### Mirrors
##### Real vs. Virtual Image
**Real**: Images where light rays actually converge

**Virtual**: Where your eyes are focusing, where the light rays **appear** to converge.

**Inverted**: Flipped to to bottom

**Transposed**: Flipped left to right
##### Plane Mirror
Everything we see in a plane mirror is virtual.

Focal point is at infinity for a plane mirror.
$s' = -s$
$h' = h$
$M =1$

$s$ is the distance of the object from the mirror, $h$ is the height of the object relative to the mirror's center.

Parallel rays along the incident axis are reflected back parallel to their incident direction, therefore their focal length is $\to \infty$
##### Concave Mirror
$p$ in the below is a real image, where light rays are actually gathering. It is across the axis, so it is also inverted.
![[Pasted image 20260428114619.png]]

###### 3 Principal Rays for Locating an Image
1. Through the center of curvature - undeflected.
2. Parallel to the optic axis reflects to go through focal point.
3. Through the focal point reflects to parallel to the optic axis.
![[Pasted image 20260428115013.png]]
###### Mirror Equation
Determines image distance in terms of object distance and focal length.
$$\frac{1}{s} + \frac{1}{s'} = \frac{1}{f}$$
Parallel rays are reflected and converge at a single point a focal distance $f$ from the mirror. The convention is to positive, and there is a real, inverted image on the side of the focal distance. 

Focal length $f = \frac{radius}{2}$
![[Pasted image 20260428120837.png]]
###### Ray Tracing for Mirror Geometric Optics
1. Rays parallel to the optical axis go through the focal point after striking the mirror
2. Rays that go through the focal point before striking the mirror leave the surface parallel to the optical axis.
3. Rays that go through the center of curvature before striking the mirror reflect back on themselves.
4. Rays that strike the mirror where it intersects with the axis have an angle of reflection equal to the angle of incidence.

![[Pasted image 20260428115756.png]]
###### Magnification
$$M \equiv \frac{h'}{h} = \frac{s'}{s}$$


##### Convex Mirror
Rays reflect and diverge, and their continuations converge at a point behind the mirror, and we define this focal distance to be negative. There is a virtual, upright image on the side of the focal distance. 
$$s' = \frac{fs}{s-f}$$
$$M = -\frac{f}{s-f}$$

## Class 10
#### Lenses
Light waves, rays are diffracted entering a lens, and are converged to a focal point on the opposite side.

##### Lens Equation
$$\frac{s'}{s} = \frac{s'-f}{f}\to\frac{1}{s} +\frac{1}{s'} = \frac{1}{f}$$
$$M \equiv \frac{h'}{h} = -\frac{s'}{s}$$
##### Snell's Law
$$n_1\sin\theta_1 = n_2 \sin\theta_2$$
##### Ray Tracing for Lenses
1. Rays parallel to the optical axis go through a focal point after striking lens: (a) 1
2. Rays that go through a focal point before striking the lens leave the surface parallel to the optical axis: (a) 2
3. Rays that go through the center of the lens are not refracted: (a) 3
![[Pasted image 20260428122320.png]]
##### Optics Problem Set — Key Results and Concepts

##### Sign Conventions
- Virtual image: $d_i < 0$ (image behind mirror/on same side as object for mirrors)
- Virtual object: $d_o < 0$ (occurs when rays are converging toward a point behind a lens)
- Convex mirror / diverging lens: $f < 0$
- Radius of curvature: $R = 2f$ (signed); when problem asks for *magnitude*, report $|R|$

---

##### Mirror Problems

###### Spherical Mirror — Focal Length and Radius
Given: $d_o = 48.3$ cm, virtual image at $d_i = -13.7$ cm (negative — virtual image is behind mirror)

$$\frac{1}{f} = \frac{1}{d_o} + \frac{1}{d_i} = \frac{1}{48.3} + \frac{1}{-13.7} \approx -0.0523 \text{ cm}^{-1}$$

$$f \approx -19.1 \text{ cm}, \quad C = 2f \approx -38.2 \text{ cm}$$

Mirror is **convex** (negative $f$).

**Common mistake:** Using $d_i = +13.7$ (forgetting virtual image sign) gives $f = -10.67$ cm — incorrect.

---

###### Cornea as Spherical Mirror (Keratometer)
Given: $h_o = 1.30$ cm, $h_i = 0.167$ cm, $d_o = 3.00$ cm

$$m = \frac{h_i}{h_o} = \frac{0.167}{1.30} = 0.128$$

$$d_i = -m \cdot d_o = -0.128 \times 3.00 = -0.385 \text{ cm}$$

$$\frac{1}{f} = \frac{1}{3.00} + \frac{1}{-0.385} \implies f = -0.4417 \text{ cm}$$

$$R = |2f| = 0.883 \text{ cm}$$

**Note:** Problem asks for *magnitude* of $R$ — report positive value.

---

##### Lens Problems

###### Visual Acuity — Maximum Reading Distance
Given: $h_i = 4.00\ \mu\text{m}$, $d_i = 1.50$ cm (lens-to-retina), $h_o = 69.0$ cm

$$|m| = \frac{h_i}{h_o} = \frac{d_i}{d_o} \implies d_o = \frac{h_o \cdot d_i}{h_i}$$

$$d_o = \frac{0.690 \times 0.015}{4.00 \times 10^{-6}} = 2587 \text{ m}$$

---

###### Plano-Concave Lens in Ethanol
Given: $n_\text{lens} = 1.52$, $n_\text{ethanol} = 1.36$, $d_o = 5.7$ cm, $d_i(\text{air}) = -2.7$ cm

**Step 1:** Find $f$ in air:
$$\frac{1}{f_\text{air}} = \frac{1}{5.7} + \frac{1}{-2.7} = -0.1950 \text{ cm}^{-1} \implies f_\text{air} = -5.128 \text{ cm}$$

**Step 2:** Extract geometry factor using lensmaker's equation in air:
$$\left(\frac{1}{R_1} - \frac{1}{R_2}\right) = \frac{-0.1950}{n_\text{lens} - 1} = \frac{-0.1950}{0.52} = -0.3750 \text{ cm}^{-1}$$

**Step 3:** Find $f$ in ethanol:
$$\frac{1}{f'} = \left(\frac{n_\text{lens}}{n_\text{ethanol}} - 1\right)\left(\frac{1}{R_1} - \frac{1}{R_2}\right) = \left(\frac{1.52}{1.36} - 1\right)(-0.3750) = -0.04412 \text{ cm}^{-1}$$

$$f' = -22.67 \text{ cm}$$

**Step 4:** Find new image distance:
$$\frac{1}{d_i'} = \frac{1}{-22.67} - \frac{1}{5.7} \implies d_i' \approx -4.55 \text{ cm}$$

---

###### Myopia Correction
Given: Far point = 29 cm from eye, lens worn 2.0 cm in front of eye

Image must form at far point as seen by lens:
$$d_i = -(29 - 2) = -27 \text{ cm}$$

$$\frac{1}{f} = \frac{1}{\infty} + \frac{1}{-27} \implies f = -27 \text{ cm}$$

$$P = \frac{1}{f(\text{m})} = \frac{1}{-0.27} \approx -3.70 \text{ diopters}$$

Lens is **diverging**.

---

###### Simple Magnifier (Angular Magnification)
Given: $f = 9.7$ cm, near point = 25 cm, object at focal point

$$M = \frac{25 \text{ cm}}{f} = \frac{25}{9.7} \approx 2.58$$

---

###### Two-Lens Systems — Upright, Enlarged, Virtual Image

For each case: apply thin lens equation to L1, use output as input to L2. Check sign of $d_{i2}$ (must be negative = virtual) and total magnification $m = m_1 \times m_2$ (must be $> +1$).

| Case | $f_1$ | $f_2$ | $d$ | $d_{o1}$ | Result | Qualifies? |
|------|--------|--------|-----|-----------|--------|------------|
| A | 3 cm | 4 cm | 5 cm | 6 cm | Real final image | No |
| B | 5 cm | −12 cm | 3 cm | 3 cm | Virtual, $m \approx +1.33$ | **Yes** |
| C | −4 cm | −6 cm | 5 cm | 2 cm | Virtual but $m < 1$ | No |
| D | −5 cm | 3 cm | 4 cm | 5 cm | Real final image | No |
| E | 6 cm | 10 cm | 2 cm | 3 cm | Virtual, $m = +10$ | **Yes** |

**Answer: Cases B and E**

---

##### Ray Diagram Rules (Convex Lens)

1. Ray parallel to axis → refracts through far focal point $f$
2. Ray through near focal point $f$ → exits parallel to axis
3. Ray through lens center → passes straight through (no refraction)

**Special cases:**
- Object outside $f$: real, inverted image on far side
- Object inside $f$: virtual, upright, enlarged image on same side as object
- Object at $f$: $d_i = \infty$, rays exit parallel, **no finite image forms**