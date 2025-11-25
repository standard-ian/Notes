## Class 7
#### Thévenin Circuit:
Reducing any complex circuit to a single voltage source, single load, in series.

#### Norton's Theorem
Any two terminal circuit made of DC sources and resistors can be represented by a single resistor in parallel with a single current source. This is called a *Norton Equivalent Circuit*

```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, voltage shift = 0.5]
\draw(0,0)
to[isource, l=$7.5A$] (0,3)
to[short](3,3)
to[R=$2\Omega$](3,0)
to[short](0,0);
\draw(3,3)
to[short, -o] (4,3);
\draw(3,0)
to[short, -o] (4,0);

\end{circuitikz}
\end{document}
```
#### IA 6.1
###### Equivalent Resistances
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, voltage shift = 0.5]
\draw(0,0)
to[short](0,5)
to[short](2,5)
to[short](2,0)
to[short](0,0);
\draw(2,4)
to[short, -o](3,4)
node[label=$A$]{};
\draw(2,1)
to[short, -o](3,1)
node[label=$B$]{};
\end{circuitikz}
\end{document}
```

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, voltage shift = 0.5]
\draw(0,0)
to[short](0,5)
to[short](2,5)
to[short](2,0)
to[short](0,0);
\draw(2,4)
to[short, -o](3,4)
node[label=$A$]{};
\draw(2,4)
to[short](1,4)
to[R=$10\Omega$](1,1)
to[short](2,1)
to[short, -o](3,1)
node[label=$B$]{};
\end{circuitikz}
\end{document}
```
###### Starting Circuit
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, voltage shift = 0.5]
\draw(0,0)
to[vsource, invert, v=$30V$] (0,3)
to[R=$15k\Omega$](3,3)
to[short, -o](4,3)
node[label = above:$A$] {};
\draw(3,3)
to[R=$10k\Omega$] (3,0)
node[label = below:$C$, circ] {};
\draw(3,0)
to[short, -o] (4,0)
node[label = above:$B$] {};
\draw(3,0)
to[short](0,0);

\end{circuitikz}
\end{document}
```
###### Thévenin Equivalent
Based on the above, we know that the voltage drop across the $15k\ohm$ resistor is $12V$ because the total drop from positive terminal to $C$ is $30V$. Therefore, the voltage drop is the supply voltage times the proportion of the resistors $V_{TH} = 30V-\frac{15k\ohm}{25k\ohm}(30V) = 12V$
We then imagine that $AB$ is a short ($R=0$), this means all current will flow through the short. This current would be the same as the current right after the $15k\ohm$ resistor, $\frac{30V}{15k\ohm} = 2mA$
Based on this, we know the equivalent resistance in the Thévenin will be $\frac{12V}{0.002A} = 6k\ohm$

```tikz
\usepackage{circuitikz}
\begin{document}

\begin{circuitikz}[american, voltage shift=0.5]
\draw (0,0)
to[vsource, invert, v=$V_{TH}(12V)$] (0,3)
to[R=$R_{TH}(6k\Omega)$] (3,3);
\draw (3,3) 
to[short, -o] (3,3)
node[label = above:$A$] {};
%to[R=$R$] (3,0);
\draw (0,0) 
to[short, -o] (3,0)
node[label = above:$B$] {};
\end{circuitikz}
\end{document}
```
###### Norton Equivalent
We can use the same current as the current source ($2mA$). We know that the $12V$ supplied is consistent in both legs of the parallel circuit based on KVL. Because of this, we know that the the resistance must be $6k\ohm$ because 12V must drop by $C$ in the below Norton circuit
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, voltage shift = 0.5]
\draw(0,0)
to[isource, l=$2mA$] (0,3)
to[short](2,3)
to[R=$6k\Omega$](2,0)
node[circ, label = below:$C$] {}
to[short](0,0);
\draw(2,3)
to[short, -o] (3,3)
node[label = above:$A$] {};
\draw(2,0)
to[short, -o] (3,0)
node[label = above:$B$] {};

\end{circuitikz}
\end{document}
```

