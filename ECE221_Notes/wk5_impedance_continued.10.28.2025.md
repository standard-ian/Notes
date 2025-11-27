## Class 9
#### Op Amp
A circuit designed to produce a source voltage which is the amplification of the difference between the non-inverting input voltage and the inverting input voltage with a tremendously high gain.

Some amplification when there's any difference, 

The output is either saturating or not when $V_{+}-V_{-}$ is not equal to 0.
$A_{o} = 200kV$

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
	
	\path(U1 IN+) node[left]{$V_{+}$};
	\path(U1 IN-) node[left]{$V_{-}$};
	
	\path(U1 OUT) node[right]{$V_{out}$};
	
	\path(U1 VCC) node[above]{$V_{CC}$};
	\path(U1 VEE) node[below]{$V_{EE}$};

	
\end{circuitikz}
\end{document}
```
#### IA 8.1
What is $V_{out}$?
$V_{out} = A_{o}(V_{+}-V_{-}) = 0.1A_{o}$
Assuming $A_{o}$ is ~$20kV$, the output will be the maximum positive limit of the op-amp
For 741 IC, this is $+13V$
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
\begin{circuitikz}[american, font=\Large]
	% invoke the opamp	
	\opamp(0,0){U1}
	
	\path(U1 IN+) node[left]{$2.5V$};
	\path(U1 IN-) node[left]{$2.4V$};
	
	\path(U1 OUT) node[right]{$V_{out}$};
	
	\path(U1 VCC) node[above]{$+15V$};
	\path(U1 VEE) node[below]{$-15V$};

	
\end{circuitikz}
\end{document}
```
#### IA 8.2
In the above diagram, if both $V_{+}$ and $V_{-}$ were made negative, the new $V_{out} = A_{o}(-2.5-(-2.4)) = -0.1A_{o}$
#### IA 8.3
Consider the circuit below. If the output is connected to a load, which is an LED light bulb that needs a voltage of at least $5V$ to turn it on. Will the circuit turn on the light? If the battery that connects to the positive power supply declines over time, what may happen? 

A comparator circuit can be used to interface analog signals with digital systems, such as in Analog-to-Digital Converters (ADCs).

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
	node[fill=white]{$V_{-}$}--++(-2.26,0);
	\draw(U1 OUT)--++(2,0)
	node[fill=white]{$V_{out}$} --++(1,0);

	\draw(U1 IN+)
	node[fill=white]{$V_{+}$} --++(-1,0)
	node[circ, label=left:$4V$]{};
	
	\draw(U1 VEE)
	to[battery, invert, a=$-10V$]++(0,-1)
	node[scale=2, ground]{};
	\draw(U1 VCC)
	to[battery, l=$+10V$]++(0,2)
	to[short]++(-4,0)
	to[R=$10k\Omega$]++(0,-2)
	to[R=$10k\Omega$]++(0,-2)
	node[scale=2, ground]{};
	
\end{circuitikz}
\end{document}
```


#### Another Op-Amp Circuit
$V_{out} = V_{-}$
$V_{-} = V_{out} = A_{o}(V_{+}-V_{-})$
$V_{-}(1+A_{o})=AV_{+}$
$V_{-}=\frac{A_{o}}{1+A_{o}}$
Negative feedback loop, stable, holds on to something
So called "unity gain". Small errors are corrected.
The Op-Amp will try to maintain a constant current no matter what $R_{L}$ is.

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
	node[fill=white]{$V_{out}$} --++(1,0)
	to[R=$R_{L}$]++(0,-2);

	\draw(U1 IN+)
	node[fill=white]{$V_{+}$} --++(-1,0)
	node[circ, label=left:$3V$]{};
	
	\draw(U1 VCC) node[above]{$V_{CC}$};
	\draw(U1 VEE) node[below]{$V_{EE}$};

	
\end{circuitikz}
\end{document}
```
Positive feedback loop (feedback on the opposite terminal) will drive to saturation, while the negative will hold steady. Small differences are amplified.
#### Another Example
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
	to[R=$10k\Omega$]++(2,0)--++(3,0)--++(0,-2) --++(-1,0);
	\draw(U1 IN-)++(-1,1)
	to[R, a=$10k\Omega$]++(-2,0)--++(0,-1)
	node[ground]{};
	
	\draw(U1 OUT) --++(2,0)
	node[fill=white]{$V_{out}$};

	\draw(U1 IN+)
	node[fill=white]{$V_{+}$} --++(-1,0)
	node[circ, label=left:$2.5V$]{};
	
	\draw(U1 VCC) node[above]{$+10V$};
	\draw(U1 VEE) node[below]{$-10V$};

	
