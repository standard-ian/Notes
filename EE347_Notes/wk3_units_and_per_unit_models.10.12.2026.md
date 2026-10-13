# Class 5
## Per Unit
Useful to represent in a way that does not require units.

Per unit saves on computation in simulation scenarios. Transformers are represented in more general terms. 
This is helpful because there are **a lot** of transformers in the grid.

![[Pasted image 20261012111034.png]] ### In Per Unit, Represent S, V, I, Z Assuming a $246kV/80MWV$ (generation), $138kV$ (transmission), $52kV$ (subtransmission), 12.47kV (distribution), $120/240V$(residential)/$120V/208$(commercial)/$277/480V$ or $347/600V$(industrial) system. 1. Normalize using base values 1. Always pick a system wide base for apparent power.  1. In this case we'll use $System_{base} = 100MVA$ 1. $S_{gen} = 50MVA$ (arbitrary choice) 1. $S_{gen, p.u.} = \frac{50MVA}{100MVA} = 0.5pu VA$ 1. There are different regions in the system, they divided right through the middle of the transformers. Always pick one voltage from one region. 1. From $S_{base, sys}$ and $V_{base}$, for a $3\phi$ system: 1. $$I_{base, 1} = \frac{S_{base, sys}}{\sqrt{3}V_{base, 1}} $$ 1. $$Z_{base, 1} = \frac{V^2_{base, 1}}{S_{base, sys}}$$
#### Example
Assume the following system:
Generation: $10kVA$, $480V$
Distribution: $j60\ohm, 20\ohm 4.2kV$ (not realistic, just to simplify the example)
Load: $208V, 7kVA, PF = 0.87 \text{ lag}$
 1. Pick a system base
	 1. $S_{base}{system} = 10kVA$
 2. Pick 1 regional voltage base
	 1. Select $V_{base, 3}  =208V$
 3. Determine the voltages in the other regions
	 1. $V_{base, 2} = 4.2kV$ and $V_{base. 1} = 480V$
	 2. The base from one region to another are related by the ratio of the transformer
 4. Determine the current and impedance bases if needed.
	 1. 

We can use intuition to see that these are common $3\phi$ voltages and can infer that without it being explicitly stated.

| Region | $S_{base, sys}$ | $V_{base, reg.}$ | $Z_{base, reg.}$                                                                 | $I{base, reg}$                                                                    |
| ------ | --------------- | ---------------- | -------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| 1      | 10kVA           | 480V             | Not needed                                                                       | Not needed                                                                        |
| 2      | 10kVA           | 4.2kV            | $\frac{V^2_{base, 2}}{S_{base, sys}} = \frac{(4.2kV)^2}{10kVA} \approx 1800\ohm$ | $\frac{S_{base, sys}}{\sqrt{3}V_{base, 2}} = \frac{10kVA}{\sqrt{3}(4.2kV)}=1.37A$ |
| 3      | 10kVa           | 208V             | Not needed                                                                       | Not needed<br>                                                                    |
We want to see the current in per unit in the distribution region $2$, and the power losses.  $\bar{I}_{L, pu}$ and Line Power Loss.
We can use the above table to create a circuit with no transformers

```tikz
\usepackage{circuitikz}
\begin{document}
	\begin{circuitikz}[american, scale=2, font=\Large]
		\draw(0,0)
		node[ocirc]{}
		to[vsource, V=$\bar{V}_{pu} {=}$]++(0,2)
		to[inductor]++(2,0)
		node[label=above:$\bar{Z}_{pu} {=} \frac{\bar{Z}_l}{Z_{base,2}} {=} \frac{20 + j60\Omega}{1800\Omega}\approx 0.011 + j0.033 pu\ \Omega$]{}
		to[R]++(2,0)
		to[short, i_=$\bar{I}_{L, pu} {=} \left(\frac{\bar{S}_{L, pu}}{\bar{V}_{L, pu}}\right)^* {=} \left(\frac{0.23\angle 30^\circ pu\ VA}{1.0\angle 0^\circ pu\ V}\right)^* {=} 0.23\angle -30^\circ pu\ A$]++(6,0)
		to[generic, a= $120V\angle 0^\circ {=} 1.0\angle 0^\circ pu\ V$, l=$\bar{S}_{s, pu} {=} \frac{\bar{S}_\phi}{\bar{S}_{base, sys}} {=} \frac{\frac{7}{3}kVA\angle30^\circ}{10kVA} \approx 0.23\angle 30^\circ pu\ VA$]++(0,-2)
		node[ocirc]{};
	\end{circuitikz}
\end{document}
```

