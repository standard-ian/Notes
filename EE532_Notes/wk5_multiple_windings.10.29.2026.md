# Class 9
![[Pasted image 20261102080507.png|791]]
We want a systematic way to analyze any rotary machine with an air gap. 
We assume some set of conditions that can be removed later.

In the above rotor-stator configuration, we can analyze the field using the enclosed  current
$$\oint\vec{H}\cdot d\vec{l} = \text{enclosed current}$$
Because the relative permeability in the rotor and the stator is infinite, $H$ goes to zero everywhere but in the air gap.
The plot above essentially is counting the number of windings enclosed. It fluctuates between max and 0 since the current in the opposite direction cancels. 
This is the turns function. We can multiply it by the current and divide by the air gap as shown, but only

This only works if $H_r(\theta_m) = 0$ though, and in that case the field is positive only. This is not correct (what is shown in the above image). We need to subtract off the average.

We need positive and negative to satisfy the following:
$$\phi = \oint Br dA = 0$$
The total flux has to be 0 so we need positive and negative.
$$0 = \mu_0l\int_0^{2\pi}H_r(\theta_m) d\theta_m \tag{5}$$
$$H_r(\theta_m) =  \frac{n_a(\theta_m) i_a}{g} \tag{4}$$
**Turns Function**
$$n_a(\theta_m)$$
$4\to 5$ 
$$0 = \int_0^{2\pi} \left[\frac{n_a(\theta_m) i_a}{g} + H_r(\theta_m)\right] d\theta_m$$
$$=\frac{N_w i_a}{g}\left(\frac{\pi}{2}\right)2 + H_r(\theta_m)2\pi$$
This creates the average of the turns functions.
$$H_r(\theta_m) = \frac{-N_w i_a}{2g} = -\frac{i_a}{g}\left(\frac{N_w}{2}\right)$$
$$H_r(\theta) = \frac{-i_a}{g}<n_a(\theta_m)> \tag{6}$$
$<n_a(\theta_m)> = \text{ average of turns function} = \frac{N_w}{2}$

Can substitute $6\to 4$:
$$H_r(\theta_m) = \frac{n_a(\theta_m) i_a}{g} - \frac{i_a}{g}<n_a(\theta_m)>$$
$$H_r(\theta_m)= \frac{i_a}{g}\left(n_a(\theta_m) - <n_a(\theta_m)>\right)\tag{6a}$$
So we have the turns function minus the **average** of the turns functions, we get the same plot as above, just without the $i_a/g$.
**Winding Function**
$$N_a(\theta_m) = n_a(\theta_m) - <n_a(\theta_m)>\tag{8}$$
![[Pasted image 20261102083709.png|638]]
$8\to 6a$
$$H_r(\theta_m) = \frac{i_a}{g}N_a(\theta_m)\tag{7}$$
We'll have a stator field and a rotor field, so add $a$ and later $b$ now...
$$B_{ra}(\theta_m) = \mu_0H_r = \frac{\mu_0i_a}{g}N_a(\theta_m) \tag{9}$$
This allowed us to get the magnetic field "poles"
![[Pasted image 20261102083755.png|653]]

## 5.2 Flux Linkage
For clarity, we'll just use 2 poles and think about mutual inductance first...
 At first, we'll imagine there is no current in the stator, so we are just looking at how the rotor field affects the stator winding. 
![[Pasted image 20261102084827.png|898]]

Mutual flux linkage - the rotor flux (a) linking stator winding (b)
$$\lambda_{ab} = N_{wb}\phi_{ab}$$

The flux is flowing between $\theta_{m1}$ and $\theta_{m2}$.
The permeability of the stator and rotor are $\infty$, so any path will only have to deal with the reluctance of the air gap, none from the rotor or stator material.
The field going between these angles.
$$\lambda_{ab} = N_{wb}\int_{\theta_{m1}}^{\theta_{m2}}B_{ra}(\theta_m)r d \theta_m\ l$$
Recall $l$ is the axial length of the rotor/stator. The above diagram is just a "slice"

But we need to account for the turns function, which accounts for where the windings are.

At $\theta_{m1}$ the number of turns goes up to $N_{wb}$

With mutual inductance, positive/negative is possible because of the relationship of definitions of current direction and $+/-$ and which direction is positive $\hat{n}$.

![[Pasted image 20261102090705.png|579]]

However, for self inductance, the flux is always linking back in itself, and there is no relativity to another coil.

So, rotor $a$ is linking $b$.
We have to define what is positive in the context of our 2 pole rotor/stator arrangement.

We may notice that if we integrate the linkage function $\lambda_{ab}$ from $0\to 2\pi$, then multiply by the turns function, the result will be equivalent
![[Pasted image 20261102091621.png|416]]
$$\lambda_{ab} = rl\int_{\theta_{m1}}^{\theta_{m2}} N_{wb}B_{ra}(\theta_m)d\theta_m $$
$$\lambda_{ab} = rl\int_0^{2\pi}n_b(\theta_m)B_{ra}(\theta_m)d\theta_m$$
But from $8$, we can write that the turns function is equal to the winding function plus the average of the turns function.
$$n_b(\theta_m) = N_b(\theta_m) + <n_b(\theta_m)>\tag{12}$$

The average of the turns function is just a constant and can be taken out.
$$\lambda_{ab} = rl\int_0^{2\pi}N_b(\theta_m) B_{ra}(\theta_m) d\theta_m + <n_b(\theta_m)> rl\int_0^{2\pi}B_{ra}(\theta_m)d\theta_m$$
The field coming in must be the field going out, so the second integral cancels
$$\lambda_{ab} = rl\int_0^{2\pi}N_b(\theta_m) B_{ra}(\theta_m) d\theta_m + \cancel{<n_b(\theta_m)> rl\int_0^{2\pi}B_{ra}(\theta_m)d\theta_m}^0$$
$$\lambda_{ab} = rl\int_0^{2\pi}N_b(\theta_m) B_{ra}(\theta_m)d\theta_m\tag{13}$$
Recall ($9$): $B_{ra}(\theta_m) = \frac{\mu_0i_a}{g}N_a(\theta_m)$

$9\to 13$
$$\lambda_{ab} = \frac{rl\mu_0i_a}{g}\int_0^{2\pi}N_b(\theta_m)N_a(\theta_m)d\theta_m\tag{19}$$

$b$ has a winding function and $a$ has a winding function, how they interact from $0\to 2\pi$ gives the mutual flux linkage.

## 5.3 Mutual and Self Inductance
### Mutual Inductance 
$$L_{ab} = \frac{\lambda_{ab}}{i_a} = \frac{\text{linking stator winding $b$}}{\text{rotor current $a$}}$$
$14\to 15$
$$L_{ab} = \frac{rl\mu_0}{g}\int_0^{2\pi}N_a(\theta_m)N_b(\theta_m)d\theta_m\tag{16}$$
### Self Inductance
In the case of the $a$ winding self-inductance, the field in the rotor winding $a$ is linking itself so $13$ becomes:
$$\lambda_{aa} = rl\int_0^{2\pi}N_a(\theta_m)B_{ra}(\theta_m) d\theta_m\tag{17}$$
We can again substitute $9\to 17$
$$\lambda_{aa} = \frac{rl\mu_0i_a}{g}\int_0^{2\pi}N_a^2(\theta_m)d\theta_m\tag{18}$$
$$L_{aa} = \frac{\lambda_{aa}}{i_a}$$
$$L_{aa} = \frac{rl\mu_0}{g}\int_0^{2\pi}N_a^2(\theta_m)d\theta_m\tag{19}$$

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



