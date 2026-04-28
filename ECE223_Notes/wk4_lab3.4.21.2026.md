# Lab 3: RC Audio Filter Design and Verification

**Ian Leuty** **Quinn Hathaway**

---

## Table of Contents

- [[#Introduction]]
    - [[#Figure 3.1: Low Pass Filter Topology]]
    - [[#Equation 3.1]]
    - [[#Equation 3.2]]
- [[#Calculations]]
    - [[#Figure 3.3: Schematic]]
- [[#Experimental Measurements]]
    - [[#Figure 3.4: Image of Filter Design on Breadboard]]
    - [[#Figure 3.5: Scope Screencapture at 300Hz]]
    - [[#Table 3.1: Gain at Varying Frequencies]]
    - [[#Figure 3.6: Plot of Gain vs. f from Table 3.1]]
- [[#Test and Simulation Results]]
    - [[#Figure 3.7: LT Spice Schematic]]
- [[#Analysis]]
    - [[#Figure 3.8: LT Spice AC Analysis]]
- [[#Conclusion]]

---

## Introduction

The goal is to design a Low-Pass RC Filter with a corner frequency that will attenuate high frequencies of a song or audio recording.

Below is the basic topology of a single stage RC filter.

### Figure 3.1: Low Pass Filter Topology

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}
    \draw(0,0)
    node[circ, label=left:$V_1$]{}
    to[R=$R$]++(2,0)
    --++(1,0)
    node[circ, label=right:$V_2$]{}
    ++(-1,0)
    to[capacitor, l=$C$]++(0,-2)
    node[ground]{};
\end{circuitikz}
\end{document}
```

### Equation 3.1

The transfer function of the above circuit can be found as follows:

$$T(s) = \frac{V_2}{V_1} = \frac{\frac{1}{sC}}{R + \frac{1}{sC}} = \frac{1}{sRC + 1} = \frac{\frac{1}{RC}}{s + \frac{1}{RC}}$$

### Equation 3.2

Cutoff frequency in $\text{Hz}$ in terms of $R$ and $C$ is derived from Equation 3.1 as follows:

$$T(j\omega) = \frac{\frac{1}{RC}}{j\omega + \frac{1}{RC}} = \frac{1}{1 + j\omega RC}$$

For corner at $-3\text{dB} = 20\log_{10}\left(\frac{1}{\sqrt{2}}\right) = \frac{|1|}{|1 + j\omega RC|}$:

$$\Longrightarrow 1 = |j\omega RC| \Longrightarrow \omega = \frac{1}{RC} \Longrightarrow f_0 = \frac{1}{2\pi RC}$$

$$f_0 = \frac{1}{2\pi RC}$$

---

## Calculations

In order to determine a filtering resistance $R_F$ we will use the impedances gathered in Lab 2, along with the following computations for output impedance of a single stage low pass filter.

Starting from the input impedance of the USB-C audio adapter and output impedance of the smart phone:

**Output Impedance of Smart Phone:** $0.7\Omega$

**Input Impedance of Audio Adapter:** $7.5k\Omega$

The output impedance of the RC filter is found looking back into the filter from the output $V_2$ with the sources removed:

### Figure 3.2: Output Impedance of Filter

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}
    \draw(0,0)
    node[circ, label=right:$V_2$]{}
    --++(-1,0)
    to[R=$R$]++(-2,0)
    node[ground]{}
    ++(2,0)
    to[capacitor, l=$C$]++(0,-2)
    node[ground]{};
\end{circuitikz}
\end{document}
```

$$Z_{out} = \frac{R\times\frac{1}{j\omega C}}{R + \frac{1}{j\omega C}} = \frac{\frac{R}{j\omega C}}{R + j\omega RC} = \frac{R}{1 + j\omega RC}$$

From the above, we can see that the worst case impedance will be when $\omega$ is very small, and $Z_L = R_F$.

Since the input impedance of the driven component, the audio adapter, is $7.5k\Omega$, we should design the output impedance of our filter to be $\approx \frac{1}{10}$ of this. Since in the worst case $Z_{out} = R_F$, $R_F$ should be $\leq 750\Omega$.

We want a low pass filter, with a cutoff frequency of $300\text{Hz}$.

From Equation 3.2, an $R$ of $750\Omega$, and a desired cutoff frequency of $300\text{Hz}$:

$$C = \frac{1}{2\pi(300)(750)} \approx 0.7\mu\text{F} = 700\text{nF}$$

So we can construct this filter using a $750\Omega$ resistor and 7 $100\text{nF}$ capacitors in parallel, to satisfy the design requirements, and since we are limited by a certain selection of capacitors.

### Figure 3.3: Schematic

$C_1 = 100\text{nF}$

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american]
    \draw(0,0)
    to[sV, l=$V_{in}$]++(0,2)
    to[R=$750\Omega$]++(2,0)--++(9,0)
    --++(2,0)
    node[circ, label=right:$V_{out}$]{}
    ++(-1.5,0)
    to[capacitor, l=$C_1$]++(0,-2)++(0,2)
    ++(-1.5,0)
    to[capacitor, l=$C_1$]++(0,-2)++(0,2)
    ++(-1.5,0)
    to[capacitor, l=$C_1$]++(0,-2)++(0,2)
    ++(-1.5,0)
    to[capacitor, l=$C_1$]++(0,-2)++(0,2)
    ++(-1.5,0)
    to[capacitor, l=$C_1$]++(0,-2)++(0,2)
    ++(-1.5,0)
    to[capacitor, l=$C_1$]++(0,-2)++(0,2)
    ++(-1.5,0)
    to[capacitor, l=$C_1$]++(0,-2)
    --++(9,0)++(-9,0)--(0,0);
\end{circuitikz}
\end{document}
```

**_Equivalently..._**

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american]
    \draw(0,0)
    node[circ, label=left:$V_{in}$]{}
    to[R=$750\Omega$]++(2,0)
    --++(2,0)
    node[circ, label=right:$V_{out}$]{}
    ++(-1.5,0)
    to[capacitor, l=$700nF$]++(0,-2)
    node[ground]{};
\end{circuitikz}
\end{document}
```

Starting Schematic for $300\text{Hz}$ RC Filter with $750\Omega$ Output Impedance at Resonance

---

## Experimental Measurements

### Figure 3.4: Image of Filter Design on Breadboard

![[wk4_lab3_images/filter1.jpg]]

### Figure 3.5: Scope Screencapture at $300\text{Hz}$

Channel 1 shows the voltage of the filter output, Channel 2 shows the input voltage. This image is at a frequency of $300\text{Hz}$, and we can see the gain is a bit over $\frac{1}{\sqrt{2}}$.

![[wk4_lab3_images/filter_scope.jpg]]

### Table 3.1: Gain at Varying Frequencies

| Frequency $(Hz)$ | $V_1$ | $V_2$ | $\frac{V_2}{V_1}$ |
| ---------------- | ----- | ----- | ----------------- |
| 50               | 1.040 | 0.921 | 0.8856            |
| 100              | 1.040 | 0.921 | 0.8856            |
| 200              | 1.040 | 0.897 | 0.8625            |
| 300              | 1.040 | 0.873 | 0.8394            |
| 500              | 1.020 | 0.777 | 0.7618            |
| 750              | 1.020 | 0.681 | 0.6676            |
| 1k               | 1.020 | 0.585 | 0.5735            |
| 1.5k             | 1.000 | 0.441 | 0.4410            |
| 2k               | 1.000 | 0.345 | 0.3450            |
| 3k               | 1.000 | 0.249 | 0.2490            |
| 5k               | 1.000 | 0.153 | 0.1530            |
| 10k              | 1.000 | 0.105 | 0.1050            |

### Figure 3.6: Plot of Gain vs. $f$ from Table 3.1

![[wk4_lab3_images/gain_plot.jpg]]

---

## Test and Simulation Results

To verify our circuit and calculations, we constructed the low pass filter circuit in LTSpice and ran a decade AC analysis from $10\text{Hz}$ to $10\text{kHz}$ with samples every $100\text{Hz}$ (`.ac dec 100 10 100k`).

We can see the cutoff frequency at $-3\text{dB}$ is right around the target cutoff of $300\text{Hz}$ on the solid red line. The phase angle is also included as the dashed red line.

### Figure 3.7: LT Spice Schematic

![[wk4_lab3_images/ltspice_filter.jpg]]

---

## Analysis

Shown below is the computational analysis of our design, performed in LTSpice.

### Figure 3.8: LT Spice AC Analysis

![[wk4_lab3_images/ltspice_freq_analysis.jpg]]

---

## Conclusion

1. Our actual cutoff frequency is $\approx 600\text{Hz}$, $300\text{Hz}$ above our intended cutoff.
2. There was not an audible difference in volume when sweeping frequencies, but when examining the gain on an oscilloscope there is a visible attenuation as can be seen in Table 3.1.