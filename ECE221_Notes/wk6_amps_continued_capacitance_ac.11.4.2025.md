## Class 11
#### Practices and Explanations 
Dr. Su will look through notebook and pick some concepts for you to explain, **how** you explain is more important. Analytical mind development
Practice explaining and contributing to the team are valuable characteristics as an engineer.

#### Negative Feedback Review
Either inverting and non inverting input are equal, or the op amp saturates. Because $V_{out}$ returns to the non-inverting terminal, the voltage stabilizes at $5V$ in the below example.

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
	node[fill=white]{$V_{-}$} --++(-1,0)--++(0,1) --++(5,0) --++(0,-2) --++(-1,0);
	\draw(U1 OUT) --++(2,0)
	node[ocirc, label=right:$V_{out}$]{};
	%to[R=$R_{L}$]++(0,-2)
	%node[ground, scale=2]{};

	\draw(U1 IN+)
	node[fill=white]{$V_{+}$}--++(-1,0)
	node[circ, label=left:$V_{in} {=} 5V$]{};
	
	\draw(U1 VCC) node[above]{$V_{CC}$};
	\draw(U1 VEE) node[below]{$V_{EE}$};

	
\end{circuitikz}
\end{document}
```
#### IA 10.1
Find $V_{out}$
What is $R_{in}$ at $V_{in}$ for the inverting amplifier below.

$V_{out}$ is $-6V$
The ratio of the resistors determines the change in voltage.
The current entering the node at the inverting terminal is $3mA$ from the left, but the current at the actual terminal is always $0mA$ because of the op amp design.
Therefore, the current entering this node must leave through the $2k$ resistor, again flowing to the right!

$R_{in}$ is the resistance looking back from the inverting terminal to the voltage source. In this case it is $1k\ohm$
The $2k$ resistor doesn't play a role because the current moves right past the inverting terminal. Looking from the lower potential to the higher potential node, there is a $1k\ohm$ impedance.

What about the output impedance? $V_{out}$ is $-6V$.



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
	to[short, i^<=$0mA$]++(-1,0)
	node[fill=white]{$0V$}
	to[short, i_>=$0mA$]++(0,1)
	to[R=$2k\Omega$, i^>=$3mA$]++(2,0)--++(3,0)
	node[fill=white]{$-6V$}--++(0,-2) --++(-1,0);
	
	\draw(U1 IN-)++(-1,1)
	to[R, a=$1k\Omega$, i<_=$3mA$]++(-2,0)--++(-1,0)
	node[fill=white]{$3V$};
	
	\draw(U1 OUT) --++(2,0)
	node[label=right:$V_{out}$, ocirc]{};

	\draw(U1 IN+)--++(-1,0)
	node[ground, scale=2]{};
	
	\draw(U1 VCC) node[above]{$V_{CC}$};
	\draw(U1 VEE) node[below]{$V_{EE}$};

	
\end{circuitikz}
\end{document}
```

What if a $1k\ohm$ resistor was placed at $V_{out}$? What is the output impedance?
$6mA$ will flow, and as we change this resistor, the current will change, but $V_{out}$ will not change.
The current will fluctuate with the resistor change, but the voltage will not, so the output impedance is $0\ohm$!

To think about output impedance, imagine inserting a resistor at $V_{out}$ and thing about how voltage and current change!
This is the use of the inverting amplifier, to make the output impedance $0$
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

	\draw(0,0)
	node[fill=white]{$-6V$}--++(1,0)
	node[ocirc, label=above:$V_{out}$]{}--++(0,-1)
	to[R=$1k\Omega$, i<_=$6mA$]++(2,0)
	node[ground, scale=2]{};

\end{circuitikz}
\end{document}
```

The $0V$ at the inverting terminal of the op amp is due to the op amp's behavior, and cannot be disregarded.
In the example below without the op amp, the voltage at $A$ is **NOT** $0V$!
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

	\draw(0,0)
	to[vsource, invert, V=$3V$]++(0,2)
	to[R=$1k\Omega$]++(2,0)
	node[ocirc, label=above:$A$]{}
	to[R=$2k\Omega$]++(2,0)--++(0,-2)--++(-4,0);

\end{circuitikz}
\end{document}
```
#### Differential Amplifiers
Assume all $R$ are $1k\ohm$

The voltage drop across $R_3$ and $R_4$ is $1V$ each because we know that an op amp makes the current at $V_+$ $0mA$
Therefore, all current must flow through $R_3$ and directly into $R_4$
This current is $1mA$, and so the voltage at $V_+$ is $1V$ because there is essentially a voltage divider at the non-inverting terminal

The voltage at $V_-$ has to be $1V$ as well because of the nature of the op-amp and the feedback loop
The current through $R_1$ has to be $\frac{3-1V}{1k} = 2mA$