$$\theta = \arccos(PF) = \arccos(0.87) \approx30^\circ$$
$$\bar{S}_{L} = 7kVA\angle 30^\circ\longrightarrow \bar{S}_\phi = \frac{7}{3}kVA\angle 30^\circ$$
Getting $\bar{V}_{L, pu}$
$$\bar{V}_{L, pu} = \frac{120V\angle 0^\circ}{V_{base, 3, \text{ per} \phi}} = \frac{120V\angle 0^\circ}{120V} = 1.0\angle 0^\circ pu\ V$$
Now, we can use $\bar{I}_{L, pu}$ to find $\bar{I}_{L}$:
$$\bar{I}_L = \bar{I}_{L, pu} \cdot I_{base, 2} = (0.23\angle -30^\circ)(1.37A) = 0.32\angle -30^\circ A$$
Now, to find the power loss in $pu$:
$$P_{loss, pu} = |\bar{I}_{L, pu}|^2R_{pu} = (0.23^2)0.011 = 5.8\times 10^{-4} pu\ W$$
This can now be used to find the actual power loss. This is for the entire $3\phi$ system because it is using the full $10kVA\ S_{base, sys}$
$$P_{loss} = P_{loss, pu} \cdot S_{base, sys} = (5.8\times 10^{-4}pu\ W)10kVA = 5.8W per line$$

The customer is expecting $208V$, this is represented as $1.0pu$ in region 3.
In the above diagram, since this is a single phase of the $3\phi$ system, the load is $120\angle 0^\circ$. 

#### Single Line Model
$S_{base, sys}$
$V_{base, 1}, V_{base, 2}, V_{base, 3}$

#### Transformer Nameplate
Metal plate on transformer with stamped values.
Example: 
$100MVA$
$13.8kV/2.4kV$
$1.2\%, 6\%$ impedance ($pu$)
This transformer has it's own $S_{base, N.P.}$ and $V_{base, N.P.}$ that can be used to create a $Z_{base, N.P.}$
This transformer will likely have a different base than the model.

Converting the $pu$ impedance into 
$\bar{Z}_{line, pu} = 0.011 + j0.06 pu\Omega$
$\bar{Z}_{line} = \bar{Z}_{line, pu} \cdot Z_{base, N.P.}$

$$Z_{base, N.P.} = \frac{V^2_{base, N.P.}}{S_{base, N.P.}} = \frac{(13.8kV)^2}{100kVA} = 1900\Omega$$
$$\bar{Z}_{line} = (0.012 + j0.06)(1900) = 23 + j114\Omega$$
This is the transformer model.
If this were to be put into a system model with:
$S_{base} =500kVA$ 
In a region with a base voltage:
$V_{base, reg} = 13.8kV$

So there is a difference between the xfmr's base and the nameplate base.

We want to move $\bar{Z}_{line}$ into this system. 

Start with the premise
$\bar{Z}_{actual} = \bar{Z}_{actual}$
$Z_{base, N.P.} \cdot \bar{Z}_{pu, N.P.} = Z_{base, reg}\cdot \bar{Z}_{pu, reg}$
$$\bar{Z}_{pu, reg} = \bar{Z}_{pu, N.P.}\frac{Z_{base, N.P.}}{Z_{base, reg}}$$
$$=\bar{Z}_{pu, N.P.}\left(\frac{V^2_{base, N.P.}}{S_{base, N.P.}}\right)\left(\frac{S_{base, reg}}{V^2_{base, reg}}\right) = (0.012 + j0.06)pu\ \Omega\left(\frac{(13.8kV)^2}{100kVA}\right)\left(\frac{500kVA}{(13.8kVA)^2}\right)$$
$$\bar{Z}_{pu, reg} = 0.06 + j0.3 pu\ \Omega$$
This may look like a gigantic impedance, but it's because it's "scaled" to the base system. 