\end{circuitikz}
\end{document}
```
#### Input Impedance
Op-Amps have a very high input impedance! This results in very low current. $i_{+} \approx 0$, $i_{-} \approx 0$  
In a negative feedback loop, this is still the case. When an op-amp operates correctly, there is no current going in through $V_{+}$ or $V_{-}$

## Class 10

Put the laws into various contexts, many times until the understanding is intuitive
#### Op Amp Review
1. Op Amps have an internal resistor with very high impedance $i_{+} = 0, i_{-}=0$
2. 2 states: Either $V_{+} = V_{-}$, output is $\approx$ $V_{ in}$ OR there is a difference, in which case $V_{out} =$ to the limit in the positive or negative direction depending on the differenceA

**Pin labels indicated according to LM741 IC**
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
	
	\path(U1 IN+) node[left, label=above:$i_{+} {=} 0A$]{$V_{+}\ (PIN\ 3)$};
	\draw(U1 IN-) node[left, label=below:$i_{-} {=} 0A$]{$V_{-}\ (PIN\ 2)$}--++(1,0)
	to[R, a=$1M\Omega$]++(0,-2)--(U1 IN+);
	
	\path(U1 OUT) node[right]{$V_{out}\ (PIN\ 6)$};
	
	\path(U1 VCC) node[above]{$V_{CC}\ (PIN\ 7)$};
	\path(U1 VEE) node[below]{$V_{EE}\ (PIN\ 4)$};

	
\end{circuitikz}
\end{document}
```


#### Comparator Circuit
Purposely use op amp to slam to the positive max voltage to compare which input is higher

#### Voltage Follower
This circuit will adjust the input until $V_{-}$ and $V_{+}$ are both equal to $3V$ because of the negative feedback
If we add a resistor $R_{L}$, we begin loading the circuit. Unlike a normal circuit, with the 
Normally, a battery really has an internal resistance and can be seen as Thevenin, so over time, its internal resistance increases

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
	node[fill=white]{$V_{out} {=} 3V$}--++(1,0)
	to[R=$R_{L} {=} 1k\Omega$, i_>=$3mA$]++(0,-2)
	node[ground]{};

	\draw(U1 IN+)
	node[fill=white]{$V_{+}$}--++(-1,0)
	node[circ, label=left:$3V$]{};
	
	\draw(U1 VCC) node[above]{$V_{CC}$};
	\draw(U1 VEE) node[below]{$V_{EE}$};

	
\end{circuitikz}
\end{document}
```
#### IA 9.1 Impedance of the Above Circuit
What is the input and output impedance of the above circuit?
Input impedance is saying if we increase the voltage, what is the change to the current at those terminals?
The input impedance is very high for the op amp, so very little change to current as voltage increases, it is very large, effectively infinite.
The output impedance $R_{out}$ will be effectively 0 because the voltage doesn't change
$\frac{\Delta V}{\Delta I} = R_{out}$
$\Delta V = \Delta I R_{out}$
As we increase $R_{L}$ the voltage will not change because of the voltage follower preventing a voltage drop.
The current will change through $R_{L}$ though because $3V$ is always supplied at $V_{out}$ because of this.
Because the current entering the op amp is $\approx 0A$, and the voltage drop is $\approx 0$ across it, $\frac{\Delta V}{\Delta I} = \frac{0}{0} = 0\ohm$ output impedance.
The entire voltage is delivered without any other resistance to cause a drop in voltage.

#### Non Inverting Amplifier
Simplification: $+10V\ V_{CC}, -10V\ V_{EE}$ we'll say this is what it takes to slam the voltage to the limit if there is a difference between $V_{-}$ and $V_{+}$
$2.5V$ is dropped across each resistor, because they are in parallel

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
	node[fill=white]{$V_{-}$} --++(-1,0)
	node[fill=white]{$2.5V$}--++(0,1) 
	to[R=$1k\Omega$, i<_=$2.5mA$]++(3,0)--++(3,0)--++(0,-2) --++(-1,0);
	\draw(U1 IN-)++(-1,1)
	to[R, a=$1k\Omega$, i_>=$2.5mA$]++(-2,0)--++(0,-1)
	node[ground, scale=2]{};
	
	\draw(U1 OUT) --++(2,0)
	node[fill=white]{$V_{out}$};

	\draw(U1 IN+)
	node[fill=white]{$V_{+}$} --++(-1,0)
	node[fill=white]{$2.5V$};
	
	\draw(U1 VCC) node[above]{$+10V$};
	\draw(U1 VEE) node[below]{$-10V$};

	
\end{circuitikz}
\end{document}
```

