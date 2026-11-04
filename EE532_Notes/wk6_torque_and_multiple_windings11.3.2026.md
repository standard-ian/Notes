# Class 11
## 5.5 Torque in Multiply Excited Rotated Device
Consider a 2 pole rotating machine
![[Pasted image 20261103174850.png|707]]
Subtracting the average shifts similarly to what we saw last week, and actually creates a pretty nice $\sin$ wave.
The winding functions are spacial, not temporal.

The rotor winding function is similar, but not as smooth, with only 5 windings.

From the previous lecture $25, 26$:
$$L_{12}(\theta) = m_1\cos(\theta) \tag{1}$$
Where:
$$m_1 = \frac{\mu_0rl\theta}{g}\left(\frac{N_1}{2}\right)\left(\frac{N_2}{2}\right)\tag{2}$$
Mutual inductance is a function of the angles.

Energy in both windings, they are mutually coupled.
$$E_m = \frac{i_1 \lambda_1}{2} + \frac{i_2\lambda_2}{2}\tag{3}$$
Where the stator will have a self and mutual inductance.
$$\lambda_1 = L_{11}i_1 + L_{12}i_2\tag{4}$$
Similary, the rotor will have a mutual and a self
$$\lambda_2 = L_{12}i_1 + L_{22} i_2\tag{5}$$
$4,5\to 3$ 
$$E_m = L_11\frac{i_1^2}{2} + \textcolor{green}{\frac{L_{12}i_1i_2}{2} + \frac{L_{21}i_1i_2}{2}} + \frac{L_{22}i_2^2}{2}$$
The middle terms combine, $\textcolor{green}{\text{mutual interaction energy}}$ 

With more sets of windings, we just keep adding additional terms.

Assume the current is held fixed for a particular position. Then, the torque is the change in the energy with respect to the angle:
$$T_e = \frac{dE_m}{d\theta} = \frac{i_1^2}{2}\frac{dL_{11}}{d\theta} + \frac{i_2^2}{2}\frac{dL_{22}}{d\theta} + i_1i_2\frac{dL_{12}}{d\theta}\tag{7}$$
The first terms cancel because $L_{11}$ and $L_{22}$ are constant no matter $\theta$.
$$T_e = \frac{dE_m}{d\theta} = \cancel{\frac{i_1^2}{2}\frac{dL_{11}}{d\theta}}^0 + \cancel{\frac{i_2^2}{2}\frac{dL_{22}}{d\theta}}^0 + i_1i_2\frac{dL_{12}}{d\theta}$$
$1\to 7$ 
$$\boxed{T_e(\theta) = -i_1i_2m_1\sin(\theta) \tag{8}}$$
The torque can be adjusted by varying the currents on either rotor or stator.
Putting the $m_1$ term back ($2\to 8$)
$$T_e(\theta) = i_1i_2\left(\frac{\mu_0rl\pi N_1N_2}{4g}\right)\sin(\theta) \tag{9}$$
$$T_e(\theta) = -rlg\pi \left(\frac{i_1N_1}{2g}\right)\left(\frac{\mu_0i_2N_2}{2g}\right)\tag{10}$$
From Ampere's, $Ni = Hl$ where $l = 2g$ 
So the first term becomes H and the second becomes B with the permeability constant in there.
$$T_e(\theta) - -rlg\pi H_{1, MAX}B_{2, MAX} \tag{11}$$

Max torque when $H_{1, MAX}$ and $B_{2, MAX}$ are at $90^\circ$ since the repetition is every $360^\circ$ 
Compare this to reluctance torque where max torque is at $\theta = 45^\circ$ since there is repetition every $180^\circ$.

This assumes there is no reluctance in the material. We could model this but it will introduce some harmonics.


Current in rotor, current in stator, or phase angle between rotor and stator can all be adjusted.

This could all be function of time, where $\theta = \omega_m t$ 
$$T_e(t) = i_1(t)i_2(t)m_1\sin(\omega_m t)$$
Let's consider when current is sinusoidal. 
$$i_1 (t) = I_S\cos(\omega_et) \tag{12}$$
$$i_2(t) = I_R \cos(\omega_r t + \alpha) \tag{13}$$
$$\theta = \omega_m t + \textcolor{green}{\theta_0 \tag{14} \text{ (initial rotor position)}}$$
If $\alpha = 0$, the windings are connected in series.

