
## What If We Account For the Resistance of The Inductor (Equivalent Series Resistor)?
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[scale=2, font=\Large]

	\draw(0,0)
	node[label=left:$V_{in}$]{}
	to[R=$10k\Omega$]++(3,0)--++(1,0)
	node[label=right:$V_{out}$]{}++(-1,0)--++(0,-1)--++(0.5,0)
	to[capacitor, l=$0.01\mu F$]++(0,-2)--++(-0.5,0)
	node[ground]{}--++(-0.5,0)++(0,2)--++(0.5,0)++(-0.5,0)
	to[color=orange, R, a=$67\Omega$]++(0,-1)
	to[inductor, a=$0.01H$]++(0,-1);
	
\end{circuitikz}
\end{document}

```
### Step 1: Parallel LC Impedance with ESR

**Starting from parallel impedance formula:**

$$Z_{LC} = \frac{1}{\frac{1}{Z_C} + \frac{1}{Z_L + R_{ESR}}};\ Z_C = \frac{1}{j\omega C};\ Z_L = j\omega L;\ R_{ESR} = R_{ESR}$$

**Convert to admittance:**

$$\frac{1}{Z_{LC}} = \frac{1}{R_{ESR} + j\omega L} + \frac{1}{\frac{1}{j\omega C}}  = \frac{1}{R_{ESR} + j\omega L}+j\omega C$$

**Get common denominator:**

$$= \frac{1}{R_{ESR} + j\omega L} + j\omega C\left(\frac{R_{ESR} + j\omega L}{R_{ESR} + j\omega L}\right)$$

$$=\frac{1 + (j\omega C(R_{ESR} + j \omega L))}{R_{ESR} + j\omega L} = \frac{1 + j\omega R_{ESR}C + j^2\omega^2LC}{R_{ESR} + j\omega L}$$

**Since j² = -1:**

$$= \frac{1-\omega^2LC + j\omega R_{ESR}C}{R_{ESR} + j\omega L}$$

**Factor out ωC:**

$$= \frac{1 - \omega C(\omega L + jR_{ESR})}{R_{ESR} + j\omega L}$$

**Invert to get Z_LC:**

$$Z_{LC\ Adjusted} = \frac{R_{ESR}+ j\omega L}{1 - \omega C(\omega L + j R_{ESR})}$$

### Step 2: Transfer Function

**Using voltage divider:**
$$H = \frac{Z_{LC\ Adjusted}}{R + Z_{LC\ Adjusted}} = \frac{\frac{R_{ESR}+ j\omega L}{1 - \omega C(\omega L + j R_{ESR})}}{R + \frac{R_{ESR}+ j\omega L}{1 - \omega C(\omega L + j R_{ESR})}}$$
**Multiply numerator and denominator by the common denominator:**
$$H = \frac{R_{ESR}+ j\omega L}{R[1 - \omega C(\omega L + j R_{ESR})] + R_{ESR}+ j\omega L}$$
**Expand the denominator:**
$$= \frac{R_{ESR}+ j\omega L}{R - R\omega C(\omega L + j R_{ESR}) + R_{ESR}+ j\omega L}$$
$$= \frac{R_{ESR}+ j\omega L}{R - R\omega^2 LC - jR\omega CR_{ESR} + R_{ESR}+ j\omega L}$$
**Group real and imaginary parts:**
$$= \frac{R_{ESR}+ j\omega L}{[R(1 - \omega^2 LC) + R_{ESR}] + j[\omega L - R\omega CR_{ESR}]}$$
$$= \frac{R_{ESR}+ j\omega L}{[R(1 - \omega^2 LC) + R_{ESR}] + j\omega[L - RCR_{ESR}]}$$
### Step 3: Define Shorthand
Let:
$$A = R(1 - \omega^2 LC) + R_{ESR}$$
$$B = \omega(L - RCR_{ESR})$$
Then:
$$H = \frac{R_{ESR}+ j\omega L}{A + jB}$$
### Step 4: Multiply by Complex Conjugate

**Conjugate of denominator:** $A - jB$
**Numerator becomes:**
$$(R_{ESR}+ j\omega L)(A - jB)$$
$$= R_{ESR}A - jR_{ESR}B + j\omega LA - j^2\omega LB$$
$$= R_{ESR}A - jR_{ESR}B + j\omega LA + \omega LB$$
**Group real and imaginary:**
$$= (R_{ESR}A + \omega LB) + j(\omega LA - R_{ESR}B)$$
**Denominator becomes:**
$$(A + jB)(A - jB) = A^2 - (jB)^2 = A^2 + B^2$$
**Therefore:**
$$H = \frac{(R_{ESR}A + \omega LB) + j(\omega LA - R_{ESR}B)}{A^2 + B^2}$$
### Step 5: Real and Imaginary Parts
$$\text{Re}\{H\} = \frac{R_{ESR}A + \omega LB}{A^2 + B^2}$$
$$\text{Im}\{H\} = \frac{\omega LA - R_{ESR}B}{A^2 + B^2}$$
Where:
- $A = R(1 - \omega^2 LC) + R_{ESR}$
- $B = \omega(L - RCR_{ESR})$
### Step 6: Gain (Magnitude)
$$|H(j\omega)| = \sqrt{[\text{Re}\{H\}]^2 + [\text{Im}\{H\}]^2}$$
$$|H(j\omega)| = \frac{\sqrt{(R_{ESR}A + \omega LB)^2 + (\omega LA - R_{ESR}B)^2}}{A^2 + B^2}$$
**Expand numerator under square root:**
$$(R_{ESR}A + \omega LB)^2 + (\omega LA - R_{ESR}B)^2$$
$$= R_{ESR}^2A^2 + 2R_{ESR}\omega LAB + \omega^2L^2B^2 + \omega^2L^2A^2 - 2\omega LR_{ESR}AB + R_{ESR}^2B^2$$
**Note the middle terms cancel:**
$$= R_{ESR}^2A^2 + \omega^2L^2B^2 + \omega^2L^2A^2 + R_{ESR}^2B^2$$
$$= R_{ESR}^2(A^2 + B^2) + \omega^2L^2(A^2 + B^2)$$
$$= (R_{ESR}^2 + \omega^2L^2)(A^2 + B^2)$$
**Therefore:**
$$|H(j\omega)| = \frac{\sqrt{(R_{ESR}^2 + \omega^2L^2)(A^2 + B^2)}}{A^2 + B^2}$$
$$|H(j\omega)| = \frac{\sqrt{R_{ESR}^2 + \omega^2L^2}}{\sqrt{A^2 + B^2}}$$
### Step 7: Expand A and B for Full Expression
$$A = R(1 - \omega^2 LC) + R_{ESR}$$
$$B = \omega(L - RCR_{ESR})$$
$$A^2 + B^2 = [R(1 - \omega^2 LC) + R_{ESR}]^2 + [\omega(L - RCR_{ESR})]^2$$
**Expanding A²:**
$$A^2 = R^2(1 - \omega^2 LC)^2 + 2R(1 - \omega^2 LC)R_{ESR} + R_{ESR}^2$$
**Expanding B²:**
$$B^2 = \omega^2(L - RCR_{ESR})^2 = \omega^2[L^2 - 2LRCR_{ESR} + R^2C^2R_{ESR}^2]$$
$$= \omega^2L^2 - 2\omega^2LRCR_{ESR} + \omega^2R^2C^2R_{ESR}^2$$
**Combined:**
$A^2 + B^2 = R^2(1 - \omega^2 LC)^2 + 2R(1 - \omega^2 LC)R_{ESR} + R_{ESR}^2 + \omega^2L^2 - 2\omega^2LRCR_{ESR} + \omega^2R^2C^2R_{ESR}^2$
This can be simplified further, but for computational purposes, it's easier to use:
$$|H(j\omega)| = \frac{\sqrt{R_{ESR}^2 + \omega^2L^2}}{\sqrt{[R(1 - \omega^2 LC) + R_{ESR}]^2 + \omega^2(L - RCR_{ESR})^2}}$$
### Step 8: Phase
$$\phi(\omega) = \arctan\left(\frac{\text{Im}\{H\}}{\text{Re}\{H\}}\right)$$

$$\phi(\omega) = \arctan\left(\frac{\omega LA - R_{ESR}B}{R_{ESR}A + \omega LB}\right)$$
**Substituting A and B:**
$$\phi(\omega) = \arctan\left(\frac{\omega L[R(1 - \omega^2 LC) + R_{ESR}] - R_{ESR}\omega(L - RCR_{ESR})}{R_{ESR}[R(1 - \omega^2 LC) + R_{ESR}] + \omega L \cdot \omega(L - RCR_{ESR})}\right)$$

**Simplify numerator:**
$$\omega L[R(1 - \omega^2 LC) + R_{ESR}] - R_{ESR}\omega(L - RCR_{ESR})$$
$$= \omega LR(1 - \omega^2 LC) + \omega LR_{ESR} - R_{ESR}\omega L + R_{ESR}\omega RCR_{ESR}$$
$$= \omega LR(1 - \omega^2 LC) + \omega R C R_{ESR}^2$$
$$= \omega R[L(1 - \omega^2 LC) + C R_{ESR}^2]$$
**Simplify denominator:**
$$R_{ESR}[R(1 - \omega^2 LC) + R_{ESR}] + \omega^2 L(L - RCR_{ESR})$$
$$= R_{ESR}R(1 - \omega^2 LC) + R_{ESR}^2 + \omega^2 L^2 - \omega^2 LRCR_{ESR}$$
**Therefore:**
$$\phi(\omega) = \arctan\left(\frac{\omega R[L(1 - \omega^2 LC) + C R_{ESR}^2]}{R_{ESR}R(1 - \omega^2 LC) + R_{ESR}^2 + \omega^2 L^2 - \omega^2 LRCR_{ESR}}\right)$$
## Step 9: Verification at Resonance

At resonance, $\omega_0 = \frac{1}{\sqrt{LC}}$, so $(1 - \omega_0^2 LC) = 0$

**A becomes:**
$$A = R \cdot 0 + R_{ESR} = R_{ESR}$$
**B becomes:**
$$B = \omega_0(L - RCR_{ESR})$$
**Gain at resonance:**
$$|H(\omega_0)| = \frac{\sqrt{R_{ESR}^2 + \omega_0^2L^2}}{\sqrt{R_{ESR}^2 + \omega_0^2(L - RCR_{ESR})^2}}$$
For more insight, we can use the standard result that at resonance:
$$Z_{LC}(\omega_0) = \frac{L}{CR_{ESR}}$$
With our values:
$$Z_{LC}(\omega_0) = \frac{0.01}{10^{-8} \times 67} \approx 14,925\ \Omega$$
**Gain:**
$$|H(\omega_0)| = \frac{14,925}{10,000 + 14,925} = \frac{14,925}{24,925} \approx 0.599$$
This matches the experimental measurement of 0.6.

**Phase at resonance:**
Numerator: $\omega_0 R[L \cdot 0 + C R_{ESR}^2] = \omega_0 RC R_{ESR}^2$
Denominator: $R_{ESR}R \cdot 0 + R_{ESR}^2 + \omega_0^2 L^2 - \omega_0^2 LRCR_{ESR}$
The phase is not exactly zero due to the ESR, but should be small.

```tikz
\usepackage{pgfplots}
\begin{document}

