## Class 13
#### Capacitor
Capacitors are made to be charged and discharged with charges of equal but opposite polarity ($+Q, -Q$). Positive charges accumulate on one plate, negative on the other. The voltage of a capacitor is proportional to the amount of charge on its conductors. Capacitance is a material property represented by the constant $C$.
Between the plates is a dielectric material that polarizes when placed in an electric field. 

## Homework 5
#### 1. What are the currents through the resistors in these circuits?
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[scale=1.2, font=\large, american]

% Circuit 1
\draw (0,0) to[vsource, invert, l=6V] (0,3)
    to[short] (2,3)
    to[R, l=20$\Omega$] (2,0)
    to[short] (0,0);
\draw (2,3) to[short] (4,3)
    to[R, l=20$\Omega$] (4,0)
    to[short] (2,0);
\node at (2,-1) {\textbf{1}};

% Circuit 2
\draw (7,0) to[vsource, invert, l=6V] (7,3)
    to[R, l=20$\Omega$] (10,3)
    to[short] (10,0)
    to[R, l=20$\Omega$] (7,0);
\node at (8.5,-1) {\textbf{2}};

% Circuit 3
\draw (13,0) to[vsource, invert, l=6V] (13,3)
    to[R, l=20$\Omega$] (16,3)
    to[short] (16,3)
    (16,3) to[short] (17.5,3)
    to[R, l=40$\Omega$] (17.5,0)
    to[short] (13,0);
\draw (16,3) to[short] (16,1.5)
    to[R, l=40$\Omega$] (16,0);
\node at (15,-1) {\textbf{3}};

\end{circuitikz}
\end{document}
```
1. By KVL, the voltage is equal to the source in both branches because it is the same before both resistors, and must drop to 0V after either resistor. They each see $\frac{6V}{20\ohm} = 300mA$  
2. In series, the combined resistance is $20\ohm + 20\ohm = 40\ohm$. The current is the same throughout since this is a single loop. The current is $\frac{6V}{40\ohm} = 150mA$ and is the same through both resistors.
3. The current is $\frac{6V}{20ohm + 20\ohm} = 150mA$. The $20\ohm$ sees this current, and the other two see a voltage drop of $6V-(0.150A \times 20\ohm) = 3V$. This same 3V drops across either resistor, and the same current flows through them because they have equal resistance. The current through each $40\ohm$ is $\frac{3V}{40\ohm} = 75mA$
#### 2. What is the voltage source in this circuit? What is the total power supplied by the source? Suppose the current through the 15$\ohm$ resistor is 1A.

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=1.5, font=\large, american]

\draw (0,0) to[vsource, invert, l=$V_s$] (0,3)
    to[R, l=20$\Omega$] (3,3)
    to[short] (3,1.5)
    (3,3) to[short] (4.5,3)
    to[R, l=15$\Omega$, i=$1A$] (4.5,0)
    to[short] (0,0);
\draw (3,1.5) to[R, l=10$\Omega$] (3,0);

\end{circuitikz}
\end{document}
```

1. If $1A$ flows through the $15\ohm$, the voltage drop across this resistor is $15\times 1 = 15V$. By KVL, this same voltage drop is seen across the $10\ohm$. Therefore, it's current is $\frac{15V}{10\ohm} = \frac{3}{2} = 1.5A$
2. By KCL, the current at the node before the 2 parallel loops must be the sum of the currents in each loop. So the current through the $20\ohm$ is $\frac{5}{2}A$ and it's voltage drop is $20\times \frac{5}{2} = 50V$
3. Therefore the total drop and the supplied voltage $V_{s} = 50V + 15V = 65V$

#### 3. Consider the situation below with two resistors connected to the same ground. If we connect points A and B to a DC power supply of 10V with A being higher than B, what is the current through each resistors? Note the directions of the currents. What is the voltage across Node A and ground? The voltage across B and the ground? Note the polarity of the voltages.

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=1.5, font=\large, american]

% Resistor A
\draw (0,3) node[above] {A} 
    to[short, o-] (0,2.8)
    to[R, l=10$k\Omega$] (0,0)
    node[ground] {};

% Resistor B
\draw (3,3) node[above] {B} 
    to[short, o-] (3,2.8)
    to[R, l=15$k\Omega$] (3,0)
    node[ground] {};

