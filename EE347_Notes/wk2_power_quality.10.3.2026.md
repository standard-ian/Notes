# Class 3
## Power Quality
$$p(t) = i(t)v(t)$$
$$v(t) = \sqrt{2}V \cos(2\pi ft + \phi_V)$$
$$i(t) = \sqrt{2}I\cos(2\pi ft + \phi_I)$$
Things that can change:
### Magnitude

#### Transient Power Quality 
The switch is closed at $t=0$, there will be a transient. If some reactive element such as a capacitor is added, there will be impulse and oscillating transients (described by second order differential equations.)
$$S=-a \pm \sqrt{w^2 -a^2}$$
```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2]
		\draw(0,0)
		to[vsource, invert]++(0,2)
		to[R]++(2,0)
		coordinate(NODE)
		to[switch, l=$t{=}0$]++(1,0)
		to[R]++(0,-2)
		--++(-3,0);
		
		\draw(NODE)
		to[R]++(0,-2);
		
	\end{circuitikz}
\end{document}
```
#### Short Duration Voltage Variations
##### Interruptions
Loss of voltage
$V < 0.1 pu$ (per unit)
$f = 60Hz$
$T = 0.0167s$
$V_{pu} = \frac{V_{actual}}{V_{nominal}}$

Example:
$V_{pu} = \frac{12V}{120V} = 0.1pu$
##### Sags 
$0.1\lt V \lt 0.95  pu$

##### Swells
$1.05 \lt V pu$

#### Long Duration Voltage Variations $T > 100s$
##### Sustained Interruption ("blackout")

##### Undervoltage
$0\lt V \lt 0.95 pu$

##### Overvoltage
$1.05 \lt V$

This can be articulated using the CBEMA Tolerance Curve
![[Pasted image 20261005113132.png|514]]

Other things besides magnitude can also cause faults. 
#### Voltage Imbalance
Magnitudes of distribution phases are more than $\pm 5\%$

#### Waveform Distortions
##### DC Offsets
##### Harmonics
###### Harmonic Distortion
If any waveform is periodic then it may be represented using and $\infty \Sigma$  of sinusoids.
###### Problems with Harmonics
```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2]
		\draw(0,0)
		to[vsource, invert]++(0,2)
		--++(1,0)
		coordinate(NODE)
		to[R]++(2,0)
		to[inductor]++(2,0)
		to[short, i=$i(t)$]++(1,0)
		to[diode]++(0,-2);
		
		\draw(NODE)
		to[capacitor]++(0,-2);
		
		
	\end{circuitikz}
\end{document}
```
The cap and inductor are "parasitics"
The diode is a non linear load and will cause harmonic distortion of $i(t)$ 
3rd $\to 3f_1 \to f_3 = 180Hz$
5th $\to 5f_1 = f_5 = 300Hz$

The reactance of the inductor $X_L = 2\pi fL$ 
And of the capacitor $X_C = \frac{-1}{2\pi fC}$

$i(t) = \sqrt{2}I_1 \sin(2\pi 60Hz t) + \sqrt{2}I_3\sin(2\pi 60Hz t) + \sqrt{2}I_5\sin(2pi 60Hz t)$ 
The reactance is decreasing for the capacitor at each increasing harmonic and increasing for the inductor. 
The cap looks like a short "to" the higher harmonics. This introduces shorts to ground which can obviously be an issue.




##### Inter Harmonics

##### Notching
Small "notches" in the top and bottom of waves
##### Broadband Noise
Every wire is an antennae 
##### Voltage Flicker
This is a sag/swell 
##### Frequency Fluctuations
On entire grid

### Phase shifting
### Other frequencies