This same $2mA$ has to flow through $R_2$, because there is $0A$ current at the inverting terminal.
So the drop has to then be $2V$ across $R_2$. Therefore, $V_{out}$ has to be lower potential than $1V$ by $2V$. $1-2=-1V$ at $V_{out}$


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
	to[short, i<^=$0mA$]++(-1,0)
	node[ocirc, label=above right:$V_-$]{}
	to[short]++(0,1)
	to[R=$R_2$]++(2,0)--++(3,0)--++(0,-2) --++(-1,0);
	
	\draw(U1 IN-)++(-1,1)
	to[R, a=$R_1$]++(-2,0)
	node[ocirc, label=left:$V_{1} {=} 3V$]{};
	
	\draw(U1 OUT) --++(2,0)
	node[label=right:$V_{out}$, ocirc]{};

	\draw(U1 IN+)
	to[short, i<_=$0mA$]++(-1,0)
	node[ocirc, label=below right:$V_+$]{}
	to[R=$R_3$]++(-2,0)
	node[ocirc, label=left:$V_2 {=} 2V$]{}++(2,0)
	to[R=$R_4$]++(0,-2)
	node[ground, scale=2]{};
	
	
	\draw(U1 VCC) node[above]{$+15V$};
	\draw(U1 VEE) node[below]{$-15V$};

	
\end{circuitikz}
\end{document}
```

#### Summing Amplifiers
$V_{out}$ should be the sum of the input voltages divided by the number of inputs, $3V$
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
	node[fill=white]{$0V$}--++(-1,0)--++(0,1)
	to[R=$1k\Omega$]++(2,0)--++(3,0)--++(0,-2) --++(-1,0);
	
	\draw(U1 IN-)++(-1,1)--++(-1,0)
	to[R, a=$2k\Omega$]++(-2,0)
	node[fill=white]{$3V$}++(0,1)
	node[fill=white]{$2V$}
	to[R=$1k\Omega$]++(2,0)++(-2,-2)
	node[fill=white]{$4V$}
	to[R=$3k\Omega$]++(2,0)--++(0,2);
	
	\draw(U1 OUT) --++(2,0)
	node[fill=white]{$V_{out}$};

	\draw(U1 IN+)
	node[fill=white]{$0V$} --++(-1,0)
	node[ocirc]{}--++(0,-1)
	node[ground, scale=2]{};
	
	\draw(U1 VCC) node[above]{$V_{CC}$};
	\draw(U1 VEE) node[below]{$V_{EE}$};

	
\end{circuitikz}
\end{document}
```

#### Current Controller
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
	to[R=$20k\Omega$]++(2,0)--++(3,0)--++(0,-2) --++(-1,0);
	\draw(U1 IN-)++(-1,1)
	to[R, a=$10k\Omega$]++(-2,0)--++(0,-1)
	node[ground, scale=2]{};
	
	\draw(U1 OUT) --++(2,0)
	node[fill=white]{$V_{out} {=} 6V$};

	\draw(U1 IN+)--++(-1,0)
	node[fill=white]{$+2V$}--++(-1,0)--++(0,-1)
	node[ground, scale=2]{};
	
	\draw(U1 VCC) node[above]{$V_{CC}$};
	\draw(U1 VEE) node[below]{$V_{EE}$};

	
\end{circuitikz}
\end{document}
```


## Class 12
#### IA 12.1 Differential Amp Review
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
	to[short, i<^=$0mA$]++(-1,0)
	node[ocirc, label=above right:$V_- {=} 1.8V$]{}
	to[short]++(0,1)
	to[R=$9k\Omega$, a=$10.8V$ Drop]++(2,0)--++(3,0)--++(0,-2) --++(-1,0);
	
	\draw(U1 IN-)++(-1,1)
	to[R, l=1.2V Drop, a=$1k\Omega$, i<_=$1.2mA$]++(-2,0)
	node[ocirc, label=left:$V_{1} {=} 3V$]{};
	
	\draw(U1 OUT) --++(2,0)
	node[label=right:$V_{out} {=} 1.2-10.8 {=} -9.6V$, ocirc]{};

	\draw(U1 IN+)
	to[short, i<_=$0mA$]++(-1,0)
	node[ocirc, label=below right:$V_+ {=} 1.8V$]{}
	to[R=$1k\Omega$, a=0.2V Drop]++(-2,0)
	node[ocirc, label=left:$V_2 {=} 2V$]{}++(2,0)
	to[R=$9k\Omega$]++(0,-2)
	node[ground, scale=2]{};
	
	
	\draw(U1 VCC) node[above]{$+10V$};
	\draw(U1 VEE) node[below]{$-10V$};

	
\end{circuitikz}
\end{document}
```
$2V$ is divided from $V_{2}$ by $2V(\frac{1k\ohm}{10k\ohm}) = 0.1V$

