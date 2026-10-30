# Class 9
# Class 10
## Review
Recall from Class 9:
![[Pasted image 20261029175203.png|461]]
### Mutual inductance
$$\lambda_{ab} = \frac{rl\mu_0}{g} i_a \int _0^{2\pi} N_b(\theta_m)N_a(\theta_m) d\theta_m\tag{14}$$
$$L_{ab} = \frac{\lambda_{ab}}{i_a} \tag{15}$$
### Self inductance
$$\lambda_{aa} = rl\int_0^{2\pi}N_a(\theta_m)B_{ra}(\theta_m)d\theta_m\tag{17}$$
$$L_{aa} = \frac{\lambda_{aa}}{i_a} = \frac{rl\mu_0}{g}\int_0^{2\pi}N_a^2(\theta_m)d\theta_m\tag{19}$$
$N_a^2$, self-inductance will always be positive

## Example
![[Pasted image 20261029175224.png|356]]
From 19:
$$L_{aa}  = \frac{\mu_0rl}{g}\int_0^{2\pi}\frac{N_w^2}{4}d\theta_m = \frac{\mu_0rl\pi N_w^2}{2g}$$
Note $$L_{aa} = \frac{N_w^2}{R_aa}$$
$$\mathcal{R}_{aa} = \frac{2g}{\mu_0rl\pi}$$
$$\mathcal{R} = \frac{l}{\mu_0A}$$
The reluctance model re-appears, the area is the length of the stator, and 1/2 of it's diameter.

Adding complexity:
![[Pasted image 20261029180229.png|571]]
Mutual Inductance 
$$L_{ab}(\theta_0) = \frac{rl\mu_0}{g} i_a \int _0^{2\pi} N_b(\theta_m)N_a(\theta_m) d\theta_m\tag{14}$$
Graphically, evaluate the integral
![[Pasted image 20261029180248.png|334]]
$$L_{ab}(\theta_m) = \frac{rl\mu_0}{g}\frac{N_{wa}N_{wb}}{4}2\left[(\pi - \theta_0) - \theta_0\right] = \frac{rl\mu_o}{2g}(\pi - 2\theta_0)$$
If $\theta_0 = \frac{\pi}{2}$ 
The mutual inductance is 0
![[Pasted image 20261029180828.png|410]]

## Self and Mutual Inductance for Sinusoidal Windings
Consider a two pole pair concentrated winding. 
![[Pasted image 20261029183211.png|604]]
$$N_a(\theta_m) = (n_a\theta_m)-1$$
Note:
$$\theta_e = P\theta_m,\ \ P = \text{ 2 pole pairs}$$
### Fourier series:
#### Mechanical:
$$N(\theta_m) - \left(\frac{4}{\pi}\right) \left(\frac{N_w}{2}\right) \left(\sin(2\theta_m) + \frac{1}{3}\sin(6\theta_m) + \frac{1}{5}\sin(10\theta_m) + ...\right)$$
#### Electrical:
$$N(\theta_m) - \left(\frac{4}{\pi}\right) \left(\frac{N_w}{2}\right) \left(\sin(\theta_e) + \frac{1}{3}\sin(3\theta_e) + \frac{1}{5}\sin(5\theta_e) + ...\right)$$
In general for the $h^{th}$ harmonic winding function:
$$N_h(\theta_m) =|N_h|\cos(hP\theta_m + \phi_h) \tag{20}$$
$$N_h(\theta_e) = |N_h|\cos(h\theta_e + \phi_h)\tag{21}$$
$$|N_h| = \frac{2N_w}{\pi h}$$

Inductances can then be decomposed into harmonic terms
$$L = L_{11} + L_{33} + L_{55}$$
If you want to make a really efficient machine, the winding functions should be largely sinusoidal. 
The higher harmonic terms result in torque ripple.

From $19$, self inductance:
$$L_h = \frac{\mu_0 rl}{g}\int_0^{2\pi} N_h^2 (\theta_m) d\theta_m \tag{22}$$
This is the self inductance for the $h^{th}$ harmonic of the winding function.

