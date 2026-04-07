# ECE223L-002 Spring 2026 Lab 1: LT Spice

**Ian Leuty** **Quinn Hathaway**

---

## Table of Contents

- [[#Introduction]]
- [[#Initial Schematics]]
    - [[#Circuit 1]]
    - [[#Circuit 2]]
    - [[#Circuit 3]]
- [[#Experimental Measurements]]
    - [[#Circuit 1 DC Operating Point Simulation Results]]
    - [[#Circuit 2 DC Operating Point Simulation Results]]
    - [[#Circuit 3 LT Spice Transient Simulation Plot]]
- [[#Simulation Results]]
    - [[#Circuit 1 Results]]
    - [[#Circuit 2 Results]]
    - [[#Circuit 3 Results]]
- [[#Analysis]]
    - [[#FFT Analysis For Circuit 3]]
    - [[#AC Analysis]]
- [[#Conclusion]]

---

## Introduction

The main purpose of this lab is to become familiar with the basic capabilities of LT Spice, and how it can be used to draw and analyze circuits. The plan is to run several DC Operating Point simulations with a few different circuits of resistors, as well as voltage and current sources.

Additionally, transient simulation, FFT analysis, and AC analysis will be performed on **Circuit 3**.

---

## Initial Schematics

Since all calculations are done in LTSpice for this lab, the calculations section details the initial plan for each of the three main circuits.

### Circuit 1

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american]
    \draw(0,0)
    to[R=$5\Omega$]++(0,2)
    node[circ, label=left:$A$]{}
    to[R=$7 \Omega$, i_>=$i_1$]++(3,0)
    to[vsource, V=$31V$]++(0,-2)++(0,2)
    to[R=$11 \Omega$, i_>=$i_2$]++(3,0)
    node[circ, label=right:$B$]{}
    to[R=$3 \Omega$]++(0,-2)++(0,2)--++(0,2)
    to[R=$1 \Omega$, i<_=$i_3$]++(-6,0)--++(0,-2)++(0,-2)--++(6,0)
    node[ground, scale=2]{};
\end{circuitikz}
\end{document}
```

### Circuit 2

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american]
    \draw(0,0)
    to[R=$5 \Omega$]++(0,2)
    node[circ, label=left:$v_1$]{}
    to[vsource, i>_=$i_s$, V=$10V$]++(3,0)
    node[circ, label=above right:$v_2$]{}
    to[R=$10 \Omega$]++(0,-2)++(0,2)--++(2,0)
    to[isource, l=$1A$, invert]++(0,-2)
    node[ground, scale=2]{}--++(-5,0)++(0,2)--++(0,2)
    to[R=$5 \Omega$]++(3,0)--++(0,-2);
\end{circuitikz}
\end{document}
```

### Circuit 3

AC Sine wave with 0 DC offset (default), $1V$ amplitude, and $1\text{kHz}$ frequency.

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american]
    \draw(0,0)
    to[sV, invert, a=$V_1$, l=$SINE(0\ 1\ 1000)$]++(0,2)
    to[R=$R_1 {=} 5 \Omega$]++(2,0)
    to[R=$R_3 {=} 10 \Omega$]++(0,-2)++(0,2)
    to[R=$R_2 {=} 15 \Omega$]++(2,0)
    to[R=$R_4 {=} 20 \Omega$]++(0,-2)
    node[ground, scale=2]{}--++(-4,0);
\end{circuitikz}
\end{document}
```

---

## Experimental Measurements

### Circuit 1 DC Operating Point Simulation Results

| Node/Device    | Voltage (V) | Current (A) |
| -------------- | ----------- | ----------- |
| A              | 10          | ---         |
| B              | 9           | ---         |
| $I_{1\Omega}$  | ---         | -1          |
| $I_{3\Omega}$  | ---         | 3           |
| $I_{5\Omega}$  | ---         | -2          |
| $I_{7\Omega}$  | ---         | -3          |
| $I_{11\Omega}$ | ---         | 2           |

### Circuit 2 DC Operating Point Simulation Results

$$v_1 = 6.67\text{ V}$$

$$v_2 = -3.34\text{ V}$$

$$i_s = -3.34\text{ A}$$

### Circuit 3 LT Spice Transient Simulation Plot

The following screenshot from LTSpice shows the plot of voltage in $V_1$ (green line) and the current in $R_1$ (blue line).

![[wk1_lab1_images/transient_plot.jpeg]]

The signals are in phase. It is worth noting that they were $180^\circ$ out of phase until the resistor was rotated $180^\circ$.

---

## Simulation Results

### Circuit 1 Results

![[wk1_lab1_images/circuit1.jpeg]]

### Circuit 2 Results

![[wk1_lab1_images/circuit2.jpeg]]

### Circuit 3 Results

![[wk1_lab1_images/circuit3.jpeg]]

#### Changing Plot Settings

- Clicked the hammer icon and edited the line thickness.
- Changed the color of the plot lines.
- Left clicked the plot, went to the View menu, and added data points.

![[wk1_lab1_images/transient_plot_settings.jpeg]]

---

## Analysis

### FFT Analysis For Circuit 3

The circuit was modified by adding an AC source with magnitude 1 and frequency of $2\text{kHz}$.

#### Planned Update to Circuit

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american]
    \draw(0,0)
    to[sV, invert, a=$V_1$, l=$SINE(0\ 1\ 1000)$]++(0,2)
    to[R=$R_1 {=} 5 \Omega$]++(2,0)
    to[R=$R_3 {=} 10 \Omega$]++(0,-2)++(0,2)
    to[R=$R_2 {=} 15 \Omega$]++(2,0)
    to[R=$R_4 {=} 20 \Omega$]++(0,-2)
    to[sV, invert, a=$V_2$, l=$SINE(0\ 1\ 2000)$]++(-2,0)--++(-1,0)
    node[ground, scale=2]{}--++(-1,0);
\end{circuitikz}
\end{document}
```

#### Updated LTSpice Schematic

![[wk1_lab1_images/fft_changes_circuit.jpeg]]

#### FFT Analysis Results

![[wk1_lab1_images/fft_changes_plot.jpeg]]

### AC Analysis

The plan for this analysis is to use the original **Circuit 3** and change $R_4$ to a $1\text{mF}$ capacitor.

#### Planned Update to Circuit

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american]
    \draw(0,0)
    to[sV, invert, a=$V_1$, l=$SINE(0\ 1\ 1000)$]++(0,2)
    to[R=$R_1 {=} 5 \Omega$]++(2,0)
    to[R=$R_3 {=} 10 \Omega$]++(0,-2)++(0,2)
    to[R=$R_2 {=} 15 \Omega$]++(3,0)
    to[capacitor, l=$1mF$]++(0,-2)
    node[ground, scale=2]{}--++(-5,0);
\end{circuitikz}
\end{document}
```

#### Updated LTSpice Schematic

![[wk1_lab1_images/fft_changes_circuit_cap.jpeg]]

#### Simulation Results

Simulate $1\text{Hz}$ to $10\text{kHz}$ sweep with 10 points per decade. Find maximum voltage (in $\text{dB}$) and cutoff frequency using cursors.

$$V_{C_{MAX}} = -3.59\text{ dB}$$

![[wk1_lab1_images/ac_analysis_max.jpeg]]

Cutoff Frequency: $8.65\text{ Hz}$

![[wk1_lab1_images/ac_analysis_freq.jpeg]]

---

## Conclusion

1. LTSpice provides a much quicker method of analyzing all currents and voltages in a circuit, especially as circuits become increasingly complicated.
2. The suite of analysis tools are powerful, allowing types of analysis that yield rich high-level information with customizable plots.
3. The user interface is not always intuitive and takes practice. Mac and Windows interfaces vary greatly.
4. In the first two circuits, getting the DC operating point analysis working took some effort. Current values would sometimes be inverted depending on the orientation of the resistor.
5. In the transient analysis, the signals were initially $180^\circ$ out of phase. This was likely because the current was being interpreted by the software in the opposite direction. Flipping the resistor in the LTSpice schematic resolved this.
6. In the FFT analysis, the larger peak at $1\text{kHz}$ was observed, as well as a smaller peak near $2\text{kHz}$, consistent with the second source frequency.