\end{circuitikz}
\end{document}
```
1. Without knowing the voltage at ground, this cannot be accurately answered, so we'll assume ground is $0V$
2. If we assume these resistors are connected with a single $10V$ source in series between $A$ and $B$, the total resistance for the circuit must be $15k\ohm + 10k\ohm = 25k\ohm$ 
3. Since it is a series circuit, the total current must be the same throughout. This would be $\frac{10V}{25k\ohm} = 0.4mA$
4. Based on the wording of the question ("note the polarity of the voltages"), if ground is $0V$ and $B$ is $10V$ below $A$, Current must flow from $A$ to ground (positive drop)
5. This drop will be $10000\ohm \times (0.0004A) = -4V$ drop from $A$ to ground.
6. If $B$ is $10V$ lower than $+4V$ it has to be $-6V$.
7. If ground is $0V$, there has to be a drop **from ground to $B$** $-6V$
8. So the voltage across $A\to ground$ is a drop of $4V$, across $B\to ground$ is a drop of $-6V$
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=1.5, font=\large, american]
	\draw(0,0)
	node[ground, label=left:$0V$]{}
	to [R=$10k\Omega$, i<^=$0.4mA$]++(0,2)
	node[ocirc, label=above:$A\ (+4V)$]{}
	to[vsource, v=$10V$]++(4,0)
	node[ocirc, label=above:$B\ (-6V)$]{}
	to[R=$15k\Omega$, i<_=$0.4mA$]++(0,-2)
	node[ground, label=right:$0V$]{};
\end{circuitikz}
\end{document}
```

#### 4. Consider the following circuit where current through the 12$\ohm$ resistor is $0.5A$ in the circuit.
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=1.5, font=\large, american]

% Voltage source
\draw (0,0) to[V, invert, a= d. ($15V$), v=$V_s$, i_>=c. ($1.5A$)] (0,4);

% Top branch with 6Ω resistor
\draw (0,4) to[R=$6\Omega$, a=$R_1$, i_>=b. ($1.5A$)] (4,4)
node[ocirc, label=above:$Z$]{};

% Two parallel resistors (6Ω and 12Ω)
\draw (4,4) to[R=$6\Omega$, a=$R_2$, i_>=b. ($1A$)] (4,0);
\draw (4,4) -- (6,4) to[R=$12\Omega$, a=$R_3$, i_>=given: $0.5A$] (6,0) -- (4,0);

% Bottom connection back to source
\draw (0,0) -- (4,0);

% Output terminals A and B
\draw (6,4) -- (7,4) node[ocirc, label=right:$A$] {};
\draw (6,0) -- (7,0) node[ocirc, label=right:$B$] {};

\draw(7,2)
node[label=right:a. ($6V$)]{};

\end{circuitikz}
\end{document}
```

a . **What is the voltage across A and B? Note the polarity.**
	The voltage across $AB$ has to be the same as across the $12\ohm$ resistor because by KVL there has to be the same drop across all parallel branches. This could be $12\times 0.5 = 6V$. This assumes there is another load here though. If there is a short here, all the voltage drops across $R_1$ and no current flows across $R_2$ or $R_3$.
b . **What is the current through the two $6\ohm$ resistors?**
	The following assumes there is a load or open circuit between $AB$. Current through the two $6\ohm$ resistors is different. The current at the node $Z$ must divide between the parallel branches. Through $R_2$ the current will be $\frac{6V}{6\ohm} = 1A$. This summed with the known current at $R_3$ is $1.5A$. This is the current that flows through $R_1$
c. **What is the current through the source?**
	The current through the source is the same as the current through $R_1$, $1.5A$. Because of the chemical reaction of the battery, it flows from the negative terminal to the positive, and enters the circuit.
d. **What is the voltage source $V_s$?**	
	$V_{s} = R_{circuit} \times I_{V_s}$ 
	$R_{circuit} = 6\ohm + \frac{12\ohm}{3} = 10\ohm$
	$V_s = 10 \times 1.5 = 15V$
e. **What is the Thevenin of the circuit at terminal A and B?**
	First, $V_{s}$ can be replaced with a short:
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=1.5, font=\large, american]

% Voltage source
\draw (0,0) to[short] (0,4);

% Top branch with 6Ω resistor
\draw (0,4) to[R=$6\Omega$] (4,4);

% Two parallel resistors (6Ω and 12Ω)
\draw (4,4) to[R=$6\Omega$] (4,0);
\draw (4,4) -- (6,4) to[R=$12\Omega$] (6,0) -- (4,0);

% Bottom connection back to source
\draw (0,0) -- (4,0);

% Output terminals A and B
\draw (6,4) -- (7,4)
node[label=right:$A$, ocirc]{};
\draw (6,0) -- (7,0)
node[label=right:$B$, ocirc]{};

\end{circuitikz}
\end{document}
```
Then this creates 3 parallel pathways from A to B through each resistor. This becomes essentially $\frac{12}{5} = 2.4\ohm$ 
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=1.5, font=\large, american]