#### IA 9.2
Now imagine the right resistor is a $2k\ohm$, what is the change?
From $A$ to $B$ there is a potential difference of $+2.5V$
Since there is $0mA$ flowing into $B$ from below, the current flowing towards the op-amp's inverting terminal at $2.5V$ through the $2k\ohm$ is equal to the current flowing to ground through the $1k\ohm$.
This results in a $5V$ drop over the $2k\ohm$ $V_{2k\ohm}=2k\times0.0025 = 5V$
$V_{out}$ must be $5V$ above the inverting terminal ($2.5V$) in order for current to flow in a way that satisfies KCL. $2.5 + 5 = 7.5V = V_{out}$

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
	node[fill=white]{$V_{-}$} 
	to[short, i^<=$0mA$]++(-1.5,0)
	node[fill=white]{$2.5V$}
	to[short, i_>=$0mA$]++(0,1)
	node[circ, label=above:$B {=} 2.5V$]{}
	to[R=$2k\Omega$, a=$5V$, i<_=$2.5mA$]++(3,0)--++(3,0)--++(0,-2)
	node[circ, label=below:$C {=} 7.5V$]{} --++(0,0);
	\draw(U1 IN-)++(-1,1)
	to[R, a=$1k\Omega$, l=$2.5V$, i_>=$2.5mA$]++(-3,0)
	node[circ, label=left:$A {=} 0V$]{}--++(0,-1)
	node[ground, scale=2]{};
	
	\draw(U1 OUT) --++(2,0)
	node[fill=white]{$V_{out}$}--++(1,0);

	\draw(U1 IN+)
	node[fill=white]{$V_{+}$} --++(-1,0)
	node[fill=white]{$2.5V$};
	
	\draw(U1 VCC) node[above]{$+10V$};
	\draw(U1 VEE) node[below]{$-10V$};

	
\end{circuitikz}
\end{document}
```

If we change the right resistor to $4k\ohm$ the inverting input will have to shift to $2V$ for Ohms, KCL, and KVL to be true.
This is something the op amp is doing internally, and it is because $V_{CC}$ is max $+10V$

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
	node[fill=white]{$V_{-}$} 
	to[short, i^<=$0mA$]++(-1.5,0)
	node[fill=white]{$2V$}
	to[short, i_>=$0mA$]++(0,1)
	node[circ, label=above:$B {=} 2.5V$]{}
	to[R=$4k\Omega$, i<_=$2.5mA$]++(3,0)--++(3,0)--++(0,-2)
	node[circ, label=below:$C {=} 10V$]{} --++(0,0);
	\draw(U1 IN-)++(-1,1)
	to[R, a=$1k\Omega$, i_>=$2.5mA$]++(-3,0)
	node[circ, label=left:$A {=} 0V$]{}--++(0,-1)
	node[ground, scale=2]{};
	
	\draw(U1 OUT) --++(2,0)
	node[fill=white]{$V_{out}$}--++(1,0);

	\draw(U1 IN+)
	node[fill=white]{$V_{+}$} --++(-1,0)
	node[fill=white]{$2.5V$};
	
	\draw(U1 VCC) node[above]{$+10V$};
	\draw(U1 VEE) node[below]{$-10V$};

	
\end{circuitikz}
\end{document}
```