---

#### Voltage Dividers

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american]
\draw (0,4) 
to[R=$R_1$] (0,2) 
to[R=$R_2$] (0,0); 
\draw[<->, thick] (-2,4) -- (-2,0) 
node[midway, left] {$V_{in}$}; 
\draw(0,4)--(-2,4);
\draw(0,0)--(-2,0);
\draw[<->, thick] (2,2) -- (2,0) 
node[midway, right] {$V_{out}$};
\draw(0,2) -- (2,2);
\draw(0,0) -- (2,0);
\end{circuitikz}
\end{document}
```
$\frac{V_{out}}{V_{in}} = \frac{R_{2}}{R_1+R_2}$
##### 4 Interpretations 

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american]
\draw(0,0)
to[vsource, invert, v=$30V$](0,5)--(3,5)
to[R=$10k\Omega$, -o](3,2.5)
to[R=$10k\Omega$](3,0)
node[ground] {};
\draw(0,0)--(3,0);
\draw(3,2.5)--(5,2.5)
node[label=right:$V_{out}$] {};

\draw(8,5)
node[label=left:$30V$] {}
to[short, -o](10,5)
to[R=$10k\Omega$](10,2.5)--(13,2.5)
node[label=right:$V_{out}$] {}
to[R=$R_{L}$](13,0)
node[ground] {};
\draw(10,2.5)
to[R=$10k\Omega$](10,0)
node[ground] {};
\end{circuitikz}
\end{document}
```
###### 1.
We know that there is a single current $I$ that flows through the loop. The two resistors in series have a total resistance of $20k$.

A source of $30V$ with a resistance of $20k$ is $I = \frac{30}{20k} = 1.5mA$

The voltage at $V_{out}$ is thus $V_{out} = IR=(0.0015)(10000) = 15V$

###### 2.
Observe that a single current flows through the loop, and $V=IR$. Since the two resistances are equal, the two voltages must be equal. KVL says that the voltage drop from the top to the bottom is $30V$. So $V_{1} = V_{2} = \frac{30}{2}=15V$

###### 3. 
In words: *Since there is only a single current, the voltage drops are proportional to the resistances the current goes through and add up to the same voltage* Thus the voltage is $15V$.

###### 4. 
We think that the circuit is to drive a load resistance between $V_{out}$ and the ground. So, we find the Thevenin equivalent of this voltage divider circuit at that output terminal:

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american]
\draw(0,0)
to[vsource, invert, v=$15V$](0,4)--(3,4)
to[R=$5k\Omega$, -o](3,2)
to[generic=load](3,0)
node[ground]{};
\draw(3,0)--(0,0);
\end{circuitikz}
\end{document}
```
#### IA 6.2

```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, voltage shift = 0.5]
\draw(0,0)
to[vsource, invert, v=$15V$] (0,3)
to[R=$5k\Omega$](3,3)
to[R=$R_{L}$](3,0)
to[short](3,-1)
node[ground] {};
\draw(3,3)
to[short](4,3)
node[label=right:$V_{out}$] {};
\draw(0,0)
to[short](0,-1)
node[ground] {};

