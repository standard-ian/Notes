## Class 11

#### Voltage Divider Review
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$V_{DC}$]{}
	to[R=$R_1$]++(2,0)
	to[R=$R_2$]++(0,-2)
	node[ground, scale=2]{}++(0,2)--++(1,0)
	node[ocirc, label=right:$V_{out}$]{};
\end{circuitikz}
\end{document}
```
If $R_2$ is significantly larger than $R_1$ ($R_2>>R_1$), then $V_{out}\approx V_{DC}$ .
If $R$ are equal, $V_{out}$ is half of $V_{DC}$.
#### Dividers With an RC Circuit
If the circuit instead was an RC circuit...

##### Low Pass Filter

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$V_{i}$]{}
	to[R=$R$]++(2,0)
	to[capacitor, l=$C$]++(0,-2)
	node[ground, scale=2]{}++(0,2)--++(1,0)
	node[ocirc, label=right:$V_{out}$]{};
\end{circuitikz}
\end{document}
```
###### If $V_i$ is DC
It takes time for the charge at $C$ to build (transient), then at steady state, the potential at $V_{out}$ will be the same as $V_i$.

###### If $V_i$ is AC
The input will be a sinusoid, with a frequency of $\omega$, the impedance of $C$ will be $Z_C=\frac{-j}{\omega C}$.

Impedance meaning how much it impedes the current!
$$\tilde{V} = Z\cdot \tilde{I}$$
Even though there is a complex number part, we can still talk about large and small impedance.

When the frequency is small, the impedance of $C$ will be large. When the impedance of the divider component **after** $V_{out}$ is **high**, the output voltage will be very similar to $V_i$. However, the current will be lower and lower because of the high impedance. 

**Because of this, this is called a Low Pass Filter**

Always consider voltage and current.

##### High Pass Filter
If, we switch the components 

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$V_{i}$]{}
	to[capacitor, l=$C$]++(2,0)
	to[R=$R$]++(0,-2)
	node[ground, scale=2]{}++(0,2)--++(1,0)
	node[ocirc, label=right:$V_{out}$]{};