The ratio of $R_{2}$ and $R_{1}$ determine the amplification, until we slam to the limit:
$$V_{out} = V_{in}(1+\frac{R_2}{R_1})$$
#### Inverting Amplifier
The positive terminal is grounded, $V_{+} = 10V$. Test $V_{-} = V_{+} = 0$
We'll also start out with $R_{2} = R_{1} = 1k\ohm$
Because $V_{-}$ is 0V and $V_{in}$ is $3V$, $3mA$ must flow to the right across $R_{1}$
Because $0A$ flows into or out of the op amp, to satisfy KCL, $3mA$ has to flow to the left across $R_{2}$
Because of this, $+3V$ is dropped from $V_{in}$ to $A$
From $A$ to $V_{out}$ there is a $-3V$ difference, effectively inverting the input voltage!


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
	node[fill=white]{$V_{-}$}--++(-1,0)
	node[fill=white]{$0V$}
	to[short, i_>=$0mA$]++(0,1)
	node[circ, label=above:$A$]{}
	to[R=$R_{2}$, i^>=$3mA$]++(2,0)--++(3,0)--++(0,-2) --++(-1,0);
	
	\draw(U1 IN-)++(-1,1)
	to[R, a=$R_{1}$, i<^=$3mA$]++(-2,0)--++(-1,0)
	node[fill=white]{$V_{in} {=} 3V$};
	
	\draw(U1 OUT) --++(2,0)
	node[fill=white]{$V_{out} {=} -3V$};

	\draw(U1 IN+)
	node[fill=white]{$V_{+}$} --++(-1,0)
	node[ground, scale=2]{};
	
	\draw(U1 VCC) node[above]{$+10V$};
	\draw(U1 VEE) node[below]{$-10V$};

	
\end{circuitikz}
\end{document}
```

If $R_{2}$ were changed to $2k\ohm$, the $V_{out}$ would become $-6V$, still inverting but again, similar to the non-inverting, scaling according to $\frac{R_{2}}{R_{1}}$
$$\frac{V_{out}}{V_{in}} = -\frac{R_2}{R_1}$$

## Homework 4
1. What we know about this circuit is that the voltage at node $A$ is $3V$ and the voltage is $B$ is $1V$ above the ground, and a positive current of $3mA$ goes from $A$ to $B$. Figure out unspecified resistance $R$, the voltage at node $C$, and the other currents. 
$V_R = 3-1 = 2V$
$R_1 = \frac{2V}{3mA} = 667\ohm$
$V_{R_3} = 1V$
$I_{R_3} = \frac{1}{10k} = 0.1mA$
Because the current form $AB$ and $B Ground$ is known, and there is only one other path $BC$ by KCL, $I_{BC} = 3-0.1mA = 2.9mA$
So:
$V_{R_2} = 10k\ohm(2.9mA) = 29V$
$V_C = 1-29 = -28V$
Therefore, node C is $28V$ below ground.

```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[label=left:$A {=} 3V$, ocirc]{}
	to[R=$R_1$, i_>=$3mA$]++(2,0)
	node[label=above:$B {=} +1V$, ocirc]{}
	to[R=$10k\Omega$, a=$R_2$, i_>=$2.9mA$]++(2,0)
	node[label=right:$C {=} -28V$, ocirc]{}++(-2,0)
	to[R=$10k\Omega$, a=$R_3$, i_>=$\frac{1V}{10k\Omega} {=} 0.1mA$]++(0,-2)
	node[ground, scale=2, label=below:$0V$]{};
	
\end{circuitikz}
\end{document}
```

2. In the following circuit, there is a current of $1mA$ from the node $B$ to ground through the $20k$ resistor. What is the voltages at $A$ and at $B$?
$V_{R_3} = 1mA(20k) = 20V$ 
Because $B$ has to be the same voltage above ground, $20V$ drops across either path.
Therefore $B$ is $20V$ above ground!

We can find the current at $B$ by determining the equivalent resistance of the parallel portion
$R_{eq} = \frac{20}{3}k\ohm = 6.67k\ohm$
If $20V$ enters this parallel portion before returning to ground, the current at B should be $\frac{20}{6.67k} = 3mA$
To verify this, we can calculate the current at $R_3$ and use KCL, $I_{R_3} = \frac{20}{10k} = 2mA$  $1mA + 2mA = 3mA \checkmark$
If the current is $3mA$ and we know the resistance of $R_1$ ($10k\ohm$), the voltage drop across $R_1$ is $3mA(10k\ohm) = 30V$
So the voltage is $50V$ and $A$ and $20V$ at $B$

```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[label=left:$A$, ocirc]{}
	to[R=$10k\Omega$, a=$R_1$]++(2,0)
	node[label=above:$B$, ocirc]{}--++(2,0)
	to[R=$R_3$, a=$20k\Omega$, i=$1mA$]++(0,-2)--++(-2,0)
	to[R=$10k\Omega$, a=$R_2$]++(0,2)++(0,-2)
	node[ground, scale=2]{};
	