\end{circuitikz}
\end{document}
```
Find the voltage $V_{out}$ for the voltage divider circuit with load $R_{L}=$
1. 10k, $V_{out} = 10V = 15V-\frac{1}{3}(15V)$
2. 100k, $V_{out} = 15V = 15V-\frac{1}{20}(15V)$ The ratio of $5k\ohm$ to $100k\ohm$ is so great (1:20) we can ignore it.

#### Design Rule of Thumb
When circuit $A$ drives circuit $B$, let $R_{out}$ for $A$ be $\leq$ $\frac{1}{10}$ of $R_{in}$ for $B$.

#### Output Impedance
The resistance as seen from a point "looking back" as if there was no voltage source from it's original position.

#### IA 6.3

```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, voltage shift = 0.5]
\draw(0,0)
to[short](0,0)
node[label=left:$V_{in}(30V)$, circ] {};
\draw(0,0)
to[short, -o](2,0)
to[R=$4k\Omega$](2, -2)
to[R=$4k\Omega$](2, -4)
node[ground] {};
\draw(2,-2)
to[short](4,-2)
node[label=below:$A$, circ] {}
to[short](4,0)
to[short](6,0)
to[R=$10k\Omega$](6,-2)
to[R=$10k\Omega$](6,-4)
node[ground] {};
\draw(6,-2)
to[short](8,-2)
node[label=below:$B$, circ] {}
to[short](8,0)
to[short](10,0)
to[R=$100k\Omega$](10,-2)
to[R=$100k\Omega$](10,-4)
node[ground] {};
\end{circuitikz}
\end{document}
```

1. What is $R_{in}$ and $R_{out}$ at node $A$?
2. What is $R_{in}$ and $R_{out}$ at node $B$?
3. Does this circuit satisfy the above rule of thumb?
   
---
## Class 8
#### Linear Circuits
$V_{AB} + V_{BC} + V_{CA} = V_{AB} + 10V -20V = 0$
$V_{AB}=10V$
Current must flow from high to low voltage, so it must flow from $A\rightarrow B$
We can identify 3 loops
1. $20V$ source through $R_{1} \rightarrow R_{2}$ to $C$ then back to source
2. $C$


```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american]
	\draw(0,0)
	to[vsource, invert, v=$20V$](0,4)
	node[label=above:$A$, circ]{}
	to[R=$R_{1}(5k\Omega)$, i_>=$I_{1}$](3,4)
	to[R, a=$R_{2}(5k\Omega)$, i_>=$I_{2}$](3,0)
	node[label=below:$C$, circ]{}
	to[short](0,0);
	
	\draw(3,4)
		to[short](5,4)
		to[R, a=$R_{3}(10k\Omega)$, i_>=$I_{3}$](5,0)--(3,0);
	
	\draw(5,4)
	to[short](6,4)
	node[label=above:$B$, circ]{}
	to[vsource, label=$10V$](6,0)--(5,0);
	
\end{circuitikz}
\end{document}
```

#### IA 7.1 Superposition
Verify superposition by showing the two approaches lead to the same circuit.
We should be able to replace each $V_{source}$ with a short, and independently calculate the current, then add them back together.
###### Circuit 1
We know that the current at the $5k\ohm$ resistor is $\frac{20V}{5k} = 4mA$
Because of the short on the right side, all this current will flow through this loop, and the other $5k$ and the $10k$ will have $0A$

```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american]
	\draw(0,0)
	to[vsource, invert, v=$20V$](0,4)
	%node[label=above:$A$, circ]{}
	to[R=$5k\Omega$, i_>=$4mA$](3,4)
	to[R, a=$5k\Omega$, i_>=$0mA$](3,0)
	%node[label=below:$C$, circ]{}
	to[short](0,0);
	
	\draw(3,4)--(5,4)
		to[R, a=$10k\Omega$, i_>=$0mA$](5,0)--(3,0);
	
	\draw(5,4)
	to[short](6,4)
	%node[label=above:$B$, circ]{}
	to[short, i^>=$4mA$](6,0)--(5,0);
	
\end{circuitikz}
\end{document}
```
###### Circuit 2
This circuit is basically a $10V$ source with 2 $5k$ and 1 $10k$ all in parallel, with an equivalent resistance of $2k\ohm$
We know that the current returning to the voltage source is $\frac{10V}{(\frac{1}{5k} + \frac{1}{5k}+ \frac{1}{10k})^{-1}} = \frac{10V}{2k\ohm} = 5mA$
If 10V enters the 3 parallel loops, for the $5k$, the current should be $2mA$ in each
The same $10V$ also enters the $10k$, the current should be $1mA$
By KCL, $2(2mA) + 1mA = 5mA$
The voltage drop across each resistor is $10V$
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american]
	\draw(0,0)
	to[short](0,4)
	%node[label=above:$A$, circ]{}
	to[R=$5k\Omega$, i<_=$2mA$](3,4)
	to[R, a=$5k\Omega$, i_>=$2mA$](3,0)
	%node[label=below:$C$, circ]{}
	to[short](0,0);
	
	\draw(3,4)--(5,4)
		to[R, a=$10k\Omega$, i_>=$1mA$](5,0)--(3,0);
	
	\draw(5,4)
	to[short, i<_=$5mA$](6,4)
	%node[label=above:$B$, circ]{}
	to[vsource, label=$10V$](6,0)
	to[short, i_<=$5mA$](5,0);
	
\end{circuitikz}
\end{document}
```