% Voltage source
\draw (0,0) to[V, v=$V_s$] (0,4);

\draw (0,4) to[R=$2.4\Omega$] (4,4)
node[label=right:$A$, ocirc]{};

% Bottom connection back to source
\draw (0,0) -- (4,0)
node[label=right:$B$, ocirc]{};

% Output terminals A and B

\end{circuitikz}
\end{document}
```
#### 5. Study this circuit. You want to know the current through each of a variety of load resistors R L , which is to be inserted between A and B. The value of R L ranges from $4k$ to $100K$. Make a Thevenin equivalent of the circuit at A and B. Use the Thevenin to compute the currents through R L in that range
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=1.5, font=\large, american]

% Voltage source
\draw (0,0) to[V, invert,  v=$30V$] (0,3);

% Top resistor
\draw (0,3) to[R, l=$10k\Omega$] (3,3);

% Right resistor
\draw (3,3) to[R, l=$15k\Omega$] (3,0);

% Bottom wire
\draw (3,0) -- (0,0);

% Terminal A
\draw (3,3) to[short, -o] (4,3) node[right] {$A$};

% Terminal B
\draw (3,0) to[short, -o] (4,0) node[right] {$B$};

\end{circuitikz}
\end{document}
```

1. The voltage at $AB = V_{th} = 30V - 30V(\frac{10}{25}) = 18V$
2. Replacing $V_{s}$ with a short and $AB$ with $V_{th}$, we get:
  ```tikz
  \usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=1.5, font=\large, american]

% Voltage source
\draw (0,0) to[R, l=$10k\Omega$] (0,3)--(3,3);

% Top resistor

% Right resistor
\draw (3,3) to[R, l=$15k\Omega$] (3,0);

% Bottom wire
\draw (3,0) -- (0,0);

% Terminal A
\draw (3,3) to[short, -o] (4,3) node[right] {$18V$};

% Terminal B
\draw (3,0) to[short, -o] (4,0) node[right] {$0V$};

\end{circuitikz}
\end{document}
  ``` 
 3. $R_{th} = \frac{30k\ohm}{5}= 6k\ohm$
 4. If $V_{th} = 18V$ and $R_{th} = 6k\ohm$ We can plug in any value in for $R_{L}$ in the following and determine the current through the equivalent resistor with $I=\frac{18}{6k\ohm + R_L}$
  
  ```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=2, font=\large, american]

	\draw (0,0)
	to[vsource, invert, V=$18V$]++(0,2)
	to[R=$6k\Omega$]++(2,0)
	node[ocirc, label=right:$A$]{}
	to[R=$R_{L}$]++(0,-2)
	node[ocirc, label=right:$B$]{}
	to[short]++(-2,0);
	
\end{circuitikz}
\end{document}
  ``` 
#### 6. Study the circuit below.
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=2, font=\large, american]
    % Define node positions
    \coordinate (A) at (0, 2);
    \coordinate (B) at (-2, 0);
    \coordinate (C) at (2, 0);
    \coordinate (D) at (0, -2);
    \coordinate (center) at (0, 0);
    
    % Draw resistors
    \draw (A) to[R, l=$2\Omega$] (B);
    \draw (A) to[R, a=$6\Omega$] (C);
    \draw (D) to[R, l=$R$] (B);
    \draw (D) to[R, a=$4\Omega$] (C);
    
    \draw (A)--++(3,0)--++(0,-4)--++(-3,0);
    
    % Draw voltage source
    \draw (B) to[V, l=$10V$] (C);
    
    % Draw labels for nodes
    \node[ocirc, label=above:$A$] at (A) {};
    \node[ocirc, label=left:$B$] at (B) {};
    \node[ocirc, label=right:$C$] at (C) {};
    \node[ocirc, label=below:$D$] at (D) {};
    
