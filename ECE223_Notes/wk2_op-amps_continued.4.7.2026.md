## Class 3
#### Voltage Divider Application for Lab 2
##### IW 3.1
Suppose $V_{open}$ is $1V\ 1kHz$ peak value and $V_2$ is $0.97V$.
###### a.)
What is $R_S$, the output impedance of the phone?

```tikz
\usepackage{circuitikz}
\begin{document}

\begin{circuitikz}[american, scale=2, font=\Large]

	\draw(0,0)
	node[ocirc, label=left:$V_{in}$]{}
	
	to[R=$R_{S}$]++(2,0)--++(1,0)
	node[ocirc, label=right:$A$]{}--++(-1,0)
	to[R=$32\Omega$]++(0,-2)--++(1,0)
	node[ocirc, label=right:$B$]{}--++(-1,0)
	
	node[ground]{};
	
\end{circuitikz}
\end{document}
```


$$\frac{V_{AB}}{V_{in}} = \frac{32\Omega}{R_S + 32\Omega}$$
$$V_{AB}(32\Omega) + V_{AB}(R_{S}) = V_{in}(32\Omega)$$
$$(V_{AB})R_{in} = V_{S}(32\Omega) - V_{AB}(32\Omega)$$
$$R_{in} = \frac{V_{S}(32\Omega)}{V_{AB}} - 32\Omega = \frac{1(32)}{0.97} - 32 = 0.989\Omega$$

###### b.)
What is $R_S$, the input impedance of the USB sound card.
$V_{in}$ is a $1V,\ 1KHz$ signal supplied by a function generator.
```tikz
\usepackage{circuitikz}
\begin{document}

\begin{circuitikz}[american, scale=2, font=\Large]

	\draw(0,0)
	node[ocirc, label=left:$V_{in}$]{}--++(1,0)
	node[ocirc, label=below:$A$]{}
	to[R=$1k\Omega$]++(2,0)
	node[ocirc, label=below:$B$]{}--++(1,0)
	to[generic , l=$R_S$]++(0,-2)
	node[ground]{};
	
\end{circuitikz}
\end{document}
```

#### Op-Amp
##### Realistic Model
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

	\draw(0,0)
	node[ocirc, label=left:$v_+$]{}--++(1,0)	
	to[R=$R_{in}$]++(0,-3)--++(-1,0)
	node[ocirc, label=left:$v_-$]{};
	
	\draw(4,0)
	node[ocirc, label=right:$v_{out}$]{}
	to[R=$R_{out}$]++(-2,0)
	to[cvsource, l=$A_0(v_+ - v_-)$]++(0,-3)
	node[ground]{};
	
\end{circuitikz}
\end{document}

```
1. There is no current at $v_+/v_-$
2. Output impedance is very small
3. The amplification is $A_0$, a very large controlled voltage source.
4. $R_{in}$ is a huge resistance, $\approx 200k\Omega$ 
5. The output is limited to the power supply max/min

##### Idealized Model (Controlled Source)

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

	\draw(0,0)
	node[ocirc, label=left:$v_+$]{}--++(1,0)	
	node[ocirc]{}
	++(0,-3)
	node[ocirc]{}
	--++(-1,0)
	node[ocirc, label=left:$v_-$]{};
	
	\draw(4,0)
	node[ocirc, label=right:$v_{out}$]{}
	to[R=$R_{out}$]++(-2,0)
	to[cvsource, l=$A_0(v_+ - v_-)$]++(0,-3)
	node[ground]{};
	
\end{circuitikz}
\end{document}

```
1. $v_+ = v_-$

##### Non-Inverting Amplifier
###### Schematic Model
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
	
	\draw(U1 IN-)  
	node[fill=white]{$V_{-}$} --++(-1,0)--++(0,1) 
	to[R=$R_2$]++(2,0)--++(3,0)--++(0,-2) --++(-1,0);
	\draw(U1 IN-)++(-1,1)
	to[R, a=$R_1$]++(-2,0)--++(0,-1)
	node[ground]{};
	
	\draw(U1 OUT) --++(2,0)
	node[fill=white]{$V_{2}$};

	\draw(U1 IN+)
	node[fill=white]{$V_{+}$} --++(-1,0)
	to[sV, a=$V_1$]++(0,-1)
	node[ground]{};
	
	\draw(U1 VCC) node[above]{$+10V$};
	\draw(U1 VEE) node[below]{$-10V$};

	
