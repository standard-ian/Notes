## Class 17
#### 4.6 Inductance (9.4 Ida)

Consider 2 coils. 
The first coil has a current $I_1$ that is creating a radial magnetic field $\vec{B}_1$. Some flux from $\vec{B}_1$ enters the second loop. 

##### Mutual Inductance
We can integrate the field over the surface of the second loop to find this flux through the second loop. 
$$\Phi_{12} = \int_{s2}\vec{B}_1\cdot d\vec{s}_2 = \int_{s2}\vec{B}_1\cdot \hat{n}_2\ ds\ [Wb]$$
There $\vec{B}_1$ is the field due to loop 1. We define inductance as:
$$L_{12} = \frac{\Phi_{12}}{I_1}\ [H] = \frac{Wb}{A} = \frac{Tm^2}{A}$$
Mutual Inductance could be negative, depending on the normal direction on the second coil.
##### Self Inductance
The field from $I_1$ also comes back on itself.

Self-Inductance is the flux from loop 1 coming back on itself, flowing through its own area. 

$$\Phi_{11} = \int_{s1}\vec{B}\cdot \hat{n}_1\ ds\ [Wb]$$
Given a magnetic flux $\Phi_B$, self inductance is defined as
$$L_{11}  = \frac{\Phi_{11}}{I_1}\ [H]$$
It is only a function of geometry and material properties (when linear) ($I$) is divided out of the flux in the numerator.

Self Inductance cannot be negative!

For wire 1 of length $l$ the self inductance is 
$$L_{11} = \frac{l\mu}{2\pi}ln\left(\frac{b}{a}\right)\ [H]$$
Inductance per unit length $L'$ is in units of Henries/meter
$$L' = \frac{L_{11}}{l} = \frac{\mu}{2\pi}ln\left(\frac{b}{a}\right)$$
Note: Also flux linking within inner conductor, so total inductance per unit length:
$$L' = L_1 + L_{11} = \frac{\mu}{2\pi}\left[\frac{1}{4} + \ln\left(\frac{a}{b}\right)\right] \ \left[\frac{H}{m}\right]$$
It just adds a term $\frac{1}{4}$ due to internal flux linkage. (see example 9.11 in Ida).


#### 5.0 Transmission Lines

The $\vec{B}$ and $\vec{E}$ fields are perpendicular coming off of a coaxial cable, for example. We can model this behavior with a sinusoidal voltage source using circuit analysis.

```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

\draw(0,0)
to[sV, l=$V(Z{,}t)$]++(0,2)
to[generic, l=$R'\Delta Z$, i>_=$I(Z{,}t)$]++(2,0)
to[inductor, l=$L'\Delta Z $]++(2,0)
node[ocirc, label=above:$A$]{}
to[generic, a = $G'\Delta Z$]++(0,-2)
++(0,2)
to[short, i>_=$I(Z + \Delta Z{,}t)$]++(3,0)
node[circ]{}
++(-3,0)
--++(0,-0.5)
--++(1,0)
to[capacitor, l=$C'\Delta Z$]++(0,-1)
--++(-1,0)
--++(0,-0.5)
--++(3,0)
node[circ]{}
++(0,0.25)
coordinate(ARROW1);

\draw(0,0)--++(4,0);

\draw[<->](ARROW1)--++(0,1.5);
\draw(ARROW1)
++(0,0.75)
node[label=right:$V(Z + \Delta Z{,}t)$]{};

\draw[<->](0,-0.25)--++(7,0);
\draw(3.5,-0.25)
node[label=below:$\Delta Z$]{};

\end{circuitikz}
\end{document}
```

We have a voltage source $V(Z,t)$ that is a function of the length along the conductor (the $z$ axis).

There is some resistance ($R'$) and inductance ($L'$) per unit length, over some very small increment of length $\Delta Z$.

There is also some conductance ($G'$) and capacitance ($C'$), again, per unit length, over the length $\Delta Z$. 

We put these 4 parameters into a circuit as configured above. Remember the inductance and capacitance calculated per unit length. This is an equivalent circuit for differential length $dZ = \Delta Z$

##### Apply KVL:

