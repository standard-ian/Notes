## Class 5
#### Ideal Op-Amp (Negative Feedback, Non-Inverting)
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
	to[short, i<_=$i_+$]++(-1,0)
	node[left]{$V_{+}$};
	
	\draw(U1 IN-)
	to[short, i<_=$i_-$]++(-1,0)
	node[above]{$V_{-}$}
	to[sV]++(0,-1)
	node[ground]{};
	
	\path(U1 OUT) node[right]{$V_{out}$};
	
	\path(U1 VCC) node[above]{$V_{CC}$};
	\path(U1 VEE) node[below]{$V_{EE}$};

	
\end{circuitikz}
\end{document}
```
$$V_+ = V_-$$
$$i_+ = 0 = i_-$$
$$A = \infty$$
$$R_1 = \infty$$
$$R_o = 0$$
#### Ideal Op-Amp (Positive Feedback,  Inverting)
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
	to[short, i<_=$i_+$]++(-1,0)
	node[above]{$V_{+}$}
	to[sV]++(0,-1)
	node[ground]{};
	
	\draw(U1 IN-)
	to[short, i<_=$i_-$]++(-1,0)
	node[left]{$V_{-}$};
	
	\path(U1 OUT) node[right]{$V_{out}$};
	
	\path(U1 VCC) node[above]{$V_{CC}$};
	\path(U1 VEE) node[below]{$V_{EE}$};

	
\end{circuitikz}
\end{document}
```
$$V_+ = V_-$$
$$i_+ = 0 = i_-$$
#### IW 5.1
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
\begin{circuitikz}[american, scale=1, font=\Large]
	% invoke the opamp	
	\opamp(0,0){U1}
	
	\draw(U1 IN-)--++(-1,0)--++(0,3) 
	to[R=$R_3$, i_>=$i_{R3}$]++(3.5,0)
	node[ocirc, label=above:$B$]{}
	to[R=$R_4$, i^<=$i_{R4}$]++(0,-2.5)
	node[ground]{}
	++(0,2.5)
	to[R=$R_5$, i>_=$i_{R5}$]++(3.5,0)--++(0,-4) --++(-1,0);
	\draw(U1 IN-)++(-1,3)
	node[ocirc, label=above:$A$]{}
	to[R, a=$R_1$]++(-2,0)
	node[circ, label=left:$V_1+$]{};
	
	\draw(U1 OUT) --++(4,0)
	node[circ, label=right:$V_{2}+$]{};

	\draw(U1 IN+)--++(0,-1)
	node[ground]{};
	
	\draw(U1 VCC) node[ocirc]{};
	\draw(U1 VEE) node[ocirc]{};

	
\end{circuitikz}
\end{document}
```
$$V_A = V_+ = 0$$
$$i_{R_1} = \frac{V_1}{R_1} = i_{R_3}$$
$$V_B = -V_1$$
$$i_{R_5} = i_{R_3} + i_{R_4} = \frac{-V_1}{R_3} -\frac{V_1}{R_4} = -V_1\left(\frac{1}{R_3} + \frac{1}{R_4}\right)$$
$$V_2 = -V_1 - V_1\left(\frac{R_5}{R_3} + \frac{R_5}{R_4}\right)$$
$$V_2 = -V_1\left(1 + \left(\frac{R_5}{R_3}+\frac{R_5}{R_4}\right)\right)$$
$$\frac{V_2}{V_1} = -1-R_5\left(\frac{1}{R_3} + \frac{1}{R_3}\right)$$
## Class 6
#### IW 6.1
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

Inverting amplifier
$$\frac{V_2}{V_1} = -\frac{R_2}{R_1}$$
For AC, phase will be $180^\circ$ between $V_1$ and $V_2$, and amplitude will be scaled by the ratio $\frac{R_2}{R_1}$.


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
	
	\draw(U1 IN-)--++(0,2)
	to[R, a=$R_3$]++(-2,0)
	node[circ, label=left:$V_3$]{};
	
	\draw(U1 OUT)--++(1,0)
	node[circ, label=right:$V_{2}$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};

	
\end{circuitikz}
\end{document}
```
$$V_2 = V_1\left(-\frac{R_2}{R_1}\right) + V_3\left(-\frac{R_2}{R_3}\right)$$
Additive property

#### IW 6.2
Design a circuit such that:
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

#### IW 6.3
Superposition - initially ignore $V_3$
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
	node[ocirc, label=above:$V_a$]{}
	to[R=$R_b$]++(0,-2)
	node[ground]{}++(0,2)
	to[R=$R_a$]++(-3,0)
	node[circ,label=left:$V_3$]{};
	
	\draw(U1 IN-)
	node[ocirc, label=above:$V_a$]{}
	--++(-1,0)
	to[R=$R_1$]++(-2,0)
	node[circ, label=left:$V_1$]{}
	++(2,0)--++(0,1)
	to[R=$R_2$]++(2,0)--++(3,0)--++(0,-2);
	
	\draw(U1 OUT)--++(1,0)
	node[circ, label=right:$V_2$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};

	
