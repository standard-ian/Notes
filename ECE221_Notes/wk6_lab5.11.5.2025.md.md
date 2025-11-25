# Lab 5
## Materials
- Range of resistors from $1k$ to several $10k\ohm$
- LM471 op-amp
- Digital multimeter
- DC Power Supply
-  Breadboards
## Experiment 1
**Make an open-loop op amp circuit.** 
**Connect the op amp to $+15V$ and $-15V$ supplies.** 
**Connect a $5V$ DC source with the non-inverting terminal (pin 3), and connect the inverting terminal (pin 2) to ground.** 

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
	
	\draw(U1 IN+) node[left, fill=white]{$Non-inverting\ (PIN\ 3)$}--++(-4,0)
	node[ground, scale=2]{};
	
	\draw(U1 IN-) node[left, fill=white]{$Inverting\ (PIN\ 2)$} --++(-4,0)
	node[label=left:$5V$, ocirc]{};
	
	
	\draw(U1 OUT) node[right]{$V_{out}\ (PIN\ 6)$};
	
	\draw(U1 VCC)--++(0,1)
	node[above]{$+15V\ (PIN\ 7)$};
	
	\draw(U1 VEE)--++(0,-1)
	node[below]{$-15V\ (PIN\ 4)$};

	
\end{circuitikz}
\end{document}
```

**Measure the output voltage (pin 6). Does the result reflect what you may find in the LM741 Data sheet?** 
	The result should be the voltage slammed to the limit (~$13V$)
	The data sheet **maximum peak output voltage swing ($V_s$)** should be $\pm13V$
	The voltage should be $V_{+}-V_{-}(A_{VD})$
	$A_{VD}$ for the $\micro$A741 is $200V/mV$ or $106bB$
	This means the differential is multiplied essentially $200,000V$
	$0 - 5(200000) = -1000000V$
	But this is limited down to $V_s$
	The measured voltage is $-12.96V$
	
**Now, reverse the connections of the input terminals. Measure the output and explain the result.**
	The result should be again the voltage slammed to the limit, but negative
	Inverted, it was $+14.40$
	This asymmetry is apparently a characteristic of the UA741A and 741 op amps in general
	https://www.righto.com/2015/10/inside-ubiquitous-741-op-amp-circuits.html

## Experiment 2
**Make a voltage follower circuit. Insert a number of different load resistors at the output.** 

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
	node[fill=white]{$V_{out}$}--++(1,0)
	to[R=$R_{L}$]++(0,-2)
	node[ground, scale=2]{};

	\draw(U1 IN+)
	node[fill=white]{$V_{+}$}--++(-1,0)
	node[circ, label=left:$V_{in}$]{};
	
	\draw(U1 VCC) node[above]{$V_{CC} {=} +15V$};
	\draw(U1 VEE) node[below]{$V_{EE} {=} -15V$};

	
\end{circuitikz}
\end{document}
```

**Measure the voltage and the current with each load.** 

| $R_{L}$    | $V_{in}$ | $V_{out}$ | $I_{out}$      |
| ---------- | -------- | --------- | -------------- |
| $1k\ohm$   | $5V$     | $4.9V$    | $7.28mA$       |
| $3.9k\ohm$ | $5V$     | $5V$      | $2.45mA$       |
| $220k\ohm$ | $5V$     | $5V$      | $23.0\micro A$ |

**What are the $R_{in}$ and $R_{out}$ of the follower circuits? Can you measure the output resistance $R_{out}$?**
	$R_{in}$ is $2M\ohm$ according to the data sheet. It restricts current flow to a point where we can consider it $\infty$ .
	$R_{out}$ is effectively 0 because the load has no effect on the voltage at $V_{out}$ but it cannot be measured directly, because the internal circuitry of the $\micro$A741 is adjusting constantly.

## Experiment 3
**Make several non-inverting amplifiers.** 
**Let the $V_{in}$ be $5V$ at the non-inverting terminal. Begin with a series of $R_1 = 1k$ and $R_2 = 1k$ with the midpoint connected to the inverting terminal and ground the other terminal of $R_1$ . Predict $V_-$  and $V_ {out}$ and measure them on the breadboard.** 
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
	node[fill=white]{$V_{-}$}--++(-1,0)--++(0,1) 
	to[R=$R_2$]++(2,0)--++(3,0)--++(0,-2) --++(-1,0);
	\draw(U1 IN-)++(-1,1)
	to[R, a=$R_1$]++(-2,0)--++(0,-1)
	node[ground, scale=2]{};
	
	\draw(U1 OUT) --++(2,0)
	node[fill=white]{$V_{out}$};

	\draw(U1 IN+)
	node[fill=white]{$V_{+}$} --++(-1,0)
	node[fill=white]{$5V$};
	
	\draw(U1 VCC) node[above]{$+15V$};
	\draw(U1 VEE) node[below]{$-15V$};

	
