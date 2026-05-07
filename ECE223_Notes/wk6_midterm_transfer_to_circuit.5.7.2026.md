## Class 11
Midterm 1

## Class 12
#### Transfer Function to Circuit
Recall:

----
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
\draw(0,0)
to[R=$R$]++(3,0);
\end{circuitikz}
\end{document}
```
**Impedance: $R$**
**Admittance: $\frac{1}{R}$**

----
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
\draw(0,0)
to[capacitor, l=$C$]++(3,0);
\end{circuitikz}
\end{document}
```
**Impedance: $\frac{1}{sC}$**
**Admittance: $sC$**

----
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
\draw(0,0)
--++(0.5,0)
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
**Impedance: $\frac{1}{\frac{1}{R} + sC}$**
**Admittance: $\frac{1}{R} + sC$**

----
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

**Impedance: $R + \frac{1}{sC}$**
**Admittance: $\frac{1}{R + \frac{1}{sC}}$**

----
##### IW 12.1
###### 1.
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[R=$\frac{1}{2}\Omega$]++(2,0);
\end{circuitikz}
\end{document}
```
Impedance = $\frac{1}{2}\Omega$
Admittance = $2$
###### 2.
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[R=$200\Omega$]++(2,0);
\end{circuitikz}
\end{document}
```
Impedance = $200\Omega$
Admittance = $\frac{2}{100}$
###### 3. 
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[capacitor, l=$\frac{1}{6}\mu F$]++(2,0);
\end{circuitikz}
\end{document}
```
Impedance = $\frac{s}{6}\Omega$
Admittance = $\frac{1}{6}s$

###### 4. 
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[R=$3\Omega$]++(2,0)
	to[capacitor, l=$\frac{1}{6}F$]++(2,0);
\end{circuitikz}
\end{document}
```
Impedance = $3+\frac{6}{s}$
Admittance = $\frac{1}{3+\frac{6}{s}}$

###### 5. 
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
\draw(0,0)--++(0.5,0)
--++(0,0.25)
to[R=$2\Omega$]++(2,0)
++(-2,0)
--++(0,-0.5)
to[capacitor, a=$1F$]++(2,0)
--++(0,0.5)
++(0,-0.25)
--++(0.5,0);

\end{circuitikz}
\end{document}
```
Impedance = $\frac{1}{\frac{1}{2} + s}$
Admittance = $\frac{1}{2} + s$

###### 6. 
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
\draw(0,0)
--++(0.5,0)
--++(0,0.25)
to[R=$1\Omega$]++(2,0)
++(-2,0)
--++(0,-0.5)
to[capacitor, a=$\frac{1}{6}F$]++(2,0)
--++(0,0.5)
++(0,-0.25)
--++(0.5,0);

\end{circuitikz}
\end{document}
```
Impedance = $\frac{1}{1 + \frac{s}{6}}$
Admittance = $1 + \frac{s}{6}$

###### 7. 
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
\draw(0,0)--++(0.5,0)
--++(0,0.25)
to[R=$10k\Omega$]++(2,0)
++(-2,0)
--++(0,-0.5)
to[capacitor, a=$\frac{1}{60}\mu F$]++(2,0)
--++(0,0.5)
++(0,-0.25)
--++(0.5,0);

\end{circuitikz}
\end{document}
```
Impedance = $\frac{1}{\frac{1}{10k} + \frac{s}{60}\times 10^{-6}}$
Impedance = $\frac{1}{10k} + \frac{s}{60}\times 10^{-6}$

###### 8. 
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
\draw(0,0)--++(0.5,0)
--++(0,0.25)
to[R=$2k\Omega$]++(2,0)
++(-2,0)
--++(0,-0.5)
to[capacitor, a=$\frac{1}{10}\mu F$]++(2,0)
--++(0,0.5)
++(0,-0.25)
--++(0.5,0);

\end{circuitikz}
\end{document}
```
Impedance = $\frac{1}{\frac{1}{2k} + \frac{s}{10}\times 10^{-6}}$
Impedance = $\frac{1}{2k} + \frac{s}{10}\times 10^{-6}$

##### Amp Impedance and Admittance

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
	to[generic, l=$Z_1$]++(-2,0)
	node[circ, label=left:$V_1$]{};
	
	\draw(U1 IN-)--++(0,1)
	to[generic, a=$Z_2$]++(2,0)--++(2,0)--++(0,-2);
	
	\draw(U1 OUT)--++(1,0)
	node[circ, label=right:$V_{2}$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};

	