# Class 4
## Harmonics
$n=1$ is the fundamental frequency
$n> 1$ is harmonic
$$\bar{I} = \sum_{n=1}^\infty\bar{I}_n$$
$$i_n(t) = \sqrt{2} I_n \cos\left[n(2\pi f_1 + \phi_1)\right]$$
### Example
```tikz
\usepackage{circuitikz}
\begin{document}
 \begin{circuitikz}[american, scale = 1.5] 
	 \coordinate (N) at (1.5,1); %make a reference point called "N" at coordinate 1.5,1 \draw(1.5,1) node[circ, label=above right:$N$]{}; %draw a node, type filled circle, with label up and to the right of it 
	 
	 \draw(1.5, 2.807)
	    node[circ, label=above:$A$]{}
	    coordinate(A)
	    to[short, i>^=$\bar{I}_A$ ](N);
	    
	    \draw(A)
	    --++(-1.5,0)
	    to[short, i^<=$I_A$]++(-2,0) %draw from A 3.5 in -x direction RELATIVE TO A (that's what ++(-2,0) means)
	    node[ocirc]{};
	    
	    
	    \draw(0,0)
	    node[circ, label=above left:$B$]{}
	    coordinate(B)
	    to[short,  i>_=$\bar{I}_B$](N); % every "\" command has to end w/ a semicolon
	    
	    \draw(B)
	    to[short, i^<=$I_B$]++(-2,0) %i= draws a current line
	    node[ocirc]{};
	
	    \draw(3,0)
	    node[circ, label=right:$C$]{}
	    coordinate(C)
	    to[short, i>^=$\bar{I}_C$](N);
	    
	    \draw(C)
	    --++(0,-1.5)
	    --++(-3,0)
	    to[short, i^<=$I_C$]++(-2,0) %i= draws a current line
	    node[ocirc]{};
    
    \end{circuitikz}
    \end{document}
```
#### For the first harmonic
$\bar{I}_A = I_A \angle 0^\circ$
$\bar{I}_B = I_B \angle -120^\circ$
$\bar{I}_C = I_C \angle 120^\circ$

This is a $cba$ sequence since C, then B, then A peaks

#### For the second harmonic:
$\bar{I}_{A2} = I_{A2} \angle (2) 0^\circ = I_{A2}\angle 0^\circ$
$\bar{I}_{B2} = I_{B2} \angle (2) -120^\circ = I_{B2}\angle 120^\circ$
$\bar{I}_{C2} = I_{C2} \angle (2)120^\circ = I_{C2} \angle -120^\circ$
#### For the third harmonic:
$\bar{I}_{A3} = I_{A3} \angle (3) 0^\circ = I_{A3}\angle 0^\circ$
$\bar{I}_{B3} = I_{B3} \angle (3) -120^\circ =I_{B3}\angle - 360^\circ =  I_{B3}\angle 0^\circ$
$\bar{I}_{C3} = I_{C3} \angle (3)120^\circ = I_{C3} \angle 360^\circ= I_{C3} \angle 0^\circ$

Therefore:
$$\bar{I}_{N3} = \bar{I}_{A3} + \bar{I}_{B3} + \bar{I}_{C3} = I_3\angle 0^\circ$$
**Triplens** add in the neutral
This is only an issue in the Wye configuration, if this is an issue, run through a Delta-Wye transformer. The lack of neutral.

## Sawtooth  Wave
$$i(t) = I_{DC} + \sum_{n=1}^\infty (an\cos n \omega_1 t + bn \sin n \omega_1 t)$$
$n \omega_1$ is a harmonic multiplier on the fundamental $\omega_1$
The relationships of the sawtooth wave points are:
$I_{DC} = \frac{I_m}{2}$
$an = 0$
$b_n = \frac{-Im}{n\pi}$
$$i(t)|_{sawtooth} = \frac{Im}{2} + \sum_{n=1}^\infty\left(\frac{-Im}{n\pi}\right)\sin n\omega_1 t = \frac{Im}{2}-\frac{Im}{\pi}\sum_{n=1}^\infty\frac{\sin n\omega_1 t}{n}$$
![[Pasted image 20261007112508.png|574]]