\end{circuitikz}
\end{document}
```

a. **Let R be a variable resistance like a potentiometer. Is it true that if you vary the value of resistance R, everything—voltages and currents—in the circuit changes, except the voltage drop being $10V$ from B to C?**
	Changing $R$ will change the current through $B\to D$. By KCL, this forces all other currents to re-distribute. If the other currents change, the voltage drops across the other resistors must also change, except for the voltage supplied ($10V$ potential difference from $B\to C$).

b. **What is the value R that makes the current through the $6\ohm$ resistor to be 1A from A to C?** 
	1. If $I_{6\ohm} = 1A$, $_{2\ohm} = 1A$, because no current flows through the short $D\to A$
	2. The voltage through the $2\ohm$ is therefor $2V$
	3. Since the voltage at $D$ is the same as the voltage at $A$, $6V$ has to drop across the $4\ohm$.
	4. Therefore, $I_{4\ohm} = \frac{6}{4} = 1.5A$
	5. The same current flows through $R$, and to satisfy KVL, if $V_{D}$ is $6V$, $4V$ has to drop across $R$. So $R = \frac{4V}{1.5A} = 4(\frac{2}{3}) = \frac{8}{3}\ohm$
###### Equivalent:
This is the more common configuration of a Wheatstone bridge
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=2, font=\large, american]
    % Define node positions
    \coordinate (B) at (0, 2);
    \coordinate (D) at (-2, 0);
    \coordinate (A) at (2, 0);
    \coordinate (C) at (0, -2);
    \coordinate (center) at (0, 0);
    
    % Draw resistors
    \draw (A) to[R, l=$2\Omega$] (B);
    \draw (A) to[R, a=$6\Omega$] (C);
    \draw (D) to[R, l=$R$] (B);
    \draw (D) to[R, a=$4\Omega$] (C);
    
    \draw (B)--++(3,0)to[vsource, V=$10V$]++(0,-4)--(C);
    
    % Draw voltage source
    \draw (D)--(A);
    
    % Draw labels for nodes
    \node[ocirc, label=right:$A$] at (A) {};
    \node[ocirc, label=above:$B$] at (B) {};
    \node[ocirc, label=below:$C$] at (C) {};
    \node[ocirc, label=left:$D$] at (D) {};
    
\end{circuitikz}
\end{document}
```

#### 7. What is Thevenin equivalent of the circuits below at terminals A and B?
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[vsource, invert, V=$36V$]++(0,2)
	to[R=$6\Omega$]++(2,0)
	node[ocirc, label=above:$Z$]{}
	to[R=$12\Omega$]++(0,-2)++(0,2)
	to[R=$5\Omega$]++(2,0)
	node[ocirc, label=right:$A$]{}++(-2,-2)--++(2,0)
	node[ocirc, label=right:$B$]{}--(0,0);
	
