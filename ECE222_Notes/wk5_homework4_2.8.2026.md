## Homework 4
1. **The RLC Circuit is supplied by an AC voltage source**
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[sV, l=$V_s$, invert]++(0,2)
	to[inductor, l=$L_1 {=}0.1H$]++(2,0)
	to[R=$100\Omega$]++(0,-2)++(0,2)
	to[capacitor, l=$5\mu F$]++(2,0)
	to[inductor, l=$L_2 {=} 0.1H$]++(0,-2)--++(-4,0);
\end{circuitikz}
\end{document}
```

**Suppose the SC source is $V_s(t) = 100cos(1000t) V$. Find the input impedance seen at the source.** 

$$Z_{in} = Z_{L1} + \frac{1}{\frac{1}{Z_R} + \frac{1}{(Z_C + Z_{L2})}} = j\omega L_1 + \left(\frac{1}{R} + \frac{1}{\frac{-j}{\omega C} + j\omega L}\right)^{-1}$$
$$=j100 + \left(\frac{1}{100} + \frac{1}{\frac{-j}{0.0005} + j100}\right)^{-1} = j100 + \left(0.01 + \frac{1}{-j200 + j100}\right)^-1$$
$$= j100 + \left(0.01 + \frac{1}{-j100}\right)^{-1} = j100 + \left(\frac{1}{100} + j\frac{1}{100}\right)^{-1}$$
$$= j100 + \left(\frac{1}{100}\right)^{-1}\left( 1 + j\right)^{-1} = j100 + \frac{100}{1 + j} = j100 + \frac{100 - 100j}{1 -j^2}$$
$$= j100+\frac{100-100j}{1-(-1)} = j100 + 50 - j50 = 50+ j50$$
$$Z_{in} = 50 + 50j$$


**Find the capacitor voltage and inductor current in real time.**
$$|Z_{in}|=\sqrt{50^2 + 50^2} = \sqrt{5000} = 70.71\ohm \angle arctan\left(\frac{50}{50}\right) = 70.71\angle45^\circ$$
**Overall Current  = Current Through First Inductor**
$$\tilde{I} = \tilde{I}_{L1}= \frac{\tilde{V}}{Z_{in}} = \frac{100}{70.71e^{j45^\circ}} = 1.414e^{-j45^\circ}$$
$$Z_{L1} = \sqrt{0^2 + 100^2}\angle arctan\left(\frac{100}{0}\right) = 100e^{90^\circ}$$
$$\tilde{V}_{L1} = \tilde{I}_{in}\times Z_{L1} = 1.414\angle -45^\circ \times j100 = 1.414e^{-j45^\circ} \times 100e^{90^\circ}$$
$$\tilde{V}_{L1} = 141.4e^{j45}$$
$$V_{L1}(t) = 141.4(cos45^\circ + sin45^\circ) = 141.4(0.707 + j0.707) = 100 + j100$$
$$V_{parallel} = V_i - V_{L1} = 100 - 100 - j100 = -j100V$$
By KCL: 
$$V_{parallel} = V_{R} = V_{L2} + V_C$$
$$V_{L2} + V_C = -j100V$$
**Voltage Through Cap**
$$V_C =V_{parallel}\times\left(\frac{Z_C}{Z_C + Z_L}\right)= -j100 \times \left(\frac{-j200}{-j200 + j100}\right) = -j100\times \frac{-j200}{-j100}$$
$$V_C= -j200V$$
**Voltage Through Second Inductor**
$$V_{L2} = -j100 \times\left(\frac{j100}{-j200 + j100}\right) = j100$$
**Current Through Cap and Second Inductor**
$$\tilde{I}_{L2} = \tilde{I}_{C} = \frac{V_{L2}}{Z_{L2}} = \frac{j100}{j100} = 1A = 1e^{j0^\circ}A$$


2. **This RLC circuit is different from the one you have seen in the recent lab:**
   
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$V_i$]{}
	to[R=$1k\Omega$]++(2,0)--++(1,0)
	node[ocirc, label=right:$V_o$]{}++(-1,0)
	to[capacitor, l=$0.01\mu F$]++(0,-2)
	to[inductor, l=$0.01H$]++(0,-2)
	node[ground, scale=2]{};
\end{circuitikz}
\end{document}
```
**The input voltage is $V_i$ and the output voltage $V_o$. Like the lab project we want to investigate the frequency response of this circuit in terms of the ratio $\frac{\tilde{V}_)}{\tilde{V}_i}$.**
	**1. Suppose the input is a sinusoidal signal $V_i cos(\omega t)$. Find the impedances of the three elements in the circuit.**
	$$Z_{R} = 1k\Omega$$
	$$Z_C = \frac{-j}{\omega\times 10^{-8}} = \frac{-j\times 10^8}{\omega}$$
	$$Z_L = j\times \omega\times 0.01$$
	**2. Use the concept of voltage divider to find the ratio $\frac{\tilde{V}_)}{\tilde{V}_i}$. Carry $\omega$ as a variable.**
	$$\frac{\tilde{V}_{out}}{\tilde{V}_{in}} = \frac{Z_C + Z_L}{Z_R + Z_C + Z_L} = \frac{\frac{-j\times 10^8}{\omega} + j\omega \times 10^{-2} } {1000-\frac{j\times 10^8}{\omega} + j\omega \times 10^{-2} }$$
	$$=\frac{j(\omega 10^{-2} - \frac{10^{8}}{\omega})}{1000 + j(\omega 10^{-2} - \frac{10^{8}}{\omega})}$$
	**3. Investigate the ratio with low $\omega$ and high $\omega$**
	If $\omega = 100000\frac{rad}{s}$, the ratio will be 
	$$\frac{j1000 - j1000}{1000+(j1000-j1000)} = \frac{0}{1000} = 0$$
	If $\omega = 10\frac{rad}{s}$, the ratio will be 
	$$\frac{0.1j -10000000j}{1000 + 0.1j  - 10000000j} \approx \frac{-10Mj}{1000 -10Mj}  = \frac{-10Mj(1000 + 10Mj)}{(1000-10Mj)(1000 + 10Mj)}$$
	$$= \frac{-10000Mj - (10Mj)^2}{1M -(10Mj)^2} = \frac{-10000Mj-j^2(10M)^2}{1M - j^2(10M)^2} = \frac{-10000Mj+(10M^2)}{1M +(10M)^2}$$
	So at a low frequency, the real portion of the ratio is very nearly 1, while the imaginary portion is negative, but very tiny.
	**4. Is there an $\omega$ where the ratio is either smallest or largest?**
	The ratio is the smallest at $\omega = 100\frac{rad}{s} = \frac{100}{2\pi}kHz =15.92kHz$ 
	It would be the largest as $\omega$ approaches 0 or infinity.
	The expression $j(\omega 10^{-2} - \frac{10^8}{\omega})$ will essentially become:
	1. $j(0 - \infty)$ as $\omega\to 0$
	2. $j(\infty - 0)$ as $\omega\to \infty$ 
	**5. Sketch a plot with vertical axis to be the gain $\frac{|\tilde{V}_o|}{|\tilde{V}_i|}$ against the horizontal axis of $\omega$.**

```tikz
\usepackage{pgfplots}

\begin{document}
\begin{tikzpicture}
\begin{axis}[
    xlabel={Frequency $\omega$ (rad/s)},
    ylabel={$|V_{out}/V_{in}|$},
    xmode=log,
    grid=major,
    width=12cm,
    height=8cm,
    xmin=1e3, xmax=1e7,
    ymin=0, ymax=1.1,
    title={Notch Filter Frequency Response},
    legend pos=south east
]

% Generate data points
% |H(omega)| = |X| * sqrt(X^2 + 10^6) / (10^6 + X^2)
% where X = omega * 10^-2 - 10^8/omega
\addplot[
    blue,
    thick,
    samples=200,
    domain=1e3:1e7
] {
    abs(x*0.01 - 1e8/x) * sqrt((x*0.01 - 1e8/x)^2 + 1e6) / (1e6 + (x*0.01 - 1e8/x)^2)
};

% Mark resonant frequency
\addplot[
    red,
    only marks,
    mark=*,
    mark size=3pt
] coordinates {(1e5, 0)};

\legend{$|V_{out}/V_{in}|$, Resonance}

\end{axis}
\end{tikzpicture}
\end{document}
```