So at $V_-$ there is $1.8V$
This makes a difference of $1.2V$ across $R_1$
This means there is a $1.2mA$ after $R_1$
This same $1.2mA$ enters $R_2$, and drops $V_{R_{2}} = 1.2mA(9k\ohm) = 10.8V$
So the voltage out will be $1.2V-10.8V = -9.6V$

If the limit was $\pm8V$ instead of $\pm10V$ the laws still must hold and the op amp will adjust the inverting input.

#### AC Circuits
In DC circuits, the voltages are constant and not changing with time.
In AC circuits, the voltage oscillates with time. We will now expand the concepts into time variance.

```tikz
\usepackage{pgfplots}
\usepackage{circuitikz}

\begin{document}
\begin{tikzpicture}[scale=2]
	% Draw axes
    \draw[->] (0,-2) -- (0,2.3) node[above] {$V$ (Volts)};
    \draw[->] (-0.3,0) -- (9.5,0) node[right] {$t$ (time)};
    
    % Draw grid
    \draw[gray!30, thin] (0,-2) grid[xstep=0.5, ystep=0.5] (9.42,2);
    
    % Mark voltage levels
    \draw (-0.1,1.7) -- (0.1,1.7) node[left] at (-0.1,1.7) {+170V};
    \draw (-0.1,-1.7) -- (0.1,-1.7) node[left] at (-0.1,-1.7) {-170V};
    \draw (-0.1,0) -- (0.1,0) node[left] at (-0.1,0) {0V};
    
    % Define the sine wave function (3 periods, amplitude = 1.7 for 170V)
    % Period = 2*pi, so 3 periods = 6*pi ≈ 18.84
    % We'll scale x to fit nicely: one period will be 3.14 units
    
    % Draw positive half-cycles in RED
    \draw[red, ultra thick, domain=0:1.57, samples=100, smooth] 
        plot (\x, {1.7*sin(\x r)});
    \draw[blue, ultra thick, domain=3.14:4.71, samples=100, smooth] 
        plot (\x, {1.7*sin(\x r)});
    \draw[red, ultra thick, domain=6.28:7.85, samples=100, smooth] 
        plot (\x, {1.7*sin(\x r)});
    
    % Draw negative half-cycles in BLUE
    \draw[red, ultra thick, domain=1.57:3.14, samples=100, smooth] 
        plot (\x, {1.7*sin(\x r)});
    \draw[blue, ultra thick, domain=4.71:6.28, samples=100, smooth] 
        plot (\x, {1.7*sin(\x r)});
    \draw[red, ultra thick, domain=7.85:9.42, samples=100, smooth] 
        plot (\x, {1.7*sin(\x r)});
    
    Mark periods
    \foreach \x in {0, 3.14, 6.28, 9.42} {
        \draw (\x, -0.1) -- (\x, 0.1);
    }
    \node[below] at (3.14, -0.2) {$\frac{T}{2}$};
    \node[below] at (6.28, -0.2) {T};
    \node[below] at (9.42, -0.2) {$\frac{3T}{2}$};
    
\end{tikzpicture}
\end{document}
```

We could have a "reference wave" $\phi_0 = 0$
Phase lead and phase lag could be peaking before or after the reference.


In AC, there is a "neutral" line and a "hot" line.
The voltage difference between hot and neutral is what is transferred to the device.
It is constantly fluctuating between + and - at 60 cycles $(Hz)$ per second, creating a sine wave.
The energy is generated by the charges moving back and forth, not moving along a circuit like in DC.
We can imagine they actually don't travel at all.

###### AC Voltage Circuit Representation
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=3, font=\Large]
	\draw(0,0)
	to[sV, l=$V_s$]++(0,2)--++(1,0)
	to[R=$144\Omega$]++(0,-2)++(0,2)--++(1,0)
	to[R=$144\Omega$]++(0,-2)--++(-2,0);
	
