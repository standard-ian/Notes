## Class 5
#### Review 
So far, I feel I have learned:
1. Conductors have a lattice of atoms with electrons that are excited when a voltage or potential difference is applied across them.
2. Resistance increases with temperature because excitement of the lattice is increased
3. Kirchhoff's current law say that the current going into a node of a circuit, must be the sum of the current in the subsequent branches
4. Kirchhoff's voltage law state that voltage must drop as current flows across a circuit. Voltage flow from high to low.
5. Ohm's law states that voltage in a circuit is directly proportional to current and resistance.
#### IA 4.1
Given a DC circuit with $12V$ and 10$\ohm$ resistor in a single loop:
1. What is the voltage across the resistor?
	$12V$
2. What is the current?
	$\frac{12V}{10\ohm} = 1.2A$ 
3. Power?
	$12(1.2A) = 14.4W$
#### IA 4.2
Given a DC circuit with $12V$, 10$\ohm$ resistor, and another resistor with unknown resistance $R$ in a single loop, we know the voltage drop across both resistors, and can use the proportionality of the two resistors over the total voltage drop to determine the resistance of the second because the current is the same across the entire single loop.

#### IA 4.3
In series, from point A to B, $R_{AB} = R_{1} + R_{2}$ 
If $R$ in the above is 0.1$\ohm$ the equivalent resistance of the circuit is 10$\ohm$ + 0.1$\ohm$ = 10.1$\ohm$

#### IA 4.4
Given a $12V$ DC circuit with 2 loops, each of which has a single resistor with resistance $R=10\ohm$:
1. What is the equivalent resistance?
	$R_{eq}=(\frac{1}{R} + \frac{1}{R})^{-1} = (\frac{1}{10} + \frac{1}{10})^{-1} = 5\ohm$ 
2. The current into this equivalent resistor:
	$I = \frac{12V}{5\ohm} = 2.4A$
3. So, the current in each branch has to be $1.2A$ per Kirchhoff's current law, therefore, the voltage in each resistor is:
	$V=1.2(10) = 12V$
	This confirms Kirchhoff's voltage law - the voltage drop for a loop in a circuit must be the sum of all the voltage drops in the loop. In returning to the battery's negative terminal, the voltage drops 12V on both legs! Conservation of energy!

	Another way to think about this is given a segment A $\rightarrow$ B, with 2 resistors in parallel $R_{AB}^{-1} = R_{1}^{-1} + R_{2}^{-1}$ Combining 2 resistors in parallel, the equivalent resistance gets smaller, given the same voltage because there is greater conductivity or pathways for current to flow. There is a greater combined current, so a lower combined resistance for parallel circuits.
#### Shortcuts
Replace difference resistance with same resistance 
#### IA 4.5
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, font=\Large]
	\draw(0,0)
	to[vsource, v=$12V$](0,2)
	to[R=$6\Omega$](3,2)
	to[R=$10\Omega$](3,0)--(0,0);
	
	\draw(3,2)--(5,2)
	to[R=$15\Omega$](5,0)--(3,0);
\end{circuitikz}
\end{document}
```
10$\ohm$ = 3, 30$\ohm$ in parallel
15$\ohm$ = 2, 30$\ohm$ in parallel
so, a 10$\ohm$ and a 15$\ohm$ in parallel is equivalent to 5, 30$\ohm$ resistors, which has an equivalent resistance of $\frac{30}{5} = 6\ohm$ 
#### IA 4.6
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, font=\Large]
	\draw(0,0)
	node[label=left:$V_{s}{=}12V$]{}
	to[R=$5\Omega$](3,0)
	node[circ, label=above:A]{}
	to[R=$3k\Omega$](3,-3)
	node[ground]{};
	
	\draw(3,0)
	to[R=$15\Omega$](6,0)
	node[circ, label=above:B]{}
	to[short](7,0)
	node[ground, rotate=90]{};
	
\end{circuitikz}
\end{document}
```
$I_{5\ohm} = \frac{12}{5} =2.4A$
The circuit is basically a 15$\ohm$ resistor after the 5$\ohm$, because the ration between 3k$\ohm$ and 15$\ohm$ is so great!
So, the voltage between A and B is basically the ratio of the resistors 5$\ohm$ to 
15$\ohm$, $\frac{15\ohm}{20\ohm} = 9V$