\end{circuitikz}
\end{document}
```
$$V_a = V_3\frac{R_b}{R_a + R_b}$$
$$\frac{V_1 - V_a}{R_1} = \frac{V_a-V_2}{R_2}$$
$$\frac{V_1}{R_1} - \frac{V_a}{R_1} = \frac{V_a}{R_2} - \frac{V_2}{R_2}$$
$$-\frac{V_2}{R_2} = \frac{V_1}{R_1}-\frac{V_a}{R_1}-\frac{V_a}{R_2}$$
$$V_2 = V_a\frac{R_2}{R_1} + V_a - V_1\frac{R_2}{R_1}$$
$$V_2 = V_a\left(1 + \frac{R_2}{R_1}\right)- V_1\frac{R_2}{R_1}$$
$$V_2 = V_3\frac{R_b}{R_a + R_b}\left(1 + \frac{R_2}{R_1}\right) - V_1\frac{R_2}{R_1}$$
#### IW 6.4
Find the transfer function $\frac{V_2}{V_1}$

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
	node[ocirc, label=above:$V_a$]{}
	to[R=$R_2$]++(0,-2)
	node[ground]{}
	++(0,2)
	to[R=$R_1$]++(-2,0)--++(0,2)
	node[ocirc, label=above:$A$]{}--++(-1,0)
	node[circ, label=left:$V_1$]{};
	
	\draw(U1 IN-)
	node[ocirc, label=below:$V_a$]{}
	to[R=$R_1$]++(-2,0)++(2,0)
	--++(0,1)
	to[R=$R_3$]++(2,0)--++(2,0)--++(0,-2);
	
	\draw(U1 OUT)
	--++(1,0)
	node[circ, label=right:$V_2$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};

	
\end{circuitikz}
\end{document}
```

This is the same as the previous circuit, but $V_1 = V_3$
$$V_a = V_1\frac{R_b}{R_a + R_b}$$
$$\frac{V_1 - V_a}{R_1} = \frac{V_a-V_2}{R_2}$$
$$V_2 = V_1\left(\frac{R_2}{R_1 + R_2}\left(1 + \frac{R_3}{R_1}\right) - \frac{R_3}{R_1}\right)$$
$$\frac{V_2}{V_1} = \frac{R_2}{R_1 + R_2}\left(1 + \frac{R_3}{R_1}\right) - \frac{R_3}{R_1}$$

#### IW 6.5
We flew through this, not sure exactly what we are wanting to see here.

First, imagine $R_3 = R_1$ and no $\textcolor{red}{\gamma R_3}$.

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
\begin{circuitikz}[american, scale=1, font=\Large]
	% invoke the opamp	
	\opamp(0,0){U1}
	\opamp(6,-1){U2}
	
	\draw[red, thick, dashed](U1 IN+)++(0,-2)
	--++(3,0)
	coordinate(A);
	
	\draw[red](A)
	to[R, a=$\gamma R_3$, color=red]++(2,0)
	coordinate(B);
	
	\draw[red, thick, dashed](B)--++(5,0)
	--++(0,2);
	
	
	\draw(U1 IN+)--++(0,-3)
	to[R=$R_3$]++(0,-2)
	node[ground]{};
	
	\draw(U1 IN-)
	to[R=$R_1$]++(-2,0)
	node[circ, label=left:$V_1$]{}
	++(2,0)--++(0,1)
	to[R=$\alpha R_1$]++(2,0)
	--++(2,0)--++(0,-2);
	
	\draw(U1 OUT)--++(1,0)
	to[R=$R_2$](U2 IN-);
	
	\draw(U2 IN+)
	node[ground]{};
	
	\draw(U2 IN-)--++(0,1)
	to[R=$\beta R_2$]++(2,0)--++(2,0)--++(0,-2);
	
	\draw(U2 OUT)--++(1,0)
	node[circ, label=right:$V_2$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};
	
	\path(U2 VCC) node[ocirc, above]{};
	\path(U2 VEE) node[ocirc, below]{};

	
\end{circuitikz}
\end{document}
```


#### Bilinear Transfer Functions

$$T(s) = \frac{V_2}{V_1}$$
is bilinear if
$$T(s) = \frac{a_1s + a_0}{b_1s + b_0} = \frac{n(s)}{d(s)}$$
$$T(s) = \frac{a_1}{b_1}\frac{s + \frac{a_0}{a_1}}{s + \frac{b_0}{b_1}} = k\frac{s +z }{s + p}$$
Zero: $s = -z,\ \ n(s) = 0$
Pole: $s = -p,\ \ d(s) = 0$

Poles and zeros are always real.
