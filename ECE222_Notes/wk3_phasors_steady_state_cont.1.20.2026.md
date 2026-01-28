## Class 5
This week we'll focus on using phasors and complex numbers as a tool to analyze linear steady state circuits.
Focus on significant mathematical tools. Additionally in week 7, the Laplace transform will be introduced.
#### Linear/Non-Linear Circuit
This following is a linear circuit:
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[label=left:$V_{source}$]{}
	to[diode]++(2,0)
	to[R]++(0,-2)
	node[ground, scale=2]{};
\end{circuitikz}
\end{document}
```
Given the $I/V$ relationship, they are proportional and additive.

This is also a linear circuit.
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[label=left:$V_{in} {=} cos(\omega t {+} \phi)$]{}
	to[R, a=$V_{R1} {=} Bcos(\omega t + \phi_b)$]++(2,0)
	to[inductor, l=$V_L {=} Acos(\omega t + \phi_a)$]++(2,0)
	to[R, a = $V_{R2} {=} Ccos(\omega t + \phi_c)$]++(0,-2)++(0,2)--++(1,0)
	to[capacitor, l = $V_C {=} Dcos(\omega t + \phi_d)$]++(0,-2)--++(-1,0)
	node[ground, scale=2]{};
\end{circuitikz}
\end{document}
```
At steady state, once an input voltage source is chosen, with angular frequency $\omega$, all the voltages will have the same angular frequency and phase shift. 
Phasors can only be applied to linear circuits.

#### AC Signals Review
$$V_mcos(wt + \phi)$$
$V_m = ampitude$
$\omega=\frac{radians}{second}$
$t=seconds$
$\phi = phase\ angle\ at\ t=0$ (may be in radians/second)

Time is phase. $\phi$ exists to describe the phase **difference** between different signals at $t = 0$

```tikz
\usepackage{pgfplots}

\begin{document}

% Define AC signal parameters
\def\amplitude{30}      % Amplitude in volts
\def\omega{pi}          % Angular frequency in rad/s
\def\phase{0}            % Phase shift in degrees
\def\tmax{10}         % Maximum time in seconds
\def\trig{cos}         % sin or cos

\begin{tikzpicture}
\begin{axis}[
    width=12cm,
    height=8cm,
    xlabel={Time (s)},
    ylabel={Voltage (V)},
    domain=0:\tmax,
    samples=200,
    grid=major,
    axis lines=middle,
    enlargelimits=true,
]
\addplot[red, very thick] {\amplitude*\trig(deg(\omega*x + \phase))};

\end{axis}

\end{tikzpicture}
\end{document}
```

The above shows the following function
$$30cos(\pi t + 0^\circ)$$
#### Complex Numbers Review Example
$$30cos(wt + 15^\circ) + j30sin(wt + 15^\circ)$$
$$(j)^2 = 1$$
Represent the sinusoid $v(t) = 170 cos (377t + 0.38)$ to the complex version of the sinusoid.
$$v(t) = 170cos(377t + 0.38) + j170sin(377t + 0.38)$$
$Re[V(t)] = v(t)$ is the real part of $V(t):Re(V(t))$

#### Complex Exponential Numbers ($e^x$)
###### Plotted, the Function $e^x$ Appears as Follow
```tikz
\usepackage{pgfplots}

\begin{document}

\def\tmax{10}         % Maximum time in seconds

\begin{tikzpicture}
\begin{axis}[
    width=12cm,
    height=8cm,
    %domain=0:\tmax,
    samples=200,
    grid=major,
    axis lines=middle,
    enlargelimits=true,
]
\addplot[red, very thick] {e^x};

\end{axis}

\end{tikzpicture}
\end{document}
```
###### These Two Identities Related to $e^x$ Are Important
1. $e^{\alpha + \beta} = e^\alpha e^{\beta}$
2.  $e^{-x} = \frac{1}{e^{x}}$

So, 
$$\frac{e^{1 + j4}}{e^{2 - j3}} = e^{-1 + j7}$$
###### Euler Identity Can be used to Describe the Complex Number Formerly Represented by $\alpha cos\theta + j\beta sin \theta$
$$e^{j\theta} = cos\theta + j sin\theta$$
#### IW 5.1
Convert the following into the $sin/cos$ representation:
1. $e^{j\frac{pi}{2}} = cos\frac{\pi}{2} + jsin\frac{\pi}{2} = j$  
2. $e^{j\pi} = cos\pi + jsin{pi} = -1$
3. $5e^{j\pi} = 5cos\pi + 5jsin\pi = -5$ 
4. $e^{2 + j\frac{\pi}{4}}=$
5. $e^{(-2 - j\frac{\pi}{4})}=$


