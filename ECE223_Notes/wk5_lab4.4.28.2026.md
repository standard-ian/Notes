# Lab 4: RC Audio Filter with Op-Amp

**Ian Leuty** **Quinn Hathaway**

---

## Table of Contents

- [[#Introduction]]
    - [[#Figure 4.1: Lab 3 Filter]]
    - [[#Equation 4.1]]
    - [[#Equation 4.2]]
- [[#Calculations]]
    - [[#Figure 4.2: Voltage Follower at Filter Output for Unity Gain]]
    - [[#Figure 4.3: Non-Inverting Amplifier at Filter Output for Gain of 2]]
- [[#Experimental Measurements]]
    - [[#Table 4.1: Gain at Varying Frequencies with Voltage Follower]]
    - [[#Table 4.2: Gain at Varying Frequencies with Non-Inverting Amp Designed for a Gain of 2]]
- [[#Test and Simulation Results]]
    - [[#Figure 4.3: Gain vs. f from Table 4.1 and Table 4.2 and the Passive Filter from Lab 3]]
    - [[#Figure 4.4: Experimental Setup for Unity Gain Filter]]
    - [[#Figure 4.5: Experimental Setup for Filter with Gain of 2]]
    - [[#Figure 4.6: Scope Readings at Intended f0 for Unity Gain Filter]]
    - [[#Figure 4.7: Scope Readings at Intended f0 for Filter with Gain of 2]]
- [[#Analysis]]
    - [[#Figure 4.8: LTSpice Schematic and AC Analysis for Filter with Voltage Follower Buffer]]
    - [[#Figure 4.9: LTSpice Schematic and AC Analysis for Filter chained with Non-Inverting Amplifier]]
- [[#Conclusion]]

---

## Introduction

The goal of this lab is to design and implement two active filters based on the RC low pass filter from Lab 3. The first will be designed for a gain of 1 (unity gain) using a voltage follower, and the other design goal will be a gain of 2 using a non-inverting amplifier.

These designs will be verified by taking measurements of $V_1$ and $V_2$ at the same frequencies as in Lab 3, and comparing the results on a single plot. In addition, AC analysis will be performed in LTSpice and compared with the experimental plots.

The original filter designed in Lab 3 is shown below.

### Figure 4.1: Lab 3 Filter

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}
    \draw(0,0)
    node[circ, label=left:$V_1$]{}
    --++(1,0)
    to[R=$750\Omega$]++(2,0)
    --++(1,0)
    node[circ, label=right:$V_2$]{};

    \draw(3,0)
    --++(0,-1)
    to[capacitor, l=$700nF$]++(0,-2)
    node[ground]{};
\end{circuitikz}
\end{document}
```

### Equation 4.1

For a voltage follower:

$$V_{out} = V_{+} \qquad Z_{out} = 0$$

### Equation 4.2

For a non-inverting amplifier, the transfer function is as follows:

$$T(s) = \frac{V_2}{V_1} = \left(1 + \frac{R_2}{R_1}\right)$$

---

## Calculations

### Figure 4.2: Voltage Follower at Filter Output for Unity Gain

```tikz

\usepackage{circuitikz}
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
    \opamp(4,1){TL071};

    \draw(-1,0)
    node[circ, label=left:$V_1$]{}
    --++(1,0)
    to[R=$750\Omega$]++(2,0)
    --++(1,0)
    --(TL071 IN+);

    \draw(2,0)
    --++(0,-1)
    to[capacitor, l=$700nF$]++(0,-2)
    node[ground]{};

    \draw(TL071 OUT)
    --++(0,2)
    --++(-4,0)
    --++(0,-1)
    --(TL071 IN-);

    \draw(TL071 OUT)
    --++(1,0)
    node[circ, label=right:$V_2$]{};

    \draw(TL071 VCC)
    node[ocirc, label=above:$15V$]{};
    \draw(TL071 VEE)
    node[ocirc, label=below:$-15V$]{};
\end{circuitikz}
\end{document}
```

### Figure 4.3: Non-Inverting Amplifier at Filter Output for Gain of 2

```tikz
\usepackage{circuitikz}
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
    \opamp(4,1){TL071};

    \draw(-1,0)
    node[circ, label=left:$V_1$]{}
    --++(1,0)
    to[R=$750\Omega$]++(2,0)
    --++(1,0)
    --(TL071 IN+);

    \draw(2,0)
    --++(0,-1)
    to[capacitor, l=$700nF$]++(0,-2)
    node[ground]{};

    \draw(TL071 OUT)
    --++(0,2)
    --++(-2,0)
    to[R, a=$R_1$]++(-2,0)
    coordinate(BRANCH)
    --++(0,-1)
    --(TL071 IN-);

    \draw(BRANCH)
    to[R, a=$R_1$]++(-2,0)
    node[ground]{};

    \draw(TL071 OUT)
    --++(1,0)
    node[circ, label=right:$V_2$]{};

    \draw(TL071 VCC)
    node[ocirc, label=above:$15V$]{};
    \draw(TL071 VEE)
    node[ocirc, label=below:$-15V$]{};
\end{circuitikz}
\end{document}
```

We selected a value for $R_1$ of $10k\Omega$ because having a larger resistance feedback circuit reduces the overall current that is flowing, decreasing power consumption, and working within the tolerances of the individual circuit components.

Based on **[[#Equation 4.2]]**, using identical resistor values on the non-inverting amplifier will result in a gain of 2.

---

## Experimental Measurements

### Table 4.1: Gain at Varying Frequencies with Voltage Follower

|Frequency $(Hz)$|$V_1$|$V_2$|$\frac{V_2}{V_1}$|
|---|---|---|---|
|50|1.020|1.015|0.995|
|100|1.020|1.015|0.995|
|200|1.040|0.995|0.957|
|300|1.040|0.975|0.938|
|500|1.020|0.895|0.877|
|750|1.000|0.774|0.774|
|1k|1.000|0.675|0.675|
|1.5k|0.980|0.515|0.526|
|2k|0.980|0.415|0.423|
|3k|0.980|0.315|0.321|
|5k|0.960|0.195|0.203|
|10k|0.960|0.115|0.120|

### Table 4.2: Gain at Varying Frequencies with Non-Inverting Amp Designed for a Gain of 2

|Frequency $(Hz)$|$V_1$|$V_2$|$\frac{V_2}{V_1}$|
|---|---|---|---|
|50|1.040|2.015|1.938|
|100|1.040|2.015|1.938|
|200|1.040|1.955|1.880|
|300|1.040|1.895|1.822|
|500|1.020|1.735|1.701|
|750|1.020|1.515|1.485|
|1k|1.000|1.315|1.315|
|1.5k|0.980|1.035|1.056|
|2k|0.980|0.835|0.852|
|3k|0.980|0.595|0.607|
|5k|0.960|0.375|0.391|
|10k|0.960|0.215|0.224|

---

## Test and Simulation Results

### Figure 4.3: Gain vs. $f$ from Table 4.1 and Table 4.2 and the Passive Filter from Lab 3

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
            ylabel={$\frac{V_2}{V_1}$},
            xmin=50, xmax=10000,
            ymin=0, ymax=2,
            grid=both,
            grid style={line width=0.2pt, draw=gray!30},
            major grid style={line width=0.4pt, draw=gray!60},
            samples=200,
        ]
        \addplot[red, opacity=0.5, thick, mark=*, domain=0.1:1000] coordinates{
            (50  , 1.938)
            (100 , 1.938)
            (200 , 1.880)
            (300 , 1.822)
            (500 , 1.701)
            (750 , 1.485)
            (1000  , 1.315)
            (1500, 1.056)
            (2000  , 0.852)
            (3000  , 0.607)
            (5000  , 0.391)
            (10000 , 0.224)
        };
        \addlegendentry{Active, with Non-Inverting Amplifier $k=2$}

        \addplot[blue, opacity=0.5, thick, mark=*, domain=0.1:1000] coordinates{
            (50   , 0.995)
            (100  , 0.995)
            (200  , 0.957)
            (300  , 0.938)
            (500  , 0.877)
            (750  , 0.774)
            (1000 , 0.675)
            (1500 , 0.526)
            (2000 , 0.423)
            (3000 , 0.321)
            (5000 , 0.203)
            (10000, 0.120)
        };
        \addlegendentry{Active, with Voltage Follower}

        \addplot[green, opacity=0.5, thick, mark=*, domain=0.1:1000]
        coordinates{
            (50, 0.8856)
            (100, 0.8856)
            (200, 0.8625)
            (300, 0.8394)
            (500, 0.7618)
            (750, 0.6676)
            (1000, 0.5735)
            (1500, 0.4410)
            (2000, 0.3450)
            (3000, 0.2490)
            (5000, 0.1530)
            (10000, 0.1050)
        };
        \addlegendentry{Passive, from Lab 3}

        %\draw[red, dashed] (axis cs:300, 0) -- (axis cs:300, 1)
%             node[pos=0.5, above, rotate=90, font=\tiny] {Calculated $f_0 = 300Hz$};
%
%         %\draw[blue, dashed] (axis cs:625, 0) -- (axis cs:625, 1)
%             node[pos=0.5, above, rotate=90, font=\tiny] {Actual $f_0$ where $\frac{V_2}{V_1} \approx \frac{1}{\sqrt{2}}$};
%
        \end{semilogxaxis}
    \end{tikzpicture}
    
    \end{document}
```
### Figure 4.4: Experimental Setup for Unity Gain Filter

![[wk5_lab4_images/part1.jpeg]]

### Figure 4.5: Experimental Setup for Filter with Gain of 2

![[wk5_lab4_images/part2.jpeg]]

### Figure 4.6: Scope Readings at Intended $f_0$ for Unity Gain Filter

![[wk5_lab4_images/part1_scope.jpeg]]

### Figure 4.7: Scope Readings at Intended $f_0$ for Filter with Gain of 2

Channel 1 (blue) shows $V_1$, Channel 2 (yellow) shows $V_2$ at the cutoff frequency.

![[wk5_lab4_images/part2_scope.jpeg]]

---

## Analysis

### Figure 4.8: LTSpice Schematic and AC Analysis for Filter with Voltage Follower Buffer

![[wk5_lab4_images/spice_follower.png]]

![[wk5_lab4_images/spice_follower_analysis.png]]

### Figure 4.9: LTSpice Schematic and AC Analysis for Filter chained with Non-Inverting Amplifier

![[wk5_lab4_images/spice_non-inverting.png]]

![[wk5_lab4_images/spice_non-inverting_analysis.png]]

---

## Conclusion

1. With a switch in place to allow for quick switching between the filtered and raw audio signals, both still feeding through the amp, it was very easy to hear the attenuation of higher frequencies.
2. This effect became more pronounced with the non-inverting amplifier, which makes sense, since it exaggerates the difference between the amplitudes of the low and high frequencies after the filter attenuation.
3. This effect is due to increased roll-off seen in **[[#Figure 4.3: Gain vs. f from Table 4.1 and Table 4.2 and the Passive Filter from Lab 3]]**, in the steeper slope of the active filter with non-inverting amplifier.