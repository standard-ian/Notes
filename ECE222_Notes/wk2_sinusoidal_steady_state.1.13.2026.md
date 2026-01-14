## Class 3

#### Recall from Week 1
The following circuit, with a $120sin(377t)$ also known as a ($60Hz$) source 
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[sV, label=$120sin(377t)$]++(0,2)
	to[switch]++(1,0)
	to[R=$3\Omega$]++(1,0)
	to[inductor, l=$0.1H$]++(0,-2)--(0,0);
\end{circuitikz}
\end{document}
```
At $t = 0$ when the switch closes, the current is $0A$. The circuit responds to the voltage source with a total response in terms of current. 
$$i(t) = 3.128e^{-50t} + 3.16cos(377t-172.5^\circ)A$$
Since the time constant in an $RL$ circuit is $\frac{L}{R}$ when there is a $\tau$ that makes $e^{-1}$. In the above example $t = \tau$ at $0.02s$. 
After the transient dies out, which is very much the case by $0.1s$ (5 time constants), the transient behavior dies out, and the circuit is in the steady state.
$$i_{ss}(t) = 3.16cos(377t-172.5^\circ)A$$
The source is $v_s(t) = 120cos(377t - 90^\circ) = 120sin(377t) V = 120V @ 60Hz$ We notice that the source voltage and the current have phase difference of $82.5^\circ$, with the current lags behind the voltage. This is because of the inductor. Inductance resists the change in current, observed by it's $i-v$ relationship: $V_{L} = L\frac{di_{L}}{dt}$

The voltage in the components is determined by the properties of the components themselves.

Knowing the steady-state current, the steady-state voltages of the resistor and inductor can be derived:
$$V_R(t) = 15.78cos(377t - 172.5^\circ) V$$
$$V_L(t) = 119.1cos(377t - 82.5^\circ)V$$
By $KVL$:
$$v_{s}(t) = v_{R}(t) + v_{L} (t)$$
That is:
$$120sin(377t) = 120cos(377t - 90^\circ) = 15.78cos(377t - 172.5^\circ) + 119.1cos(377t - 82.5^\circ) V$$ 
Using chain rule to differentiate:
$$\frac{d}{dt} cos(wt + \phi) = -w\ sin(wt + \phi)$$
So, to find the voltage through the inductor, we can take:
$$\frac{d}{dt}3.16cos(377t - 172.5^\circ) = -\frac{377}{3.16}sin(377t + 172.5^\circ) = -119.1sin(377t - 172.5^\circ ) = -119.1 cos(377t - 172.5^\circ - 90^\circ) = -119.1cos(377t - 262.5^\circ)$$
We can confirm the voltages of the components sum to the source using the identities:
$cos(\alpha + \beta) = cos\alpha cos\beta - sin\alpha sin\beta$
$cos(\alpha - \beta) = cos\alpha cos\beta+sin\alpha sin\beta$
$sin(\alpha + \beta) = sin\alpha cos\beta + cos\alpha sin\beta$
$sin(\alpha - \beta) = sin\alpha cos\beta - cos\alpha sin\beta$

$$15.78cos(377t - 172.5^\circ) = 15.78[cos(377t)cos(172.5^\circ) + sin(377t) sin(172.5^\circ)] = 15.78[-0.9914cos(377t) + 0.1305sin(377t)]$$
$$119.1cos(377t - 82.5^\circ) = 119.1[cos(377t)cos(82.5^\circ) + sin(377t) sin(82.5^\circ)] = 119.1[0.1305cos(377t) + 0.9914sin(377t)]$$
$$119.1(0.1305cos(377t)) + 119.1(sin0.9914(377t)) + 15.78(-0.9914cos(377t)) + 15.78(0.1305sin(377t)) = 120.14sin(377t) - 0.102cos(377t)$$

We can complete this using the identity:
$$A\ sin(\omega t) + B\ cos(\omega t) = R \sin(\omega t + \phi)$$
Where $R = \sqrt{A^2 + B^2}$ and $\phi = arctan(\frac{B}{A})$

$$R = \sqrt{120.14^2 +  (-0.102)^2} = \sqrt{14433.61} = 120.14$$
$$\phi = arctan(\frac{-0.102}{120.14}) = -0.048^\circ$$
Resulting in, where the $0.048^\circ$ is basically negligible:
$$120.14sin(377t-0.048^\circ)\approx 120sin(377t)$$
