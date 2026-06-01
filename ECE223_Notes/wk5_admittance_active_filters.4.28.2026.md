## Class 9
### Midterm Review
#### Amplifiers with Resistors
##### Non-Inverting Amplifier
$$V_2 = V_1\left(1 + \frac{R_2}{R_1}\right)$$
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
    
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	% invoke the opamp	
	\opamp(0,0){U1}
	
	\draw(U1 IN+) 
	node[circ, label=left:$V_1$]{};
	
	\draw(U1 IN-)--++(0,1)
	to[R, a=$R_1$]++(-2,0)
	node[ground]{};
	
	\draw(U1 IN-)--++(0,1)
	to[R=$R_2$]++(2,0)--++(2,0)--++(0,-2);
	
	\draw(U1 OUT)--++(1,0)
	node[circ, label=right:$V_{2}$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};

	
\end{circuitikz}
\end{document}
```

##### Inverting Amplifier
$$V_2 = V_1\left(-\frac{R_2}{R_1}\right)$$

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
    
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	% invoke the opamp	
	\opamp(0,0){U1}
	
	\draw(U1 IN+) 
	node[ground]{};
	
	\draw(U1 IN-)--++(0,1)
	to[R, a=$R_1$]++(-2,0)
	node[circ, label=left:$V_1$]{};
	
	\draw(U1 IN-)--++(0,1)
	to[R=$R_2$]++(2,0)--++(2,0)--++(0,-2);
	
	\draw(U1 OUT)--++(1,0)
	node[circ, label=right:$V_{2}$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};

	
\end{circuitikz}
\end{document}
```

##### With Voltage Divider
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
    
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	% invoke the opamp	
	\opamp(0,0){U1}
	
	\draw(U1 IN+) 
	node[circ, label=above:$V_a$]{}
	to[R=$R_3$]++(-2,0)
	node[circ, label=left:$V_1$]{}
	++(2,0)
	to[R=$R_4$]++(0,-2)
	node[ground]{};
	
	\draw(U1 IN-)--++(0,1)
	to[R, a=$R_1$]++(-2,0)
	node[ground]{};
	
	\draw(U1 IN-)--++(0,1)
	to[R=$R_2$]++(2,0)--++(2,0)--++(0,-2);
	
	\draw(U1 OUT)--++(1,0)
	node[circ, label=right:$V_{2}$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};

	
\end{circuitikz}
\end{document}
```
The voltage at $V_a$ will be:
$$V_a = V_1\frac{R_4}{R_3 + R_4}$$
The transfer function is now:
$$T(s) = \frac{V_2}{V_1} = \frac{V_2}{V_1\frac{R_4}{R_3 + R_4}} = \left(1 + \frac{R_2}{R_1}\right)$$
$$\boxed{T(s) = \frac{V_2}{V_1} = \left(\frac{R_4}{R_4 + R_3}\right)\left(1 + \frac{R_2}{R_1}\right)}$$
##### Summing Amplifier
$$V_{out} = -2V_1 - 4V_3 -6V_4$$
$$V_{out} = V_1\left(-\frac{1\Omega}{0.5\Omega}\right) + V_3\left(-\frac{1\Omega}{0.25\Omega}\right) + V_4\left(-\frac{1\Omega}{0.125\Omega}\right)$$
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
    
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	% invoke the opamp	
	\opamp(0,0){U1}
	
	\draw(U1 IN+) 
	node[ground]{};
	
	\draw(U1 IN-)--++(0,1)
	to[R=$R_2$]++(2,0)--++(2,0)--++(0,-2);
	
	\draw(U1 IN-)--++(0,1)
	to[R, a=$\frac{1}{2}R_2$]++(-2,0)
	node[circ, label=left:$V_1$]{};
	
	\draw(U1 IN-)--++(0,2)
	to[R, a=$\frac{1}{4}R_2$]++(-2,0)
	node[circ, label=left:$V_3$]{};
	
	\draw(U1 IN-)--++(0,3)
	to[R, a=$\frac{1}{6}R_2$]++(-2,0)
	node[circ, label=left:$V_4$]{};
	
	\draw(U1 OUT)--++(1,0)
	node[circ, label=right:$V_{2}$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};

	
\end{circuitikz}
\end{document}
```

##### Voltage Follower
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
    
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	% invoke the opamp	
	\opamp(0,0){U1}
	
	\draw(U1 IN+) --++(-1,0)
	node[circ, label=left:$V_1$]{};
	
	\draw(U1 IN-)--++(0,1)
	--++(4,0)--++(0,-2);
	
	\draw(U1 OUT)--++(1,0)
	node[circ, label=right:$V_2$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};

	
