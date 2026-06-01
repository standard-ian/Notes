# Lab 5: Active Audio Filters for Bass and Treble Boost

**Ian Leuty** **Quinn Hathaway**

---

## Table of Contents

- [[#Introduction]]
    - [[#Equation 5.1 Inverting Amplifier Transfer Function]]
    - [[#Figure 5.1: Generic Active Inverting Amplifier RC Filter]]
- [[#Calculations]]
    - [[#Bass Boosting Filter]]
        - [[#Figure 5.2: Bass Boosting Filter]]
    - [[#Treble Boosting Filter]]
        - [[#Figure 5.3: Treble Boosting Filter Schematic]]
- [[#Experimental Measurements]]
    - [[#Table 5.1 & 5.2: Measurements For Bass Boosting]]
    - [[#Table 5.3 & 5.4: Measurements For Treble Boosting]]
- [[#Test and Simulation Results]]
    - [[#Figure 5.4: Gain Bode Plot of Experimental Frequency Sweep: Bass Boosting Filter]]
    - [[#Figure 5.5: Gain Bode Plot of Experimental Frequency Sweep: Treble Boosting Filter]]
    - [[#Figure 5.6: Experimental Setup]]
    - [[#Figure 5.7: Scope Readings at Pole Frequency for Bass Boosting Filter]]
    - [[#Figure 5.8: Scope Readings at Pole Frequency for Treble Boosting Filter]]
- [[#Analysis]]
    - [[#Figure 5.9: LTSpice Schematic and AC Analysis for Bass Boosting Filter]]
    - [[#Figure 5.10: LTSpice Schematic and AC Analysis for Treble Boosting Filter]]
- [[#Conclusion]]

---

## Introduction

The goal is to design, verify, and construct 2 filters designed to boost bass and treble respectively.

These will be active RC filters designed around an inverting amplifier, and using two parallel RC sections each as $Z_1$ and $Z_2$.

### Equation 5.1 Inverting Amplifier Transfer Function

$$T(s) = -\frac{Z_2}{Z_1}$$

### Figure 5.1: Generic Active Inverting Amplifier RC Filter

```tikz

\def\opamp(#1)#2{%Customized opamp
    \begin{scope}[shift={(#1)}]
    %Component Shape
    \draw[line join=round] (0,0)++(-1,1.5)
        --++(2.5,-1.5) -- ++(-2.5,-1.5)-- cycle; 
    % Label and component identifier.
    \draw(0,0) node{\sf #2}; % IC LABEL
    % Draw the pins
    \draw(-1,1) node [anchor=180]{$-$} -- ++(-0.5,0)  coordinate (#2 IN-); % IN - 
    \draw(-1,-1) node [anchor=180]{$+$}  -- ++(-0.5,0) coordinate (#2 IN+); % IN +
    \draw(1.5,0)  -- ++(0.5,0) coordinate (#2 OUT); % OUT
    % Power supply pins
    \draw(0.25,0.77) -- ++(0,0.5) coordinate (#2 VCC); % VCC
    \draw(0.25,-0.77) -- ++(0,-0.5) coordinate (#2 VEE); % VEE
    \end{scope}
    }
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}
    \opamp(0,0){TL071};

    \draw(TL071 IN+)
    node[ground]{};

    \draw(TL071 IN-)--++(0,2)
    to[generic, l=$Z_1$]++(-2,0)
    node[circ, label=left:$V_1$]{};

    \draw(TL071 IN-)--++(0,2)
    to[generic, a=$Z_2$]++(2,0)
    --++(2,0)--++(0,-3);

    \draw(TL071 OUT)--++(3,0)
    node[circ, label=right:$V_{2}$]{};

    \path(TL071 VCC) node[circ, label=right:$15V$]{};
    \path(TL071 VEE) node[circ, label=right:$-15V$]{};
\end{circuitikz}
\end{document}
```

In this case, since we want a pole and zero term, $Z_n$ is a resistor and capacitor in parallel:

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}
    \draw(0,0)
    --++(1,0)
    --++(0,0.5)
    to[R=$R_n$]++(2,0)
    ++(-2,0)
    --++(0,-1)
    to[capacitor, a=$C_n$]++(2,0)
    --++(0,1)
    ++(0,-0.5)
    --++(1,0);
\end{circuitikz}
\end{document}
```

---

## Calculations

From the transfer function for an **[[#Equation 5.1 Inverting Amplifier Transfer Function]]**, converting to admittance:

$$T(s) = -\frac{Z_2}{Z_1} = -\frac{Y_1}{Y_2} \Longrightarrow T(s) = \frac{Y_1}{Y_2}$$

We'll also disregard the $(-)$ because when working with AC source signals, this will only cause a $180^\circ$ phase shift on the entire output, and the effect is consistently applied and negligible.

### Bass Boosting Filter

We are given the design parameter of using a $0.1\mu F = 100nF$ capacitor.

Also, we should have a low frequency gain of $5 = 20\log(5) \approx 14dB$, a zero at $1kHz$, and a pole at $200Hz$.

To form the transfer function in terms of admittance, we'll want the pole term in the numerator, since when the transfer function is flipped back to impedance, $Z_2$ should be the zero term (numerator).

Additionally, we need frequency in terms of radians, so we'll multiply the corner frequencies by $2\pi$.

$$T(s) = \frac{Y_1}{Y_2} = \frac{s + 1000(2\pi)}{s + 200(2\pi)} \Longrightarrow T(j\omega) = \frac{1000(2\pi)}{200(2\pi)}\frac{j\frac{\omega}{1000(2\pi)} + 1}{j\frac{\omega}{200(2\pi)} + 1} = 5\frac{j\frac{\omega}{1000(2\pi)} + 1}{j\frac{\omega}{200(2\pi)} + 1}$$

We can see this has a low frequency gain of $5$ and the desired cutoff frequencies. Also:

$$Y_1 = s + 1000(2\pi)$$ $$Y_2 = s + 200(2\pi)$$

Using admittance for a resistor/capacitor in parallel, we can find the values of $R$ and $C$:

$$Y_{R||C} = sC + \frac{1}{R}$$

**Numerator: $Y_1$**

$$Y_1 = s + 1000(2\pi)$$

$R_1 = \frac{1}{1000(2\pi)}$, $C_1 = 1$

Scaling for a $100nF$ capacitor, we can use a magnitude scale factor of $10^{7}$ to change the capacitor without shifting the poles or zeros.

$$C_{new} = \frac{C_{old}}{k_m} = \frac{1}{10^{7}} = 0.1\times 10^{-6} = 0.1\mu F = \boxed{100nF}$$

And to scale the resistor:

$$R_{new} = R_{old}(k_m) = 10^7\frac{1}{1000(2\pi)} = 1.592\times 10^3 \approx \boxed{1.6k\Omega}$$

**Denominator: $Y_2$**

$$Y_2 = s + 200(2\pi)$$

$R_2 = \frac{1}{200(2\pi)}$, $C_2 = 1$

With scaling, $C_2$ will also be $100nF$ since the initial calculation has the same pre-scaling value of $1F$. Scaling the resistor:

$$R_{new} = R_{old}(k_m) = 10^7\frac{1}{200(2\pi)} = 7.958\times 10^3 \approx \boxed{8k\Omega}$$

The resulting circuit, showing the $15V$ DC power rails for the TL071 Amp:

#### Figure 5.2: Bass Boosting Filter

```tikz
\def\opamp(#1)#2{%Customized opamp
    \begin{scope}[shift={(#1)}]
    %Component Shape
    \draw[line join=round] (0,0)++(-1,1.5)
        --++(2.5,-1.5) -- ++(-2.5,-1.5)-- cycle; 
    % Label and component identifier.
    \draw(0,0) node{\sf #2}; % IC LABEL
    % Draw the pins
    \draw(-1,1) node [anchor=180]{$-$} -- ++(-0.5,0)  coordinate (#2 IN-); % IN - 
    \draw(-1,-1) node [anchor=180]{$+$}  -- ++(-0.5,0) coordinate (#2 IN+); % IN +
    \draw(1.5,0)  -- ++(0.5,0) coordinate (#2 OUT); % OUT
    % Power supply pins
    \draw(0.25,0.77) -- ++(0,0.5) coordinate (#2 VCC); % VCC
    \draw(0.25,-0.77) -- ++(0,-0.5) coordinate (#2 VEE); % VEE
    \end{scope}
    }
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}
    \opamp(0,0){TL071};

    \draw(TL071 IN+)
    node[ground]{};

    \draw(TL071 IN-)--++(0,2)
    --++(-1,0)
    --++(0,0.5)
    to[R, a=$1.6k\Omega$]++(-2,0)
    ++(2,0)
    --++(0,-1)
    to[capacitor, l=$100nF$]++(-2,0)
    --++(0,1)
    ++(0,-0.5)
    --++(-1,0)
    node[circ, label=left:$V_1$]{};

    \draw(TL071 IN-)--++(0,2)
    --++(1,0)
    --++(0,0.5)
    to[R=$8k\Omega$]++(2,0)
    ++(-2,0)
    --++(0,-1)
    to[capacitor, a=$100nF$]++(2,0)
    --++(0,1)
    ++(0,-0.5)
    --++(1,0)
    --++(2,0)--++(0,-3);

    \draw(TL071 OUT)--++(3,0)
    node[circ, label=right:$V_{2}$]{};

    \path(TL071 VCC) node[circ, label=right:$15V$]{};
    \path(TL071 VEE) node[circ, label=right:$-15V$]{};
\end{circuitikz}
\end{document}
```

### Treble Boosting Filter

We are given the design parameter of using a $10nF$ capacitor.

Also, we should have a low frequency gain of $0.1 = 20\log(0.1)\approx -20dB$, a zero at $1kHz$ and a pole at $10kHz$, returning to unity gain $0dB$ at high frequency within reasonable audible range.

$$T(s) = \frac{Y_1}{Y_2} = \frac{s + 1000(2\pi)}{s + 10000(2\pi)} \Longrightarrow T(j\omega) = \frac{1000(2\pi)}{10000(2\pi)}\frac{j\frac{\omega}{1000(2\pi)}+1}{j\frac{\omega}{10000(2\pi)} + 1} = 0.1\frac{j\frac{\omega}{1000(2\pi)} + 1}{j\frac{\omega}{10000(2\pi)}+1}$$

We can see this has a low frequency gain of $0.1$.

$$Y_1 = s + 1000(2\pi)$$ $$Y_2 = s + 10000(2\pi)$$

$R_1 = \frac{1}{1000(2\pi)}$, $C_1 = 1$

$R_2 = \frac{1}{10000(2\pi)}$, $C_2 = 1$

For a $10nF$ capacitor from a $1F$, $k_m = 10^{8}$.

$$C_{new} = \frac{C_{old}}{k_m} = \frac{1}{10^{8}} = 1\times 10^{-8} = 0.01\mu F = \boxed{10nF}$$

$$R_{new} = R_{old}(k_m) = 10^8\frac{1}{1000(2\pi)} = 1.592\times 10^4 \approx \boxed{16k\Omega}$$

As before, $C_1 = C_2$, and for $R_2$:

$$R_{new} = R_{old}(k_m) = 10^8\frac{1}{10000(2\pi)} = 1.592\times 10^3 \approx \boxed{1.6k\Omega}$$

The resulting circuit, showing the $15V$ DC power rails for the TL071 Amp:

#### Figure 5.3: Treble Boosting Filter Schematic

```tikz
\def\opamp(#1)#2{%Customized opamp
    \begin{scope}[shift={(#1)}]
    %Component Shape
    \draw[line join=round] (0,0)++(-1,1.5)
        --++(2.5,-1.5) -- ++(-2.5,-1.5)-- cycle; 
    % Label and component identifier.
    \draw(0,0) node{\sf #2}; % IC LABEL
    % Draw the pins
    \draw(-1,1) node [anchor=180]{$-$} -- ++(-0.5,0)  coordinate (#2 IN-); % IN - 
    \draw(-1,-1) node [anchor=180]{$+$}  -- ++(-0.5,0) coordinate (#2 IN+); % IN +
    \draw(1.5,0)  -- ++(0.5,0) coordinate (#2 OUT); % OUT
    % Power supply pins
    \draw(0.25,0.77) -- ++(0,0.5) coordinate (#2 VCC); % VCC
    \draw(0.25,-0.77) -- ++(0,-0.5) coordinate (#2 VEE); % VEE
    \end{scope}
    }
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}
    \opamp(0,0){TL071};

    \draw(TL071 IN+)
    node[ground]{};

    \draw(TL071 IN-)--++(0,2)
    --++(-1,0)
    --++(0,0.5)
    to[R, a=$16k\Omega$]++(-2,0)
    ++(2,0)
    --++(0,-1)
    to[capacitor, l=$10nF$]++(-2,0)
    --++(0,1)
    ++(0,-0.5)
    --++(-1,0)
    node[circ, label=left:$V_1$]{};

    \draw(TL071 IN-)--++(0,2)
    --++(1,0)
    --++(0,0.5)
    to[R=$1.6k\Omega$]++(2,0)
    ++(-2,0)
    --++(0,-1)
    to[capacitor, a=$10nF$]++(2,0)
    --++(0,1)
    ++(0,-0.5)
    --++(1,0)
    --++(2,0)--++(0,-3);

    \draw(TL071 OUT)--++(3,0)
    node[circ, label=right:$V_{2}$]{};

    \path(TL071 VCC) node[circ, label=right:$15V$]{};
    \path(TL071 VEE) node[circ, label=right:$-15V$]{};
\end{circuitikz}
\end{document}
```

---

## Experimental Measurements

### Table 5.1 & 5.2: Measurements For Bass Boosting

**Table 5.1:** Experimental AC Analysis for Gain of Bass Boosting Filter

|Frequency $(Hz)$|$V_1$|$V_2$|$\frac{V_2}{V_1}$|$20\log\left(\frac{V_2}{V_1}\right)\ (dB)$|
|---|---|---|---|---|
|10|0.84|3.92|4.6667|13.3801|
|50|1.04|4.76|4.5769|13.2115|
|100|1.04|4.76|4.5769|13.2115|
|150|1.04|4.72|4.5385|13.1382|
|200|1.04|4.64|4.4615|12.9897|
|300|1.04|4.48|4.3077|12.6849|
|400|1.04|4.24|4.0769|12.2067|
|500|1.04|4.04|3.8846|11.7870|
|1000|1.04|3.28|3.1538|9.9768|
|1500|1.04|2.96|2.8462|9.0852|
|2000|1.04|2.80|2.6923|8.6025|
|3000|1.04|2.68|2.5769|8.2220|
|4000|1.04|2.64|2.5385|8.0914|
|5000|1.04|2.60|2.5000|7.9588|
|10000|1.00|2.48|2.4800|7.8890|
|20000|0.88|2.24|2.5455|8.1153|
|30000|0.76|1.96|2.5789|8.2288|
|50000|0.60|1.52|2.5333|8.0738|
|100000|0.36|0.96|2.6667|8.5194|

**Table 5.2:** Experimental AC Analysis, MSO Bode Plot Sweep

|Frequency $(Hz)$|Gain $(dB)$|Phase ($°$)|
|---|---|---|
|100.00|13.579|174.87|
|126.90|13.538|173.56|
|161.00|13.416|172.05|
|204.30|13.257|170.28|
|259.30|13.016|168.33|
|329.00|12.695|166.30|
|417.50|12.273|164.41|
|529.80|11.712|163.11|
|672.30|11.116|162.14|
|853.20|10.498|162.16|
|1082.6|9.919|163.14|
|1373.8|9.389|164.71|
|1743.3|9.009|166.65|
|2212.2|8.705|168.73|
|2807.2|8.498|170.50|
|3562.2|8.355|172.23|
|4520.4|8.282|173.55|
|5736.2|8.204|174.64|
|7279.0|8.208|175.38|
|9236.7|8.236|175.85|
|11721|8.241|176.04|
|14874|8.304|175.96|
|18874|8.416|175.55|
|23950|8.581|174.79|
|30392|8.774|173.56|
|38566|9.155|171.38|
|48939|9.690|168.47|
|62102|10.522|164.05|
|78805|11.793|156.60|
|100000|13.769|142.94|

### Table 5.3 & 5.4: Measurements For Treble Boosting

**Table 5.3:** Experimental AC Analysis for Gain of Treble Boosting Filter

|Frequency $(Hz)$|$V_1$|$V_2$|$\frac{V_2}{V_1}$|$20\log\left(\frac{V_2}{V_1}\right)\ (dB)$|
|---|---|---|---|---|
|500|1.08|0.16|0.1481|-16.5861|
|1000|1.08|0.20|0.1852|-14.6479|
|1500|1.08|0.24|0.2222|-13.0643|
|2000|1.08|0.28|0.2593|-11.7253|
|2500|1.08|0.36|0.3333|-9.5424|
|3000|1.08|0.40|0.3704|-8.6273|
|4000|1.08|0.48|0.4444|-7.0437|
|5000|1.08|0.60|0.5556|-5.1055|
|6000|1.08|0.80|0.7407|-2.6067|
|8000|1.08|0.80|0.7407|-2.6067|
|10000|1.08|0.88|0.8148|-1.7788|
|13000|1.08|1.00|0.9259|-0.6685|
|15000|1.08|1.04|0.9630|-0.3278|
|20000|1.08|1.12|1.0370|0.3159|

**Table 5.4:** Experimental AC Analysis for Treble Boosting Filter, MSO Bode Plot Sweep

|Frequency $(Hz)$|Gain $(dB)$|Phase ($°$)|
|---|---|---|
|529.8|-18.325|-151.13|
|672.3|-17.597|-145.68|
|853.2|-16.694|-139.98|
|1082.6|-15.562|-134.66|
|1373.8|-14.194|-129.95|
|1743.3|-12.668|-126.28|
|2212.2|-11.021|-123.98|
|2807.2|-9.278|-123.09|
|3562.2|-7.583|-123.58|
|4520.4|-5.913|-125.64|
|5736.2|-4.326|-128.99|
|7279.0|-2.889|-133.61|
|9236.7|-1.669|-139.08|
|11721|-0.649|-145.11|
|14874|0.094|-151.23|
|18874|0.683|-157.17|

---

## Test and Simulation Results

### Figure 5.4: Gain Bode Plot of Experimental Frequency Sweep: Bass Boosting Filter from Table 5.2 Data


```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
        \begin{semilogxaxis}[
            legend pos=south west,
            legend style={font=\footnotesize},
            width=0.9\linewidth,
            height=10cm,
            xlabel={Frequency ($Hz$)},
            ylabel={$20\log\left(\frac{V_2}{V_1}\right)$ $(dB)$},
            xmin=100, xmax=10000,
            ymin=5, ymax=15,
            grid=both,
            grid style={line width=0.2pt, draw=gray!30},
            major grid style={line width=0.4pt, draw=gray!60},
            samples=200,
        ]
        \addplot[red, opacity=0.5, thick, mark=*, domain=0.1:10000] coordinates{
        (100,		13.5790) 
        (126.9,		13.538)
        (161,		13.4160)
        (204.3,		13.257)
        (259.3,		13.016)
        (329,		12.6950)
        (417.5,		12.273)
        (529.8,		11.712)
        (672.3,		11.116)
        (853.2,		10.498)
        (1082.6,	9.9191)
        (1373.8,	9.3891)
        (1743.3,	9.0088)
        (2212.2,	8.7046)
        (2807.2,	8.4982)
        (3562.2,	8.3545)
        (4520.4,	8.2817)
        (5736.2,	8.2042)
        (7279,		8.2076)
        (9236.7,	8.2361)
        (11721,		8.2412)
        (14874,		8.3044)
        (18874,		8.4164)
        (23950,		8.5806)
        (30392,		8.7743)
        (38566,		9.1553)
        (48939,		9.6899)
        (62102,		10.522)
        (78805,		11.793)
        (100000,	13.769)            
        };
        \addlegendentry{Bass Boosting}
        \end{semilogxaxis}
    \end{tikzpicture}
\end{document}
```
### Figure 5.5: Gain Bode Plot of Experimental Frequency Sweep: Treble Boosting Filter from Table 5.4 Data

```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
        \begin{semilogxaxis}[
            legend pos=south west,
            legend style={font=\footnotesize},
            width=0.9\linewidth,
            height=10cm,
            xlabel={Frequency ($Hz$)},
            ylabel={$20\log\left(\frac{V_2}{V_1}\right)$ $(dB)$},
            xmin=500, xmax=10000,
            ymin=-20, ymax=1,
            grid=both,
            grid style={line width=0.2pt, draw=gray!30},
            major grid style={line width=0.4pt, draw=gray!60},
            samples=200,
        ]

        \addplot[blue, opacity=0.5, thick, mark=*, domain=0.1:10000] coordinates{
        (529.8, -18.325)      
        (672.3, -17.597)
        (853.2, -16.694)
        (1082.6, -15.562)
        (1373.8, -14.194)
        (1743.3, -12.668)
        (2212.2, -11.021)
        (2807.2, -9.2781)
        (3562.2, -7.5829)
        (4520.4, -5.9130)
        (5736.2, -4.3257)
        (7279.0, -2.8887)
        (9236.7, -1.6691)
        (11721.0, -0.6485)
        (14874.0, 0.09352)
        (18874.0, 0.68322)
        };
        \addlegendentry{Treble Boosting}

        \end{semilogxaxis}
    \end{tikzpicture}
\end{document}
```
### Figure 5.6: Experimental Setup

![[wk6_lab5_images/board.jpeg]]

### Figure 5.7: Scope Readings at Pole Frequency for Bass Boosting Filter with MSO Generated Bode Plot

![[wk6_lab5_images/bass_scope.png]]

### Figure 5.8: Scope Readings at Pole Frequency for Treble Boosting Filter with MSO Generated Bode Plot

![[wk6_lab5_images/treble_scope.png]]

---

## Analysis

### Figure 5.9: LTSpice Schematic and AC Analysis for Bass Boosting Filter

![[wk6_lab5_images/spice_bass.png]]

![[wk6_lab5_images/spice_bass_analysis.png]]

### Figure 5.10: LTSpice Schematic and AC Analysis for Treble Boosting Filter

![[wk6_lab5_images/spice_treble.png]]

![[wk6_lab5_images/spice_treble_analysis.png]]

---

## Conclusion

1. The treble boosting filter boosted the audio signal for frequencies above $\approx 1kHz$. Unity was designed to be around $10kHz$, so for some songs, with less very high frequency treble tones, the effect was less noticeable.
2. The bass boosting filter had noticeable audible effect, boosting the gain of the entire signal and significantly boosting frequencies below $1kHz$.
3. The input impedance of the laptop sound card may have had an effect on the high frequency gain of the bass boosting filter. While the experimental DC gain **was** approximately $14dB$, the high frequency gain of the realized filter was closer to $8dB$, when the simulation in **[[#Figure 5.9: LTSpice Schematic and AC Analysis for Bass Boosting Filter]]** suggests a gain of $0dB$ around $10kHz$.
4. Using the MSO's Bode Plot feature with the internal AFG resulted in more consistent frequency sweep than using the external AFG and manually recording data.