#### Applying Back to Voltage
$$v(t) v_m cos(\omega t + \theta) + jv_m sin(\omega t + \theta) = v_m[cos(\omega t + \theta) + jsin(\omega t + \theta)] = v_me^{j(\omega t + \theta)}$$
Also:
$$=v_m(e^{j\omega t})(e^{j\theta})$$

###### Application
Given:
$$v_1 = v_{m1} cos(\omega t + \theta_0)\ \ \ \ v_2 = v_{m2}cos(\omega t + \theta_2)$$
What is $v_1 + v_2$?
Complex number representations of the voltages ($\mathbb{V}$) can be used to add these signals!
$$\mathbb{V}_1 = v_{m1} e^{j(\omega t + \theta_1)}\ \ \ \ \ \mathbb{V}_2 = v_{m2}e^{j(\omega t + \theta_2)}$$
$$\mathbb{V}_1 +\mathbb{V}_2  = v_{m1} e^{j(\omega t + \theta_1)} + v_{m2}e^{j(\omega t + \theta_2)} = v_{m1}e^{j\theta_1}e^{j\omega t} + v_{m2}e^{j\theta_2}e^{j\omega t}$$
$$= [v_{m1}e^{j\theta_1} + v_{m2}e^{j\theta_2}]e^{j\omega t}$$
Then, the real part can be extracted.
Phasor of $v_1 = v_{m1}e^{j\theta_1}$
Phasor of $v_2 = v_{m2}e^{j\theta_2}$

###### Example
$$v(t) = 12cos(500t + 13.8^\circ)$$
We can go right to the phasor, where $\tilde{V}$ signified a phasor, which is a complex number:
$$\tilde{V} = 12e^{j13.8^\circ}\ (Polar\ Form) = 12(cos13.8^\circ + jsin13.8^\circ)\ (Rectangular\ Form)$$
$$\tilde{V} = x + jy=11.65 + j2.86$$
$$\tilde{V}=\sqrt{x^2 + j^2}e^{j\theta}\ \ \ \ \theta=arctan(\frac{y}{x})$$
$$\tilde{V} = \sqrt{(11.65)^2+(2.86)^2}e^{j\cdot arctan(\frac{y}{x})} = \sqrt{143.9k}e^{j76.21^\circ} \approx12.0e^{j76.21^\circ}$$
## Class 6

#### Real and Complex Numbers Review
##### Real: $v(t) = v_m cos(\omega t + \phi$
##### Complex: $\mathbb{V} = V_m(cos(\omega t + \phi) + jsin(\omega t + \phi))$

$$\mathbb{V} = V_me^{j(\omega t + \phi)}$$
Knowing this, we can generally go directly to the following format to work easily via phasors.
$$v(t) = Re[\mathbb{V}(t)]$$
#### Phasor Application Examples
##### Adding
$v_1 = 20 cos (500t - 45^\circ)$
$v_2 = 10 sin(500t + 60^\circ)$

Find $v_1 + v_2$:
$\tilde{V}_1 = 20e^{-j45^\circ} = 20\angle-45^\circ$
$v_2 = 10 cos(500t -30^\circ)$
$\tilde{V}_2 = 10e^{-j30^\circ} = 10 \angle -30^\circ$
In rectangular form:
$\tilde{V}_1 = 14.14 - j14.14$
$\tilde{V}_2 = 8.66-j5$
$\tilde{V}_1 + \tilde{V}_2 = 14.14 + 8.66 - j14.14 -j5 = 22.8-19.14j$$
$y$ is negative, $x$ is positive, $arctan(\frac{y}{x})$ can be left as is, a negative angle
$$=\sqrt{(22.8)^2+(19.14)^2}e^{j(arctan(\frac{-19.14}{22.8}))}= 29.54e^{j(-40^\circ)}$$

#### Applying Back to Circuit
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[label=left:$V_{AC}$]{}
	to[R = $V_1$]++(2,0)
	to[inductor, l=$V_2$]++(1,0)
	to[R = $V_3$]++(0,-1)
	to[capacitor, l=$V_4$]++(0,-1)
	node[ground, scale=2]{};
	
	\draw(5,0)
	node[label=left:$i_{AC}$]{}
	to[R, i= $i_1$]++(2,0)
	to[inductor, i=$i_2$]++(1,0)
	to[R, i= $i_3$]++(0,-1)
	to[capacitor, i=$i_4$]++(0,-1)
	node[ground, scale=2]{};