\end{circuitikz}
\end{document}
```
Cycles per second: $V(t) = V_o cos(2\pi f t + \phi)$ 
With a phase shift $V(t) =V_{o} \sin(2\pi ft + \phi) =   V_{o} \cos(2\pi ft + \phi - 90^{\circ})$
$\phi$ = Phase angle
$V_o$ = Peak to peak voltage

Angular frequency: $w=2\pi f$

**Root Mean Square (RMS)**: 
$$V_{rms} = \sqrt{\frac{1}{T} \int^T_{0} V_{o}^2 \cos^2(wt+\phi)dt}$$$T=\frac{1}{f}$
$V_{rms} = \frac{V_o}{\sqrt{2}}$


#### IA 12.2
Match the functions with their graphs
Notice the only sine function starts at origin and goes positive
The cosine functions are phase shifted $\frac{T}{2}$ then they have a phase angle of $\pm\frac{\pi}{4}$

```tikz
\usepackage{pgfplots}
\usepackage{circuitikz}
\begin{document}
\begin{tikzpicture}[scale=4, font=\Large]
    % Draw axes
    \draw[->] (0,-1.5) -- (0,1.8) node[above] {$V$ (Volts)};
    \draw[->] (-0.3,0) -- (6.5,0) node[right] {$t$ (time)};
    
    % Draw grid
    \draw[gray!30, thin] (0,-1.5) grid[xstep=0.3925, ystep=0.3925] (6.28,1.5);
    
    % Mark voltage levels
    \draw (-0.1,1) -- (0.1,1) node[left] at (-0.1,1) {+5V};
    \draw (-0.1,-1) -- (0.1,-1) node[left] at (-0.1,-1) {-5V};
    \draw (-0.1,0) -- (0.1,0) node[left] at (-0.1,0) {0V};
    
    % Function 1: 5cos(2π(t/8)-π/4) in RED
    % When t goes 0 to 2T (which is 16 in real time), x goes 0 to 2π
    % So t = 8x/π, and 2π(t/8) = 2πx/π = 2x
    \draw[red, ultra thick, domain=0:6.28, samples=200, smooth] 
        plot (\x, {cos(deg(2*\x - pi/4))});
    
    % Function 2: 5cos(2π(t/8)+π/4) in BLUE  
    \draw[blue, ultra thick, domain=0:6.28, samples=200, smooth] 
        plot (\x, {cos(deg(2*\x + pi/4))});
    
    % Function 3: -5cos(2π(t/8)-π/4) in GREEN
    \draw[green, ultra thick, domain=0:6.28, samples=200, smooth] 
        plot (\x, {-cos(deg(2*\x - pi/4))});
    
    % Function 4: 5sin(2π(t/8)) in ORANGE
    \draw[orange, ultra thick, domain=0:6.28, samples=200, smooth] 
        plot (\x, {sin(deg(2*\x))});
    
    % Mark periods
    \foreach \x in {0, 3.14, 6.28} {
        \draw (\x, -0.1) -- (\x, 0.1);
    }
    \node[below] at (0, -0.2) {0};
    \node[below] at (3.14, -0.2) {T};
    \node[below] at (6.28, -0.2) {2T};
    
    % Legend
    \draw[red, ultra thick] (2,1.5) -- (2.4,1.5);
    \node[right, font=\Large] at (2.4,1.5) {$5\cos(2\pi t/8-\pi/4)$};
    \draw[blue, ultra thick] (2,1.3) -- (2.4,1.3);
    \node[right, font=\Large] at (2.4,1.3) {$5\cos(2\pi t/8+\pi/4)$};
    \draw[green, ultra thick] (4,1.5) -- (4.4,1.5);
    \node[right, font=\Large] at (4.4,1.5) {$-5\cos(2\pi t/8-\pi/4)$};
    \draw[orange, ultra thick] (4,1.3) -- (4.4,1.3);
    \node[right, font=\Large] at (4.4,1.3) {$5\sin(2\pi t/8)$};
    
\end{tikzpicture}
\end{document}
```
#### Application to Circuits
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=3, font=\Large]
	\draw(0,0)
	to[sV, l=$V_s$]++(0,2)--++(2,0)
	to[R=$R$]++(0,-2)--++(-2,0);
	
\end{circuitikz}
\end{document}
```
$V=IR$
$V_ocos(wt+\phi)$
$I_ocos(wt+\phi)$
$I_{o} = \frac{V_o}{R}$

https://www.cxi1.co.uk/Theory/actheory.htm
http://hyperphysics.phy-astr.gsu.edu/hbase/electric/acohml.html
#### Capacitors
Two conductor plates connected to wires with potential difference.
Thin insulator sandwiched between the conductor plates.
Once the positive charges pile up at the insulator, the atoms of the insulator "tilt", reacting to create a current flow out of the other side.
There is no current through the insulator, but the capacitor reacts to equalize the flow of charges out of the other side.

```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=5, font=\Large]
	\draw(0,0)
	node[label=left:$V_{+}$]{}
	to[short, i_>=$Current$]++(1,0)
	to[short, l=$Q$]++(.25,0)
	to[capacitor, l=$V_C$]++(1,0)
	to[short, l=$-Q$]++(.25,0);
	
\end{circuitikz}
\end{document}
```

There is a voltage across the capacitor. Unlike a resistor, this is an energy **storage** not an energy **drop**
Capacitors effectively store voltages.