\end{circuitikz}
\end{document}
```
###### If $V_i$ is DC
$C$ takes a while to charge, and once it does, it's going to essentially "eat up" all the current getting through it, and $V_{out}$ will approach 0
###### If $V_i$ is AC
If the input is AC, $\tilde{V}_{out}\to\tilde{V}_i$ as $C$ charges. The impedance of $C$ becomes significantly large when the frequency is small, and this small $\omega$ $V_i$ is attenuated and **doesn't** make it through to $V_{out}$. A high $\omega$ $V_{in}$ will result in a low $C$ impedance, and be **"allowed"** to pass.

##### RC With a Square Wave
$R\cdot C = \tau$  determines how long it takes to get from starting voltage to 70% to "target".

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$V_{i}$]{}
	to[R=$100k\Omega$]++(2,0)
	to[capacitor, l=$1\mu F$]++(0,-2)
	node[ground, scale=2]{}++(0,2)--++(1,0)
	node[ocirc, label=right:$V_{out}$]{};
\end{circuitikz}
\end{document}
```
$$\tau = R\cdot C = 0.1s$$
```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
\begin{axis}[title={DC RC Circuit: Square Wave Response (2.5 Hz)}, xlabel={Time (ms)}, ylabel={Voltage (V)},
    legend pos=north east, grid=major, width=16cm, height=12cm]

\addplot[yellow, mark=none, line width=2pt] coordinates {
    (0.000000e+00, 2.500000e+00)
    (1.000000e+01, 5.000000e+00)
    (2.000000e+01, 5.000000e+00)
    (3.000000e+01, 5.000000e+00)
    (4.000000e+01, 5.000000e+00)
    (5.000000e+01, 5.000000e+00)
    (6.000000e+01, 5.000000e+00)
    (7.000000e+01, 5.000000e+00)
    (8.000000e+01, 5.000000e+00)
    (9.000000e+01, 5.000000e+00)
    (1.000000e+02, 5.000000e+00)
    (1.100000e+02, 5.000000e+00)
    (1.200000e+02, 5.000000e+00)
    (1.300000e+02, 5.000000e+00)
    (1.400000e+02, 5.000000e+00)
    (1.500000e+02, 5.000000e+00)
    (1.600000e+02, 5.000000e+00)
    (1.700000e+02, 5.000000e+00)
    (1.800000e+02, 5.000000e+00)
    (1.900000e+02, 5.000000e+00)
    (2.000000e+02, 5.000000e+00)
    (2.100000e+02, 0.000000e+00)
    (2.200000e+02, 0.000000e+00)
    (2.300000e+02, 0.000000e+00)
    (2.400000e+02, 0.000000e+00)
    (2.500000e+02, 0.000000e+00)
    (2.600000e+02, 0.000000e+00)
    (2.700000e+02, 0.000000e+00)
    (2.800000e+02, 0.000000e+00)
    (2.900000e+02, 0.000000e+00)
    (3.000000e+02, 0.000000e+00)
    (3.100000e+02, 0.000000e+00)
    (3.200000e+02, 0.000000e+00)
    (3.300000e+02, 0.000000e+00)
    (3.400000e+02, 0.000000e+00)
    (3.500000e+02, 0.000000e+00)
    (3.600000e+02, 0.000000e+00)
    (3.700000e+02, 0.000000e+00)
    (3.800000e+02, 0.000000e+00)
    (3.900000e+02, 0.000000e+00)
    (4.000000e+02, 0.000000e+00)
    (4.100000e+02, 5.000000e+00)
    (4.200000e+02, 5.000000e+00)
    (4.300000e+02, 5.000000e+00)
    (4.400000e+02, 5.000000e+00)
    (4.500000e+02, 5.000000e+00)
    (4.600000e+02, 5.000000e+00)
    (4.700000e+02, 5.000000e+00)
    (4.800000e+02, 5.000000e+00)
    (4.900000e+02, 5.000000e+00)
    (5.000000e+02, 5.000000e+00)
    (5.100000e+02, 5.000000e+00)
    (5.200000e+02, 5.000000e+00)
    (5.300000e+02, 5.000000e+00)
    (5.400000e+02, 5.000000e+00)
    (5.500000e+02, 5.000000e+00)
    (5.600000e+02, 5.000000e+00)
    (5.700000e+02, 5.000000e+00)
    (5.800000e+02, 5.000000e+00)
    (5.900000e+02, 5.000000e+00)
    (6.000000e+02, 5.000000e+00)
    (6.100000e+02, 0.000000e+00)
    (6.200000e+02, 0.000000e+00)
    (6.300000e+02, 0.000000e+00)
    (6.400000e+02, 0.000000e+00)
    (6.500000e+02, 0.000000e+00)
    (6.600000e+02, 0.000000e+00)
    (6.700000e+02, 0.000000e+00)
    (6.800000e+02, 0.000000e+00)
    (6.900000e+02, 0.000000e+00)
    (7.000000e+02, 0.000000e+00)
    (7.100000e+02, 0.000000e+00)
    (7.200000e+02, 0.000000e+00)
    (7.300000e+02, 0.000000e+00)
    (7.400000e+02, 0.000000e+00)
    (7.500000e+02, 0.000000e+00)
    (7.600000e+02, 0.000000e+00)
    (7.700000e+02, 0.000000e+00)
    (7.800000e+02, 0.000000e+00)
    (7.900000e+02, 0.000000e+00)
    (8.000000e+02, 0.000000e+00)
    (8.100000e+02, 5.000000e+00)
    (8.200000e+02, 5.000000e+00)
    (8.300000e+02, 5.000000e+00)
    (8.400000e+02, 5.000000e+00)
    (8.500000e+02, 5.000000e+00)
    (8.600000e+02, 5.000000e+00)
    (8.700000e+02, 5.000000e+00)
    (8.800000e+02, 5.000000e+00)
    (8.900000e+02, 5.000000e+00)
    (9.000000e+02, 5.000000e+00)
    (9.100000e+02, 5.000000e+00)
    (9.200000e+02, 5.000000e+00)
    (9.300000e+02, 5.000000e+00)
    (9.400000e+02, 5.000000e+00)
    (9.500000e+02, 5.000000e+00)
    (9.600000e+02, 5.000000e+00)
    (9.700000e+02, 5.000000e+00)
    (9.800000e+02, 5.000000e+00)
    (9.900000e+02, 5.000000e+00)
    (1.000000e+03, 5.000000e+00)
    (1.010000e+03, 0.000000e+00)
    (1.020000e+03, 0.000000e+00)
    (1.030000e+03, 0.000000e+00)
    (1.040000e+03, 0.000000e+00)
    (1.050000e+03, 0.000000e+00)
    (1.060000e+03, 0.000000e+00)
    (1.070000e+03, 0.000000e+00)
    (1.080000e+03, 0.000000e+00)
    (1.090000e+03, 0.000000e+00)
    (1.100000e+03, 0.000000e+00)
    (1.110000e+03, 0.000000e+00)
    (1.120000e+03, 0.000000e+00)
    (1.130000e+03, 0.000000e+00)
    (1.140000e+03, 0.000000e+00)
    (1.150000e+03, 0.000000e+00)
    (1.160000e+03, 0.000000e+00)
    (1.170000e+03, 0.000000e+00)
    (1.180000e+03, 0.000000e+00)
    (1.190000e+03, 0.000000e+00)
    (1.200000e+03, 0.000000e+00)
    (1.210000e+03, 5.000000e+00)
    (1.220000e+03, 5.000000e+00)
    (1.230000e+03, 5.000000e+00)
    (1.240000e+03, 5.000000e+00)
    (1.250000e+03, 5.000000e+00)
    (1.260000e+03, 5.000000e+00)
    (1.270000e+03, 5.000000e+00)
    (1.280000e+03, 5.000000e+00)
    (1.290000e+03, 5.000000e+00)
    (1.300000e+03, 5.000000e+00)
    (1.310000e+03, 5.000000e+00)
    (1.320000e+03, 5.000000e+00)
    (1.330000e+03, 5.000000e+00)
    (1.340000e+03, 5.000000e+00)
    (1.350000e+03, 5.000000e+00)
    (1.360000e+03, 5.000000e+00)
    (1.370000e+03, 5.000000e+00)
    (1.380000e+03, 5.000000e+00)
    (1.390000e+03, 5.000000e+00)
    (1.400000e+03, 5.000000e+00)
    (1.410000e+03, 0.000000e+00)
    (1.420000e+03, 0.000000e+00)
    (1.430000e+03, 0.000000e+00)
    (1.440000e+03, 0.000000e+00)
    (1.450000e+03, 0.000000e+00)
    (1.460000e+03, 0.000000e+00)
    (1.470000e+03, 0.000000e+00)
    (1.480000e+03, 0.000000e+00)
    (1.490000e+03, 0.000000e+00)
    (1.500000e+03, 0.000000e+00)
    (1.510000e+03, 0.000000e+00)
    (1.520000e+03, 0.000000e+00)
    (1.530000e+03, 0.000000e+00)
    (1.540000e+03, 0.000000e+00)
    (1.550000e+03, 0.000000e+00)
    (1.560000e+03, 0.000000e+00)
    (1.570000e+03, 0.000000e+00)
    (1.580000e+03, 0.000000e+00)
    (1.590000e+03, 0.000000e+00)
    (1.600000e+03, 0.000000e+00)
    (1.610000e+03, 5.000000e+00)
    (1.620000e+03, 5.000000e+00)
    (1.630000e+03, 5.000000e+00)
    (1.640000e+03, 5.000000e+00)
    (1.650000e+03, 5.000000e+00)
    (1.660000e+03, 5.000000e+00)
    (1.670000e+03, 5.000000e+00)
    (1.680000e+03, 5.000000e+00)
    (1.690000e+03, 5.000000e+00)
    (1.700000e+03, 5.000000e+00)
    (1.710000e+03, 5.000000e+00)
    (1.720000e+03, 5.000000e+00)
    (1.730000e+03, 5.000000e+00)
    (1.740000e+03, 5.000000e+00)
    (1.750000e+03, 5.000000e+00)
    (1.760000e+03, 5.000000e+00)
    (1.770000e+03, 5.000000e+00)
    (1.780000e+03, 5.000000e+00)
    (1.790000e+03, 5.000000e+00)
    (1.800000e+03, 5.000000e+00)
    (1.810000e+03, 0.000000e+00)
    (1.820000e+03, 0.000000e+00)
    (1.830000e+03, 0.000000e+00)
    (1.840000e+03, 0.000000e+00)
    (1.850000e+03, 0.000000e+00)
    (1.860000e+03, 0.000000e+00)
    (1.870000e+03, 0.000000e+00)
    (1.880000e+03, 0.000000e+00)
    (1.890000e+03, 0.000000e+00)
    (1.900000e+03, 0.000000e+00)
    (1.910000e+03, 0.000000e+00)
    (1.920000e+03, 0.000000e+00)
    (1.930000e+03, 0.000000e+00)
    (1.940000e+03, 0.000000e+00)
    (1.950000e+03, 0.000000e+00)
    (1.960000e+03, 0.000000e+00)
    (1.970000e+03, 0.000000e+00)
    (1.980000e+03, 0.000000e+00)
    (1.990000e+03, 0.000000e+00)
};
\addlegendentry{$V_{in}$}

\addplot[orange, mark=none, line width=2pt] coordinates {
    (0.000000e+00, 0.000000e+00)
    (1.000000e+01, 4.757926e-01)
    (2.000000e+01, 9.063299e-01)
    (3.000000e+01, 1.295896e+00)
    (4.000000e+01, 1.648390e+00)
    (5.000000e+01, 1.967339e+00)
    (6.000000e+01, 2.255936e+00)
    (7.000000e+01, 2.517070e+00)
    (8.000000e+01, 2.753353e+00)
    (9.000000e+01, 2.967151e+00)
    (1.000000e+02, 3.160603e+00)
    (1.100000e+02, 3.335645e+00)
    (1.200000e+02, 3.494030e+00)
    (1.300000e+02, 3.637343e+00)
    (1.400000e+02, 3.767018e+00)
    (1.500000e+02, 3.884352e+00)
    (1.600000e+02, 3.990520e+00)
    (1.700000e+02, 4.086586e+00)
    (1.800000e+02, 4.173509e+00)
    (1.900000e+02, 4.252160e+00)
    (2.000000e+02, 4.323327e+00)
    (2.100000e+02, 3.911951e+00)
    (2.200000e+02, 3.539678e+00)
    (2.300000e+02, 3.202832e+00)
    (2.400000e+02, 2.898040e+00)
    (2.500000e+02, 2.622254e+00)
    (2.600000e+02, 2.372712e+00)
    (2.700000e+02, 2.146918e+00)
    (2.800000e+02, 1.942611e+00)
    (2.900000e+02, 1.757746e+00)
    (3.000000e+02, 1.590474e+00)
    (3.100000e+02, 1.439119e+00)
    (3.200000e+02, 1.302168e+00)
    (3.300000e+02, 1.178250e+00)
    (3.400000e+02, 1.066124e+00)
    (3.500000e+02, 9.646686e-01)
    (3.600000e+02, 8.728678e-01)
    (3.700000e+02, 7.898030e-01)
    (3.800000e+02, 7.146430e-01)
    (3.900000e+02, 6.466354e-01)
    (4.000000e+02, 5.850996e-01)
    (4.100000e+02, 1.005190e+00)
    (4.200000e+02, 1.385348e+00)
    (4.300000e+02, 1.729329e+00)
    (4.400000e+02, 2.040576e+00)
    (4.500000e+02, 2.322204e+00)
    (4.600000e+02, 2.577031e+00)
    (4.700000e+02, 2.807608e+00)
    (4.800000e+02, 3.016243e+00)
    (4.900000e+02, 3.205023e+00)
    (5.000000e+02, 3.375839e+00)
    (5.100000e+02, 3.530399e+00)
    (5.200000e+02, 3.670250e+00)
    (5.300000e+02, 3.796793e+00)
    (5.400000e+02, 3.911294e+00)
    (5.500000e+02, 4.014899e+00)
    (5.600000e+02, 4.108644e+00)
    (5.700000e+02, 4.193468e+00)
    (5.800000e+02, 4.270220e+00)
    (5.900000e+02, 4.339668e+00)
    (6.000000e+02, 4.402507e+00)
    (6.100000e+02, 3.983597e+00)
    (6.200000e+02, 3.604506e+00)
    (6.300000e+02, 3.261490e+00)
    (6.400000e+02, 2.951117e+00)
    (6.500000e+02, 2.670279e+00)
    (6.600000e+02, 2.416167e+00)
    (6.700000e+02, 2.186238e+00)
    (6.800000e+02, 1.978189e+00)
    (6.900000e+02, 1.789938e+00)
    (7.000000e+02, 1.619602e+00)
    (7.100000e+02, 1.465476e+00)
    (7.200000e+02, 1.326017e+00)
    (7.300000e+02, 1.199829e+00)
    (7.400000e+02, 1.085650e+00)
    (7.500000e+02, 9.823360e-01)
    (7.600000e+02, 8.888539e-01)
    (7.700000e+02, 8.042679e-01)
    (7.800000e+02, 7.277313e-01)
    (7.900000e+02, 6.584782e-01)
    (8.000000e+02, 5.958154e-01)
    (8.100000e+02, 1.014886e+00)
    (8.200000e+02, 1.394121e+00)
    (8.300000e+02, 1.737268e+00)
    (8.400000e+02, 2.047759e+00)
    (8.500000e+02, 2.328703e+00)
    (8.600000e+02, 2.582912e+00)
    (8.700000e+02, 2.812929e+00)
    (8.800000e+02, 3.021058e+00)
    (8.900000e+02, 3.209380e+00)
    (9.000000e+02, 3.379781e+00)
    (9.100000e+02, 3.533966e+00)
    (9.200000e+02, 3.673478e+00)
    (9.300000e+02, 3.799714e+00)
    (9.400000e+02, 3.913937e+00)
    (9.500000e+02, 4.017290e+00)
    (9.600000e+02, 4.110807e+00)
    (9.700000e+02, 4.195426e+00)
    (9.800000e+02, 4.271991e+00)
    (9.900000e+02, 4.341271e+00)
    (1.000000e+03, 4.403958e+00)
    (1.010000e+03, 3.984909e+00)
    (1.020000e+03, 3.605693e+00)
    (1.030000e+03, 3.262564e+00)
    (1.040000e+03, 2.952089e+00)
    (1.050000e+03, 2.671159e+00)
    (1.060000e+03, 2.416963e+00)
    (1.070000e+03, 2.186958e+00)
    (1.080000e+03, 1.978840e+00)
    (1.090000e+03, 1.790528e+00)
    (1.100000e+03, 1.620136e+00)
    (1.110000e+03, 1.465959e+00)
    (1.120000e+03, 1.326454e+00)
    (1.130000e+03, 1.200224e+00)
    (1.140000e+03, 1.086007e+00)
    (1.150000e+03, 9.826596e-01)
    (1.160000e+03, 8.891467e-01)
    (1.170000e+03, 8.045328e-01)
    (1.180000e+03, 7.279710e-01)
    (1.190000e+03, 6.586951e-01)
    (1.200000e+03, 5.960117e-01)
    (1.210000e+03, 1.015063e+00)
    (1.220000e+03, 1.394282e+00)
    (1.230000e+03, 1.737413e+00)
    (1.240000e+03, 2.047891e+00)
    (1.250000e+03, 2.328822e+00)
    (1.260000e+03, 2.583020e+00)
    (1.270000e+03, 2.813027e+00)
    (1.280000e+03, 3.021146e+00)
    (1.290000e+03, 3.209460e+00)
    (1.300000e+03, 3.379853e+00)
    (1.310000e+03, 3.534031e+00)
    (1.320000e+03, 3.673537e+00)
    (1.330000e+03, 3.799767e+00)
    (1.340000e+03, 3.913985e+00)
    (1.350000e+03, 4.017334e+00)
    (1.360000e+03, 4.110847e+00)
    (1.370000e+03, 4.195462e+00)
    (1.380000e+03, 4.272024e+00)
    (1.390000e+03, 4.341300e+00)
    (1.400000e+03, 4.403984e+00)
    (1.410000e+03, 3.984933e+00)
    (1.420000e+03, 3.605715e+00)
    (1.430000e+03, 3.262584e+00)
    (1.440000e+03, 2.952106e+00)
    (1.450000e+03, 2.671175e+00)
    (1.460000e+03, 2.416978e+00)
    (1.470000e+03, 2.186971e+00)
    (1.480000e+03, 1.978852e+00)
    (1.490000e+03, 1.790539e+00)
    (1.500000e+03, 1.620146e+00)
    (1.510000e+03, 1.465968e+00)
    (1.520000e+03, 1.326462e+00)
    (1.530000e+03, 1.200232e+00)
    (1.540000e+03, 1.086014e+00)
    (1.550000e+03, 9.826655e-01)
    (1.560000e+03, 8.891521e-01)
    (1.570000e+03, 8.045376e-01)
    (1.580000e+03, 7.279754e-01)
    (1.590000e+03, 6.586991e-01)
    (1.600000e+03, 5.960153e-01)
    (1.610000e+03, 1.015067e+00)
    (1.620000e+03, 1.394285e+00)
    (1.630000e+03, 1.737416e+00)
    (1.640000e+03, 2.047893e+00)
    (1.650000e+03, 2.328825e+00)
    (1.660000e+03, 2.583022e+00)
    (1.670000e+03, 2.813029e+00)
    (1.680000e+03, 3.021148e+00)
    (1.690000e+03, 3.209461e+00)
    (1.700000e+03, 3.379854e+00)
    (1.710000e+03, 3.534032e+00)
    (1.720000e+03, 3.673538e+00)
    (1.730000e+03, 3.799768e+00)
    (1.740000e+03, 3.913986e+00)
    (1.750000e+03, 4.017334e+00)
    (1.760000e+03, 4.110848e+00)
    (1.770000e+03, 4.195462e+00)
    (1.780000e+03, 4.272025e+00)
    (1.790000e+03, 4.341301e+00)
    (1.800000e+03, 4.403985e+00)
    (1.810000e+03, 3.984933e+00)
    (1.820000e+03, 3.605715e+00)
    (1.830000e+03, 3.262584e+00)
    (1.840000e+03, 2.952107e+00)
    (1.850000e+03, 2.671175e+00)
    (1.860000e+03, 2.416978e+00)
    (1.870000e+03, 2.186971e+00)
    (1.880000e+03, 1.978852e+00)
    (1.890000e+03, 1.790539e+00)
    (1.900000e+03, 1.620146e+00)
    (1.910000e+03, 1.465968e+00)
    (1.920000e+03, 1.326462e+00)
    (1.930000e+03, 1.200232e+00)
    (1.940000e+03, 1.086014e+00)
    (1.950000e+03, 9.826656e-01)
    (1.960000e+03, 8.891522e-01)
    (1.970000e+03, 8.045377e-01)
    (1.980000e+03, 7.279755e-01)
    (1.990000e+03, 6.586991e-01)
};
\addlegendentry{$V_{cap}$}

\end{axis}
\end{tikzpicture}
\end{document}
```
#### RLC "Tank Circuit"
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[scale=2, font=\Large]

	\draw(0,0)
	node[label=left:$V_{in}$]{}
	to[R=$R$, i>_=$\tilde{I}$]++(3,0)--++(1,0)
	node[label=right:$V_{out}$]{}++(-1,0)--++(0,-1)--++(0.5,0)
	to[capacitor, l=$C$]++(0,-2)--++(-0.5,0)
	node[ground]{}--++(-0.5,0)++(0,2)--++(0.5,0)++(-0.5,0)
	to[inductor, a=$L$]++(0,-2);
	