\end{circuitikz}
\end{document}
```
###### Controlled Source Model
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

	\draw(0,0)
	node[ground]{}
	to[R=$R_1$]++(0,2)--++(1,0)
	node[ocirc, label=right:$V_-$]{}++(-1,0)--++(0,1)
	to[R=$R_2$]++(4,0)--++(0,-1)--++(2,0)
	node[ocirc, label=right:$V_2$]{}++(-2,0)--++(-1,0)
	to[cvsource, l=$A_0(V_+-V_-)$]++(0,-2)
	node[ground]{}++(-2,0)
	
	node[ground]{}
	to[sV, l=$V_1$]++(0,1)
	node[ocirc, label=right:$V_+$]{};	
	
\end{circuitikz}
\end{document}

```

$$V_- = V_2\frac{R_1}{R_1 + R_2}$$
$$V_+ = V_1$$
$$V_2 = A(V_+ - V_-)$$
$$V_2 = A\left(V_1 - V_2\frac{R_1}{R_1 + R_2}\right)$$
$$V_2 = A(V_1) - A\left(V_2\frac{R_1}{R_1 + R_2}\right)$$
$$V_2\left(1 + \frac{AR_1}{R_1 + R_2}\right) = A(V_1)$$
$$\frac{V_2}{V_1} = \frac{A}{1 + \frac{AR_1}{R_1+R_2}}$$
$$\frac{V_2}{V_1} = 1 + \frac{R_2}{R_1}$$
This makes sense because 
$$\frac{V_-}{V_2} = \frac{R_1}{R_1 + R_2}$$
$V_- = V_+ = V_1$ 
##### IW 3.2
Create a controlled source model of the following **inverting** amplifier.
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
	
	\draw(U1 IN-)  
	node[fill=white]{$V_{-}$} --++(-1,0)--++(0,1) 
	to[R=$R_2$]++(2,0)--++(3,0)--++(0,-2) --++(-1,0);
	\draw(U1 IN-)++(-1,1)
	to[R, a=$R_1$]++(-2,0)--++(0,-1)
	to[sV, a=$V_1$]++(0,-1)
	node[ground]{};
	
	\draw(U1 OUT) --++(2,0)
	node[fill=white]{$V_{2}$};

	\draw(U1 IN+)
	node[fill=white]{$V_{+}$} --++(-1,0)
	node[ground]{};
	
	\draw(U1 VCC) node[above]{$+10V$};
	\draw(U1 VEE) node[below]{$-10V$};

	
\end{circuitikz}
\end{document}
```
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

	\draw(0,0)
	node[ground]{}
	to[sV, l=$V_1$]++(0,1)
	to[R=$R_1$]++(0,2)--++(1,0)
	node[ocirc, label=right:$V_-$]{}++(-1,0)--++(0,1)
	to[R=$R_2$]++(4,0)--++(0,-1)--++(2,0)
	node[ocirc, label=right:$V_2$]{}++(-2,0)--++(-1,0)
	to[cvsource, l=$A_0(V_+-V_-)$]
	++(0,-2)
	node[ground]{}++(-2,0)
	
	node[ground]{}--++(0,1)
	node[ocirc, label=right:$V_+$]{};	
	
\end{circuitikz}
\end{document}

```

## Class 4

#### High Open Loop Gain has a Roll-Off
**Rolling-Off**: Frequency response, when the gain begins to drop.

For a cutoff frequency of $10Hz = 20\pi \omega$ 
```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
\begin{semilogxaxis}[
    title={RC Low-Pass $|T(j\omega)|$},
    xlabel={$\omega$ (rad/s)},
    ylabel={$|T|$ (dB)},
    xmin=0.1, xmax=10000,
    ymin=-60, ymax=5,
    grid=both,
    grid style={line width=0.2pt, draw=gray!30},
    major grid style={line width=0.4pt, draw=gray!60},
    width=10cm, height=7cm,
    samples=200,
]
\addplot[orange, thick, domain=0.1:10000] {-10*log10(1 + (x/(20*pi))^2)};
\addplot[gray, dashed, thick] coordinates {(20*pi,-60) (20*pi,5)};
\end{semilogxaxis}
\end{tikzpicture}
\end{document}
```
The pole of the transfer function is $-\omega_0 = -20\pi$
$$T(s) = K\frac{\omega_0}{s + \omega_0}$$
#### TL071 Op-Amp
The cutoff frequency is so low, we cannot see the roll off.

![[tl071_freq_response.png]]