#### IA 4.7
We have resistors 10, 12, 15, 18, 22, 27, 33, 39, 47, 100 $\ohm$s. We want to have a resistance of R=65$\ohm$. Design a circuit to meet this goal. We can us 10, 22, and 33 $\ohm$ in series or ??? in parallel (explore later!)

## Check understanding using LLM (Claude 4 Sonnet, Anthropic, Conversation on Oct. 15 2025 10:32 PM)
#### Parallel Circuits: Voltage Is Always Equal
In parallel branches, the voltage across all branches must be equal. This follows from the definition of voltage as potential difference between two points—since parallel branches connect to the same two nodes, they span the same potential difference.
- Parallel: same voltage, different currents
- Series: same current, different voltages
---
#### How Batteries Work
Chemical reactions at electrodes create charge separation:
- Negative terminal: excess electrons (repels them)
- Positive terminal: deficit of electrons (attracts them)
- This creates an electric field = voltage
Energy flows: chemical potential → electrical potential → kinetic energy of electrons → thermal energy in resistors
---
#### Electron Flow Direction
Electrons flow **negative to positive** (opposite to conventional current direction). They take all available paths simultaneously, with more current through lower resistance paths.

---
#### Current Splitting in Parallel Branches
When current reaches parallel branches, it splits inversely proportional to resistance:
$$\frac{I_1}{I_2} = \frac{R_2}{R_1}$$
If $R_1$ is half of $R_2$, then $I_1$ is twice $I_2$.

---
#### Why Proportional Resistance Formula Fails - Conductance (not recommended)
You cannot use $I_{branch} = I_{total} \times \frac{R_{branch}}{R_{total}}$ because current splits by **conductance** (inverse of resistance), not resistance.
Lower resistance = MORE current, not less.
**Correct formula:**
$$I_{branch} = I_{total} \times \frac{1/R_{branch}}{1/R_1 + 1/R_2 + 1/R_3}$$
**Why Ohm's Law works:** $I = V/R$ automatically accounts for the inverse relationship by dividing by resistance.

---
#### Example: Series-Parallel Circuit
**Given:** $V_s = 5V$, series $100\Omega$, parallel $150\Omega$, $1000\Omega$, $1500\Omega$
**Solution:**
$$R_{parallel} = \left(\frac{1}{150} + \frac{1}{1000} + \frac{1}{1500}\right)^{-1} = 120\Omega$$
$$R_{total} = 100 + 120 = 220\Omega$$
$$I_{total} = \frac{5V}{220\Omega} = 22.727mA$$
$$V_{parallel} = 22.727mA \times 120\Omega = 2.727V$$
Branch currents:
- $I_{150} = 2.727V / 150\Omega = 18.18mA$ (80% of total)
- $I_{1000} = 2.727V / 1000\Omega = 2.73mA$ (12% of total)
- $I_{1500} = 2.727V / 1500\Omega = 1.82mA$ (8% of total)
## Class 6
#### Learning Circuits Deeply
1. Image of charges coming and going in conductors, currents and voltages
2. Voltage drops in the circuits and voltage rise in the source: In a loop, sum to 0
3. In a junction, the coming of current is equal to the going
4. A resistor is made to dissipate the power up to a limit
5. Batteries, DC voltage, and DC current source
6. Modeling circuits as lumped circuit diagrams
#### IA 5.1:

#### IA 5.2:
Given the below circuits, what resistor can be placed between $A\rightarrow B$ for $R$ to make the current and voltage between $A\rightarrow B$ equivalent?
If $R=10k\ohm$, For circuit 1: $I_{AB} = 1mA$, $V_{AB} = 10V$
If $R=10k\ohm$, For circuit 2: $I_{AB} = 1mA$, $V_{AB} = 10V$