\end{circuitikz}
\end{document}

```
Energy in $L$
$$L\frac{I^2}{2}$$
Energy in $C$
$$C\frac{V^2}{2}$$
There should be a point (frequency) where the impedance of the inductor and the capacitor "cancel". This would be the resonant frequency, where the energy pumped between the two is "trapped" in the form of voltage and current bouncing between the two elements.

At this resonant frequency, the impedance of the $LC$ tank is **infinite**. 

The current through $R$ will be reduced to 0, but there will still be current cycling through the $LC$ "tank".

$$\frac{Z}{R + Z}$$
$$Z = (\frac{1}{j\omega L} + j\omega C)^{-1} = (\frac{-j}{\omega C} + j\omega C)^{-1} = (j(\omega C - \frac{1}{\omega L}))^{-1}$$
$$=(j(\frac{\omega LC - 1}{\omega L}))^{-1} = j^{-1}\frac{\omega L}{\omega^2 LC -1} = -j\frac{\omega L}{\omega^2 L C - 1}$$
When $\omega^2LC -1 = 0$, $Z = \infty$
$\omega^2 LC = 1$ is the resonant frequency.

###### What is $\tilde{I}$ at Resonance? 
$$\tilde{I} = \frac{\tilde{V}}{R + Z}$$
At resonance, $Z$ of the tank approaches infinity, so $\tilde{I}$ approaching 0.

But $\tilde{I}_L$ & $\tilde{I}_C$ are not 0.
Assuming $L = 0.01H = 10^{-2}H$ and $C=10^{-8}F$ at $\omega = 10^5rad/s = 15.9kHz$ 
$$\tilde{I}_L = \frac{\tilde{V}_0}{j\omega L}$$
The current in the inductor has a phase lag $\frac{1}{j} = -90^\circ$

And
$$\tilde{I}_C = \tilde{V}_0 (j\omega C)$$
The current in the cap has a phase lead $j = 90^\circ$ 

So, even though the current at $R$ is 0 at resonance, there is a current in the $LC$ portion!
## Class 12
#### Laplace Transform and Circuits
When a **capacitor** is connected to a circuit, the energy transfer is not instantaneous. The current will instantly jump through the capacitor, but the voltage will take time to build (charge).

When an **inductor** is connected, the voltage will instantly be imposed on the inductor, but the current takes time to change it's flow, since the inductor generates a current that resists when voltage changes suddenly across it.

##### RLC Circuit
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[sV, l=$Vcos(\omega t)$]++(0,2)
	to[switch]++(1,0)
	to[R=$R$, i>_=$i(t)$]++(1,0)
	to[inductor, l=$L$]++(0,-1)
	to[capacitor, l=$C$]++(0,-1)--++(-2,0);
\end{circuitikz}
\end{document}
```

