## Class 13
Final Exam will be on June 9, 2026
### Realization of Bilinear Transfer Functions
#### Passive RC to Realization
$$T(s) = \frac{s + 0.5}{s+3}$$
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

$$\frac{V_2}{V_1} = \frac{Z_2}{Z_1 + Z_2} = \frac{Y_1}{Y_1 + Y_2}$$
For the above transfer function, 
$Y_2 + Y_1 = 2.5 + s + 0.5$
$Y_1 = s + 0.5\Longrightarrow Z_1 = \frac{1}{s + 0.5} = \frac{1}{sC + \frac{1}{R}}\Longrightarrow R=\frac{1}{0.5} = 2\Omega;\ \ C = 1F$
$Y_2 = 2.5\Longrightarrow  Z_2 = \frac{1}{2.5} = 0.4\Omega$
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
\draw(0,0)
node[circ, label=left:$V_1$]{}
%to[generic, l=$Z_1$]++(2,0)
--++(0.5,0)
--++(0,0.25)
to[R=$2\Omega$]++(2,0)
++(-2,0)
--++(0,-0.5)
to[capacitor, a=$1F$]++(2,0)
--++(0,0.5)
++(0,-0.25)
--++(0.5,0)
--++(1,0)
node[circ, label=right:$V_2$]{}
++(-1,0)
to[R, l=$0.4\Omega$]++(0,-2)
node[ground]{};


\end{circuitikz}
\end{document}
```
To scale frequency, divide $C$ by a frequency scaling factor $k_f$
Let's say we want to shift the transfer function to:
$$T(s) = \frac{s + 500}{s + 3000} = \frac{\frac{s}{1000} + 0.5}{\frac{s}{1000} + 3}$$
$$C_{new} = \frac{C_{old}}{k_f}\Longrightarrow C_{new} = \frac{1}{1000} = 1mF$$
If we keep everything else the same, the break frequency shifts by a factor of $\times 1k$

Now, lets say we want a $\times 0.001$ capacitor, but to maintain the break frequency. We can divide the cap by a magnitude scaling factor $k_m$ of 1000, and **multiply** the resistors by the same $k_m$.

$$C_{new} = \frac{C_{old}}{1000} = \frac{1mF}{1000} = 1\mu F$$
$$R_{new} = R_{new}(1000)$$
This will apply to all resistors in the circuit.
$C = 1\mu F$
$R_1 = 500$
$R_2 = 3k$
#### Active Op-Amp Circuits
How can we apply the transfer function to the following:
$$T(s) = \frac{s + 0.5}{s + 3}$$
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
$$T(s) = -\frac{Z_2}{Z_1} = -\frac{Y_1}{Y_2}$$
$Y_1 = s + 0.5\Longrightarrow C = 1F,\ R=\frac{1}{0.5}\Omega = 2\Omega$
$Y_2 = s + 3\Longrightarrow C = 1F, R = \frac{1}{3}\Omega$

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
	to[R=$\frac{1}{3}\Omega$]++(2,0)
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

Scaling the frequency by $k_f = 1000$ we can follow the same scaling conventions described above. Magnitude scaling also operates the same way.

For a new transfer function, we can divide the denominator by the new coefficient, 6. This may happen if we wanted the base gain to actually be $20\log6$.
$$T(s) = 6\frac{s + 0.5}{s +3} \Longrightarrow\frac{s + 0.5}{\frac{s}{6} + 0.5}$$
This will result in
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
	to[R=$2\Omega$]++(2,0)
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
To scale frequency by $k_f = 10k$ and magnitude by $k_m = 1k$:
$C_{new} = \frac{C_{old}}{10\times 10^{6}} = 0.1\mu F$ and $16.7nF$
$R_{new} = R_{old}(1000) = 2k$

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
	to[R, a=$2k\Omega$]++(-2,0)
	++(2,0)
	--++(0,-0.5)
	to[capacitor, l=$100nF$]++(-2,0)
	--++(0,0.5)
	++(0,-0.25)
	--++(-0.5,0)
	node[circ, label=left:$V_1$]{};
	
	\draw(U1 IN-)--++(0,1)
	%to[generic, a=$Z_2$]++(2,0)
	
	--++(0.5,0)
	--++(0,0.25)
	to[R=$2k\Omega$]++(2,0)
	++(-2,0)
	--++(0,-0.5)
	to[capacitor, a=$16.7nF$]++(2,0)
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
$$-\frac{V_2}{V_1} = \frac{s + 50,00}{s + 30,000}$$
We disregard the negative sign of the inverting amp because we're usually working with AC and don't care about the $180^\circ$ phase shift.
#### Lab 5
Two circuits:

Phase Lag, decrease will happen sooner because pole term is closer to imaginary axis
We want to scale capacitor to $100nF$
$$T_1 = \frac{s + 1000(2\pi)}{s + 200(2\pi)}$$
Zero resistor should be $\frac{1}{1000(2\pi)}\times 10\times 10^{6} = 1.59k\Omega$ 
Pole resistor Pole resistor should be $\frac{1}{200(2\pi)}\times 10 \times 10^{6} = 7.96k\Omega$

Phase Lead, increase will happen first because zero term is closer to imaginary axis.
We want to scale capacitor to $10nF$
$$T_2 = \frac{s + 1000(2\pi)}{s + 10000(2\pi)}$$

Zero resistor should be $\frac{1}{1000(2\pi)}\times 10\times 10^{7} = 15.9k\Omega$ 
Pole resistor should be $\frac{1}{10000(2\pi)}\times 10 \times 10^{5} = 1.59k\Omega$
## Class 14