$$I_{RMS} = \sqrt{\sum_{n=1}^\infty I^2_{RMS, n}}$$
$I_{RMS, 1} = \left(\frac{-Im}{\pi}\right)\frac{1}{\sqrt{2}}$
$I_{RMS, 2} = \left(\frac{-Im}{2\pi}\right)\frac{1}{\sqrt{2}}$
$I_{RMS, 3} = \left(\frac{-Im}{3\pi}\right)\frac{1}{\sqrt{2}}$
$$I_{RMS} | _{sawtooth} = \sqrt{\left(\frac{-Im}{\pi}\frac{1}{\sqrt{2}}\right)^2 + \left(\frac{-Im}{2\pi}\frac{1}{\sqrt{2}}\right)^2 + \left(\frac{-Im}{3\pi}\frac{1}{\sqrt{2}}\right)^2}$$
We don't know when exactly to stop yet, but we know this has to stop eventually....
This is good for phases A, B, and C.....
#### When to stop? When is $\infty$? (Convergence)
$$\%\text{Convergence}   = \frac{I_{RMS, n} - I_{RMS, n-1}}{I_{RMS, n}}\times 100\%$$
#### Returning to Example - How much current might be in the Neutral line?
```tikz
\usepackage{circuitikz}
\begin{document}
 \begin{circuitikz}[american, scale = 1.5] 
	 \coordinate (N) at (1.5,1); %make a reference point called "N" at coordinate 1.5,1 \draw(1.5,1) node[circ, label=above right:$N$]{}; %draw a node, type filled circle, with label up and to the right of it 
	 
	 \draw(1.5, 2.807)
	    coordinate(A)
	    node[ocirc, label = above:$A$]{}
	    to[short, i^>=$i_A(t)$](N);
	    
	    
	    \draw(0,0)
	    coordinate(B)
	    node[ocirc, label = left:$B$]{}
	    to[short, i>_=$i_B(t)$](N); % every "\" command has to end w/ a semicolon
		
	
	    \draw(3,0)
	    coordinate(C)
	    node[ocirc, label = right:$C$]{}
	    to[short, i>^=$i_C(t)$](N);
	    
	    
	    \draw(N)
	    to[short, i^>=$i_N(t)$]++(2,0)
	    node[ocirc]{};
    
    \end{circuitikz}
    \end{document}
```

$$I_{RMS}|_{netural} = 3\sqrt{\left(\frac{-Im}{3\pi\sqrt{2}}\right)^2 + \left(\frac{-Im}{9\pi\sqrt{2}}\right)^2 + \left(\frac{-Im}{15\pi\sqrt{2}}\right)^2 + ...}$$
For the most part, we will have x-symmetric waveforms and use just the triplens when $n_{even} = 0$

#### Total Harmonic Distortion
The limits for total harmonic distortion. How much harmonic distortion your load is allowed to contribute.
**IEEE 519-2022**

$$THD = \sqrt{\sum_{n=2}^\infty}I_{RMS, n}^2\times 100\%$$
##### Example
We have a CFL light connected to a $120V$ source.
It is "gulping" current for a moment at peak.

![[Pasted image 20261007114940.png|412]]
```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}
		
		
	\draw(1.5,1)
	coordinate (N)
	node[ocirc, label=above left:$N$]{};
	
	\draw(7.5, 1)
	coordinate (N_L)
	node[ocirc, label=above left:$N_L$]{}
	node[ground]{};
	
	\draw(1.5, 2.807)
	coordinate(A);
	    
	\draw(N)
	--++(0,1)
	node[circ]{}
	to[sV, l =$120\angle 0^\circ$]++(0,2)
	to[R]++(3,0)
	to[inductor, i^>=$210mA$]++(3,0)
	coordinate(A_L)	
	to[generic, l=non-linear cfl]++(0,-2)
	--(N_L);
	
	\draw(0,0)
	coordinate(B)
	node[ocirc, label = left:$B$]{}
	to[short](N); % every "\" command has to end w/ a semicolon
	

	\draw(3,0)
	coordinate(C)
	node[ocirc, label = below:$C$]{}
	to[short](N);
	    
	\draw(6,0)
	coordinate(C_L)
	node[ocirc, label = below:$C$]{}
	to[short](N_L); % every "\" command has to end w/ a semicolon
	

	\draw(9,0)
	coordinate(B_L)
	node[ocirc, label = right:$B$]{}
	to[short](N_L);
	   
	\draw(C)
	--(C_L);
	
	\draw(B)
	--++(0,-2)
	--++(9,0)
	--(B_L);
	    
	\end{circuitikz}
\end{document}
```

