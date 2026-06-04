## Class 19
#### Review of Cascaded Op-Amp Bi-quad Circuit

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
\begin{circuitikz}[american, scale=1.2, font=\Large]
	% invoke the opamp	
	\opamp(0,0){A}
	
	\draw(A IN+) 
	node[ground]{};
	
	\draw(A IN-)--++(0,1)
	%to[R=$1$]++(-2,0)
	%node[circ, label=left:$V_2$]{}
	coordinate(START)
	to[R=$R_3$]++(-2,0)
	node[circ, label=left:$V_1$]{}
	++(0,0.5)
	++(0,-0.25);
	%--++(-0.5,0);
	
	\draw(A IN-)--++(0,1)
	%to[R, a=$1$]++(2,0)
	
	--++(0.5,0)
	--++(0,0.25)
	to[R=$R_1$]++(2,0)
	++(-2,0)
	--++(0,-0.5)
	to[capacitor, a=$C_1$]++(2,0)
	--++(0,0.5)
	++(0,-0.25)
	--++(0.5,0)
	--++(2,0)--++(0,-2);
	
	
	\path(A VCC) node[ocirc, above]{};
	\path(A VEE) node[ocirc, below]{};

	\opamp(7,-2){C}
	
	\draw(C IN+) 
	node[ground]{};
	
	\draw(C IN-)--++(0,1)
	to[R=$R_4$]++(-2,0)
	--++(0,-1)
	node[circ, label=below:$V_2'$]{}
	++(0,1)
	coordinate(C INPUT);
	
	\draw(C IN-)--++(0,1)
	to[capacitor, a=$C_2$]++(2,0)
	
	--++(2,0)--++(0,-2);
	
	
	\path(C VCC) node[ocirc, above]{};
	\path(C VEE) node[ocirc, below]{};
	
	\draw(A OUT)--++(2,0)
	%node[circ, label=right:$V_{2}'$]{};
	--(C INPUT);
	
	% invoke the opamp	
	\opamp(14,-4){B}
	
	\draw(B IN+) 
	node[ground]{};
	
	\draw(B IN-)--++(0,1)
	to[R=$R_5$]++(-2,0)
	coordinate(B INPUT)
	--++(0,-1)
	node[circ, label=below:$V_3$]{}
	++(0,1);
	
	\draw(B IN-)--++(0,1)
	to[R, a=$R_5$]++(2,0)
	
	--++(2,0)--++(0,-2);
	
	\draw(B OUT)--++(2,0)
	node[circ, label=right:$V_{2}$]{};
	
	\draw(B OUT)
	--++(1.5,0)
	--++(0,8)
	to[R=$R_2$]++(-19,0)
	--(START);
	
	\path(B VCC) node[ocirc, above]{};
	\path(B VEE) node[ocirc, below]{};

	\draw(C OUT)--++(2,0)
	--(B INPUT);
	%node[circ, label=right:$V_{2}$]{};
	
\end{circuitikz}
\end{document}
```

##### Low Pass
###### Transfer Function
$$\frac{V_2}{V_1} = -\frac{R_2}{R_3}\frac{\frac{1}{R_2R_4C_1C_2}}{s^2 + \frac{1}{R_1C_1}s + \frac{1}{R_2R_4C_1C_4}}$$
###### DC Gain
$$H = \frac{R_2}{R_3}$$
###### Q-factor (Sharpness)
$$Q = \sqrt{\frac{R_1^2C_1}{R_2R_4C_2}}$$
###### Cutoff Frequency
$$\omega_0^2 = \frac{1}{R_2R_4C_1C_2}$$

Recognize this is a low pass filter. As $s$ increases, gain approaches 0.

Asymptotic rolloff will be $-40dB/\text{decade}$

##### Bandpass
###### Transfer Function
$$\frac{V_2'}{V_1} = -\frac{R_1}{R_3}\frac{\frac{1}{R_1C_1}s}{s^2 + \frac{1}{R_1C_1}s + \frac{1}{R_2R_4C_1C_4}}$$
###### Midband Gain
$$H = \frac{R_1}{R_3}$$
###### Q-factor (Sharpness)
$$Q = \sqrt{\frac{R_1^2C_1}{R_2R_4C_1C_2}}$$
###### Center Frequency
$$\omega_0^2 = \frac{1}{R_2R_4C_1C_2}$$
###### Half Power Frequencies $\omega_1$ and $\omega _2$ 
Equally spaced around the center frequency. The difference beween them is the bandwidth
$$\omega _1, \omega_2 = \sqrt{1 + \left(\frac{1}{2Q}\right)^2}\pm\frac{1}{2Q}$$
$\omega_1\omega_2 = 1$ and $\omega_1-\omega_2 = \frac{1}{Q} = BW$
###### Bandwidth
$$BW = \frac{\omega_0}{Q}$$
#### Four Op-Amp Circuit
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
\begin{circuitikz}[american, scale=1.2, font=\Large]
	% invoke the opamp	
	\opamp(0,0){D}
	
	\draw(D IN+) 
	node[ground]{};
	
	\draw(D IN-)--++(0,1)
	--++(0,0.5)
	to[R, a=$R_6$]++(-2,0)
	node[circ, label=left:$V_6$]{}
	++(2,0)
	--++(0,-1)
	to[R=$R_6$]++(-2,0)
	node[circ, label=left:$V_6'$]{}
	++(0,0.5)
	++(0,-0.25);
	%--++(-0.5,0);
	
	\draw(D IN-)--++(0,1)
	to[R=$R_6$]++(4,0)
	--++(0,-2);
	
	
	\path(D VCC) node[ocirc, above]{};
	\path(D VEE) node[ocirc, below]{};
	
	\draw(D OUT)--++(2,0)
	node[circ, label=right:$V_{2}''$]{};
	
\end{circuitikz}
\end{document}
```
This individual amp has the transfer function
$$\frac{V_2''}{V_1} = -(V_6 + V_6')$$
Adding it in to the 3 amp circuit...
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
\begin{circuitikz}[american, scale=1.2, font=\Large]
	% invoke the opamp	
	\opamp(0,0){A}
	
	\draw(A IN+) 
	node[ground]{};
	
	\draw(A IN-)--++(0,1)
	%to[R=$1$]++(-2,0)
	%node[circ, label=left:$V_2$]{}
	coordinate(START)
	to[R=$R_3$]++(-2,0)
	node[circ, label=left:$V_1$]{}
	coordinate(V1)
	++(0,0.5)
	++(0,-0.25);
	%--++(-0.5,0);
	
	\draw(A IN-)--++(0,1)
	%to[R, a=$1$]++(2,0)
	
	--++(0.5,0)
	--++(0,0.25)
	to[R=$R_1$]++(2,0)
	++(-2,0)
	--++(0,-0.5)
	to[capacitor, a=$C_1$]++(2,0)
	--++(0,0.5)
	++(0,-0.25)
	--++(0.5,0)
	--++(2,0)--++(0,-2);
	
	
	\path(A VCC) node[ocirc, above]{};
	\path(A VEE) node[ocirc, below]{};

	\opamp(7,-2){C}
	
	\draw(C IN+) 
	node[ground]{};
	
	\draw(C IN-)--++(0,1)
	to[R=$R_4$]++(-2,0)
	--++(0,-1)
	%node[circ, label=below:$V_2'$]{}
	coordinate(V2')
	++(0,1)
	coordinate(C INPUT);
	
	\draw(C IN-)--++(0,1)
	to[capacitor, a=$C_2$]++(2,0)
	
	--++(2,0)--++(0,-2);
	
	
	\path(C VCC) node[ocirc, above]{};
	\path(C VEE) node[ocirc, below]{};
	
	\draw(A OUT)--++(2,0)
	%node[circ, label=right:$V_{2}'$]{};
	--(C INPUT);
	
	% invoke the opamp	
	\opamp(14,-4){B}
	
	\draw(B IN+) 
	node[ground]{};
	
	\draw(B IN-)--++(0,1)
	to[R=$R_5$]++(-2,0)
	coordinate(B INPUT)
	--++(0,-1)
	node[circ, label=below:$V_3$]{}
	++(0,1);
	
	\draw(B IN-)--++(0,1)
	to[R, a=$R_5$]++(2,0)
	
	--++(2,0)--++(0,-2);
	
	\draw(B OUT)--++(2,0)
	node[circ, label=right:$V_{2}$]{};
	
	\draw(B OUT)
	--++(1.5,0)
	--++(0,8)
	to[R=$R_2$]++(-19,0)
	--(START);
	
	\path(B VCC) node[ocirc, above]{};
	\path(B VEE) node[ocirc, below]{};

	\draw(C OUT)--++(2,0)
	--(B INPUT);
	%node[circ, label=right:$V_{2}$]{};
	
	\opamp(7,-8){D}
	
	\draw(D IN+) 
	node[ground]{};
	
	\draw(D IN-)--++(0,1)
	--++(0,0.5)
	to[R, a=$R_6$]++(-2,0)
	%node[circ, label=left:$V_6$]{}
	coordinate(V6)
	++(2,0)
	--++(0,-1)
	to[R=$R_6$]++(-2,0)
	%node[circ, label=left:$V_6'$]{}
	coordinate(V6')	
	++(0,0.5)
	++(0,-0.25);
	%--++(-0.5,0);
	
	\draw(D IN-)--++(0,1)
	to[R=$R_6$]++(4,0)
	--++(0,-2);
	
	
	\path(D VCC) node[ocirc, above]{};
	\path(D VEE) node[ocirc, below]{};
	
	\draw(D OUT)--++(2,0)
	node[circ, label=right:$V_{2}''$]{};
	
	\draw(V6')--++(-7,0)--(V1);
	\draw(V6)--(V2');
	
\end{circuitikz}
\end{document}
```

$$V_2'' = -V_2' - V_1$$
$$\frac{V_2''}{V_1} = -\frac{V_2'}{V_1}-1 = -\frac{R_1}{R_3}\frac{\frac{1}{R_1C_1}s}{s^2 + \frac{1}{R_1C_1}s + \frac{1}{R_2R_4C_1C_4}} - 1$$
$$\frac{V_2''}{V_1}=-\frac{s^2 + \left(\frac{1}{R_1C_1} - \frac{1}{R_3C_1}\right)s + \frac{1}{R_2R_4C_1C_2}}{s^2 + \frac{1}{R_1C_1}s + \frac{1}{R_2R_4C_1C_4} }$$
When $R_1 = R_3$,  the term $(\frac{1}{R_1C_1} - \frac{1}{R_3C_1})s$ is eliminated, and the transfer function takes the form:
##### Notch Filter
$$\frac{V_2''}{V_1}=-\frac{s^2 + \frac{1}{R_2R_4C_1C_2}}{s^2 + \frac{1}{R_1C_1}s + \frac{1}{R_2R_4C_1C_4} } = \frac{s^2 + \omega_0^2}{s^2 + \frac{\omega_0}{Q}s + \omega_0^2}$$
$$Q = \sqrt{\frac{R_1^2C_1}{R_2R_4C_2}}$$
$$\omega_0^2 = \frac{1}{R_2R_4C_1C_2}$$
At $\omega = \omega_0$ $|\frac{V_2''}{V_1}| = 0$
##### All-Pass Filter

If we let $R_3 = \frac{1}{2}R_1$ 
$$\frac{1}{R_3C_1} = \frac{1}{\frac{1}{2}R_1C_1} = \frac{2}{R_1C_1}$$
This will make the term $(\frac{1}{R_1C_1} - \frac{1}{R_3C_1})s = -\frac{1}{R_1C_1}$
$$\frac{V_2''}{V_1} = -\frac{s^2 -\frac{1}{R_1C_1}s+ \frac{1}{R_2R_4C_1C_2}}{s^2 + \frac{1}{R_1C_1}s + \frac{1}{R_2R_4C_1C_4} }$$
$$\frac{1}{R_1C_1} = \frac{\omega_0}{Q}$$
$$\frac{V_2''}{V_1} = \frac{s^2 - \frac{\omega_0}{Q}s + \omega_0^2}{s^2 - \frac{\omega_0}{Q}s + \omega_0^2}\Longrightarrow \left|\frac{V_2''}{V_1}\right| = 1 \text{ (always)}$$
##### High Pass
If we add one more line...
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
\begin{circuitikz}[american, scale=1.2, font=\Large]
	% invoke the opamp	
	\opamp(0,0){A}
	
	\draw(A IN+) 
	node[ground]{};
	
	\draw(A IN-)--++(0,1)
	%to[R=$1$]++(-2,0)
	%node[circ, label=left:$V_2$]{}
	coordinate(START)
	to[R=$R_3$]++(-2,0)
	node[circ, label=left:$V_1$]{}
	coordinate(V1)
	++(0,0.5)
	++(0,-0.25);
	%--++(-0.5,0);
	
	\draw(A IN-)--++(0,1)
	%to[R, a=$1$]++(2,0)
	
	--++(0.5,0)
	--++(0,0.25)
	to[R=$R_1$]++(2,0)
	++(-2,0)
	--++(0,-0.5)
	to[capacitor, a=$C_1$]++(2,0)
	--++(0,0.5)
	++(0,-0.25)
	--++(0.5,0)
	--++(2,0)--++(0,-2);
	
	
	\path(A VCC) node[ocirc, above]{};
	\path(A VEE) node[ocirc, below]{};

	\opamp(7,-2){C}
	
	\draw(C IN+) 
	node[ground]{};
	
	\draw(C IN-)--++(0,1)
	to[R=$R_4$]++(-2,0)
	--++(0,-1)
	%node[circ, label=below:$V_2'$]{}
	coordinate(V2')
	++(0,1)
	coordinate(C INPUT);
	
	\draw(C IN-)--++(0,1)
	to[capacitor, a=$C_2$]++(2,0)
	
	--++(2,0)--++(0,-2);
	
	
	\path(C VCC) node[ocirc, above]{};
	\path(C VEE) node[ocirc, below]{};
	
	\draw(A OUT)--++(2,0)
	%node[circ, label=right:$V_{2}'$]{};
	--(C INPUT);
	
	% invoke the opamp	
	\opamp(14,-4){B}
	
	\draw(B IN+) 
	node[ground]{};
	
	\draw(B IN-)--++(0,1)
	to[R=$R_5$]++(-2,0)
	coordinate(B INPUT)
	--++(0,-1)
	node[circ, label=below:$V_3$]{}
	++(0,1);
	
	\draw(B IN-)--++(0,1)
	to[R, a=$R_5$]++(2,0)
	
	--++(2,0)--++(0,-2);
	
	\draw(B OUT)--++(2,0)
	coordinate(III)
	node[circ, label=right:$V_{2}$]{};

	
	\draw(B OUT)
	--++(1.5,0)
	--++(0,8)
	to[R=$R_2$]++(-19,0)
	--(START);
	
	\path(B VCC) node[ocirc, above]{};
	\path(B VEE) node[ocirc, below]{};

	\draw(C OUT)--++(2,0)
	--(B INPUT);
	%node[circ, label=right:$V_{2}$]{};
	
	\opamp(7,-10){D}
	
	\draw(D IN+) 
	node[ground]{};
	
	\draw(D IN-)--++(0,1)
	--++(0,0.5)
	coordinate(OOO)
	to[R, a=$R_6$]++(-2,0)
	%node[circ, label=left:$V_6$]{}
	coordinate(V6)
	++(2,0)
	--++(0,-1)
	to[R=$R_6$]++(-2,0)
	%node[circ, label=left:$V_6'$]{}
	coordinate(V6')	
	++(0,0.5)
	++(0,-0.25);
	%--++(-0.5,0);
	
	\draw(D IN-)--++(0,1)
	to[R=$R_6$]++(4,0)
	--++(0,-2);
	
	
	\path(D VCC) node[ocirc, above]{};
	\path(D VEE) node[ocirc, below]{};
	
	\draw(D OUT)--++(2,0)
	node[circ, label=right:$V_{2}''$]{};
	
	\draw(V6')--++(-7,0)--(V1);
	\draw(V6)--(V2');
	
	\draw(III)
	--++(0,-2)
	--++(-9,0)
	to[R=$R_6$]++(-3.5,0)
	--(OOO);
	
	
\end{circuitikz}
\end{document}
```
$$V_2'' = -V_1 - V_2' -V_2$$
$$\frac{V_2''}{V_1} = -1-\frac{V_2'}{V_1} - \frac{V_2}{V_1} \Longrightarrow \frac{s^2}{s^2 + \frac{\omega_0}{Q}s + \omega_0^2}$$
#### IW 19.1
Use Tow-Thomas bi-quad circuits to design a lowpass filter with cutoff at $30k\ rad/s$ and a DC gain of $0dB$, and peak gain of $10dB$.
Use $Q=3$ and $C_1=C_2=0.1\mu F$ 

If $R_2 = R_4 = 1$
$$Q = \sqrt{\frac{R_1^2C_1}{R_2R_4C_2}} = R_1 = 3$$
$$H = \frac{R_1}{R_3} = 1$$
$$R_1 = R_3 = 3$$
To scale $\omega_0$ to $30k$, 
$$\omega_0^2 = \frac{1}{R_2R_4C_1C_2} = \frac{1}{1(0.1)^2}$$
$$\frac{1}{(0.1)^2} = 100 = \omega_0^2\Longrightarrow \omega_0 = 10rad/s$$
We need to scale $\omega_0$ by a factor of 3000, so
$$C_1=C_2 = \frac{0.1\times 10^{-6}}{3000} = 3.33\times 10^{-11} = 33.3pF$$
$$R_1=R_3 = 3\times 3000 = 9k\Omega$$
$$R_2 = R_4 = 3k\Omega$$






![[Pasted image 20260526100547.png]]

## Class 20
#### Butterworth Filters
Given some transfer function:
$$T_1(s) = \frac{1}{s+ 1}$$
If we imagine the frequency response's magnitude, squared
$$|T_1(j\omega) |^2 = \frac{1}{|j\omega + 1|^2} = \frac{1}{1 + \omega^2}$$
$$|T_n(j\omega)| = \frac{1}{\sqrt{1 + \omega^{2n}}}$$