\begin{tikzpicture}[scale=1.5]
\begin{axis}[
    width=12cm,
    height=8cm,
    xlabel={Frequency (Hz)},
    ylabel={Gain $|H|$},
    xmode=log,
    ymode=linear,
    grid=both,
    legend pos=north west,
    legend style={font=\footnotesize, row sep=3mm},
    xmin=100, xmax=100000,
    ymin=0, ymax=1.0,
    domain=100:100000,
    samples=200,
]
\def\R{10000}
\def\L{0.01}
\def\C{1e-8}
\def\LC{1e-10}
\def\Radj{65}

\addplot[blue, thick] {
    sqrt(
        (\Radj*(\R*((1-(2*pi*x)^2*\LC)^2+(2*pi*x*\C*\Radj)^2)+\Radj) + (2*pi*x*(\L*(1-(2*pi*x)^2*\LC)-\C*\Radj^2))^2)^2 
        + ((2*pi*x*(\L*(1-(2*pi*x)^2*\LC)-\C*\Radj^2))*\R*((1-(2*pi*x)^2*\LC)^2+(2*pi*x*\C*\Radj)^2))^2
    ) / (
        (\R*((1-(2*pi*x)^2*\LC)^2+(2*pi*x*\C*\Radj)^2)+\Radj)^2 + (2*pi*x*(\L*(1-(2*pi*x)^2*\LC)-\C*\Radj^2))^2
    )
};
\addlegendentry{Theoretical with ESR Correction}


\addplot[purple, thick] coordinates{
	(100,    0.00178)
	(1000,   0.00752)
	(3000,   0.02139)
	(4000,   0.02931)
	(10000,   0.11089)
	(13000,  0.28515)
	(14500,  0.62136)
	(15600,  0.54369)
	(15900,  0.50485)
	(16200,  0.47379)
	(20000,  0.21386)
	(22000,  0.15534)
	(25000,  0.11683)
	(30000,  0.07921)
	(50000,  0.03883)
	(100000, 0.01942)	
};
\addlegendentry{Experimental Gain Curve}


\addplot[black, dashed, domain=1:100000] {0.707};

\draw[black, dashed] (axis cs:15915,0) -- (axis cs:15915,1.1);
\node[anchor=south, right] at (axis cs:15915,0.90) {$f_c = 15.92$ kHz};

\end{axis}
\end{tikzpicture}
\end{document}
```