In order to say circuits are equivalent, we have to refer to a particular pair of terminals, and the "load resistance" put in, the same voltage and current.
We are saying that any $R$ would work, including $0\ohm$
###### Circuit 1:
```tikz
\usepackage{circuitikz}
\begin{document}

\begin{circuitikz}[american, voltage shift=0.5]
\draw (0,0)
to[isource, v=$30V$] (0,3)
to[R=$10k\Omega$] (3,3)
to[R=$10k\Omega$] (3,0) (3,0) -- (0,0);
\draw (3,3) 
to[short, -*] (6,3)
node[label = above:A] {}
to[R=$R$] (6,0);
\draw (0,0) 
to[short, -*] (6,0)
node[label = above:B] {};
\end{circuitikz}
\end{document}
```
###### Circuit 2:
```tikz
\usepackage{circuitikz}
\begin{document}

\begin{circuitikz}[american, voltage shift=0.5]
\draw (0,0)
to[isource, v=$15$] (0,3)
to[R=$5\Omega$] (3,3);
\draw (3,3) 
to[short, -*] (3,3)
node[label = above:A] {}
to[R=$R$] (3,0);
\draw (0,0) 
to[short, -*] (3,0)
node[label = above:B] {};
\end{circuitikz}
\end{document}
```

## Homework 3
1. Series circuit

```tikz
\usepackage{circuitikz}
\begin{document}

\begin{circuitikz}[american, voltage shift=0.5]
\draw (0,0)
to[vsource, invert, v=$15V$] (0,3)
to[R=$2k\Omega$] (3,3);
\draw (3,3) 
to[short, -o] (3,3)
node[label = above:A] {};
%to[R=$R$] (3,0);
\draw (0,0) 
to[short, -o] (3,0)
node[label = above:B] {};
\end{circuitikz}
\end{document}
```
With the circuit above, the goal is to see all the voltages and currents throughout each circuit variation, made by placing a resistor across A and B for the following $R=$
	1. 2k
		1. $I_{total}=\frac{15V}{2k\ohm + 2k\ohm} = 3.75mA$ 
		2. Series circuit, so $I_{2k_{1}} = I_{2k_{2}} = I_{total} = 3.75mA$
		3. They are both 2k, so same voltage drop. $V_{2k} = 0.00375A(2000\ohm) = 7.5V$ 
		4. KVL: $7.5V + 7.5V = 15V = V_{s}$
	2. 1k
		1. $I_{total}=\frac{15V}{2k\ohm + 1k\ohm} = 5mA$ 
		2. Series circuit, so $I_{2k} = I_{1k} = I_{total} = 5mA$
		3. $V_{2k} = 0.005A(2000\ohm) = 10V$
		4. $V_{1k} = 0.005A(1000\ohm) = 5V$
		5. KVL: $10V + 5V = 15V = V_{s}$
	3. 4k
		1. $I_{total}=\frac{15V}{2k\ohm + 4k\ohm} = 2.5mA$ 
		2. Series circuit, so $I_{2k} = I_{4k} = I_{total} = 2.5mA$
		3. $V_{2k} = 0.0025A(2000\ohm) = 5V$
		4. $V_{4k} = 0.0025A(4000\ohm) = 10V$
		5. KVL: $5V + 10V = 15V = V_{s}$
	4. 10$\ohm$
		1. $I_{total}=\frac{15V}{2k\ohm + 10\ohm} = 7.463mA$ 
		2. Series circuit, so $I_{2k} = I_{10} = I_{total} = 7.463mA$
		3. $V_{2k} = 0.007463A(2000\ohm) = 14.925V$
		4. $V_{4k} = 0.007463A(10\ohm) = 0.075V$
		5. KVL: $14.9254V + 0.075V = 15V = V_{s}$
	5. 1M$\ohm$
		1. $I_{total} = \frac{15V}{2k\ohm + 1M\ohm} = 14.97\micro A$
		2. Series circuit, so $I_{2k} = I_{1M} = I_{total} = 14.97 \micro A$
		3. $V_{2k} = 0.00001497(2000\ohm) = 0.03V$
		4. $V_{1M} = 0.00001497A(1000000\ohm) = 14.97V$
		5. KVL: $0.03V + 14.97V = 15V = V_{s}$
	6. 0
		1. $I_{total} = \frac{15V}{2k\ohm} = 7.5mA$
		2. Series circuit, so $I_{2k} = I_{total} = 7.5mA$
		3. $V_{2k} = 0.0075A(2000\ohm) = 15V$
		4. KVL: $15V = 15V = V_{s}$