\end{circuitikz}
\end{document}
```
1. The voltage drop across the $6\ohm$ is $36(\frac{6}{18}) = 12V$
2. The voltage at $Z$ is $36-12 = 24V$
3. No current flows from $Z$ to $A$ because there is no path for it to go to anywhere with lower potential. So the voltage does not drop across the $5\ohm$ if the circuit is open at $A$ and the voltage difference relative to $B$ which is at ground is $24V$, so $V_{th} = 24V$
4. $R_{th} = 5 + \frac{12}{3} = 9\ohm$
###### We can reconstruct the Thevenin equivalent below and plug in some resistors to verify.
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[vsource, invert, V=$24$]++(0,2)
	to[R=$9\Omega$]++(2,0)
	node[ocirc, label=right:$A$]{}++(-2,-2)--++(2,0)
	node[ocirc, label=right:$B$]{}--(0,0);
	
\end{circuitikz}
\end{document}
```
###### With a $9\ohm$ at $A\to B$
7. If we insert a $9\ohm$ resistor, the current through it will be $\frac{12}{9} = 1.333A$
8. In the original circuit, with a $9\ohm$ between $AB$ the resistance of the circuit becomes $R_{eq} = 6\ohm + (\frac{1}{12} + \frac{1}{5+9})^{-1} = 12.4615\ohm$ 
9. The current through the $6\ohm$ is then $\frac{36}{12.4615} = 2.8889A$ With a voltage drop of $6\ohm \times 2.8889A =  17.3333V$. This leaves $36-17.3333 = 18.6667V$ to enter the parallel portion. The current through the branch with the $5\ohm$ and $9\ohm$ resistors will be $\frac{18.6667}{14} = 1.333A$ $\checkmark$
###### With a short at $A\to B$
7. If we short the circuit at $AB$ of both circuits, the voltage of $24V$ should be entirely dropped across the initial resistor and the single loop Thevenin should have a current of $\frac{24}{9} = 2.667A$ 
8. In the original circuit, with a short across $AB$ there will be a $R_{eq}$ of $6+\left(\frac{1}{12} + \frac{1}{5} \right)^{-1} = 9.529\ohm$
9. The current through the $6\ohm = \frac{36}{9.529} = 3.7779A$ and a voltage drop of $6\ohm \times 3.7779A = 22.6676V$ This leaves $13.3324V$ to drop over the 2 paths in the parallel portion equally. 
10. The path with the $5\ohm$ will do this with a current of $2.667A$ $\checkmark$
#### 8. The circuit begins with one-loop of three resistors (400, 600, 250) in series. A voltage source of 60 volts is inserted between nodes A and C, A being higher in potential. We want to place a load resistor R L between A and B. Find the Thevenin equivalent of the circuit between nodes A and B. Use it to find the current through this load resistance if R L = 40$\ohm$

```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[R=$400\Omega$]++(0,3)
	to[R=$600\Omega$]++(2,0)
	node[ocirc, label=above:$A$]{}
	to[R=$R_{L}$]++(0,-3)
	node[ocirc, label=below:$B$]{}++(0,3)
	to[vsource, V=$60V$]++(2,0)
	node[ocirc, label=right:$C$]{}
	to[R=$250\Omega$]++(0,-3)--++(-4,0);
	
\end{circuitikz}
\end{document}
```

1. Imagine $AB$ is open. No current flows through $R_L$ There is $60V$ potential at $A$
2. The total resistance for the loop is $600 + 400 + 250 = 1250\ohm = R_{eq}$
3. The current for the loop is $\frac{V_{s}}{R_{eq}} = \frac{60V}{1.25k\ohm} = 48mA$
4. There is a drop of $0.048A\times 1000\ohm = 48V$ between $A$ and $B$, so $V_{th} = 48V$
5. If we short the $V_s$ there are 2 parallel loops, one which contains the $1000\ohm$ series equivalent and the other with the $250\ohm$ So $R_{th} = \frac{1000}{5} = 200\ohm$
6. So we can find the current when $R_{L} = 40\ohm$ using:
```tikz
\usepackage{circuitikz}   

\begin{document}
\begin{circuitikz}[scale=2, american, font=\Large]
	\draw(0,0)
	to[vsource, invert, V=$48$]++(0,2)
	to[R=$200\Omega$]++(2,0)
	to[R=$R_{L}$]++(0,-2)++(0,2)
	node[ocirc, label=right:$A$]{}++(0,-2)
	node[ocirc, label=right:$B$]{}--++(-2,0);
\end{circuitikz}   
\end{document}
```
7. It will be $\frac{48}{240} = 200mA$


#### 9. Study the circuit and determine the currents through all the resistors and the voltage difference across all elements in the two connected circuits. What are the voltage differences between points with one in the left loop and the other in the right loop?
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[R=$1\Omega$]++(0,2)
	to[R=$2\Omega$]++(2,0)
	to[vsource, V=$24V$]++(0,-2);
	
	\draw(0,0)
	to[R=$5\Omega$]++(2,0)
	to[R=$5\Omega$]++(2,0)
	to[vsource, invert, V=$50V$]++(1,0)
	to[R=$4\Omega$]++(0,2)
	to[R=$6\Omega$]++(2,0)
	to[isource, invert, l=$5A$]++(0,-2)
	to[R, a=$2\Omega$]++(-2,0);
	
	
\end{circuitikz}
\end{document}

