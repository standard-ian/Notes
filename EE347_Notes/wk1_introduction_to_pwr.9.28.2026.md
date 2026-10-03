# Class 1
## Power Definitions
For the supply:
$$p_s (t) = \textcolor{orange}{-} v_g(t) i(t)$$
For the load:
$$p_l (t) = \textcolor{orange}{+} v_g(t) i(t)$$

$$i(t) = I_m\cos(\omega t)$$
Power is calculated as:
$$p_s(t)  = \frac{V_mI_m}{2}\cos(\phi_V - \phi_I) + \frac{V_mI_m}{2}\cos(\phi_V-\phi_I)\cos2\omega t - \frac{V_mI_m}{2}\sin(\phi_V - \phi_I)\sin2\omega t$$
$$Q = \frac{V_mI_m}{2}\sin(\phi_V - \phi_I) t\ \text{(Reactive Power)}$$
$$p_s(t) = P + P\cos2\omega t - Q\sin 2\omega t$$
$$\text{RMS:}\ V = \frac{V_m}{\sqrt{2}},\ I = \frac{I_m}{\sqrt{2}}$$
Power Factor Angle:
$$\theta = \phi_V - \phi_I$$
$P = VI\cos(\theta)$
$Q = VI\sin(\theta)$

Positive power is $p_l(t) = + v_l(t)i(t)$
There can be power moving back and forth between the source and the load, a resonance between electric/magnetic field due to capacitive/inductive elements. 

Transformers, motors are inherently inductive and produce these effects, called reactive power. Most loads are inductive. 

### Residential Power Example
Residential power is designed to reach the service at 120V rms
$$v_l(t) = 170V\cos(2\pi 60 \text{Hz}\ t - \frac{\pi}{4}),\ V = 120V$$
$$i(t) = 2.5A\cos(2\pi 60\text{Hz} t - \frac{\pi}{4}),\ I = \frac{2.5A}{\sqrt{2}}$$
$$\text{Phase Angle of Voltage:}\ \phi_V = \frac{\pi}{4} = -45^\circ$$
$$\text{Phase Angle of Current:}\ \phi_I = \frac{3\pi}{4} = -135^\circ$$
$$\text{Power Factor Angle: } \theta = -45^\circ - (-135^\circ) = 90^\circ$$

We can find apparent power using phasors:  

For Single Phase: $\bar{S} = \bar{V}_L\bar{L}$
$\bar{V} = V_L \angle \phi_V$
$\bar{I} = I\angle\phi_I$
$$\bar{S} = (120V\angle -45^\circ)(1.8A\angle-135^\circ)$$
Take complex conjugate (review using calculator) for the phase angles.
$$\bar{S} = (120\times 1.8) \angle (-45^\circ+ 135^\circ)$$
$$\bar{S} = 220VA \angle 90^\circ$$
$$\bar{S} = 0W + j220Var$$
$$\bar{S} = S\angle\theta = P + jQ$$
$$\bar{S} = \bar{V}\bar{I}$$
$$\bar{V} = \bar{I}\bar{Z}$$
$$\bar{S} = (\bar{I}\bar{Z})\bar{I} = \bar{I}^2\bar{Z}$$
Load:
$$\bar{Z} = Z\angle \theta = R + jx\ \text{Comprised of resistance and reactance}$$
$*$ = complex conjugate
$$\bar{S} = \bar{V}\left(\frac{\bar{V}}{\bar{Z}}\right)^* = \frac{V^2}{\bar{Z}^*}$$
### Types of Service
#### Residential
120V/240V
2 phases between, 240V A-B
#### Commercial
120V/208V 
3 phases, $(\sqrt{3})*120 = 208V$  between phases
#### Industrial
277V/480V
346V/600V
3 phases, 480 and 600 are the interphase voltages

### 3 Phase Configurations Wye and Delta
![[Pasted image 20260928122030.png|697]]

With a delta config, line currents are **NOT** interphase currents, but for wye the line current **IS** the phase current.
A phase current goes through a phase element. 

We will deal with balanced systems where we only deal with one phase, mirrored 3 times. They are mostly the same phase-phase

#### Characteristics of a Balanced 3 Phase System:
1. All loads are equal. $\bar{Z}_l = \bar{Z}_{an} = \bar{Z}_{bn} = \bar{Z}_{cn}$
2. All source voltages have the same magnitude. $V_\phi = |\bar{V}_{\phi A}| = |\bar{V}_{\phi B} | = |\bar{V}_{\phi C}|$ and $V_L = |\bar{V}_{AB}| = |\bar{V}_{BC}| = |\bar{V}_{AC}|$
3. Phase angles between the source voltages are equal. $\bar{V}_{AB} = V_L\angle0^\circ, \bar{V}_{BC} = V_L\angle240^\circ, \bar{V}_{CA} = V_L \angle120^\circ$
4. All lines are equal $\bar{Z}_l = \bar{Z}_{Al} = \bar{Z}_{Bl} = \bar{Z}_{cl}$ and $I_L = |\bar{I}_A| = |\bar{I}_B| = |\bar{I}_C|$
	1. $\bar{I}_A = I_L \angle \psi + 0^\circ$
	2. $\bar{I}_B = I_L \angle \psi + 240^\circ$
	3. $\bar{I}_C = I_L \angle \psi + 120^\circ$