2. Parallel circuit 
```tikz
\usepackage{circuitikz}
\begin{document}

\begin{circuitikz}[american, voltage shift=0.5]
\draw (0,0)
to [vsource, invert, v=$30V$] (0,3)
to[R=$4k\Omega$] (3,3);
\draw (3,3)
to[short, -o] (4,3)
node[label = above:$A$] {};
\draw (3,3)
to[R=$4k\Omega$] (3,0)
to[short] (0,0);
\draw (3,0)
to[short, -o] (4,0)
node[label = above:$B$] {};

\end{circuitikz}
\end{document}
```
Study this circuit with load resistor R across $A$ and $B$ for the following $R=$ 
	1. $2k$
		1. $I_{total} = \frac{30V}{4k\ohm + (\frac{1}{4k\ohm} + \frac{1}{2k\ohm})^{-1}}  = 5.625mA$ 
		2. Intuitive method: $R_{eq}$ of the $4k\ohm$ and $2k\ohm$ in parallel is 3, $4k\ohm$ in parallel, which is $\frac{4}{3}k\ohm = 1.333k\ohm$ 
		3. $R_{eq}$ of the whole circuit is then $4k + 1.333k = 5.333k\ohm$, so $I_{total} = \frac{30V}{5333}\approx 5.625mA$
		4. $V_{4k_{1}} = 0.005625A(4000\ohm)=22.5V$
		5. This leaves a potential difference of $30-22.5= 7.5V$ entering the parallel portion, and a current of $5.625mA$ divided between the resistors.
		6. In the parallel part of the circuit:
			1. $I_{4k_{2}} = \frac{7.5V}{4000\ohm} = 1.875mA$
			2. $I_{2k} = \frac{7.5V}{2000\ohm} = 3.75mA$
			3. KCL: $1.875+3.75 = 5.625mA$
		7. $V_{AB}=I_{2k}(R) = 0.00375A(2000\ohm) = 7.5V$
		8. Interestingly, this is the same as the voltage across $AB$ in with $2k\ohm$ resistor in the problem above!
	2. $1k$
		1. $R_{eq}$ of the parallel portion is $= \frac{4}{5}\ohm = 800\ohm$ 
		2. So $R_{eq}$ of the entire circuit is $4k\ohm +  \frac{4k}{5}\ohm = 4800\ohm$
		3. So $I_{total} = \frac{30V}{4800\ohm}=0.00625A \approx 6.25mA$
		4. $V_{4k_1} = 0.00625A(4000\ohm) = 25V$
		5. Leaving $5V$ to enter each leg of the parallel branch, again, this is identical to the first circuit!
	3. $4k$
	4. $10\ohm$
	5. $1M\ohm$
	6. $0$
	
2. Compare, in particular, the voltage across the terminals and the current from A to B in each of the circuits above.
	1. We can see that the voltage across $AB$ is the same for all $R$ in the parallel and it's Thévenin equivalent series circuit. Note that the voltage has doubled in the parallel circuit and the other resistances are a $4k$ in series with the parallel branch, the other leg of which is a second $4k$. Compare this with the single $2k$ in the series circuit. Interesting!
	2. The voltage drop across $AB$ is equivalent to the voltage drop across the $4k\ohm$. For the first circuit, it will be $15V(\frac{R_{{AB}}}{2k\ohm+R_{AB}})$, for the second, it will be $30V(\frac{R_{{AB}}}{4k\ohm+R_{AB}})$.