```
#### 10.  What we know about this circuit is that the voltage at node A is $3V$ and the voltage at B is $1V$ above the ground, and a positive current of $3mA$ goes from A to B. Figure out unspecified resistance R, the voltage at node C, and the other currents. As always, the important thing to practice here is to reason using the basic laws (Ohm’s law, KVL, KCL). Do not just write down an answer. With any answer state how you support it with basic laws.

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$A$]{}
	to[R=$R$]++(2,0)
	node[ocirc, label=above:$B$](B){};
	
	\draw(B)
	to[R=$10k\Omega$]++(0,-2)
	node[ground]{};
	
	\draw(B)
	to[R=$10k\Omega$]++(1.5,0)
	node[ocirc, label=right:$C$](C){};
	
	
\end{circuitikz}
\end{document}
```
$R = \frac{V_{A} - V_{B}}{I_{A\to B}} = \frac{3-1}{3mA} = \frac{2}{3mA} = 666.7\ohm$
As stated, $V_B$ is 1V above ground so:
$I_{10k\to\ ground}=\frac{1}{10k} = 0.1mA$
The the current at node $B$ is $3mA$
by KCL, $I_{10k_{B\to C}} = I_{A\to B} - I_{B\to ground} = 3mA - 0.1mA = 2.9mA$
$V_C = 1V - (2.9mA \times 10k\ohm) = 1-29 = -28V$



#### 11. In the following circuit, there is a current of $1mA$ from node B to ground through the $20k\ohm$ resistor. What are the voltages at $A$ and $B$?
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$A$]{}
	to[R=$10k\Omega$]++(2,0)
	node[ocirc, label=above:$B$](B){};
	
	\draw(B)
	to[R=$10k\Omega$]++(0,-2)
	node[ground]{};
	
	\draw(B)--++(1.5,0)
	to[R=$20k\Omega$]++(0,-2)--++(-1.5,0);
	
	
\end{circuitikz}
\end{document}
```
$V_{B} = 20k \times 1mA = 20V$
$V_{10k_2}=20V$
$I_{10k_2} = \frac{20V}{10k} = 2mA$
$I_{B} = 2+1= 3mA$
$V_{A} = V_{B} + V_{10k_1} = 20V + (3mA \times 10k) = 20V + 30V = 50V$

#### 12. What is the voltage at the output $V_{out}$ of the op amp circuit?
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
	node[fill=white]{$0V$}--++(-1,0)
	to[short, i_>=$0A$]++(0,1)
	node[label=above:$A$, ocirc]{}
	to[R=$2k\Omega$]++(2,0)--++(3,0)--++(0,-2) --++(-1,0);
	
	\draw(U1 IN-)++(-1,1)--++(-1,0)
	to[R, a=$2k\Omega$]++(-2,0)
	node[fill=white]{$3V$}++(0,1)
	node[fill=white]{$-2V$}
	to[R=$1k\Omega$]++(2,0)++(-2,-2)
	node[fill=white]{$4V$}
	to[R=$4k\Omega$]++(2,0)--++(0,2);
	
	\draw(U1 OUT) --++(2,0)
	node[ocirc, label=right:$V_{out}$]{};

	\draw(U1 IN+)
	node[fill=white]{$0V$} --++(-1,0)
	node[ocirc]{}--++(0,-1)
	node[ground, scale=2]{};
	
	\draw(U1 VCC) node[above]{$V_{CC}$};
	\draw(U1 VEE) node[below]{$V_{EE}$};

	
\end{circuitikz}
\end{document}
```

There is no current entering node $A$ from the amp.
The sum of the currents from the 3 source voltages are the current at node A.
The current is flowing opposite direction through the $1k\ohm$ because the $-2V$ source is lower than $0V$ at node $A$
$I_{sum} = \frac{-2V}{1k\ohm} + \frac{3V}{2k\ohm} + \frac{4V}{4k\ohm} = -2mA + \frac{3}{2}mA + 1mA = \frac{5}{2}mA - \frac{4}{2}mA = 0.5mA$
By KCL, $100\%$ of this $0.5mA$ entering node $A$ must exit through the $2k\ohm \to V_{out}$ 
The voltage drop across the resistor to $V_{out}$ is therefore $0.5mA \times 2k\ohm = 1V$ 
$V_{out} = 0V-1V = -1V$