\end{circuitikz}
\end{document}
```

3. The voltage at node $A$ is $0V$. What is the voltage at node $B$ if the current is $1mA$ from $A$ to $B$? What if the current is $1mA$ from $B$ to $A$?
	If the current is $1mA$ from $A\rightarrow B$:
		If $1mA$ flows from $A$ to $B$, the voltage at B must be below $0V$.
		The resistor has to have a drop of $1mA(3k\ohm) = 3V$ so the voltage at $B$ has to be $-3V$
	If the current is $1mA$ from $B \rightarrow A$:
		The drop will be the same across the resistor, but if the current flows from $B$ to $A$, B must be above $0V$
		Therefore, $B$'s voltage would be $3V$
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[label=left:$A$, ocirc]{}
	to[R=$3k\Omega$]++(2,0)
	node[label=right:$B$, ocirc]{};
	
\end{circuitikz}
\end{document}
```

4. The voltage at node $A$ is $0V$. What is the voltage at the output $V_{out}$?
	Since the voltage at $A$ is lower than all the nodes on the far left, current must flow through each of the 3 parallel resistors $R_1$ through $R_3$
	$I_{R_1} = \frac{2}{1k} = 2mA$
	$I_{R_2} = \frac{3}{2k} = 1.5mA$ 
	$I_{R_3} = \frac{4}{4k} = 1mA$
	The sum of these currents is $4.5mA$ and by KCL, the currents entering a node must equal to the currents leaving the node, so the voltage drop across $R_4$ has to be $4.5mA(2k\ohm) = 9V$
	Therefore $V_{out}$ must be $-9V$. The potential must be less than at $A$ for current to exit the node. 

```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[label=left:$2V$, ocirc]{}
	to[R=$1k\Omega$, a=$R_1$, i_>=$2mA$]++(2,0);
	
	\draw(0,-1)
	node[label=left:$3V$, ocirc]{}
	to[R=$2k\Omega$, a=$R_2$, i_>=$1.5mA$]++(2,0)
	node[label=above right:$A$, ocirc]{}
	to[R=$2k\Omega$, a=$R_4$, i_>=$4.5mA$]++(2,0)
	node[label=right:$V_{out} {=} -9V$, ocirc]{};
	
	\draw(0,-2)
	node[label=left:$4V$, ocirc]{}
	to[R=$4k\Omega$, a=$R_3$, i_>=$1mA$]++(2,0);
	
	\draw(2,0)--++(0,-2);
	
\end{circuitikz}
\end{document}
```

5. The voltage at node $A$ is $0V$. What is the voltage at the output $V_{out}$?
	In this case, current will flow from right to left through $R_1$ because $A$ has higher potential than $-2V$
	$R_2$ and $R_3$ will have current flow in the rightward direction on the diagram below
	So the sum of currents entering $A$ will be $(-2) + 1.5 + 1 = 0.5mA$
	Therefore, $V_{out}$ must be $0.5mA(2k\ohm) = -1V$ because to have that $0.5mA$ current flow out of $A$ and to satisfy KCL, current must flow rightward and the potential difference from $A$ to $V_{out}$ must be $1V$
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[label=left:$-2V$, ocirc]{}
	to[R=$1k\Omega$, a=$R_1$, i<_=$2mA$]++(2,0);
	
	\draw(0,-1)
	node[label=left:$3V$, ocirc]{}
	to[R=$2k\Omega$, a=$R_2$, i=$1.5mA$]++(2,0)
	node[label=above right:$A$, ocirc]{}
	to[R=$2k\Omega$, a=$R_4$, i=$0.5mA$]++(2,0)
	node[label=right:$V_{out} {=} -1V$, ocirc]{};
	
	\draw(0,-2)
	node[label=left:$4V$, ocirc]{}
	to[R=$4k\Omega$, a=$R_3$, i=$1mA$]++(2,0);
	
	\draw(2,0)--++(0,-2);
	
\end{circuitikz}
\end{document}
```