\end{circuitikz}
\end{document}
```
$$v(t) = v_1 + v_2 + v_3 + v_4$$
$$\tilde{V}_{AC} = \tilde{V}_1+\tilde{V}_2+\tilde{V}_3+\tilde{V}_3$$

$$i_1+ i_2 + i_3 = i(t)$$
$$\tilde{I}_{AC} = \Sigma \tilde{I}_n$$

#### Differentiation
$$x(t) = X_mcos(\omega t + \phi)$$
$$x' = \frac{dx}{dt} = X_m\cdot \omega \cdot (-sin(\omega t +\phi)) = \omega \cdot X_m \cdot sin(-\omega t - \phi) = \omega\cdot X_m \cdot cos(-\omega t - \phi - 90^\circ)$$
$-sin(\theta) = sin(-\theta)$
$cos(-\theta) = cos(\theta)$

So, 
$$\omega X_m cos(\omega + \phi + 90^\circ)$$
And the phasor:
$$\omega X_m e^{j(\phi + 90^\circ)}=\omega X_m e^{j(\phi + \frac{\pi}{2})}$$
When you take the derivative, it is a phase **leading**. Integration will cause to phase lag.
The derivative will amplify by $\omega$ as can be seen above.

**Reminder**: Derivative of current is voltage for inductor, and integral of current is voltage for capacitor.
When the current changes fast, the voltage rises high.

#### Integration Over Time
$$\tilde{X} = X_me^{j(\omega t)}$$
$$\tilde{X}' = \omega X_me^{j(\omega t + \frac{\pi}{2})}$$
$$\tilde{X}''' = \omega^2 X_me^{j(\omega t + \pi)}$$
##### Example
$$x(t) = X_m cos(\omega t + \phi)$$
$$y(t) = \int X_m cos(\omega t + \phi) dt$$
$$\frac{X_m}{\omega}sin(\omega t + \phi) = \frac{X_m}{\omega} cos(\omega t + \phi -\frac{\pi}{2})$$
$$\tilde{X} = X_m e^{j\phi}$$
$$\tilde{Y} = \frac{X_m}{\omega}e^{j(\phi - \frac{\pi}{2})}$$
$$y(t) = \frac{X_m}{\omega}cos(\omega t + \phi - 90^\circ)$$
Integration introduces a phase **lag**

It takes time to rotate $\tilde{X}$ into $\tilde{Y}$. The amount of time to get there depends on $\omega$. It takes some time to reach the angle of the original function.

#### IW 6.1
1. Write complex representations of the following signals.
	1. $i(t) = 0.05cos(1000t + 45^\circ)A$
		1. $0.05e^{j(1000t + 45^\circ)}$
	2. $v(t)=2.5cos(1000t + 135^\circ)V$
		1. $2.5e^{j(1000t + 135^\circ)}$
2. Determine whether the signal $i(t)$ leads or lags the signal $v(t)$ and by how many degrees.
		$i(t)$ lags $v(t)$ by $\frac{\pi}{2}$
3. Find the phasor of each. 
	1. $\tilde{I} = 0.05\angle 45^\circ$
	2. $\tilde{V} =2.5\angle 135^\circ$
4. It is probably an inductor because current lags voltage. The voltage in an inductor is the derivative of the current. For inductors, the inductance is the ratio of the amplitudes of voltage/current (impedance, by ohms law), $2.5/0.05 = 50\ohm$, then divided by the frequency ($\omega$). So the inductance is $\frac{50}{1000} = 0.05H = 50mH$


#### Inductor Example

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)--++(0.5,0)
	node[label=above:$+$]{}
	to[inductor, l=$v(t)$, i=$i(t)$]++(2,0)--++(0.5,0)
	node[label=above:$-$]{};
\end{circuitikz}
\end{document}
```
$$\color{orange}v(t) = L\cdot\frac{di}{dt}$$


$$\tilde{V} = L \cdot\omega \tilde{I}e^{j\frac{\pi}{2}} $$
$$e^{j\frac{\pi}{2}} = cos(\frac{\pi}{2})+jsin(\frac{\pi}{2}) = 0 + j(1) = j$$
So, for inductors, the **complex impedance** of the inductor is $j\omega L$, and
$$\color{orange}\tilde{V}_L  = j\omega L \tilde{I}_L$$
Which parallels Ohm law, $V=I\cdot R$
At steady state, complex numbers really simplify AC signals!
$$Z_L = \frac{\tilde{V}_L}{\tilde{I}_L} = j\omega L$$