#### A circuit is designed for a purpose. A circuit is driven by a source, an input, which can be a voltage or a current. The purpose of a circuit is often to make the output voltage or current meet certain specifications. 
###### What is the purpose of a voltage divider circuits? 
The purpose of this circuit is to scale the source voltage by $\frac{R_2}{R_1+R_2}$. $V_{out}$ is taken at the node between the resistors and is equal to the drop across $R_{2}$ .
###### Can you describe different approaches to design a circuit to accomplish the purpose of voltage dividers? Use specific examples including sketches to explain.
We could achieve something similar with a non inverting amplifier after the passive divider, to eliminate output impedance. In the below example, however, $V_{out}$ is  not divided, it is $5V$ because the non-inverting amplifier has a gain of > 1.
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
    node[ocirc, label=above:$2.5V$](DIV){};
    
    \draw(DIV)
    to[R=$1k\Omega$]++(-2,0)
	node[ocirc, label=left:$5V$]{};
	
    \draw(DIV)
    to[R=$1k\Omega$]++(0,-2)
    node[ground, scale=2]{};
    
    
    \draw(U1 VCC) node[above]{$+10V$};
    \draw(U1 VEE) node[below]{$-10V$};

    
\end{circuitikz}
\end{document}
```
To have a true divider with no output impedance, a follower would be more appropriate.
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
    node[fill=white]{$2.5V$}--++(0,1)--++(3,0)--++(3,0)--++(0,-2) --++(-1,0);
    
    \draw(U1 OUT) --++(2,0)
    node[fill=white]{$V_{out}$};

    \draw(U1 IN+)
    node[fill=white]{$V_{+}$} --++(-1,0)
    node[ocirc, label=above:$2.5V$](DIV){};
    
    \draw(DIV)
    to[R=$1k\Omega$]++(-2,0)
	node[ocirc, label=left:$5V$]{};
	
    \draw(DIV)
    to[R=$1k\Omega$]++(0,-2)
    node[ground, scale=2]{};
    
    
    \draw(U1 VCC) node[above]{$+10V$};
    \draw(U1 VEE) node[below]{$-10V$};

    
\end{circuitikz}
\end{document}
```
Or we could cascade inverting amps
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
	to[R=$2k\Omega$,i^>=$5mA$]++(2,0)--++(3,0)--++(0,-2)--++(-1,0);
	
	\draw(U1 IN-)++(-1,1)
	to[R, a=$1k$, i<^=$5mA$]++(-2,0)
	node[ocirc, label=left:$V_{in} {=} 5V$]{};
	
	\draw(U1 OUT) --++(2,0)
	node[ocirc, label=below:$V_{out} {=} -2.5V$](U1_VOUT){};

	\draw(U1 IN+)
	node[fill=white]{$V_{+}$} --++(-1,0)
	node[ground, scale=2]{};
	
	\draw(U1 VCC) node[above]{$+10V$};
	\draw(U1 VEE) node[below]{$-10V$};
	
	\opamp(10,-2){U2};

	\draw(U2 IN-)  
	node[fill=white]{$V_{-}$}--++(-1,0)
	node[fill=white]{$0V$}
	to[short, i_>=$0mA$]++(0,1)
	to[R=$1k\Omega$,i<_=$5mA$]++(2,0)--++(3,0)--++(0,-2)--++(-1,0);
	
	\draw(U2 IN-)++(-1,1)
	to[R, a=$1k$, i_>=$5mA$]++(-2,0)--(U1_VOUT);
	
	\draw(U2 OUT) --++(2,0)
	node[ocirc, label=right:$V_{out} {=} 2.5V$]{};

	\draw(U2 IN+)
	node[fill=white]{$V_{+}$} --++(-1,0)
	node[ground, scale=2]{};
	
	\draw(U2 VCC) node[above]{$+10V$};
	\draw(U2 VEE) node[below]{$-10V$};
	
\end{circuitikz}
\end{document}
```


#### Consider a circuit which consists only resistors and a DC voltage source of $20V$. Is it possible to have voltage difference across two points in the circuit larger than $20V$, the source? Explain your answer with specific examples.
By KVL, the sum of all voltage drops around a closed loop and/or parallel configuration of loops will be equal to the source so that $V_{source} - V_{R_1} - V_{R_2} - ...-V_{R_n} = 0$
Because of this, so long as there are no amps, capacitors, or additional voltage sources besides the one creating a potential difference of $0V\to20V$, resistors can only consume energy and cause the voltage to drop.
Resistors cannot consume more voltage than is supplied to the circuit in their efforts to keep current flowing. They are restricted to consuming between 0 and 20V.