#### Effect of Feedback 
"*The concept of feedback is just a wonderful thing*" -Dr. Su
##### Open Loop Transfer Function
$$T(s) = \frac{2 \times 10^{6}}{s + 10}$$
##### Finding the Closed Loop Transfer Function
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[circ, label=left:$V_1$]{}--++(1,0)
	node[ocirc, label=above right:$e$]{}
	to[generic, a=$T(s) {=} \frac{2\times 10^{6}}{s + 10}$]++(2,0)--++(1,0)
	node[circ, label=right:$V_2$]{}++(-1,0)--++(0,-2)
	to[generic, l=$T(s) {=} \frac{1}{2}$]++(-2,0)--++(0,2);

\end{circuitikz}
\end{document}
```
$$V_2 = e\frac{2\times 10^{6}}{s + 10}$$
$$e = V_1 = \frac{V_1}{V_2}$$
$$V_2 = \left(V_1 - \frac{V_2}{2}\right)\left(\frac{2\times 10^{6}}{s + 10}\right)$$
$$= V_1\left(\frac{2\times 10^{6}}{s + 10}\right) - V_2\left(\frac{10^{6}}{s + 10}\right)$$
$$V_2 + V_2\left(\frac{10^{6}}{s + 10}\right) = V_1\left(\frac{2\times 10^{6}}{s + 10}\right)$$
$$V_2\left(1 + \frac{10^{6}}{s + 10}\right) = V_1\left(\frac{2\times10^{6}}{s + 10}\right)$$
$$V_2\left(\frac{s + 10 + 10^{6}}{s + 10}\right) = V_1\left(\frac{2\times 10^{6}}{s + 10}\right)$$
$$\frac{V_2}{V_1} = \frac{\left(\frac{2\times10^{6}}{s + 10}\right)}{\left(\frac{s + 10 + 10^{6}}{s + 10}\right)} = \frac{2\times 10^{6}}{s + 10 + 10^6}$$
We can see this shifts the cutoff frequency to $\omega = 1M$ and a gain of about $2$. This feedback creates amplification! 

This can be seen the in the plot of closed loop gain for the TL071
![[tl071_closed_loop.png]]
#### Voltage Follower
Using this model for a non-inverting amplifier.

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
	
	\draw(U1 IN-)  
	node[fill=white]{$V_{-}$} --++(-1,0)--++(0,1) 
	to[R=$R_2$]++(2,0)--++(3,0)--++(0,-2) --++(-1,0);
	\draw(U1 IN-)++(-1,1)
	to[R, a=$R_1$]++(-2,0)--++(0,-1)
	node[ground]{};
	
	\draw(U1 OUT) --++(2,0)
	node[fill=white]{$V_{o}$};

	\draw(U1 IN+)
	node[fill=white]{$V_{+}$} --++(-1,0)
	to[sV, a=$V_1$]++(0,-1)
	node[ground]{};
	
	%\draw(U1 VCC) node[above]{$+10V$};
	%\draw(U1 VEE) node[below]{$-10V$};

	
\end{circuitikz}
\end{document}
```

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

	\draw(0,0)
	node[ground]{}
	to[R=$R_1$]++(0,2)--++(1,0)
	node[ocirc, label=right:$V_-$]{}++(-1,0)--++(0,1)
	to[R=$R_2$]++(4,0)--++(0,-1)--++(2,0)
	node[ocirc, label=right:$V_2$]{}++(-2,0)--++(-1,0)
	to[cvsource, l=$A_0(V_+-V_-)$]++(0,-2)
	node[ground]{}++(-2,0)
	
	node[ground]{}
	to[sV, l=$V_1$]++(0,1)
	node[ocirc, label=right:$V_+$]{};	
	
\end{circuitikz}
\end{document}

```

$$\frac{V_2}{V_1} = 1 + \frac{R_2}{R_1}$$
If we make $R_1$ very high, and replace $R_1$ with a short.
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

	\draw(0,0)
	--++(1,0)
	node[ocirc, label=right:$V_-$]{}++(-1,0)--++(0,1)
	--++(4,0)--++(0,-1)--++(2,0)
	node[ocirc, label=right:$V_2$]{}++(-2,0)--++(-1,0)
	to[cvsource, l=$A_0(V_+-V_-)$]++(0,-2)
	node[ground]{}++(-2,0)
	
	node[ground]{}
	to[sV, l=$V_1$]++(0,1)
	node[ocirc, label=right:$V_+$]{};	
	
\end{circuitikz}
\end{document}

```
$$V_1 = V_2$$
$$\frac{V_2}{V_1} = 1$$
This creates a voltage follower.
#### IW 4.1
```tikz
```
#### Summing and Subtracting