$$V(Z,t) = R'\Delta Z \cdot i(Z,t) + L'\Delta Z\frac{d i(Z,t)}{d t}+ V(z + \Delta Z, t)$$
$$-\frac{[V(Z + \Delta Z ) - V(Z,t)]}{\Delta Z}$ = R'\cdot i(Z,t) + L'\frac{di(Z,t)}{dt}$$
As $\Delta Z \to 0$
$$\boxed{-\frac{dV(Z,t)}{dZ} = R'\cdot i(Z,t) + L'\frac{di(Z,t)}{dt}}\tag{4}$$
##### Apply KCL at point $A$
$$i(Z,t) - G'\Delta Z \cdot V(Z + \Delta Z, t) - C'\Delta Z\frac{dV(Z + \Delta Z, t)}{dt} - i(Z + \Delta Z,t) = 0$$

Collecting the 2 $i$ terms
$$-\frac{[i(Z + \Delta Z, t) - i(Z,t)]}{\Delta Z} = G'V(Z + \Delta Z, t) + C'\frac{dV(Z + \Delta Z, t)}{dt}$$
As $\Delta Z \to 0$
$$\boxed{\frac{di(Z,t)}{dZ} = G'\cdot V(Z,t) + C'\frac{dV(Z,t)}{dt}}\tag{5}$$
**Equations 5 and 6 are called the Telegraph Equations**

For Sinusoidal case:
$$V(Z,t) = \mathcal{R}e[V(Z)e^{j\omega t}]\tag{6}$$
$$i(Z,t) = \mathcal{R}e[I(Z)e^{j\omega t}]\tag{7}$$

Substituting $(6)$ and $(7)$ into $(4)$ and $(5)$
$$-\frac{dV}{dZ} = [R' + j\omega L']I(Z)\tag{8}$$
$$-\frac{dI}{dZ} = [G' + j\omega C']V(Z)\tag{9}$$



The wave equation for $V(z)$ (Voltage)
$$\frac{d^2V(Z)}{dZ^2} = [R'+j\omega L'][G'+j\omega C']V(z)$$
$$\boxed{\frac{d^2V(z)}{dZ^2 } =  \gamma^2V(z)}$$
Where:
$$\gamma = \sqrt{(R' + j\omega L')(G'+j\omega C')} = \text{complex propagation constant}$$
$$\alpha = \mathcal{R}e[\gamma] = \text{attenuation constant}$$
$$\beta = \mathcal{I}m[\gamma] = \text{phase constant}$$
$$\gamma = \alpha + j\beta$$
We can also eliminate $V(Z)$ to get a current wave equation:
$$\boxed{\frac{d^2I(Z)}{dZ^2} = \gamma^2I(Z)}$$

The wave equations have solutions:
$$V(Z) = V_0^+e^{-\gamma Z} + V_0^-e^{\gamma Z}$$
$$I(Z) = I_0^+e^{-\gamma Z} + I_0^-e^{+\gamma Z}$$
In general, $V_0^+$ and $V_0^-$ will have some magnitude and phase
$$V_0^+ = |V_0^+|e^{j\phi+}$$
$$V_0^- = |V_0^-|e^{j\phi-}$$
Converting back to time domain:
$$V(Z,t) = \mathcal{R}e[V(Z)e^{j\omega t}]$$
Substituting:
$$V(Z,t) = \mathcal{R}e[V_0^+e^{-\gamma Z}e^{j\omega t}] + \mathcal{R}e[V_0^-e^{+\gamma Z}e^{j\omega t}]$$
Inserting the magnitude and phase:
$$V(Z,t) = |V_0^+|\ \mathcal{R}e[e^{j\phi +}e^{-(alpha + j\beta) Z}e^{j\omega t}] + |V_0^-|\ \mathcal{R}e[e^{j\phi -}e^{(\alpha + j\beta) Z}e^{j\omega t}]$$
$$V(Z,t) =|V_0^+|e^{-\alpha Z}\cos[\omega t - \beta Z + \phi^+] + |V_0^-|e^{\alpha Z}\cos[\omega t + \beta Z + \phi^-]$$

