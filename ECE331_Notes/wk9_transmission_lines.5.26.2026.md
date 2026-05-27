## Class 17
#### 4.2 Inductance (9.4 Ida)
Given a magnetic flux $\Phi_B$, self inductance is defined as
$$L_{11}  = \frac{\Phi_B}{I}\ [H]$$
It is only a function of geometry and material properties (when linear) ($I$) is divided out of the flux in the numerator.

For wire 1 of length $l$ the self inductance is 
$$L_{11} = \frac{l\mu}{2\pi}ln\left(\frac{b}{a}\right)\ [H]$$
Inductance per unit length $L'$ is in units of Henries/meter
$$L' = \frac{L_{11}}{l} = \frac{\mu}{2\pi}ln\left(\frac{b}{a}\right)$$
#### 5.0 Transmission Lines
![[Pasted image 20260526204718.png]]
The wave equation for $V(z)$ (Voltage)
$$\frac{d^2V}{dz^2} = [R'+j\omega L'][G'+j\omega C']V(z) = \gamma^2V(z)$$
Where:
$$\gamma = \sqrt{(R' + j\omega L')(C"+j\omega C')} = \text{complex propegation constant}$$
$$\alpha = \mathcal{R}e[\gamma] = \text{attenuation constant}$$
$$\beta = \mathcal{I}m[\gamma] = \text{phase constant}$$
$$\gamma = \alpha + j\beta$$
We can also eliminate $V(z)$ to get:
$$\frac{d^2I(z)}{dz^2} = \gamma^2I$$

The wave equations have solutions:
$$V(z) = V_0^+e^{-\gamma z} + V_0^-e^{_\gamma z}$$
$$I(z) = I_0^+e^{-\gamma z} + I_0^-e^{+\gamma z}$$
In general, $V_0^+$ and $V_0^-$ will have some magnitude and phase
$$V_0^+ = |V_0^+|e^{j\phi+}$$
$$V_0^- = |V_0^-|e^{j\phi-}$$
Converting back to time domain:
$$V(z,t) = \mathcal{R}e[V(z)e^{j\omega t}]$$
Substituting:
$$V(z,t) = \mathcal{R}e[V_0^+e^{-\gamma z}e^{j\omega t}] + \mathcal{R}e[V_0^-e^{+\gamma z}e^{j\omega t}]$$
Inserting the magnitude and phase:
$$V(z,t) = |V_0^+|\ \mathcal{R}e[e^{j\phi +}e^{-(alpha + j\beta) z}e^{j\omega t}] + |V_0^-|\ \mathcal{R}e[e^{j\phi -}e^{(\alpha + j\beta) z}e^{j\omega t}]$$
$$=|V_0^+|e^{-\alpha z}\cos[\omega t - \beta z + \phi^+] + |V_0^-|e^{\alpha z}\cos[\omega t + \beta z + \phi^+]$$

## Class 18