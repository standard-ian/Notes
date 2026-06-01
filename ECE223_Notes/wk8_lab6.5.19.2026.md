# Lab 6: Cascaded Active Audio Filters

**Ian Leuty** **Quinn Hathaway**

---

## Table of Contents

- [[#Introduction]]
    - [[#Equation 6.1]]
    - [[#Figure 6.1: Second Order Filter from Cascaded Bass into Treble Filters]]
- [[#Calculations]]
- [[#Experimental Measurements]]
    - [[#Table 6.1 & 6.2: Measurements for Circuits 1 & 2]]
- [[#Test and Simulation Results]]
    - [[#Figure 6.2: Gain Bode Plot of Experimental Frequency Sweep: Circuit 1]]
    - [[#Figure 6.3: Gain Bode Plot of Experimental Frequency Sweep: Circuit 2]]
    - [[#Figure 6.4: Experimental Setup]]
    - [[#Figure 6.5: Faulty 100nF Capacitor]]
    - [[#Figure 6.6: Scope Readings for Circuit 1 with MSO Generated Bode Plot]]
    - [[#Figure 6.7: Scope Readings for Circuit 2 with MSO Generated Bode Plot]]
- [[#Analysis]]
    - [[#Figure 6.8: LTSpice Schematic and AC Analysis Circuit 1]]
    - [[#Figure 6.9: LTSpice Schematic and AC Analysis Circuit 2]]
- [[#Conclusion]]

---

## Introduction

### Equation 6.1

$$T(s) = T_1(s) \times T_2(s) = -\frac{Z_2}{Z_1} \times -\frac{Z_2}{Z_1}$$

### Figure 6.1: Second Order Filter from Cascaded Bass into Treble Filters

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
\begin{circuitikz}[scale=1]
    \opamp(0,0){BASS};

    \draw(BASS IN+)
    node[ground]{};

    \draw(BASS IN-)--++(0,2)
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

    \draw(BASS IN-)--++(0,2)
    --++(1,0)
    --++(0,0.5)
    to[R=$8k\Omega$]++(2,0)
    ++(-2,0)
    --++(0,-1)
    to[capacitor, a=$100nF$]++(2,0)
    --++(0,1)
    ++(0,-0.5)
    --++(1,0)--++(0,-3);

    \path(BASS VCC) node[circ, label=right:$15V$]{};
    \path(BASS VEE) node[circ, label=right:$-15V$]{};

    \opamp(8,-3){TREBLE};

    \draw(TREBLE IN+)
    node[ground]{};

    \draw(TREBLE IN-)--++(0,2)
    --++(-1,0)
    --++(0,0.5)
    to[R, a=$16k\Omega$]++(-2,0)
    ++(2,0)
    --++(0,-1)
    to[capacitor, l=$10nF$]++(-2,0)
    --++(0,1)
    ++(0,-0.5)
    --++(-1,0)
    coordinate(TREBLE_IN);

    \draw(TREBLE IN-)--++(0,2)
    --++(1,0)
    --++(0,0.5)
    to[R=$1.6k\Omega$]++(2,0)
    ++(-2,0)
    --++(0,-1)
    to[capacitor, a=$10nF$]++(2,0)
    --++(0,1)
    ++(0,-0.5)
    --++(1,0)--++(0,-3);

    \draw(TREBLE OUT)--++(1,0)
    node[circ, label=right:$V_{2}$]{};

    \path(TREBLE VCC) node[circ, label=right:$15V$]{};
    \path(TREBLE VEE) node[circ, label=right:$-15V$]{};

    \draw(BASS OUT)--(TREBLE_IN);
\end{circuitikz}
\end{document}
```

---

## Calculations

---

## Experimental Measurements

### Table 6.1 & 6.2: Measurements for Circuits 1 & 2

**Table 6.1:** Experimental AC Analysis, MSO Bode Plot Sweep

|Frequency $(Hz)$|Gain $(dB)$|Phase ($°$)|
|---|---|---|
|52.200|-6.450|-8.959|
|66.100|-6.627|-11.049|
|83.800|-6.886|-13.407|
|106.100|-7.261|-15.942|
|134.300|-7.753|-18.388|
|170.100|-8.396|-20.433|
|215.400|-9.229|-21.668|
|272.800|-10.117|-21.545|
|345.500|-11.115|-19.565|
|437.500|-12.019|-15.596|
|554.100|-12.762|-9.573|
|701.700|-13.244|-1.829|
|888.600|-13.339|7.037|
|1125.300|-13.049|16.178|
|1425.100|-12.341|24.824|
|1804.700|-11.314|32.310|
|2285.500|-10.016|38.091|
|2894.300|-8.542|41.974|
|3665.200|-6.994|43.836|
|4641.600|-5.444|43.797|
|5878.000|-3.942|41.851|
|7443.800|-2.567|38.415|
|9426.700|-1.410|33.798|
|11938.000|-0.437|28.400|
|15118.000|0.337|22.585|
|19145.000|1.005|16.696|
|24245.000|1.575|10.911|
|30703.000|2.189|4.998|
|38882.000|3.037|-1.398|
|49239.000|4.463|-9.725|
|62355.000|7.934|-27.148|
|78965.000|12.522|-86.084|
|100000.000|9.111|-149.090|

**Table 6.2:** Zero Adjustment Filter, MSO Bode Plot Sweep

|Frequency $(Hz)$|Gain $(dB)$|Phase ($°$)|
|---|---|---|
|52.200|-6.749|-8.620|
|66.100|-6.933|-10.668|
|83.800|-7.160|-12.951|
|106.100|-7.528|-15.415|
|134.300|-7.987|-17.852|
|170.100|-8.650|-19.890|
|215.400|-9.417|-21.005|
|272.800|-10.333|-20.815|
|345.500|-11.290|-18.806|
|437.500|-12.188|-14.767|
|554.100|-12.914|-8.643|
|701.700|-13.357|-0.874|
|888.600|-13.451|8.017|
|1125.300|-13.099|17.188|
|1425.100|-12.381|25.781|
|1804.700|-11.292|33.133|
|2285.500|-9.957|38.803|
|2894.300|-8.487|42.564|
|3665.200|-6.923|44.252|
|4641.600|-5.383|44.089|
|5878.000|-3.900|42.118|
|7443.800|-2.518|38.616|
|9426.700|-1.358|33.849|
|11938.000|-0.372|28.374|
|15118.000|0.418|22.580|
|19145.000|1.030|16.724|
|24245.000|1.632|10.865|
|30703.000|2.230|5.000|
|38882.000|3.052|-1.388|
|49239.000|4.449|-9.668|
|62355.000|7.928|-27.177|
|78965.000|12.489|-86.059|
|100000.000|9.094|-148.960|

---

## Test and Simulation Results

### Figure 6.2: Gain Bode Plot of Experimental Frequency Sweep: Circuit 1 from Table 6.1 Data


```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
        \begin{semilogxaxis}[
            legend pos=south west,
            legend style={font=\footnotesize},
            width=\linewidth,
            minor y tick num=8,
            height=13cm,
            xlabel={Frequency ($Hz$)},
            ylabel={$20\log\left(\frac{V_2}{V_1}\right)$ $(dB)$},
            xmin=50, xmax=10000,
            ymin=-14, ymax=-1,
            grid=both,
            grid style={line width=0.2pt, draw=gray!30},
            major grid style={line width=0.4pt, draw=gray!60},
            samples=200,
        ]
        \addplot[red, opacity=0.5, thick, mark=*, domain=0.1:10000] coordinates{
        (52.2, -6.450)
        (66.1, -6.627)
        (83.8, -6.886)
        (106.1, -7.261)
        (134.3, -7.753)
        (170.1, -8.396)
        (215.4, -9.229)
        (272.8, -10.117)
        (345.5, -11.115)
        (437.5, -12.019)
        (554.1, -12.762)
        (701.7, -13.244)
        (888.6, -13.339)
        (1125.3, -13.049)
        (1425.1, -12.341)
        (1804.7, -11.314)
        (2285.5, -10.016)
        (2894.3, -8.542)
        (3665.2, -6.994)
        (4641.6, -5.444)
        (5878.0, -3.942)
        (7443.8, -2.567)
        (9426.7, -1.410)
        (11938.0, -0.437)
        (15118.0, 0.337)
        (19145.0, 1.005)
        (24245.0, 1.575)
        (30703.0, 2.189)
        (38882.0, 3.037)
        (49239.0, 4.463)
        (62355.0, 7.934)
        (78965.0, 12.522)
        (100000.0, 9.111)
        };
        \addlegendentry{Circuit 1}

        \draw[dashed, gray] (axis cs:1000,\pgfkeysvalueof{/pgfplots/ymin}) -- (axis cs:1000,\pgfkeysvalueof{/pgfplots/ymax});
        
        \end{semilogxaxis}
    \end{tikzpicture}
\end{document}
```
### Figure 6.3: Gain Bode Plot of Experimental Frequency Sweep: Circuit 2 from Table 6.2 Data


```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
        \begin{semilogxaxis}[
            legend pos=south west,
            legend style={font=\footnotesize},
            width=\linewidth,
            minor y tick num=8,
            height=13cm,
            xlabel={Frequency ($Hz$)},
            ylabel={$20\log\left(\frac{V_2}{V_1}\right)$ $(dB)$},
            xmin=50, xmax=10000,
            ymin=-14, ymax=-1,
            grid=both,
            grid style={line width=0.2pt, draw=gray!30},
            major grid style={line width=0.4pt, draw=gray!60},
            samples=200,
        ]

        \addplot[blue, opacity=0.5, thick, mark=*, domain=0.1:10000] coordinates{
        (52.2, -6.749)
        (66.1, -6.933)
        (83.8, -7.160)
        (106.1, -7.528)
        (134.3, -7.987)
        (170.1, -8.650)
        (215.4, -9.417)
        (272.8, -10.333)
        (345.5, -11.290)
        (437.5, -12.188)
        (554.1, -12.914)
        (701.7, -13.357)
        (888.6, -13.451)
        (1125.3, -13.099)
        (1425.1, -12.381)
        (1804.7, -11.292)
        (2285.5, -9.957)
        (2894.3, -8.487)
        (3665.2, -6.923)
        (4641.6, -5.383)
        (5878.0, -3.900)
        (7443.8, -2.518)
        (9426.7, -1.358)
        (11938.0, -0.372)
        (15118.0, 0.418)
        (19145.0, 1.030)
        (24245.0, 1.632)
        (30703.0, 2.230)
        (38882.0, 3.052)
        (49239.0, 4.449)
        (62355.0, 7.928)
        (78965.0, 12.489)
        (100000.0, 9.094)
        };
        \addlegendentry{Circuit 2}

        \draw[dashed, gray] (axis cs:800,\pgfkeysvalueof{/pgfplots/ymin}) -- (axis cs:800,\pgfkeysvalueof{/pgfplots/ymax});
        \draw[dashed, gray] (axis cs:1200,\pgfkeysvalueof{/pgfplots/ymin}) -- (axis cs:1200,\pgfkeysvalueof{/pgfplots/ymax});

        \end{semilogxaxis}
    \end{tikzpicture}
\end{document}
```
### Figure 6.4: Experimental Setup

![[wk7_lab6_images/board.jpg]]

### Figure 6.5: Faulty $100nF$ Capacitor

Our realized circuit was seeing a gain in the notch around $1kHz$ of only $-6\ dB$, while simulations suggested a $\approx -14dB$ gain. We checked to make sure capacitance was matched on the bass and treble filters, and found this faulty $100nF$ cap.

![[wk7_lab6_images/failed_cap.jpeg]]

**Failed 104 ($100nF$) Ceramic Capacitor, with Measured Capacitance of $\approx 40nF$**

### Figure 6.6: Scope Readings for Circuit 1 with MSO Generated Bode Plot

![[wk7_lab6_images/circuit1_scope.png]]

### Figure 6.7: Scope Readings for Circuit 2 with MSO Generated Bode Plot

![[wk7_lab6_images/circuit2_scope.png]]

---

## Analysis

### Figure 6.8: LTSpice Schematic and AC Analysis Circuit 1

![[wk7_lab6_images/spice_circuit1.png]]

![[wk7_lab6_images/spice_circuit1_analysis.png]]

### Figure 6.9: LTSpice Schematic and AC Analysis Circuit 2

![[wk7_lab6_images/spice_circuit2.png]]

![[wk7_lab6_images/spice_circuit2_analysis.png]]

---

## Conclusion

1. Making the adjustment to the zeros in circuit 2 did not have much of a noticeable audible effect, but the notch could be seen to be widened and deepened _slightly_ in **[[#Figure 6.3: Gain Bode Plot of Experimental Frequency Sweep: Circuit 2 from Table 6.2 Data]]**.