## Class 18
$$V(Z,t) =|V_0^+|e^{-\alpha Z}\cos[\omega t - \beta Z + \phi^+] + |V_0^-|e^{\alpha Z}\cos[\omega t + \beta Z + \phi^-]$$
$$\gamma = \sqrt{(R' + j\omega L')(G'+j\omega C')}$$
$${\frac{d^2I(Z)}{dZ^2} - \gamma^2I(Z) = 0}$$
$${\frac{d^2V(z)}{dZ^2 }-  \gamma^2V(z) = 0}$$
$$V(Z) = V_0^+e^{-\gamma Z} + V_0^-e^{\gamma Z}$$
$$I(Z) = I_0^+e^{-\gamma Z} + I_0^-e^{+\gamma Z}$$
The above equations from last lecture are trying to get at the fact that if you have a sinusoidal voltage and a long transmission line such as a coaxial cable, what happens to the voltage.

Using the circuit model, we can produce the wave equations above.

Where $\beta = \frac{2\pi}{\lambda}$ 
Looking at just one section of the above $V(Z,t)$ function with $\phi^+ = 0$ and $\alpha = 0$:
$$V_+(Z,t) =\cos(\omega t -\beta Z) = \cos\left(\frac{2\pi t}{T} - \frac{2\pi Z}{\lambda}\right)$$
##### At $t = 0$ 
$$V_+(Z,0) = \cos\left(\frac{-2\pi}{\lambda}Z\right)$$
```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
  \begin{axis}[
    width=12cm,
    height=6cm,
    xlabel={$x$},
    ylabel={$\cos(2\pi x/\lambda)$},
    xmin=0, xmax=1,
    ymin=-1.3, ymax=1.3,
    xtick={0, 0.25, 0.5, 0.75, 1.0},
    xticklabels={
      $0$,
      $\lambda/4$,
      $\lambda/2$,
      $3\lambda/4$,
      $\lambda$
    },
    ytick={-1, 0, 1},
    axis lines=center,
    tick align=outside,
    tick label style={font=\small},
    x label style={at={(axis description cs:1.02,0.5)}, anchor=west},
    y label style={at={(axis description cs:-0.05,1.02)}, anchor=south},
    grid=major,
    grid style={dashed, gray!30},
    samples=200,
    domain=0:1,
  ]
    \addplot[blue, thick] {cos(deg(2*pi*x))};
  \end{axis}

\end{tikzpicture}
\end{document}
```
##### At $t=\frac{T}{4}$ 
$$V_+\left(Z, \frac{T}{4}\right) = \cos\left(\frac{\pi}{2} - \frac{2\pi Z}{\lambda}\right)$$
If $z = \frac{\lambda}{4}$, we get $\cos(1)$
```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
  \begin{axis}[
    width=12cm,
    height=6cm,
    xlabel={$x$},
    ylabel={$\cos(\pi/2 - 2\pi x/\lambda)$},
    xmin=0, xmax=1,
    ymin=-1.3, ymax=1.3,
    xtick={0, 0.25, 0.5, 0.75, 1.0},
    xticklabels={
      $0$,
      $\lambda/4$,
      $\lambda/2$,
      $3\lambda/4$,
      $\lambda$
    },
    ytick={-1, 0, 1},
    axis lines=center,
    tick align=outside,
    tick label style={font=\small},
    x label style={at={(axis description cs:1.02,0.5)}, anchor=west},
    y label style={at={(axis description cs:-0.05,1.02)}, anchor=south},
    grid=major,
    grid style={dashed, gray!30},
    samples=200,
    domain=0:1,
  ]
    \addplot[blue, thick] {cos(deg(2*pi*x - pi/2))};
  \end{axis}
\end{tikzpicture}

\end{document}
```
##### At $t = \frac{T}{2}$ 
$$V_+\left(Z, \frac{T}{2}\right) = \cos\left(\pi - \frac{2\pi Z}{\lambda}\right)$$
```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
  \begin{axis}[
    width=12cm,
    height=6cm,
    xlabel={$x$},
    ylabel={$\cos(\pi - 2\pi x/\lambda)$},
    xmin=0, xmax=1,
    ymin=-1.3, ymax=1.3,
    xtick={0, 0.25, 0.5, 0.75, 1.0},
    xticklabels={
      $0$,
      $\lambda/4$,
      $\lambda/2$,
      $3\lambda/4$,
      $\lambda$
    },
    ytick={-1, 0, 1},
    axis lines=center,
    tick align=outside,
    tick label style={font=\small},
    x label style={at={(axis description cs:1.02,0.5)}, anchor=west},
    y label style={at={(axis description cs:-0.05,1.02)}, anchor=south},
    grid=major,
    grid style={dashed, gray!30},
    samples=200,
    domain=0:1,
  ]
    \addplot[blue, thick] {cos(deg(pi - 2*pi*x))};
  \end{axis}
\end{tikzpicture}
\end{document}
```
We can see the maximum point moves to the right.

