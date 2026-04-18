## Homework 2
#### 1. 
Find the gain $k$ such that $V_2 = kV_1$
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
	
	\draw(U1 IN-)--++(-1,0)
	node[ocirc, label=below:$A$]{}
	--++(0,1) 
	to[R=$R$]++(2.5,0)
	to[R=$R$]++(2.5,0)--++(0,-2) --++(-1,0);
	\draw(U1 IN-)++(-1,1)
	to[R, a=$R$]++(-2,0)
	node[circ, label=left:$V_1+$]{};
	
	\draw(U1 OUT) --++(2,0)
	node[circ, label=right:$V_{2}+$]{};

	\draw(U1 IN+)--++(0,-1)
	node[ground]{};
	
	\draw(U1 VCC) node[ocirc]{};
	\draw(U1 VEE) node[ocirc]{};

	
\end{circuitikz}
\end{document}
```
At node $A$, there is 0 current. Therefore, the current over the leftmost resistor is 
$$I = \frac{V_1}{R}$$
and this same current must leave the junction over the rightmost 2 resistors. 
The voltage at the non-inverting terminal is $0$ or ground, the amp will want to make the inverting terminal $0V$ also. 

So if $V_A = 0$ and current must flow to the right, $V_2$ must be:
$$V_2 = 0V - \frac{V_1}{R}(2R) = -2V_1$$
$$k = \frac{V_2}{V_1} = -2$$
#### 2. 
$R_1 = R$. Find the gain $k$ of $\frac{V_2}{V_1} = k$

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
	
	\draw(U1 IN-)--++(-1,0)--++(0,2) 
	to[R=$R$]++(3.5,0)
	node[ocirc, label=above:$B$]{}
	to[R=$R_1$]++(0,-1.5)
	node[ground]{}
	++(0,1.5)
	to[R=$R$]++(3.5,0)--++(0,-3) --++(-1,0);
	\draw(U1 IN-)++(-1,2)
	node[ocirc, label=above:$A$]{}
	to[R, a=$R$]++(-2,0)
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
Again, no current at $-/+$ 
$I_{\to A} = \frac{V_1}{R}$
$I_{A\to} = -\frac{V_1}{R}$
$V_B = -V_1$
$I_{\to B} = I_{R_1}  + I_{A\to}=  \frac{V_1}{R} + \frac{V_1}{R_1}$
$I_{B\to} = -\frac{V_1}{R} - \frac{V_1}{R_1}$
$V_2 = -V_1  - R\left(\frac{V_1}{R} + \frac{V_1}{R_1}\right)$
$$V_2 = -V_1 - V_1\left(1 + \frac{R}{R_1}\right) = -V_1 - V_1 -\frac{V_1R}{R_1} = -V_1\left(2 + \frac{R}{R_1}\right)$$
$$\frac{V_2}{V_1} = -2-\frac{R}{R_1}$$
For $R=R_1$, $k = -3$ 

#### 3. 
With the circuit in **2** find $R_1$ such that the gain $\frac{V_2}{V_1} = k = -100$
$$-100 = -2-\frac{R}{R_1}\to98 = \frac{R}{R_1}$$
$$R_1 = \frac{R}{98}$$
#### 4. 
Let $G_j = \frac{1}{R_j}$. The inverse of resistance is conductance.
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
	
	\draw(U1 IN-)--++(-1,0)--++(0,1) 
	to[R=$R_2$]++(4,0)--++(1,0)--++(0,-2) --++(-1,0);
	\draw(U1 IN-)++(-1,1)
	node[ocirc, label=above:$B$]{}
	to[R, a=$R_1$]++(-2,0)
	node[ground]{};
	
	\draw(U1 OUT) --++(1,0)
	node[circ, label=right:$V_{2}+$]{};

	\draw(U1 IN+)--++(-1,0)--++(0,-1)
	node[ocirc, label=below right:$A$]{}
	to[R=$R_3$]++(-2,0)
	node[circ, label=left:$V_1+$]{}++(2,0)--++(0,-1)
	to[R=$R_5$]++(0,-2)
	node[ground]{}++(0,3)
	to[R, a=$R_4$]++(4,0)--++(1,0)--++(0,2);
	
	\draw(U1 VCC) node[ocirc]{};
	\draw(U1 VEE) node[ocirc]{};

\end{circuitikz}
\end{document}
```
##### a. 
Show that:
$$\frac{V_2}{V_1} = T = \frac{\left(\frac{G_3}{G_2G_4}\right)(G_1+G_2)}{\left(\frac{G_3 + G_5}{G_4}\right) - \frac{G_1}{G_2}}$$
###### Node $A$
$$\frac{V_A - V_1}{R_3} + \frac{V_A - V_2}{R_4} + \frac{V_A}{R_5} = 0$$
$$\frac{V_A}{R_3} - \frac{V_1}{R_3} + \frac{V_A}{R_4} - \frac{V_2}{R_4} + \frac{V_A}{R_5} = 0$$
$$V_A\left(\frac{1}{R_3} + \frac{1}{R_4} + \frac{1}{R_5}\right) = \frac{V_1}{R_3} + \frac{V_2}{R_4}$$
$$V_A = \frac{\frac{V_1}{R_3} + \frac{V_2}{R_4}}{\frac{1}{R_3} + \frac{1}{R_4} + \frac{1}{R_5}}$$
###### Node B
$$\frac{V_B- 0}{R_1} + \frac{V_B - V_2}{R_2} = 0$$
$$\frac{V_B}{R_1} + \frac{V_B}{R_2} = \frac{V_2}{R_2}$$
$$V_B = \frac{\frac{V_2}{R_2}}{\frac{1}{R_1} + \frac{1}{R_2}}$$
###### $V_A = V_B$
$$\frac{\frac{V_1}{R_3} + \frac{V_2}{R_4}}{\frac{1}{R_3} + \frac{1}{R_4} + \frac{1}{R_5}} = \frac{\frac{V_2}{R_2}}{\frac{1}{R_1} + \frac{1}{R_2}}$$
###### Converting to Inductance to Simplify
$$\frac{V_1G_3 + V_2G_4}{G_3 + G_4 + G_5} = \frac{V_2G_2}{G_1 + G_2}$$
$$V_1G_3 + V_2G_4 = \frac{V_2G_2(G_3 + G_4 + G_5)}{G_1 + G_2}$$
$$V_1G_3 = \frac{V_2G_2(G_3 + G_4 + G_5)}{G_1 + G_2} - V_2G_4 = V_2\left(\frac{G_2(G_3 + G_4 + G_5)}{G_1 + G_2} - G_4\right) $$
###### Manipulating to Match the Form
$$\frac{V_2}{V_1} = \frac{G_3}{\left(\frac{G_2(G_3 + G_4 + G_5)}{G_1 + G_2} - G_4\right)} \left(\frac{\frac{1}{G_2G_4}}{\frac{1}{G_2G_4}}\right)  = \frac{\frac{G_3}{G_2G_4}}{\frac{G_3 + G_4 + G_5}{G_4(G_1 + G_2)}- \frac{1}{G_2}}\left(\frac{G_1 + G_2}{G_1 + G_2}\right)$$
$$ = \frac{\frac{G_3}{G_2G_4}(G_1 + G_2)}{\frac{G_3 + G_5}{G_4} + \frac{G_4}{G_4} -\frac{G_1}{G_2} - \frac{G_2}{G_2}}$$
$$= = \frac{\frac{G_3}{G_2G_4}(G_1 + G_2)}{\frac{G_3 + G_5}{G_4} + \cancel{1} -\frac{G_1}{G_2} - \cancel{1}} =  \color{green}\Large\frac{\frac{G_3}{G_2G_4}(G_1 + G_2)}{\frac{G_3 + G_5}{G_4} -\frac{G_1}{G_2} }$$
##### b. 
Let $R_1=R_2=R_3=R_5 =R$. $R_4$ can be tuned. Sketch $T$ as a function of $R_4$.
$$T = \frac{\frac{2R_4}{R}}{\frac{2R_4}{R} -1 } = \frac{2R_4}{2R_4 - R}$$
At $R_4 = 0$,  $T = 0$
At $R_4 = \infty$, $T = 1$
At $\frac{R}{2}$, $T = \infty$, amp slams to $V_{max}$

```tikz
\usepackage{pgfplots}

\begin{document}

\begin{tikzpicture}
\begin{axis}[
    width=15cm,
    height=15cm,
    xlabel={$\frac{R_4}{R}$},
    xlabel style={font=\large},
    ylabel={$T = \frac{V_2}{V_1}$},
    ylabel style={font=\large},
    xmin=-10, 
    xmax=10,
    ymin=-10, 
    ymax=10,
    grid=major,
    axis lines=middle,
    enlargelimits=true,
]
\addplot[orange, thick, domain=-20:0.499, samples=1000] {(2*x)/((2*x) - 1)};
\addplot[orange, thick, domain=0.501:20, samples=1000] {(2*x)/((2*x) - 1)};
\addplot[black, dashed, domain=10:-10] {1};
\addplot[black, dashed] coordinates {(0.5,-10) (0.5,10)};

\addplot[red, only marks, mark=x, mark size=4pt] coordinates {(0.5,0)};

\node[red, below, font=\Large] at (axis cs:0.5, 0) {$\frac{R}{2}$};


\end{axis}

\end{tikzpicture}
\end{document}
```