Now....$12, 13, 14 \to 8$ 
$$T_e(T) = -mI_SI_r\cos(\omega_e t) \cos(\omega_r t + \alpha) \sin(\omega_m t + \theta_0)$$
Using $\cos(A)\cos(B) = \frac{1}{2}\cos(A-B) + \frac{1}{2}\cos(A + B)$ 
$$T_e(t) = \frac{-MI_SI_r}{2}\left\{\left[\cos\left[(\omega_e - \omega_r)t - \alpha\right] + \cos\left[(\omega_e + \omega_r)t + \alpha\right]\right]\sin(\omega_mt + \theta_0)\right\}$$
Using $$\sin(A)\cos(B) = \frac{1}{2}\sin(A + B) + \frac{1}{2} \sin(A - B)$$
If we assign:
$A = (\omega_mt + \theta_0)$
$B = (\omega_et + \omega_r)t + \alpha$
$$T_e(t) = \frac{-MI_SI_r}{4}\left[\sin\left\{\left[\omega_m + (\omega_e + \omega_r)\right]t + \alpha + \theta_0\right\} + \left\{\left[\omega_m - (\omega_e + \omega_r)\right]t - \alpha + \theta_0\right\} + \sin\left\{ \left[\omega_m + (\omega_e - \omega_r)\right]t + \theta_0 - \alpha\right\} + \sin\left\{\left[\omega_m - (\omega_e - \omega_r)\right]t + \theta_0 + \alpha\right\}\right]$$
This is the situation where everything is time dependent. We want to create a non-zero average torque. 
If everything is changing with time, and all values are different, everything is sinusoid, and the average of that is 0.

$$\int_0^{2\pi}\sin(\omega t) dt$$
If we can isolate $\theta_0$ by eliminating the speed terms 0, what combinations of $\omega_m, \omega_e, \omega_r$ will result in non-zero torque?
A non-zero average torque requires $\omega_m \geq 0$

### Option 1 - Synchronous Machine
Make rotor voltage DC ($\omega_r = 0$) and $\omega_e = \omega_m$, and $\alpha = 0$
With this combination, the general equation becomes:
$$T_e = \frac{-mI_SI_r}{4}\left\{\sin(2\omega_e t + \theta_0) + \sin(\theta_0) + \sin(2\omega_et + \theta_0) + \sin(\theta_0)\right\}$$
Time has been eliminated for 2 terms.
$$T_e = \frac{-MI_SI_r}{2}\left[(2\omega_r t + \theta_0 )+ \sin\theta_0\right]$$
The torque is very shite because the torque is very oscillatory.
$$\text{Average}\ <T_e> = -\frac{MI_SI_r}{2}\sin(\theta_0)$$

In reality, there will be a time constant for $\omega_e$ and $\omega_m$ to synchronize, and it would depend on the inertia of the rotor.
But...this is not a good design really...because of the oscillations.

### Option 2 - Single Phase Induction Machine
Another way to eliminate $t$ might be to make $(\omega_e + \omega_r) = -\omega_m$ or $(\omega_e - \omega_r) = \omega_m$ 
#### $(\omega_e -\omega_r) = \omega_m$
$$T_e(t) = \frac{-MI_sI_r}{4}\left[\sin(2\omega_et + \theta_0 + \alpha) + \sin(-2\omega_r t - \alpha + \theta_0) + \sin(2(\omega_e - \omega_r)t + \theta_0 - \alpha) + \sin(\theta_0 + \alpha)\right]$$
The average torque:
$$\text{Average} <T_e> = \frac{-MI_SI_r}{4}\sin(\alpha + \theta_0)$$
This is a single phase induction machine.
This is also a bit shite because it is single phase. There is always an oscillation in the torque, despite a non-zero average. 
It causes noise, vibration, and inefficiency in large machines.
We use three phase because it creates constant torque. 

## 5.6 Three Phase Rotating Fields
Consider three windings spaced $120^\circ$ apart and current $120^\circ$ apart.
Recall, $$B_r = \frac{\mu_0 i_a}{g} N_a(\theta)$$
Where $N_a(\theta)$ is the winding function.

The current $i_a$ is of course a function of time. 
The field in the air gap for the machine is a function of the current wrt time and the winding function wrt $\theta$
$$B_r(\theta_m, t) = \frac{\mu_0 i_a(t)}{g}N_a(\theta_m) = \frac{\mu_0}{g} MMF_a(\theta_m, t)$$
We could plot this MMF in an air gap as s function of angle and time. For three phase, the current and winding function will be phase shifted by $120^\circ$

Each individual field in the three phases. $P$ is the number of pole pairs.
$$MMF_a(\theta, t) = N_wI_m\cos(P\theta_m)\cos(\omega_et)$$
$$MMF_b(\theta, t) = N_wI_m\cos(P\theta_m - 120^\circ)\cos(\omega_et - 120^\circ)$$
$$MMF_c(\theta, t) = N_wI_m\cos(P\theta_m + 120^\circ)\cos(\omega_et + 120^\circ)$$
Adding up and expanding terms using identities:
1. Obtains $MMF_{Total} = MMF_a + MMF_b + MMF_c = \frac{3}{2}N_fI_m\cos(P\theta - \omega _et)$
	1. This doesn't look like much but when plotted, each MMF is just flattening and inverting over time
	2. But when added up, it becomes a single sine wave moving forward along the plot
	3. In the air gap, this creates rotating north and south fields.
2. A N/S field in the rotor will want to track this moving field.

# Class 12