5. 


# Class 2
## Generators
Note the power equation is the same regardless of configuration.
#### Wye
In Wye configuration, Line currents are phase currents but line voltages are not phase voltages.
$$I_L = I_\phi$$
$$V_L = \sqrt{3}V_\phi$$
$$S_\phi = I_\phi V_\phi$$
$$S_T = 3I_\phi V_\phi = 3I_L\frac{V_L}{\sqrt{3}} = \sqrt{3}I_LV_L$$
For example: $277V/480V$
#### Delta
In Delta, Line voltages are phase voltages, but line currents are not phase currents.
$$I_L = \sqrt{3} I_\phi$$
$$V_L = V_\phi$$
$$S_T = 3S_\phi = 3I_\phi V_\phi = S_T = 3\frac{I_L}{\sqrt{3}}V_L - \sqrt{3}I_LV_L$$
## Load Complex Calculations
$$\bar{V} = \bar{Z}\bar{I}$$
$$\bar{Z} = R + jX = Z\angle \theta$$
$$\theta = \phi_Z - \phi_I = \text{Power Factor Angle}$$
$$\bar{S} = \bar{V}\bar{I}^* = (V\angle \phi_V)(I\angle \phi_I)^* = VI\angle \phi_V-\phi_I = VI\angle \theta$$
$$\bar{S} = VI\angle \theta = P + jQ = VI\cos\theta + jVI\sin\theta$$
$$P = VI\cos\theta$$
$$\cos\theta = \frac{P}{VI} = \frac{P}{S}$$
$$\text{Power Factor: }\boxed{PF = \cos\theta = \frac{P}{S}}$$
Power factor is the ratio of energy invested (capital) ($P$) to energy produced (product) ($S$) 

Power factor can be lead or lag with respect to voltage because of reactive elements.
BPA's transmission goal is $PF = 0.97 \text{\ lag}$ 

When doing the calculation, the PF angle can produce the same PF if $\pm$. $-90^\circ \leq \theta \leq +90^\circ\to 0 \leq PF \leq 1.0$ 

Lag is REACTIVE (inductive)

### Example
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[vsource, invert, l=$\bar{V}$]++(0,2)
	node[label=above:$+$]{}
	to[R=$0.5\Omega$]++(2,0)
	node[label=above:$\bar{V}_{line}$]{}
	to[inductor, l=$j1.3\Omega$]++(2,0)
	node[label=above:$-$]{}	
	to[short, i=$\bar{I}_L$]++(1,0)
	node[circ, label=right:$+$]{}
	to[generic, l=$5kW {,}\ 0kVAr$, a=$277V\angle0^\circ$]++(0,-2)
	node[circ, label=right:$-$]{};
\end{circuitikz}
\end{document}
```
#### PF = 1.0
$* = \text{Complex Conjugate}$

$$\bar{I} = \left(\frac{\bar{S}_L}{\bar{V}_L}\right)^*$$
$$\bar{I}_L = \frac{5.0kW - j0kVAr}{277\angle 0^\circ}$$
$$I_L = 18\angle 0^\circ$$
$$P_{dis} = I_L^2R = (18A)^20.5\ohm = 160W$$

$$\bar{V}_{line} = \bar{I}_L\bar{Z}_{line} = (18A\angle 0^\circ)(0.5+ j1.3\ohm) = 9.0 + j2.3V = 24V\angle 69^\circ$$

$$\bar{V} - \bar{V}_{line} - \bar{V}_L = 0$$
$$\bar{V} = 24V \angle 69^\circ+ 277V\angle 0^\circ = 290V$$

$I_L = 18A, P_{diss} = 160W$
$\bar{V}_{line} = 24V\angle 69^\circ$
$V = 290V$

#### PF = 0.7 Lag (5kW, 5kVAr)
We have a reactive load and there is a resonance every half cycle of energy between the load and the source. The ampacity increases considerbly.
$$\bar{I}_L = \left(\frac{\bar{S}_L}{\bar{V}_L}\right)^* = \frac{(5 - j5)kVA}{277V\angle 0^\circ} = 26A\angle -45^\circ$$
$$P_{diss}  = I_L^2R = 26A^2(0.5) = 340W$$
$$\bar{V}_{line} = \bar{I}_L\bar{Z}_{line} = (26A\angle -45^\circ)(0.5 + j1.3\ohm) = $$
$$\bar{V} = 277V\angle \theta + 36V\angle 24^\circ = 310V\angle 2.7^\circ$$