With AC, when the switch is switched on, there is initially a transient state.
Everything is sinusoidal, despite that phase difference.

With DC, everything is constant signals. $V(t)$, and $I(t)$ are constants.

##### Introducing Laplace
An audio signal is comprised of an exponential, an amplitude, and a cosine function.

This function can be used to represent constant, sinusoidal, and exponential signals that we have learned up to this point.
###### These are sinusoidal signals, that increase or decrease.

$$V(t) = V_0e^{-at}cos(\omega t)$$
$$V(t) = V_0e^{-at}sin(\omega t)$$
```tikz
\usepackage{pgfplots}

\begin{document}

% Define AC signal parameters
\def\amplitude{100}      % Amplitude in volts
\def\omega{20*pi*2}          % Angular frequency in rad/s
\def\phase{0}            % Phase shift in degrees
\def\tmax{1}         % Maximum time in seconds
\def\trig{cos}         % sin or cos
\def\a{5}              %exponential coefficient e^{-a}

\begin{tikzpicture}[scale=1.2]
\begin{axis}[
    width=12cm,
    height=10cm,
    xlabel={Time (s)},
    ylabel={Voltage (V)},
    domain=0:\tmax,
    samples=500,
    grid=major,
    axis lines=middle,
    enlargelimits=true,
]
\addplot[orange, thick] {exp(-\a*x)*\amplitude*\trig(deg(\omega*x + \phase))};
\addlegendentry{$20Hz\ Audio\ Signal$}

\end{axis}

\end{tikzpicture}
\end{document}
```