Subbing $20$ into $22$:
$$L_h = \frac{\mu_0 rl}{g} \int_0^{2\pi} |N_h|^2 \cos^2(hP\theta_m + \phi_h) d\theta_m$$
$$L_h = \frac{\mu_0 rl}{g}|N_h|^2\int_0^{2\pi}\frac{1 + \cos[2(hP\theta_m + \phi_h)]}{2} d\theta_m$$
$$L_h = \frac{\mu_0rl}{g}|N_h|^2[2\pi +0]$$
Self inductance for the $h^{th}$ harmonic.
$$L_h = \frac{\mu_0rl2\pi|N_h|^2}{g}\tag{23}$$

Mutual inductance between the two sinusoidal windings:
$$N_h(\theta_m) =|N_h|\cos(hP\theta_m + \phi_h) \ \ \ \ h = 1,2,3,4...$$
Another winding, as general as possible (the $k^{th}$ harmonic)
$$N_{k}(\theta_m)= |N_k|\cos(kP\theta_m + \phi_k)\ \ \ \ k = 1,2,3...$$

From $16$ 
$$L_{hk} = \frac{\mu_0rl}{g}\int_0^{2\pi} |N_h| \cos(hP\theta_m + \phi_h)|N_k|\cos(kP\theta_m + \phi_k) d\theta_m$$
$$ = 0 \text{ for } h\neq k$$
No magnetic coupling whatsoever between sinusoidal windings that have different number of harmonic terms
This is actually from fourier analysis, two like trig terms (i.e. cos and cos) multiplied together are equal to zero.

### But what if $n=k$?

Let's assume 2 sets of windings $P =$ 1 pole pair. $a$ winding and $b$ winding

$$N_{ha}(\theta_m) =|N_{ha}|\cos(h\theta_m + \phi_{ha})$$
$$N_{hb}(\theta_m)= |N_{hb}|\cos(kP\theta_m + \phi_{hb})$$

These should sum when multiplying together. From $16$:
$$L_{ab} = \frac{\mu_0 rl}{g}\int_0^{2\pi} N_{ha}(\theta_m)N_{hb}(\theta_m)d\theta_m$$
$$L_{ab} = \frac{\mu_0 r l} {g} |N_{ha}||N_{hb}|\int_0^{2\pi}\cos[h\theta_m + \phi_{ha}]\cos[h\theta_m + \phi_{hb}] d\theta_m$$
We can treat the two $\cos$ terms as $x$ and $y$.
Using $\cos(x)\cos(y) = \frac{1}{2}[\cos(x-y) + \cos(x + y)]$
$$L_{ab} = \frac{\mu_0 rl}{g} \frac{|N_{ha}| |N_{hb}|}{2}\int_0^{2\pi}\left[\cos(\phi_{ha} - \phi_{hb}) + \cos(2h\theta_m + \phi_{ha} + \phi_{hb})\right]d\theta_m$$
$$L_{ab} = \frac{\mu_0 rl \pi}{g} |N_{ha}||N_{hb}| \cos(\phi_{ha} - \phi_{hb})$$
We can call the whole leading term 
$$M_h = \frac{\mu_0 r l\pi}{g}|N_{ha}||N_{hb}|\tag{25}$$
So, 
$$L_{ab} = M_h \cos(\phi_{ha} - \phi_{hb})\tag{26}$$
If the phase shift angle angle is $90^\circ$ there is no mutual inductance between the two windings since they are perpendicular.

In a three phase machine, they are $120^\circ$ not $90^\circ$ , so there is mutual inductance.

For a $3\phi$ machine with 3 phase winding,
$$\vec{\lambda}_{abc} = \begin{bmatrix}\lambda_a\\ \lambda_b \\ \lambda_c \end{bmatrix} = \begin{bmatrix} L_{as} & L_{abs}  & L_{acs} \\ L_{abs} &  L_{bs} &L_{bcs} \\ L_{acs}&  L_{bcs} &  L_{cs}\end{bmatrix}\begin{bmatrix}i_{as} \\ i_{bs} \\ i_{cs}\end{bmatrix}$$

$$\vec{V}_{abc} = \frac{d\lambda_{abc}}{dt} + \vec{i}_{abc} \vec{R}_{abc}$$
$$\vec{R} = \begin{bmatrix}R_a & 0 & 0\\ 0 & R_b & 0 \\ 0 & 0 & R_c\end{bmatrix}$$

The inductance is a function of phase angle. If one is stationary, and the other is rotating, the mutual inductance will be changing as a function of position. i.e. the rotor is $a$ and the stator is $b$.


How does this change torque?
Torque is change in energy with respect to position. 



