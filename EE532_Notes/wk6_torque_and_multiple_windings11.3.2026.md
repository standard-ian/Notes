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
$$MMF_A = \cos(\theta)\cos(\omega_et)$$
$$MMF_B = \cos(\theta - 120^\circ)\cos(\omega_et - 120^\circ)$$
$$MMF_C = \cos(\theta + 120^\circ)\cos(\omega_et + 120^\circ)$$
$$\boxed{MMF_A + MMF_B + MMF_C = \frac{3}{2}\cos(P\theta - \omega_et)}$$
This is a travelling wave, the sum of each phase's MMF.

 $$Ni = MMF = Hl$$
 $$H_r = \frac{Ni}{l}$$

## 6.0 Induction Machine Review
Three phase stator winding creates a travelling wave field in the air gap despite no single phase being a travelling wave.
$f_e$ = electrical frequency

![[Pasted image 20261116080417.png|553]]i

If you have a north south field rotating past a conductor, Faraday's law states that current will be induced in the winding. This current will interact with the field in the air gap that created it, and this will produce torque. 
The rotor and the field will be rotating around. The stator's field with an electrical frequency, and the rotor with a **mechanical** frequency.

$f_r = f_m p$
where $p$ is **pole pairs**, this is just 2 in the example above. Each pole has 2 **PAIRS**

We need to select and commit to a single reference frequency, not both. So we can put one in terms of the other
$$f_m = \text{ mechanical frequency}\ [Hz]$$
One mechanical rotation is equivalent to 2 electrical rotations.

$f_r$ is the rotor frequency in a  "electrical frame"

There is some difference between the rotor (mechanical) and the stator (electrical)  frequency. This is called **slip**. It measures this difference in the **electrical frame of reference**

Slip:
$$S = \frac{f_e - f_r}{f_e} = \frac{\omega_e - \omega_r}{\omega_e}\tag{1 \& 2}$$
$$\omega_r = p\omega_m\tag{4}$$
Alternatively, we could use the mechanical frequency $f_m$ and convert the electrical into the mechanical frame.
$$S = \frac{\omega_{sm} - \omega_m}{\omega_{sm}} = \frac{f_{sm} - f_m}{f_{sm}}\tag{3}$$
Where 
$$\omega_{sm} = \frac{\omega_e}{p},\ \ \omega_m = 2\pi f_m\tag{5} $$

$$sf_{e} = f_e - f_r = \text{ (electrical frequency)} - \text{(rotor frequency in electrical frame)}$$
Visualize the mechanical rotor spinning, and then multiplying that by the number of pole pairs. 
$s f_e$ physically means how many hertz the rotor is lagging behind the stator's field.

Induction machine per-phase equivalent circuit.

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[generic, l=$r_1$, i>^=$i_1$]++(2,0)
	to[inductor, l=$jX_1$]++(2,0)
	coordinate(A);
	
	\draw[<->](0,-0.1)--++(0,-1.8)
	node[midway, label=left:$V_1$]{};
	
	\draw(A)
	to[inductor, l=$jX_2$, i>^=$i_2$]++(2,0)
	to[generic, , l=$\frac{r_2}{s}$]++(0,-2)
	--++(-6,0);
	
	\draw(A)--++(0,-0.25)
	--++(0.5,0)
	to[inductor, l=$jX_m$]++(0,-1.5)
	--++(-0.5,0)
	--++(0,-0.25)
	++(0,0.25)
	--++(-0.5,0)
	to[R, l=$r_2$]++(0,1.5)
	--++(0.5,0);
	
\end{circuitikz}
\end{document}
```
$r_1$ = stator resistance
$x_1$ = stator leakage reactance ($jX_1 = j\omega_e L_1)$ 
$r_2$ = rotor resistance
$x_2$ = rotor leakage reactance ($jX_2 = j\omega_eL_2$)
$R_C$ = core loss (hysterysis and eddy currents)
$i_1$ = stator current
$i_2$ = rotor current

![[Pasted image 20261116084847.png|955]]
$$\eta = \frac{P_{out}}{P_{in}}\tag{7}$$
Power transmitted across the air gap
$$P_{gap} = \frac{3|i_2|^2r_2}{s}\tag{8}$$

After the gap there is some loss before the developed power
$$P_{dev} = P_{gap} - P_{RC}\tag{9}$$
$$ = \frac{3|i_2|^2r_2}{s} - 3|i_2|^2r_2 = 3|i_2|^2r_2\left(\frac{1}{s}-1\right)$$
$$T_{dev} \omega_m = 3|i_2|^2 r_2\left(\frac{1-s}{s}\right)$$
$$T_{dev} = \frac{3|i_2|^2 r_2(1-s)}{s\omega_m}\tag{10}$$
From $3$:
$s = \frac{\omega_{sm} - \omega_m}{\omega_{sm}}$
$S\omega_{sm} = \omega_{sm}-\omega_m$
$\omega_m - \omega_{sm}(1-s)$

$11\to 10$
$$T_{dev} = \frac{3|i_2|^2r_2}{s\omega_m}\tag{12} = \frac{P_{gap}}{\omega_{sm}}$$
Gap Power:
$$P_{gap} = \frac{3|i_2|^2r_2}{s}$$
$$SP_{gap} = 3|i_2|^2r_2$$
$$s = \frac{\omega_e - \omega_r}{\omega_e}$$
$$s\omega_e = \omega_e = \text{rotor current frequency}$$
As the slip increases towards 1, the resistance $\frac{r_2}{s}$ will $\infty \to r_2$

If the rotor is rotating, the induced current will be lower, since the rotor is rotating with the field. (The windings of the rotor will see a "lower" frequency)

If $s$ is zero, there will be no current induced, and therefore no torque. $\frac{r_2}{s}$ will be infinite.
There is always some friction, so there will always be some slip. 

Something else would have to be applying power to overcome the friction instead, like in the case of a wind turbine.

![[Pasted image 20261116100152.png|1106]]A

## Maximum Power Transfer

Considering a resistive circuit. 
Max power transfer when $R = R_L$ 

Similarly, 
$$|Z_{thevenin}| = |Z_L|$$
So considering the model we used earlier, if we can find the Thevenin impedance.

$$\frac{r_2}{s} = |Z_{th}|\tag{13}$$
Where 
$$Z_{th} = \frac{jX_2 + r_c || jX_m}{ j(x_2 + r_1)}$$
We can work out the voltage divider to find $V_{th}$
$$V_{th} = \frac{V_1 X_m}{\sqrt{(X_m + x_1)^2 + r_1^2}}$$
Assume $V_1$ is real only
$$$$