Over time, the sound decays because it eventually fades out. The envelope of decay is defined by the coefficient on the exponent $a$.

###### A pure sinusoidal can be obtained by setting $a=0$, so that $e^{-at} = e^{0} = 1$ 
```tikz
\usepackage{pgfplots}

\begin{document}

% Define AC signal parameters
\def\amplitude{100}      % Amplitude in volts
\def\omega{20*pi*2}          % Angular frequency in rad/s
\def\phase{0}            % Phase shift in degrees
\def\tmax{0.5}         % Maximum time in seconds
\def\trig{cos}         % sin or cos
\def\a{0}

\begin{tikzpicture}[scale=1.2]
\begin{axis}[
    width=12cm,
    height=10cm,
    xlabel={Time (s)},
    ylabel={Voltage (V)},
    domain=0:\tmax,
    samples=500,
    grid=major,
    axis lines=middle,
    enlargelimits=true,
]
\addplot[orange, thick] {exp(-\a*x)*\amplitude*\trig(deg(\omega*x + \phase))};
\addlegendentry{$20Hz\ Audio\ Signal$}

\end{axis}

\end{tikzpicture}
\end{document}
```

###### A non-oscillating signal can be obtained by setting $\omega=0$, so that 
```tikz
\usepackage{pgfplots}

\begin{document}

% Define AC signal parameters
\def\amplitude{100}      % Amplitude in volts
\def\omega{0*pi*2}          % Angular frequency in rad/s
\def\phase{0}            % Phase shift in degrees
\def\tmax{1}         % Maximum time in seconds
\def\trig{cos}         % sin or cos
\def\a{2}

\begin{tikzpicture}[scale=1.2]
\begin{axis}[
    width=12cm,
    height=10cm,
    xlabel={Time (s)},
    ylabel={Voltage (V)},
    domain=0:\tmax,
    samples=500,
    grid=major,
    axis lines=middle,
    enlargelimits=true,
]
\addplot[orange, thick] {exp(-\a*x)*\amplitude*\trig(deg(\omega*x + \phase))};
\addlegendentry{$20Hz\ Audio\ Signal$}

\end{axis}

\end{tikzpicture}
\end{document}
```

##### Musical Equivalent
```abc
X:1
L:1/8
!mf!c
```
This symbol has a duration, frequency, and amplitude 

##### Laplace Notation
$$L\{V(t)\} = V_0\frac{s+a}{(s + a)^2 + \omega^2}$$
$$L\{V(t)\} = \int_0^\infty v(t)e^{-8t}\ dt$$
This allows us to move from "time domain" to "s-domain".
Time is the derivative of $s$ and it represents the time 

For the signal where $a$ is 0, the Laplace representation is:
$$V_0\frac{s}{s^2 + \omega^2}$$
This is the representation of the "infinite" cosine function with no decay.
$a$ still represents growth or decay.