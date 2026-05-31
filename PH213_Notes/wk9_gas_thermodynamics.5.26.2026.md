## Class 17
Adiabatic: No heat flow
#### Work and the $PV$ Diagram for Gas
$$W = \int P\ dV = \int_{V_{initial}}^{V_{final}}P\ dV = nRT\int\frac{dv}{v} = nRT\ \ln\left(\frac{V_f}{V_i}\right)$$
Gas confined in a thermally insulated cylinder. If the piston moves to the right by a distance $dx$, the volume of the gas is reduced by:
$$dV = A\ dx$$
$$\text{Work} = PA\ dx = PdV \text{ (if } P \text { is constant during volume change)} $$
Negative work is done when volume decreases. If volume doesn't change, no work is done. 

$$\Delta E_{int} = nC_V\Delta T$$
##### Ideal Gas at Constant Volume
$$C_V = \frac{dE_{int}}{dT} = \frac{3}{2}R$$
##### Ideal Gas at Constant Pressure
$$C_P = C_V + R=\frac{5}{2}R$$

#### Adiabatic Transition of Gas
![[Pasted image 20260526121455.png]]
Gamma ($\gamma$) is the ratio of molar specific heats for the gas.
$$\gamma = \frac{C_P}{C_V}$$
$$PV^\gamma = \text{constant}$$
The point is:
$$P_iV_i^\gamma = P_fV_f^\gamma$$
For adiabatic:
1. Perfect insulation
2. Slow, reversible transition

Path 1: $Q = nC_p\Delta T$, $W = P\Delta V$ isobaric
Path 2: $Q = W = nRTln(V_f/V_i)$, $\Delta E = 0$ isothermal 
Path 3: $Q = 0$, $W = \Delta E$ adiabatic
Path 4: $Q = \Delta E = nC_v\Delta T$, $W =0$ iochoric

![[Pasted image 20260526123211.png]]
## Class 18
#### Adiabatic Transition Example
$P_i = 1atm$
$V_i = 40L$
$V_f = 20L$
$\gamma =1.67$
$$PV^\gamma =\text{const}$$
$$P_1V_1^\gamma = P_2V_2^\gamma$$
$$\gamma = \frac{C_P}{C_V} = \frac{\frac{5R}{2}}{\frac{3R}{2}} = 1.67$$
$$P_f = \frac{P_i\times 40^{1.67}}{20^{1.67}} = 3.2atm$$
$$T = \frac{PV}{nR}$$
$$T_i =\frac{40L \times 1atm}{1\times 0.082\frac{L\times atm}{mol \times K} } = 488K$$
$$T_f = \frac{20L \times 3.2atm}{1\times 0082\frac{L\times atm}{mol\times K}}= 780K$$
$$\Delta T = 780K - 488K = 292K$$

#### Carnot Engine and Second Law of Thermodynamics

"No series of processes is possible whose sole result is the transfer of energy as head from a thermal reservoir and a complete conversion of this energy to work"

First Law: Energy of a thermal reservoir cannot be created or destroyed, only converted to another form

Second Law: All energy cannot do useful work, some goes to entropy.


