## Class 17
#### Tow-Thomas Bi-quad Circuit
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
	--++(-0.5,0)
	--++(0,0.25)
	to[R, a=$R_2$]++(-2,0)
	%node[circ, label=left:$V_2$]{}
	coordinate(START)
	++(2,0)
	--++(0,-0.5)
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
	node[circ, label=below:$V_2'$]{}
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
	node[circ, label=above:$V_4$]{};
	
	\draw(B IN-)--++(0,1)
	to[R, a=$R_5$]++(2,0)
	
	--++(2,0)--++(0,-2);
	
	\draw(B OUT)--++(2,0)
	node[circ, label=right:$V_{2}$]{};
	
	\draw(B OUT)
	--++(1.5,0)
	--++(0,8)
	--++(-21.5,0)
	--(START);
	
	\path(B VCC) node[ocirc, above]{};
	\path(B VEE) node[ocirc, below]{};

	\draw(C OUT)--++(2,0)
	--(B INPUT);
	%node[circ, label=right:$V_{2}$]{};
	
\end{circuitikz}
\end{document}
```
A Tow-Thomas circuit can be used to realize any lowpass filter with a transfer function.
$$T(s) = \pm H\frac{\omega^2}{s^2 + \frac{\omega}{Q} + \omega^2}$$
The individual transfer functions are:
###### Summing Amp
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
	%to[R=$1$]++(-2,0)
	--++(-0.5,0)
	--++(0,0.25)
	to[R, a=$R_2$]++(-2,0)
	node[circ, label=left:$V_3$]{}
	++(2,0)
	--++(0,-0.5)
	to[R=$R_3$]++(-2,0)
	node[circ, label=left:$V_1$]{}
	++(0,0.5)
	++(0,-0.25);
	%--++(-0.5,0);
	
	\draw(U1 IN-)--++(0,1)
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
	
	\draw(U1 OUT)--++(2,0)
	node[circ, label=right:$V_{2}'$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};

	
\end{circuitikz}
\end{document}
```
$$V'_2(s) = \left(\frac{\frac{1}{R_3}}{C_1s + \frac{1}{R_1}}\right)V_1 + \left(\frac{\frac{1}{R_2}}{C_1s + \frac{1}{R_1}}\right)V_3$$
###### Integrator
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
	to[R=$R_4$]++(-2,0)
	node[circ, label=left:$V_2'$]{};
	
	\draw(U1 IN-)--++(0,1)
	to[capacitor, a=$C_2$]++(2,0)
	
	--++(2,0)--++(0,-2);
	
	\draw(U1 OUT)--++(2,0)
	node[circ, label=right:$V_{4}$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};
\end{circuitikz}
\end{document}
```
This is $\frac{1}{s}$ with some constants, $\frac{1}{s} F(s) \Longrightarrow \int f(t)\ dt$
This is the Laplace of integration, hence the name integrator.
$$V_4(s) = \left(\frac{\frac{1}{R_4}}{C_2s}\right)V_2'$$
###### Unity Gain Inverting Amp
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
	to[R=$R_5$]++(-2,0)
	node[circ, label=left:$V_4$]{};
	
	\draw(U1 IN-)--++(0,1)
	to[R, a=$R_5$]++(2,0)
	
	--++(2,0)--++(0,-2);
	
	\draw(U1 OUT)--++(2,0)
	node[circ, label=right:$V_{2}$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};

	
\end{circuitikz}
\end{document}
```
$$V_2(s) = \left[-\right]\cdot\left[\left(\frac{\frac{1}{R_4}}{C_2s}\right)\right]\cdot\left[V_1\left(\frac{\frac{1}{R_3}}{C_1s + \frac{1}{R_1}}\right) + V_3\left(\frac{\frac{1}{R_2}}{C_1s + \frac{1}{R_1}}\right)\right]$$
##### Putting the above 3 circuits together
With $V_2 = V_3$
$$T(s) = \frac{V_2}{V_1} = -\frac{R_2}{R_3}\frac{\frac{1}{R_2R_4C_1C_2}}{s^2 + \frac{1}{R_1C_1}s + \frac{1}{R_2R_4C_1C_2}}$$
$$Q = \sqrt{\frac{R_1^2C_1}{R_2R_4C_2}}$$
This is a lowpass filter. The transfer function can be matched with the general second-order lowpass function:
$$T(s) = \pm H\frac{\omega_0^2}{s^2 + \frac{\omega_0}{Q}s + \omega_0^2}$$
The frequency response is 
$$T(j\omega) = \pm H\frac{\omega_0^2}{(j\omega)^2 + \frac{\omega_0}{Q}(j\omega) + \omega_0^2}$$
At $\omega=\omega_0$
$$T(j\omega_0) = H\frac{\omega_0^2}{(j\omega_0^2) + \frac{\omega_0}{Q})(j\omega_0) + \omega_0^2} = H\frac{\omega_0^2}{j\frac{\omega_0^2}{Q}} = -jHQ$$
$$|T(j\omega_0)| = HQ$$
$$\angle T(j\omega_0) = -90^\circ$$
##### Tuning Strategy
We **normalize** the transfer function:
If we say $C_1 =C_2 = 1$ 
And $R_2 = R_4 = 1$

By doing this:
$\omega_0$ will be fixed to be 1.
$H$ will be $R_3$
$Q$ will be $R_1$

This is okay, because we can use $k_f$ to scale the overall $\omega_0$, remember, $k_f$ is only applied to $C$. $C_{new} = C_{old}/k_f$.

Then, scale with $k_m$ on all $R$ and $C$ if desired.

##### Cutoff Frequency
For first order filters, recall that this is where the gain is $-3dB$, however, with a bi-quad, the cutoff frequency is $HQ$, which is greater than the DC gain $H$ if $Q>1$. 
![[Pasted image 20260526101037.png]]
![[Pasted image 20260526100547.png]]

#### Example: Bi-Quad Circuit Design
Poles at $-577\pm j816.5$
DC gain $H=2$

There are opposite and equal poles $p$ and $\bar{p}$, that lie on the same circuit on $(\mathcal{R}e, \mathcal{I}m) = (-577, 816.5)$

So:
$$\omega_0^2 = 577^2+816.5^2$$
$$\cos\psi = \frac{-577}{\omega_0} = \frac{1}{2Q}$$

$$\psi = \arctan\left(\frac{816.5}{577}\right) = 54.75^\circ$$
$\frac{1}{2Q} =0.577$
$$Q = \frac{1}{2(0.577)} = 0.866$$
$$\omega_0 = \sqrt{577^2 + 816.5^2} = 999.8\text{ rad}$$

$$T(s) = -H\frac{(999.8)^2}{s^2 + \frac{999.8}{0.866}s + (999.8)^2}\approx-H\frac{1000^2}{s^2 + \frac{1000}{0.866}s + 1000^2}$$
$$R_2=R_4 = 1$$
$$C_1=C_2 =1 $$
For $\omega_0 = 1000$, $k_f =1000$
$$C_1=C_2 = \frac{1}{1000}F = 1mF$$
$$R_1 = Q = 0.866\Omega$$
$$R_3 = \frac{1}{H} = \frac{1}{2} = 0.5\Omega$$
We'll want a more reasonable $R_1$ and $R_2$, so we can use a magnitude scale $k_m$ to adjust.


## Class 18

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
\begin{circuitikz}[american, scale=1.2]
	% invoke the opamp	
	\opamp(0,0){A}
	
	\draw(A IN+) 
	node[ground]{};
	
	\draw(A IN-)--++(0,1)
	%to[R=$1$]++(-2,0)
	--++(-0.5,0)
	--++(0,0.25)
	to[R, a=$1$]++(-2,0)
	node[circ, label=left:$V_3$]{}
	%coordinate(START)
	++(2,0)
	--++(0,-0.5)
	to[R=$1$]++(-2,0)
	node[circ, label=left:$V_1$]{}
	++(0,0.5)
	++(0,-0.25);
	%--++(-0.5,0);
	
	\draw(A IN-)--++(0,1)
	%to[R, a=$1$]++(2,0)
	
	--++(0.5,0)
	--++(0,0.25)
	to[R=$0.5\Omega$]++(2,0)
	++(-2,0)
	--++(0,-0.5)
	to[capacitor, a=$1F$]++(2,0)
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
	to[R=$1$]++(-2,0)
	%--++(-0.5,0)
	%--++(0,0.25)
	%to[R, a=$2\Omega$]++(-2,0)
	%++(2,0)
	%--++(0,-0.5)
	%to[capacitor, l=$1F$]++(-2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(-0.5,0)
	node[circ, label=below:$V_2'$]{}
	coordinate(C INPUT);
	
	\draw(C IN-)--++(0,1)
	to[capacitor, a=$1$]++(2,0)
	
	%--++(0.5,0)
	%--++(0,0.25)
	%to[R=$\frac{1}{3}\Omega$]++(2,0)
	%++(-2,0)
	%--++(0,-0.5)
	%to[capacitor, a=$1F$]++(2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(0.5,0)
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
	to[R=$1$]++(-2,0)
	%--++(-0.5,0)
	%--++(0,0.25)
	%to[R, a=$2\Omega$]++(-2,0)
	%++(2,0)
	%--++(0,-0.5)
	%to[capacitor, l=$1F$]++(-2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(-0.5,0)
	%node[circ, label=left:$V_1$]{};
	coordinate(B INPUT);
	
	\draw(B IN-)--++(0,1)
	to[R, a=$1$]++(2,0)
	
	%--++(0.5,0)
	%--++(0,0.25)
	%to[R=$\frac{1}{3}\Omega$]++(2,0)
	%++(-2,0)
	%--++(0,-0.5)
	%to[capacitor, a=$1F$]++(2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(0.5,0)
	--++(2,0)--++(0,-2);
	
	\draw(B OUT)--++(2,0)
	node[circ, label=right:$V_{2}$]{};
	
	% \draw(B OUT)
	% --++(1.5,0)
	% --++(0,8)
	% --++(-21.5,0)
	% --(START);
	
	\path(B VCC) node[ocirc, above]{};
	\path(B VEE) node[ocirc, below]{};

	\draw(C OUT)--++(2,0)
	--(B INPUT);
	%node[circ, label=right:$V_{2}$]{};
	
\end{circuitikz}
\end{document}
```
$$V_2' = -V_1\left(\frac{1}{2 + s}\right) - V_3\left(\frac{1}{2 + s}\right)$$
$$V_2  = V_2'\left(\frac{1}{s}\right)$$
Now, adding back the feedback path
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
\begin{circuitikz}[american, scale=1.2]
	% invoke the opamp	
	\opamp(0,0){A}
	
	\draw(A IN+) 
	node[ground]{};
	
	\draw(A IN-)--++(0,1)
	%to[R=$1$]++(-2,0)
	--++(-0.5,0)
	--++(0,0.25)
	to[R, a=$1$]++(-2,0)
	%node[circ, label=left:$V_3$]{}
	coordinate(START)
	++(2,0)
	--++(0,-0.5)
	to[R=$1$]++(-2,0)
	node[circ, label=left:$V_1$]{}
	++(0,0.5)
	++(0,-0.25);
	%--++(-0.5,0);
	
	\draw(A IN-)--++(0,1)
	%to[R, a=$1$]++(2,0)
	
	--++(0.5,0)
	--++(0,0.25)
	to[R=$0.5\Omega$]++(2,0)
	++(-2,0)
	--++(0,-0.5)
	to[capacitor, a=$1F$]++(2,0)
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
	to[R=$1$]++(-2,0)
	%--++(-0.5,0)
	%--++(0,0.25)
	%to[R, a=$2\Omega$]++(-2,0)
	%++(2,0)
	%--++(0,-0.5)
	%to[capacitor, l=$1F$]++(-2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(-0.5,0)
	node[circ, label=below:$V_2'$]{}
	coordinate(C INPUT);
	
	\draw(C IN-)--++(0,1)
	to[capacitor, a=$1$]++(2,0)
	
	%--++(0.5,0)
	%--++(0,0.25)
	%to[R=$\frac{1}{3}\Omega$]++(2,0)
	%++(-2,0)
	%--++(0,-0.5)
	%to[capacitor, a=$1F$]++(2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(0.5,0)
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
	to[R=$1$]++(-2,0)
	%--++(-0.5,0)
	%--++(0,0.25)
	%to[R, a=$2\Omega$]++(-2,0)
	%++(2,0)
	%--++(0,-0.5)
	%to[capacitor, l=$1F$]++(-2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(-0.5,0)
	%node[circ, label=left:$V_1$]{};
	coordinate(B INPUT);
	
	\draw(B IN-)--++(0,1)
	to[R, a=$1$]++(2,0)
	
	%--++(0.5,0)
	%--++(0,0.25)
	%to[R=$\frac{1}{3}\Omega$]++(2,0)
	%++(-2,0)
	%--++(0,-0.5)
	%to[capacitor, a=$1F$]++(2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(0.5,0)
	--++(2,0)--++(0,-2);
	
	\draw(B OUT)--++(2,0)
	node[circ, label=right:$V_{2}$]{};
	
	\draw(B OUT)
	--++(1.5,0)
	--++(0,8)
	--++(-21.5,0)
	--(START);
	
	\path(B VCC) node[ocirc, above]{};
	\path(B VEE) node[ocirc, below]{};

	\draw(C OUT)--++(2,0)
	--(B INPUT);
	%node[circ, label=right:$V_{2}$]{};
	
\end{circuitikz}
\end{document}
```
$$V_2 =  -V_1\left(\frac{1}{2s+s^2}\right) - V_2\left(\frac{1}{2s+s^2}\right)$$
$$V_2\left(1 + \frac{1}{2s+s^2}\right) = -V_1\left(\frac{1}{2s+ s^2}\right)$$
$$T(s) = \frac{V_2}{V_1} = -\frac{\frac{1}{2s+s^2}}{1 + \frac{1}{2s + s^2}}=-\frac{1}{s^2 +2s+ 1}$$

What if we eliminated the last inverting amp?

As before, except last stage will have negative sign un-cancelled
$$V_2' = -V_1\left(\frac{1}{2 + s}\right) - V_3\left(\frac{1}{2 + s}\right)$$
$$V_2 = -V_2'\left(\frac{1}{s}\right)$$
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
\begin{circuitikz}[american, scale=1.2]
	% invoke the opamp	
	\opamp(0,0){A}
	
	\draw(A IN+) 
	node[ground]{};
	
	\draw(A IN-)--++(0,1)
	%to[R=$1$]++(-2,0)
	--++(-0.5,0)
	--++(0,0.25)
	to[R, a=$1$]++(-2,0)
	%node[circ, label=left:$V_3$]{}
	coordinate(START)
	++(2,0)
	--++(0,-0.5)
	to[R=$1$]++(-2,0)
	node[circ, label=left:$V_1$]{}
	++(0,0.5)
	++(0,-0.25);
	%--++(-0.5,0);
	
	\draw(A IN-)--++(0,1)
	%to[R, a=$1$]++(2,0)
	
	--++(0.5,0)
	--++(0,0.25)
	to[R=$0.5\Omega$]++(2,0)
	++(-2,0)
	--++(0,-0.5)
	to[capacitor, a=$1F$]++(2,0)
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
	to[R=$1$]++(-2,0)
	%--++(-0.5,0)
	%--++(0,0.25)
	%to[R, a=$2\Omega$]++(-2,0)
	%++(2,0)
	%--++(0,-0.5)
	%to[capacitor, l=$1F$]++(-2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(-0.5,0)
	node[circ, label=below:$V_2'$]{}
	coordinate(C INPUT);
	
	\draw(C IN-)--++(0,1)
	to[capacitor, a=$1$]++(2,0)
	
	%--++(0.5,0)
	%--++(0,0.25)
	%to[R=$\frac{1}{3}\Omega$]++(2,0)
	%++(-2,0)
	%--++(0,-0.5)
	%to[capacitor, a=$1F$]++(2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(0.5,0)
	--++(2,0)--++(0,-2);
	
	
	\path(C VCC) node[ocirc, above]{};
	\path(C VEE) node[ocirc, below]{};
	
	\draw(A OUT)--++(2,0)
	%node[circ, label=right:$V_{2}'$]{};
	--(C INPUT);
	
	
	\draw(C OUT)
	--++(1.5,0)
	--++(0,8)
	--++(-14.5,0)
	--(START);
	

	\draw(C OUT)--++(2,0)
	%--(B INPUT);
	node[circ, label=right:$V_{2}$]{};
	
\end{circuitikz}
\end{document}
```
$$V_2 = V_1\left(\frac{1}{2s+s^2}\right) + V_2\left(\frac{1}{2s+s^2}\right)$$
$$V_2\left(1 - \frac{1}{2s + s^2}\right) = V_1\left(\frac{1}{2s + s^2}\right)$$
$$T(s) = \frac{V_2}{V_1} = \frac{\frac{1}{2s+s^2}}{1 - \frac{1}{2s + s^2}}=-\frac{-1}{s^2 +2s- 1}$$
So the poles are
$$s_1, s_2 = \frac{-2\pm\sqrt{4 + 4}}{2} = -1\pm\sqrt{2}$$
$s_1 = -2.414$
$s_2 = 0.414$

Notice poles are opposite sign

This results in the Laplace for the positive 
$$\frac{1}{s-0.414} \Longrightarrow e^{0.414t}$$
An exponential increase.

Now what if the feedback path was still taken as 

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
\begin{circuitikz}[american, scale=1.2]
	% invoke the opamp	
	\opamp(0,0){A}
	
	\draw(A IN+) 
	node[ground]{};
	
	\draw(A IN-)--++(0,1)
	%to[R=$1$]++(-2,0)
	--++(-0.5,0)
	--++(0,0.25)
	to[R, a=$1$]++(-2,0)
	%node[circ, label=left:$V_3$]{}
	coordinate(START)
	++(2,0)
	--++(0,-0.5)
	to[R=$1$]++(-2,0)
	node[circ, label=left:$V_1$]{}
	++(0,0.5)
	++(0,-0.25);
	%--++(-0.5,0);
	
	\draw(A IN-)--++(0,1)
	%to[R, a=$1$]++(2,0)
	
	--++(0.5,0)
	--++(0,0.25)
	to[R=$0.5\Omega$]++(2,0)
	++(-2,0)
	--++(0,-0.5)
	to[capacitor, a=$1F$]++(2,0)
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
	to[R=$1$]++(-2,0)
	%--++(-0.5,0)
	%--++(0,0.25)
	%to[R, a=$2\Omega$]++(-2,0)
	%++(2,0)
	%--++(0,-0.5)
	%to[capacitor, l=$1F$]++(-2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(-0.5,0)
	node[circ, label=below:$V_2'$]{}
	coordinate(C INPUT);
	
	\draw(C IN-)--++(0,1)
	to[capacitor, a=$1$]++(2,0)
	
	%--++(0.5,0)
	%--++(0,0.25)
	%to[R=$\frac{1}{3}\Omega$]++(2,0)
	%++(-2,0)
	%--++(0,-0.5)
	%to[capacitor, a=$1F$]++(2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(0.5,0)
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
	to[R=$1$]++(-2,0)
	%--++(-0.5,0)
	%--++(0,0.25)
	%to[R, a=$2\Omega$]++(-2,0)
	%++(2,0)
	%--++(0,-0.5)
	%to[capacitor, l=$1F$]++(-2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(-0.5,0)
	%node[circ, label=left:$V_1$]{};
	coordinate(B INPUT);
	
	\draw(B IN-)--++(0,1)
	to[R, a=$1$]++(2,0)
	
	%--++(0.5,0)
	%--++(0,0.25)
	%to[R=$\frac{1}{3}\Omega$]++(2,0)
	%++(-2,0)
	%--++(0,-0.5)
	%to[capacitor, a=$1F$]++(2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(0.5,0)
	--++(2,0)--++(0,-2);
	
	\draw(B OUT)--++(2,0)
	node[circ, label=right:$V_{2}$]{};
	
	\draw(B OUT)
	--++(1.5,0)
	--++(0,8)
	--++(-21.5,0)
	--(START);
	
	\path(B VCC) node[ocirc, above]{};
	\path(B VEE) node[ocirc, below]{};

	\draw(C OUT)--++(2,0)
	--(B INPUT);
	%node[circ, label=right:$V_{2}$]{};
	
\end{circuitikz}
\end{document}
```
But, we want a transfer function at $V_2'$
$$V_2' = -V_1\left(\frac{1}{2 + s}\right) - V_3\left(\frac{1}{2 + s}\right)$$
$$V_2  = V_2'\left(\frac{1}{s}\right)$$
$V_3 = V_2 = V_2'\left(\frac{1}{s}\right)$ 
$$V_2' = -V_1\left(\frac{1}{2 + s}\right) -V_2'\left(\frac{1}{2s + s^2}\right)$$
$$V_2'\left(1 + \frac{1}{2s + s^2}\right) = -V_1\left(\frac{1}{2 + s}\right)$$
$$\frac{V_2'}{V_1} = -\frac{\frac{1}{2 + s}}{1 + \frac{1}{2s + s^2}} = \frac{\frac{2s + s^2}{2 + s}}{2s + s^2 + 1} = \frac{\frac{s + 0.5s^2}{1 + 0.5s}}{2s + s^2 + 1}$$
$$T(s) = \frac{V_2'}{V_1} = -\frac{\frac{1}{Q}s}{s^2 + \frac{1}{Q}s + 1}$$
$H = 1$
$\omega_0 = 1$
We have 2 poles and a zero at the origin.

This is a bandpass filter

$$|T(j\omega)| = \frac{KQ}{\omega_0}$$
$$H = \frac{kQ}{\omega_0}$$
$$K = \frac{H\omega_0}{Q}$$
$$T(s) = \frac{H\left(\frac{\omega_0}{Q}\right)s}{s ^2 + \left(\frac{\omega_0}{Q}\right)s + \omega_0^2}$$
$$Q = \frac{\omega_0}{BW}$$
$$\omega_0 = \frac{1}{R_2R_4C_1C_2}$$
$$T(s)_{\text{low pass}} = \frac{V_2}{V_1} = -H\frac{\frac{1}{R_2R_4C_1C_2}}{s^2 + \frac{1}{R_1C_1}s + \frac{1}{R_2R_4C_1C_2}}$$
$$T(s)_{\text{band pass}} = \frac{V_2'}{V_1} =-H\frac{\frac{1}{R_3C_1}s}{s^2 + \frac{1}{R_1C_1}s + \frac{1}{R_2R_4C_1C_2}} $$
We put the denominator into this particular form:
$$s^2 + \frac{\omega_0}{Q}s + \omega_0^2$$
##### Example
Design a band pass with center frequency $\omega_0 = 1000rad/s$, bandwidth of $200rad/s$, and midband gain of $H =1$

