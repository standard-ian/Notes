# Class 15
$$P = \frac{3V_RV_S \sin(\gamma)}{x}$$ $$Q = \frac{3V_R(V_S\cos(\gamma)- V_R}{x}$$
$\theta = \phi_V - \phi _Z$
$\theta = 0^\circ - \phi_z$
### Observations
1. Note on $V_S \approx V_R (\pm 5\%)$ - They aren't changing with respect to one another very much over varying loading
	$P \approx V^2$
	e.g. 500kV vs. 765kV
	$$\frac{765^2}{500^2} = 2.34$$
2. P is most sensitive to $\gamma$ 
	$\bar{V}_S = \bar{V}_R + jX\bar{I}$
	$V_S\angle \gamma = V_R \angle 0^|circ + IX \angle(90^\circ - \theta)$
	$P_{max} = \frac{3V_RV_S}{X} (\sin\gamma = \sin90^\circ)$
	
![[Pasted image 20261116205401.png|652]]
# Class 16
## Power Systems Modeling
![[Pasted image 20261118110910.png|824]]
#### Per Unit Model
1. Ignore all generators and loads
2. Sum all impedances between busses
	1. Transformers
	2. Lines
	3. For example, for between bus $1\to 2$, $\bar{Z}_{12} = \bar{Z}_{XFMR2} + \bar{Z}_{XFMR1} + \bar{Z}_{L1}$
3. Change impedances to admittances
	1. $\bar{Y}_{12} = \bar{Z}_{12}^{-1}$
4. Construct matrix $\bar{Y}_{BUS}$
![[Pasted image 20261118113601.png|654]]
##### KCL Bus 2
$$\bar{I}_2 = (\bar{V}_2 - \bar{V}_1)\bar{Y}_A + (\bar{V}_2 + \bar{V}_3)\bar{Y}_C$$
$$(-\bar{Y}_A)\bar{V}_1 + (\bar{Y}_A + \bar{Y}_C)\bar{V}_2 + (-\bar{Y}_C)\bar{V}_3 = \bar{I}_2$$
##### KCL Bus 3
$$\bar{I}_3 = (\bar{V}_3 - \bar{V}_2) \bar{Y}_C + (\bar{V_3} - \bar{V}_1)\bar{Y}_B$$
$$(-\bar{Y}_B)\bar{V}_1 + (-\bar{Y}_C)\bar{V}_2 + (\bar{Y}_B  + \bar{Y}_C)\bar{V}_3 = \bar{I}_3 $$

##### Bus 1
$$(\bar{Y}_A + \bar{Y}_B)\bar{V}_1 + (-\bar{Y}_A)\bar{V}_2 + (-\bar{Y}_B)\bar{V}_3 = \bar{I}_3$$

$$\begin{bmatrix}\bar{Y}_{11} & \bar{Y}_{12} & \bar{Y}_{13}\\ \bar{Y}_{21} & \bar{Y}_{22} & \bar{Y}_{23}\\ \bar{Y}_{31} & \bar{Y}_{32} & \bar{Y}_{33}\end{bmatrix} \begin{bmatrix}\bar{V}_1 \\ \bar{V}_2 \\ \bar{V}_3\end{bmatrix} = \begin{bmatrix}\bar{I}_1 \\\bar{I}_2 \\ \bar{I}_3\end{bmatrix}$$
$$\begin{bmatrix}\bar{Y}_A + \bar{Y}_B & -\bar{Y}_A & -\bar{Y}_B\\ -\bar{Y}_A & \bar{Y}_A + \bar{Y}_C & -\bar{Y}_C \\ -\bar{Y}_B & -\bar{Y}_C & \bar{Y}_B + \bar{Y}_C\end{bmatrix} \begin{bmatrix}\bar{V}_1 \\ \bar{V}_2 \\ \bar{V}_3\end{bmatrix} = \begin{bmatrix}\bar{I}_1 \\\bar{I}_2 \\ \bar{I}_3\end{bmatrix}$$
1. **Off Diagonals**:  $y_{ij} =$ negative of the sum of the admittances between bus $i$ and bus $j$
	1. $\bar{Y}_{13} = -\bar{Y}_B$
2. **Diagonals**: $y_{ii} =$ sum of the admittances that connect to bus i
	1. $\bar{Y}_{33} = \bar{Y}_B + \bar{Y}_C$


#### Another Example
![[Pasted image 20261118114225.png|766]]
This creates a 5x5 matrix
$$\begin{bmatrix}\bar{Y}_A & -\bar{Y}_A & 0 & 0 & 0 \\ -\bar{Y}_A & \bar{Y}_A + \bar{Y}_B + \bar{Y}_C & -\bar{Y}_C& -\bar{Y}_B & 0  \\ 0 & -\bar{Y}_C & \bar{Y}_C & 0 & 0   \\0 &  -\bar{Y}_B &  0 & \bar{Y}_B + \bar{Y}_D & -\bar{Y}_D\\ 0 & 0 & 0 & -\bar{Y}_D & \bar{Y}_D \end{bmatrix}$$

If a new path, $\textcolor{red}{\bar{Y}_E}$ is added between bus **1** and **2**, it will only touch those two busses, and so only row 1,2 in columns 1,2 will be affected
$$\begin{bmatrix}\bar{Y}_A \textcolor{red}{+ \bar{Y}_E} & -\bar{Y}_A  \textcolor{red}{-\bar{Y}_E} & 0 & 0 & 0 \\ -\bar{Y}_A  \textcolor{red}{-\bar{Y}_E}& \bar{Y}_A + \bar{Y}_B + \bar{Y}_C \textcolor{red}{+ \bar{Y}_E}& -\bar{Y}_C& -\bar{Y}_B & 0  \\ 0 & -\bar{Y}_C & \bar{Y}_C & 0 & 0   \\0 &  -\bar{Y}_B &  0 & \bar{Y}_B + \bar{Y}_D & -\bar{Y}_D\\ 0 & 0 & 0 & -\bar{Y}_D & \bar{Y}_D \end{bmatrix}$$

If another new path is added $\textcolor{green}{\bar{Y}_F}$  and another bus, **6** is added, it adds a new row, and affects only the columns the new bus touches
$$\begin{bmatrix}\bar{Y}_A \textcolor{red}{+ \bar{Y}_E} & -\bar{Y}_A  \textcolor{red}{-\bar{Y}_E} & 0 & 0 & 0 & \textcolor{green}{0} \\ -\bar{Y}_A  \textcolor{red}{-\bar{Y}_E}& \bar{Y}_A + \bar{Y}_B + \bar{Y}_C \textcolor{red}{+ \bar{Y}_E}& -\bar{Y}_C& -\bar{Y}_B & 0 & \textcolor{green}{0}\\ 0 & -\bar{Y}_C & \bar{Y}_C & 0 & 0 &  \textcolor{green}{0}   \\0 &  -\bar{Y}_B &  0 & \bar{Y}_B + \bar{Y}_D & -\bar{Y}_D &  \textcolor{green}{0}\\ 0 & 0 & 0 & -\bar{Y}_D & \bar{Y}_D &  \textcolor{green}{-\bar{Y}_F}\\ \textcolor{green}{0} & \textcolor{green}{0} & \textcolor{green}{0} & \textcolor{green}{0} &  \textcolor{green}{-\bar{Y}_F} & \textcolor{green}{\bar{Y}_F} \end{bmatrix}$$

#### Per Unit Representation
$$S_{BASE} = 40MVA$$
$$\bar{Z}_L = 10 + j50$$
![[Pasted image 20261118115717.png|784]]
Transformers:
13.8kV/138kV
20MVA
2%, 10%

We always pick the high side as the base, so 2% and 10% are in reference to 138kV
$$V_{BASE, XFMR} = 139kV$$
$$S_{BASE, XFMR} = 20MVA$$
Everything is in the $138kV$ zone.

Using the nameplate impedances $2\%, 10\%$:
$$\bar{Z}_{T, pu} = \bar{Z}_{T, pu, XFMR}\left(\frac{V_{BASE, XFMR}^2}{S_{BASE, XFMR}}\right) \left(\frac{S_{BASE, SYS}}{V_{BASE, SYS}^2}\right) $$
$$\bar{Z}_{T, pu} = (0.02 + j0.1)\left(\frac{\cancel{138kV^2}}{20MVA}\right) \left(\frac{40MVA}{\cancel{138kV^2}}\right)  = 0.04 + j0.2 \ohm$$

To find the impedance of the line, $\bar{Z}_L$, we need $Z_{BASE, REGION\ 1}$. Note that this is a scalar, 
$$\bar{Z}_{L1,pu} = \frac{\bar{Z}_L}{Z_{BASE, REGION\ 1}} $$
$$Z_{BASE, REGION\ 1} = \frac{V_{BASE, REGION\ 1}^2}{S_{BASE, SYS}} = \frac{(138kV)^2}{40MVA} = 480\Omega$$
$$\bar{Z}_{L1,pu} = \frac{10 + j50\ohm}{480\ohm}  = 0.02 + j0.1\ohm$$

Therefore
$$\bar{Z}_{A}  = 2(0.04 + j0.2) + 0.02 + j0.1 = 0.1 + j0.5\ pu$$
$$\bar{Y}_A = \bar{Z}_A^{-1} \approx 0.385 - j1.92$$

This is what Power World is doing behind the scenes.

## Bus Types
### Generator Bus also known as "PV Bus" or "Gen Bus"
$P$ and $|\bar{V}|$ are known.
### Load Bus
There are 3 varieties, these are often called "Z.I.P." loads and are sometimes modeled as "tunable" combined loads
1. PQ Load Bus - motor load **This will be the primary focus**
	1. $P_L$ and $Q_L$ are known, from a load forecast at a particular time
2. Z Load Bus - Toaster or inductive heating element
	1. $Z\angle \theta$ are known
3. I Load Bus - battery/EV charger
	1. $I\angle (\phi_V - \phi _I)$ are known
### Slack Bus
Generators running on the grid are bidding into specified timesteps with a forecasted load. This results in a schedule of generation.
A slack generator acts on a single system to provide slack for the difference from the schedule if load/generation differs from forecasted.

Phase angle of slack bus is $0^\circ$ is known $\delta_i$ 
$|\bar{V}|$  is known $V_i$ 

The slack generator doesn't know $P$ and $Q$.

#### Example

![[Pasted image 20261118113601.png|654]]

Assuming the current entering from the left at bus 1 is from the slack generator
Bus 2 and 3 are PQ loads

At Bus $i$, have an injected current $\bar{I}$, $P_i$ and $Q_i$ are known.

$$\bar{I}_i = \left(\frac{\bar{S}_i}{\bar{V}_i}\right)^* = \frac{P_i - jQ_i}{\bar{V}_i^*}$$

Recall the indexed $\bar{Y}$ matrix...
$$\begin{bmatrix}\bar{Y}_{11} & \bar{Y}_{12} & \bar{Y}_{13}\\ \bar{Y}_{21} & \bar{Y}_{22} & \bar{Y}_{23}\\ \bar{Y}_{31} & \bar{Y}_{32} & \bar{Y}_{33}\end{bmatrix} \begin{bmatrix}\bar{V}_1 \\ \bar{V}_2 \\ \bar{V}_3\end{bmatrix} = \begin{bmatrix}\bar{I}_1 \\\bar{I}_2 \\ \bar{I}_3\end{bmatrix}$$

The top row gives:
$$\bar{I}_1  = \bar{Y}_{11}\bar{V}_1 + \bar{Y}_{12} \bar{V}_2 + \bar{Y}_{13}\bar{V}_3 = \frac{P_1 - jQ_1}{\bar{V}_1^*}$$
$$\bar{V_1} = \frac{1}{\bar{Y}_{11}}\left[\frac{P_1 - jQ_1}{\textcolor{red}{\bar{V}_1^*}} - \bar{Y}_{12}\bar{V}_2 - \bar{Y}_{13}\bar{V}_3\right]$$
In red is the issue. We don't know $\bar{V}_1$ but it's required to find $\bar{V}_1$
We'll do the Gauss-Siedel method by guessing $\bar{V}_{1, 2,3}$ as $1\angle 0^\circ$
We'll compare the results for $\bar{V}_1$,  and iterate until convergence.
$$\bar{V}_{1, NEW} = \frac{1}{\bar{Y}_{11}}\left[\frac{P_1 - jQ_1}{\bar{V}_{1, OLD}^*} - \bar{Y}_{12}\bar{V}_{2, OLD} - \bar{Y}_{13}\bar{V}_{3, OLD}\right]$$
Repeat for ~50 iterations and stop when diminishing returns are noticed. Not actually solving, just approximating.