## Circuit Analysis with Superposition using LLM (Claude Sonnet 4.5, Anthropic, Conversation on Oct. 24 2025)

#### Initial Question and Setup

We analyzed a circuit with two voltage sources: a 20V source on the left and a 10V source on the right, connected through three resistors (5kΩ top left, 5kΩ middle, 10kΩ right). The question was whether the total voltage supplied is 30V. We clarified that you cannot simply add independent voltage sources - they must be analyzed using circuit analysis techniques.

#### Establishing Reference and Potentials

We established point C as the reference (0V) and discussed the assumption that $V_A = 20V$ and $V_B = 10V$ relative to C. This would create a potential drop of $V_A - V_B = 10V$ across the top resistor. However, we noted these values need verification through circuit analysis, not just from the source voltages.

#### Introduction to Superposition

We discussed superposition as an analysis method. The key insight: when "ignoring" a voltage source, you replace it with a short circuit (wire), not just remove it. When "ignoring" a current source, you replace it with an open circuit. This distinction is crucial for correct analysis.

#### Analysis with 20V Source Active (10V source shorted)

With the 10V source replaced by a short circuit, current flows through the top 5kΩ resistor and then encounters a node with three paths: the short circuit (zero resistance), the middle 5kΩ, and the right 10kΩ. Since the short circuit has essentially zero resistance, all current flows through it. Using Ohm's law: $I = \frac{20V}{5k\Omega} = 4mA$. The middle 5kΩ and right 10kΩ carry 0mA since the short circuit bypasses them.

#### Analysis with 10V Source Active (20V source shorted)

With the 20V source shorted, the circuit becomes a 10V source connected to three parallel resistors. The equivalent resistance is:
$$R_{eq} = \left(\frac{1}{5k} + \frac{1}{5k} + \frac{1}{10k}\right)^{-1} = 2k\Omega$$
Total current: $I = \frac{10V}{2k\Omega} = 5mA$

Current distribution: Each 5kΩ carries 2mA, the 10kΩ carries 1mA. KCL verification: $2mA + 2mA + 1mA = 5mA$ ✓

#### Combining Results Using Superposition

We combined the results algebraically, respecting current directions:
- Top 5kΩ: $4mA - 2mA = 2mA$ (currents oppose)
- Middle 5kΩ: $0mA + 2mA = 2mA$ (same direction)
- Right 10kΩ: $0mA + 1mA = 1mA$ (same direction)

#### Finding Voltages

Using Ohm's law with the combined currents:
- Top 5kΩ: $V = 2mA \times 5k\Omega = 10V$
- Middle 5kΩ: $V = 2mA \times 5k\Omega = 10V$
- Right 10kΩ: $V = 1mA \times 10k\Omega = 10V$

#### Alternative Methods Discussion

We discussed other analysis approaches: nodal analysis and mesh analysis. A node is a connection point where two or more components meet (this circuit has 3 nodes: A, B, C). A mesh is a closed loop with no other loops inside it (like a window pane). We clarified that this circuit has 3 meshes due to the parallel arrangement.

#### Mesh Analysis Setup

Mesh currents are arbitrary directions assigned for analysis. If a mesh current solution is positive, current flows in the assumed direction; if negative, it flows opposite. You can assign any direction initially - the mathematics determines the actual flow direction. This is essential for setting up KVL equations around each mesh.