## Class 5
#### Ideal Op-Amp (Negative Feedback, Non-Inverting)
$$V_+ = V_-$$
$$i_+ = 0 = i_-$$
$$A = \infty$$
$$R_1 = \infty$$
$$R_o = 0$$
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
$$\frac{V_2}{V_1} = -1-R_5\left(\frac{1}{R_3} - \frac{1}{R_3}\right)$$
#### Ideal Op-Amp (Positive Feedback,  Inverting)