\end{circuitikz}
\end{document}
```
$$T(s) = -\frac{Z_2}{Z_1}$$
So...

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
	%to[generic, l=$Z_1$]++(-2,0)
	--++(-0.5,0)
	--++(0,0.25)
	to[R, a=$2\Omega$]++(-2,0)
	++(2,0)
	--++(0,-0.5)
	to[capacitor, l=$1F$]++(-2,0)
	--++(0,0.5)
	++(0,-0.25)
	--++(-0.5,0)
	node[circ, label=left:$V_1$]{};
	
	\draw(U1 IN-)--++(0,1)
	%to[generic, a=$Z_2$]++(2,0)
	
	--++(0.5,0)
	--++(0,0.25)
	to[R=$1\Omega$]++(2,0)
	++(-2,0)
	--++(0,-0.5)
	to[capacitor, a=$\frac{1}{6}F$]++(2,0)
	--++(0,0.5)
	++(0,-0.25)
	--++(0.5,0)
	--++(2,0)--++(0,-2);
	
	\draw(U1 OUT)--++(2,0)
	node[circ, label=right:$V_{2}$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};

	
\end{circuitikz}
\end{document}
```
$$Z_1 = \frac{1}{\frac{1}{2} + s}$$
$$Z_2 = \frac{1}{1 + \frac{s}{6}}$$
$$\frac{Z_2}{Z_1} = \frac{\frac{1}{1 + \frac{s}{6}}}{\frac{1}{\frac{1}{2} + s}} = \left(\frac{1}{2} + s\right)\left(\frac{1}{1 + \frac{s}{6}}\right) = \frac{\frac{1}{2} +s}{1 + \frac{s}{6}}$$
$$6\frac{\frac{1}{2} + s}{s +6}$$
#### Finding Circuit from Transfer Function Using Admittance
##### Passive  Circuit
$$T(s) = \frac{s + 3}{s + 6}$$
Pole at $-6$ and zero at $-3$
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
\draw(0,0)
node[circ, label=left:$V_1$]{}
to[generic, l=$Z_1$]++(2,0)
--++(1,0)
node[circ, label=right:$V_2$]{}
++(-1,0)
to[generic, l=$Z_2$]++(0,-2)
node[ground]{};


\end{circuitikz}
\end{document}
```
$$\frac{V_2}{V_1} = \frac{Z_2}{Z_1 + Z_2} = \frac{Y_1}{Y_2 + Y_1}$$
We can pull $3$ out of the denominator, but to match the form $\frac{Y_1}{Y_1 + Y_2}$ or $\frac{Z_2}{Z_2 + Z_1}$ we can recognize that the s term by itself more closely matches the **admittance** form. So we can go to:
$$\frac{Y_1}{Y_1 + Y_2} = \frac{s+3}{s + 3 + 3}$$
We can pull these out and go back to impedance
$$Y_1 = s + 3\Longrightarrow Z_1 = \frac{1}{s + 3}$$
$$Y_2 = 3\Longrightarrow Z_2 = \frac{1}{3}$$
Then create the circuit:
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
\draw(0,0)
node[circ, label=left:$V_1$]{}
%to[generic, l=$Z_1$]++(2,0)
--++(0.5,0)
--++(0,0.25)
to[R=$\frac{1}{3}\Omega$]++(2,0)
++(-2,0)
--++(0,-0.5)
to[capacitor, a=$1F$]++(2,0)
--++(0,0.5)
++(0,-0.25)
--++(0.5,0)
--++(1,0)
node[circ, label=right:$V_2$]{}
++(-1,0)
to[R, l=$\frac{1}{3}\Omega$]++(0,-2)
node[ground]{};


\end{circuitikz}
\end{document}
```

##### Active Circuit
$$T(s) = -\frac{s + 3}{s + 6}$$
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
	to[generic, l=$Z_1$]++(-2,0)
	node[circ, label=left:$V_1$]{};
	
	\draw(U1 IN-)--++(0,1)
	to[generic, a=$Z_2$]++(2,0)--++(2,0)--++(0,-2);
	
	\draw(U1 OUT)--++(1,0)
	node[circ, label=right:$V_{2}$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};

	
\end{circuitikz}
\end{document}
```

$$-\frac{Z_2}{Z_1} = -\frac{Y_1}{Y_2}$$
$$Y_1 = s+3\Longrightarrow Z_2 = \frac{1}{s + 3}\Longrightarrow C = 1;\ \ \frac{1}{R} = 3\to R=\frac{1}{3}$$
$$Y_2 = s+6 \Longrightarrow\ Z_2 =\frac{1}{s + 6} \Longrightarrow C = 1;\ \ \frac{1}{R} = 6\to R = \frac{1}{6}$$

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
	%to[generic, l=$Z_1$]++(-2,0)
	--++(-0.5,0)
	--++(0,0.25)
	to[R, a=$\frac{1}{3}\Omega$]++(-2,0)
	++(2,0)
	--++(0,-0.5)
	to[capacitor, l=$1F$]++(-2,0)
	--++(0,0.5)
	++(0,-0.25)
	--++(-0.5,0)
	node[circ, label=left:$V_1$]{};
	
	\draw(U1 IN-)--++(0,1)
	%to[generic, a=$Z_2$]++(2,0)
	
	--++(0.5,0)
	--++(0,0.25)
	to[R=$\frac{1}{6}\Omega$]++(2,0)
	++(-2,0)
	--++(0,-0.5)
	to[capacitor, a=$1F$]++(2,0)
	--++(0,0.5)
	++(0,-0.25)
	--++(0.5,0)
	--++(2,0)--++(0,-2);
	
	\draw(U1 OUT)--++(2,0)
	node[circ, label=right:$V_{2}$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};

	
\end{circuitikz}
\end{document}
```
In Lab 5, we will do something like the above