\end{circuitikz}
\end{document}
```
$$V_2 = V_1$$
##### RC Circuit Cascaded with Voltage Follower
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
    
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

	% invoke the opamp	
	\opamp(5,1){U1}
	
	\draw(0,0)
	node[circ, label=left:$V_1$]{}
	to[R=$10k\Omega$]++(2,0)
	--(U1 IN+);
	
	\draw(2,0)
	to[capacitor, l=$C_1$]++(0,-2)
	node[ground]{};
	
	\draw(U1 IN+)--++(-1,0);
	
	\draw(U1 IN-)--++(0,1)
	--++(4,0)--++(0,-2);
	
	\draw(U1 OUT)--++(1,0)
	node[circ, label=right:$V_2$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};

	
\end{circuitikz}
\end{document}
```
The output impedance will be effectively $0$

$$Z_{out} = -\frac{\Delta V_{out}}{\Delta I_{out}}$$
Output impedance is the change in voltage over the change in current at the output node. In this case, it we measure the voltage at $V_2$ with and without a load, it will be unchanged because of the follower, so:
$$Z_{out} = -\frac{0}{\Delta I_{out}} = 0\Omega$$

Alternatively, using the equation from Lab 2, because the follower makes $V_2 = V_1$:
$$Z_{out} = \frac{V_{S}(R_{test})}{V_{R_{test}}} - R_{test} = \frac{V_1}{V_2}R_{test} - R_{test}$$
$$= (1)R_{test} - R_{test} = 0\Omega$$
#### Bilinear Transfer Functions
At most one pole and one zero.
$$T(s) = k\frac{s + z}{s + p}$$
##### Phase Plot
$$\angle(T(j\omega)) = \angle(\text{zero}) -\angle(\text{pole})$$
$$\angle\frac{j\omega + z}{j\omega + p} = \angle$$
#### Asymptotic Bode Plots
Plot straight lines in log-log plot, resulting in linear vectors.
$$T(s) = 180\frac{1 + 0.01s}{1+0.001s}$$
$$T(j\omega) = 180\frac{s + j\frac{\omega}{100s}}{s + j\frac{\omega}{1000s}}$$
![[Pasted image 20260428102702.png]]
![[image.png]]
#### Input and Output Impedance
##### Output Impedance
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2]
   \draw(0,0)
   to[sV, l=$V_{S}$]++(0,1)
   to[generic, l=$Z_{out}$]++(2,0)
   node[ocirc, label=above:$A$]{}
   --++(0,-1)
   node[ocirc, label=below:$B$]{}
   --++(-2,0);

   \draw(4,0)
   to[sV, l=$V_{S}$]++(0,1)
   to[generic, l=$Z_{out}$]++(2,0)
   node[ocirc, label=above:$A$]{}
   to[R=$R_{test}$]++(0,-1)
   node[ocirc, label=below:$B$]{}
   --++(-2,0);
\end{circuitikz}

\end{document}
```
$$V_{A\to B} = V_{S}\frac{R_{test}}{R_{test} + Z_{out}}$$
$$V_{A\to B}(R_{test}) + V_{AB}(Z_{out}) = V_{S}(R_{test})$$
$$(V_{A\to B})Z_{out} = V_{S}(R_{test}) - V_{A\to B}(R_{test})$$
$$Z_{out} = \frac{V_{S}(R_{test})}{V_{A\to B}} - R_{test}$$
$$Z_{out} = \frac{V_{S}(R_{test})}{V_{R_{test}}} - R_{test}$$
##### Input Impedance
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2]
   \draw(0,0)
   to[sV, l=$V_{S}$]++(0,1)
   node[ocirc, label=above:$A$]{}
   to[R=$R_{test}$]++(2,0)
   node[ocirc, label=above:$B$]{}--++(1,0)
   node[circ, label=right:$V_{B\to C}$]{}++(-1,0)
   to[generic, l=$Z_{L}$]++(0,-1)
   node[ocirc, label=below:$C$]{}
   --++(-2,0);
\end{circuitikz}
\end{document}
```
$$\frac{V_{B\to C}}{V_{A \to C}} = \frac{Z_{L}}{R_{test} + Z_{L}}$$
$$\frac{V_{B\to C}}{V_{A\to C}}(R_{test}) + \frac{B_{B\to C}}{V_{A\to C}}(Z_{L}) = Z_{L}$$
$$\frac{V_{B\to C}}{V_{A\to C}}(R_{test}) = Z_{L} - \frac{V_{B\to C}}{V_{A\to C}}Z_{L}$$
$$Z_{L} = \frac{\frac{V_{B\to C}}{V_{A\to C}}(R_{test})}{1 - \frac{V_{B\to C}}{V_{A\to C}}}$$
## Class 10
This will have a gain plot that rolls off forever towards infinity