\end{circuitikz}
\end{document}
```

**What are the $R_{in}$ and $R_{out}$? Can you measure the output resistance $R_{out}$?**
	$R_{in}$ is going to be $R_{1}$ because it sets the current of $5mA$ with a $5V$ supply, $1k\ohm$
	$R_{out}$ is still $0mA$ because there is still a voltage follower circuit.
	The measured voltage with 2 $1k\ohm$ resistors is $10.06V$
	We'd expect this because the current is $5mA$ and both resistors have the same drop. The voltage at $V_{-}$ is $5V$ because of the follower circuit. This drops $5V$ to ground across $R_{2}$ and another $5V$ from $V_{out}$ to $V_{-}$, so $V_{out}$ is expected to be $10V$. 

**Increase $R_2$ and repeat.** **Predict the value of $R_2$ that can cause the circuit to saturate with $V_{out}$ swings to the limit. Measure the circuit to see if your prediction is true.**
	At $R_{1}=2.2k\ohm$, there will be saturation because the drop across $R_{1}$ will have to be double that of $R_{1}=1k\ohm$, meaning $V_{out}$ = $15V$. This is larger than the limit, so the amp should slam to the limit.
	The table of measured $V_{out}$ confirms this.

| $R_{2}$    | $V_{out}$ (measured) |
| ---------- | -------------------- |
| $1k\ohm$   | $10.05V$             |
| $2.2k\ohm$ | $14.06V$             |
| $4.7k\ohm$ | $14.13V$             |
| $100k\ohm$ | $14.28V$             |
## Experiment 4
**Make several inverting amplifiers. Connect $5V$ with a series of $R_{1} =1k$ and $R_2 = 1k$ with the midpoint connected to the inverting terminal.** 
**Ground the non-inverting terminal.** 
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
	to[R=$R_{2}$]++(2,0)--++(3,0)--++(0,-2) --++(-1,0);
	
	\draw(U1 IN-)++(-1,1)
	to[R, a=$R_{1}$]++(-2,0)--++(-1,0)
	node[fill=white]{$5V$};
	
	\draw(U1 OUT) --++(2,0)
	node[fill=white]{$V_{out}$};

	\draw(U1 IN+)
	node[fill=white]{$V_{+}$} --++(-1,0)
	node[ground, scale=2]{};
	
	\draw(U1 VCC) node[above]{$+15V$};
	\draw(U1 VEE) node[below]{$-15V$};

	
\end{circuitikz}
\end{document}
```

**Predict $V_{out}$ and measure it on the breadboard. What are the $R_{in}$ and $R_{out}$?** 
	For the initial voltage a $V_{out}$ of $-5V$ is predicted.

**Can you measure the output resistance $R_{out}$?**
	It cannot be directly measured directly. We can measure voltage or current and infer the impedance based on this.

**Increase $R_2$  and repeat. Predict the value of $R_2$ that can cause the circuit to saturate with $V_{out}$ swings to the limit. Measure the circuit to see if your prediction is true.** 
	$V_{out} = V_{in}(-\frac{R_2}{R_1})$
	$R_{2}=(\frac{V_{out}}{V_{in}})(-R_1)$
	$R_{2}=(\frac{-12.9}{5})(-1000)$
	We predict a $2.5k\ohm$ resistor will saturate.
	We only had a $3k\ohm$ but the change can be seen below
	This is verified in the table below as we increase $R_{2}$

| $R_{2}$    | $V_{out}$ (measured) |
| ---------- | -------------------- |
| $1k\ohm$   | $-5.08V$             |
| $2k\ohm$   | $-9.98V$             |
| $3k\ohm$   | $-12.63V$            |
| $100k\ohm$ | $-12.96V$            |

**With the pair of $R_{1}$ and $R_2$ can you predict a $V_{in}$ that will not saturate the circuit? Check the prediction with the input voltage.**
	If $V_{out}$ max is $-12.9V$ 
	$V_{out} = -V_{in}\frac{R_{2}}{R_{1}}$
	$V_{in} = -12.9(\frac{R_1}{R_2})$
	$V_{in}=-12.9(-\frac{1}{3}) = 4.3$
	In practice, we dialed $V_{in}$ up from $4V$ and saturation was reached at $4.3V$, so the above prediction holds!
#### Conclusions
1. In conclusion, the op amp has an asymmetrical limit ($-12.9V\ to\ 14.4V$)

2. For a voltage follower type circuit, $R_{out} = 0$ is created by the op amp adjusting the voltage, making the resistance looking back effectively 0 

3. For a non-inverting amplifier, the amplification is determined by the ratio of $V_{in}(1+\frac{R_{2}}{R_{1}})$

4. For the inverting amp, the amplification is $-V_{in}\frac{R_{2}}{R_{1}}$