| harmonic | $I_{RMS_n}\ (mA)$ |
| -------- | ----------------- |
| 1        | 150               |
| 3        | 120               |
| 5        | 80                |
| 7        | 40                |
| 9        | 20                |
THD is essentially he ratio of what we have($150mA$) to what we don't want (the harmonic $I_{RMS}$).
$$THD_I = \frac{\sqrt{120^2 + 80^2 + 40^2 + 20^2}mA}{150mA}\times 100\% = 101\%$$

Recall:
$$I_{RMS} = \sqrt{\sum_{n=1}^\infty I^2_{RMS,n}}$$
Therefore:
$$I_{RMS}|_{TOTAL} = \sqrt{150^2 + 120^2 + 80^2 + 40^2 + 20^2} mA = 212 mA$$

$$\cos A\cos B = \frac{1}{2}\cos(A + B) + \frac{1}{2}\cos(A \cdot B)$$
$$p(t) = v(t)i(t)$$
$$v_1(t) = V_{m_1}\cos(2\pi ft + \theta) $$
$$I_1(t) = I_{m_1}\cos(2\pi ft) $$
$$p_1(t) = \frac{1}{2}V_{m_1}\cos(2\pi ft + \theta + 2\pi ft) + \frac{1}{2}V_{m_1}\cos(2\pi ft + \theta - 2\pi ft)$$
$$ = \frac{1}{2}V_{m_1}I_{m_1}\cos(2(2\pi f)t + \theta) + \frac{1}{2}V_{m_1}I_{m_1}\cos\theta$$
$$ = \frac{1}{T}\int^T + \frac{1}{2}\int^T = 0 + P$$
If we look at the 3rd harmonic of current...

$$v_1(t) = V_{m_1}\cos(2\pi ft + \theta_3) $$
$$I_3(t) = I_{m_3}\cos(3\cdot 2\pi ft) $$
$$p_3(t) = \frac{1}{2} V_{m_1} I_{m_3}\cos(2\pi ft + \theta + 3 \cdot 2\pi ft) + \frac{1}{2} V_{m_1}I_{m_3}\cos(2\pi ft + \theta - 3\cdot 2\pi ft)$$
$$= \frac{1}{T}\int ^T  + \frac{1}{T}\int^T = 0 + 0$$
As long as voltage isn't heavily distorted, harmonic currents do not carry real power.

Reactive elements also don't carry real power. We measure this ratio with PF.
We can have power factor for displacement also.

$$PF_{disp} = \frac{P}{S} = \frac{P}{P^2 + Q^2}$$
$$PF_{disp} = \frac{P}{\sqrt{3} V_{L_1} I_{L_1}}\textcolor{red}{(3\phi)}\ , \ \frac{P}{V_{\phi_1} I_{\phi_1}} \textcolor{green}{(1\phi)}$$
#### Distortion Power Factor
We need this new power factor
$$PF_{dist} = \frac{1}{\sqrt{1 + \left(\frac{THD}{100\%}\right)^2}}$$
There are then 2 of these, one for current and one for voltage
$$PF_{dist, I} = \frac{1}{\sqrt{1 + \left(\frac{THD_I}{100\%}\right)^2}},\ \ PF_{dist, V} = \frac{1}{\sqrt{1 + \left(\frac{THD_V}{100\%}\right)^2}}$$
$$PF_{true} = PF_{disp} \cdot PF_{dist, V} \cdot PF_{dist, I}  = \frac{P}{\textcolor{red}{ (\text{if 3}_\phi)\sqrt{3} }\ (\text{fundamental})V_1I_1} \cdot \frac{1}{\sqrt{1 + \left(\frac{THD_I}{100\%}\right)^2}} \cdot  \cancel{\frac{1}{\sqrt{1 + \left(\frac{THD_V}{100\%}\right)^2}}}^{1,\ \text{because } THD_V \approx 0} $$
#### "Stiff" Line Voltages
We have very small impedances between where we're pulling the load and the substation or feeder.
Your load is not likely to effect the voltage because the system has been designed to ensure your voltage drop is a small portion of the total supply voltage.