$$T(j\omega) = \frac{1 + j\frac{\omega}{2k}}{\left(1 + j\frac{\omega}{20k}\right)\left(1 + j\frac{\omega}{200k}\right)}$$
![[Pasted image 20260430095116.png]]
#### Impedance vs Resistance
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
\draw(0,0)
to[R=$R$]++(3,0);
\end{circuitikz}
\end{document}
```
Impedance: $R$
Admittance: $\frac{1}{R}$
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
\draw(0,0)
to[capacitor, l=$C$]++(3,0);
\end{circuitikz}
\end{document}
```
Impedance: $\frac{1}{sC}$
Admittance: $sC$
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
\draw(0,0)--++(0.5,0)
--++(0,0.25)
to[R=$R$]++(2,0)
++(-2,0)
--++(0,-0.5)
to[capacitor, a=$C$]++(2,0)
--++(0,0.5)
++(0,-0.25)
--++(0.5,0);

\end{circuitikz}
\end{document}
```
Impedance: $\frac{1}{\frac{1}{R} + sC}$
Admittance: $\frac{1}{R} + sC$
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
\draw(0,0)
to[R=$R$]++(2,0)
to[capacitor, l=$C$]++(1,0);

\end{circuitikz}
\end{document}
```

Impedance: $R + \frac{1}{sC}$
Admittance: $\frac{1}{R + \frac{1}{sC}}$
##### Example 1 

$$T(s) = \frac{1000}{s + 1000} = \frac{Z_2}{Z_1 + Z_2}$$
Find a circuit
$$T(s) = \frac{\frac{1000}{s}}{1 + \frac{1000}{s}}$$
To get the form:
$$\frac{\frac{1}{sC}}{1 + \frac{1}{sC}} = \frac{Z_2}{Z_1 + Z_2}$$
$$Z_2 = \frac{1}{sC} = \frac{1000}{s}$$
$$C = \frac{1}{1000}F = 1mF$$
$$Z_2 = \frac{1}{\frac{1}{1000\times s}}$$
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
\draw(0,0)
node[circ]{}
to[R=$1\Omega$]++(2,0)
--++(1,0)
node[circ]{}
++(-1,0)
to[capacitor, l=$1mF$]++(0,-2)
node[ground]{};

\end{circuitikz}
\end{document}
```
But $1mF$ is a really large and expensive capacitor, so we want to perform **magnitude scaling**, scaling $R$ and $C$ at the same time.

$$C_{new} = \frac{1}{k_m}C_{old}$$
$$R_{new} = k_mR_{old}$$
If we want to scale by 1000x smaller capacitor,  $k_m = 1000$
$$C_{new} = \frac{1}{1000}1mF = 1\mu F$$
$$R_{new} = 1000(1) = 1k\Omega$$
##### Example 2
For the transfer function:
$$T_2(s) = \frac{s}{s + 1000}$$
It is a high pass, with a break frequency $f_0 = 1000\omega/s$ 
We want to put into terms $Z_1$ and $Z_2$

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
\draw(0,0)
node[circ]{}
to[generic, l=$Z_1$]++(2,0)
--++(1,0)
node[circ]{}
++(-1,0)
to[generic, l=$Z_2$]++(0,-2)
node[ground]{};

\end{circuitikz}
\end{document}
```
$$T(j\omega) = \frac{1}{1 + \frac{1000}{j\omega}}$$
We can see this is a high pass version of the low pass in the previous example

##### Example 3
$$T_3(s) = \frac{s + 0.5}{s + 3} = \frac{Z_2}{Z_1 + Z_2}$$
Don't let $Z_2$ be $s + 0.5$
$$= \frac{s+ 0.5}{s + 0.5 + 2.5} = \frac{1}{1 + \frac{2.5}{s+0.5}}$$

$$T_3(s) = \frac{1}{1 + \frac{5}{2}\left(\frac{1}{s+0.5}\right)}\left(\frac{\frac{2}{5}}{\frac{2}{5}}\right) = \frac{\frac{2}{5}}{\frac{2}{5} + \frac{1}{s + \frac{1}{2}}} = \frac{\frac{2}{5}}{\frac{2}{5} + \frac{2}{2s + 1}}$$

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
\draw(0,0)
node[circ]{}
to[generic, l=$Z_1$]++(2,0)
--++(1,0)
node[circ]{}
++(-1,0)
to[generic, l=$Z_2$]++(0,-2)
node[ground]{};

\end{circuitikz}
\end{document}
```
$Z_1 = \frac{2}{2s + 1} = \frac{1}{s + 0.5} = \frac{1}{\frac{1}{R} + sC}$, letting $R=2$ and $C=1$
$Z_2 = \frac{2}{5}$
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
\draw(0,0)
node[circ]{}
--++(0.5, 0)
--++(0,0.25)
to[R=$2\Omega$]++(2,0)
++(-2,0)
--++(0,-0.5)
to[capacitor, a=$1F$]++(2,0)
--++(0,0.5)
++(0,-0.25)
--++(0.5, 0)
--++(1,0)
node[circ]{}
++(-1,0)
to[R=$0.4 {=} \frac{2}{5}\Omega$]++(0,-2)
node[ground]{};

\end{circuitikz}
\end{document}
```