$$V_+ = |V_0^+|\cos(\omega t - \beta Z)\Longrightarrow \phi_{\text{phase}} =  \arccos\left(\frac{V_+(Z,t)}{|V_0^+|}\right) = \omega t-\beta Z = \text{constant}$$

We want to keep the phase constant, so $Z$ has to keep moving, this results in the wave moving to the right.

Therefore, there is a velocity associated with the movement of this peak point. We can find this velocity by taking the derivative of the phase.


$$\frac{d\phi_{\text{phase}}}{dt} = \omega - B\frac{dZ}{dt} = 0$$
Rearrange:
$$\frac{dZ}{dt} = \frac{\omega}{B} = \frac{2\pi f}{2\pi/\lambda} = \lambda f$$
$$V_P = \lambda f = \text{velocity of wave propegation}$$
Recall though, there are 2 parts of the original $V(Z,t)$ equation, they create traveling waves in the positive (shown above) and negative (not shown in detail here, but opposite) directions, both decaying.

The presence of the two waves of the same frequency creates a standing wave, as their max amplitude points intersect and sum constructively, then pass out of phase destructively. 
#### 5.2 Characteristic Impedance
How does the voltage and current relate with regard to the amplitude?
Recall:
$$\frac{dV(Z)}{dZ} = -[R' + j\omega L']I(Z)$$
$$V(Z) = V_0^+e^{-\gamma Z} + V_0^-e^{\gamma Z}$$
Combining these
$$+\gamma[-V_0^+e^{-\gamma Z} + V_0^-e^{\gamma Z} = -[R'+j\omega L']I(Z)$$
$$I(Z) = \left(\frac{\gamma}{R' + j\omega L'}\right)(V_0^+e^{-\gamma Z} - V_0^-e^{\gamma Z})$$
$$I(Z) = \left[\frac{\gamma V_0^+}{R' + j\omega L'}\right]e^{-\gamma Z} -\left[\frac{\gamma V_0^-}{R' + j\omega L'}\right]e^{\gamma Z}$$
Comparing with:
$$I(Z) = I_0^+e^{-\gamma Z} + I_0^-e^{+\gamma Z}$$
$$I_0^+ = \left(\frac{\gamma}{R'+j\omega L'}\right)V_0^+$$
$$I_0^+ = \left(\frac{-\gamma}{R'+j\omega L'}\right)V_0^-$$
Rearranging:
$$\frac{V_0^+}{I_0^+} = \frac{R' + j\omega L'}{\gamma} = Z_0$$
Recall $\gamma$ is the complex propagation term:
$$\gamma = \sqrt{(R' + j\omega L')(G'+j\omega C')} $$
$$Z_0 = \sqrt{\frac{R' + j\omega L'}{G' + j\omega C'}}$$
This is the relationship between the voltage and the current magnitudes, called the characteristic impedance of the line.

$$-\frac{V_0^-}{I_0^-} = Z_0$$
If this were made lossless, $R'$ and $G'$ would be 0, significantly simplifying the $Z_0$ expression.

#### 5.3 Lossless Transmission Lines
If $R' = G' = 0$, the lines is lossless.
$$Z_0 = \sqrt{\frac{L'}{C'}}$$
$$\gamma = \sqrt{j\omega L'\ j\omega C'} = j\omega \sqrt{L'C'} = \alpha + j\beta$$
For Lossless:
$$\alpha = \mathcal{R}e[\gamma] = 0$$
$$\beta = \mathcal{I}m[\gamma] = \omega \sqrt{L'C'}$$
Since $\lambda = \frac{2\pi}{\beta}$, lossless wavelength:
$$\lambda_{ll} = \frac{2\pi}{\omega \sqrt{L'C'}}$$
Phase velocity:
$$V_P = \lambda f$$
Lossless phase velocity is a function of inductance per unit length and capacitance per unit length:
$$V_{P_{ll}} = \frac{1}{\sqrt{L'C'}}$$

#### 5.4 Voltage Reflection
If we consider the transmission line circuit, 
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

\draw(0,0)
to[sV, l=$V_g$]++(0,2)
to[generic, l=$Z_g$, i>_=$I_i$]++(2,0)
node[ocirc]{}
coordinate(ONE)
--++(3,0)
node[ocirc]{}
coordinate(TWO)
to[short, i>_=$I_L$]++(1,0)
to[generic, l=$Z_L$]++(0,-2)
--++(-1,0)
node[ocirc, label=below:$Z{=}0$]{}
coordinate(THREE)
--++(-3,0)
node[ocirc, label=below:$Z{=}l$]{}
coordinate(FOUR)
--++(-2,0);

\draw[<->](ONE)
++(0,-0.1)
--++(0,-1.8);
\draw(FOUR)
++(0,1)
node[label=left:$V_i$]{};

\draw[<->](TWO)
++(0,-0.1)
--++(0,-1.8);
\draw(THREE)
++(0,1)
node[label=right:$V_L$]{};




\end{circuitikz}
\end{document}
```
For the case for lossless, $\alpha = 0$ and $\gamma = j\beta$
From 
$$V(Z) = V_0^+e^{-\gamma Z} + V_0^-e^{\gamma Z}$$
$$I(Z) = I_0^+e^{-\gamma Z} + I_0^-e^{+\gamma Z}$$
The following can be said:
$$V(Z) = V_0^+e^{-j\beta Z} + V_0^-e^{j\beta Z}$$
$$I(Z) = I_0^+e^{-j\beta Z} + I_0^-e^{j\beta Z}$$
Recall:
$$I_0^+ = \frac{V_0^+}{Z_0}$$
$$I_0^- = -\frac{V_0^-}{Z_0}$$

$$I(Z) = \left(\frac{V_0^+}{Z_0}\right)e^{-j\beta Z} - \left(\frac{V_0^-}{Z_0}\right)e^{j\beta Z}$$
At $z=0$
$$I(0) = \left(\frac{V_0^+}{Z_0}\right) - \left(\frac{V_0^-}{Z_0}\right) = I_L$$
$$V(0) = V_0^+ + V_0^- = V_L$$
From the circuit, we can see:
$$Z_L = \frac{V_L}{I_L}$$
$$Z_L = \frac{V_0^+ + V_0^-}{V_0^+ - V_0^-}Z_0$$
Remember $Z_0$ is the characteristic impedance resulting from $C'$ and $L'$, and $Z_L$ is the impedance of the load.

$$V_0^- = \left[\frac{Z_L - Z_0}{Z_L + Z_0}\right]V_0^+$$
$V_0^+$ is associated with the incident voltage.
$V_0^-$ is associated with the reflected voltage.

$$\Gamma = \frac{V_0^-}{V_0^+} = \text{voltage reflection coefficient (at the load)}$$ $$\Gamma = \frac{Z_L-Z_0}{Z_L + Z_0}$$
if $Z_L = Z_0$ the reflection coefficient will be $0$.

If not lossless, generally $Z_L$ has some resistance and inductance term, meaning the terms are complex, as will $\Gamma$.
$$\Gamma = |\Gamma|e^{j\theta_r}$$
Where $\theta_r$ is a phase and $|\Gamma|$ is a magnitude. Note: $\Gamma \leq 1$ 

1. A load $Z_L$ is matched if $Z_L = Z_0$, there is no reflection by load.

2. If $Z_L \to \infty$ (open circuit), $\Gamma = 1$, $V_0^- = V_0^+$, $V_0^- = \Gamma V_0^+$

3. If it is short circuit,  $Z_L = 0$; $\Gamma = -1, V_0^- = V_0^+$
