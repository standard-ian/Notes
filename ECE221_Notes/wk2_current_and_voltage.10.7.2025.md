## Class 3
#### IA2.1: 2-3 things learned last week
1. Voltage is joules/coulomb
2. The physical effects of resistance in terms of electron velocity and energy
#### Review of Week 1
1. In a single loop circuit, charges move through all cross sections of the circuit at a constant rate. A unit of flow rate is current (amps = coulomb/second).
2. Energy supplied by battery is spent everywhere in the circuit because the lattice is present everywhere. At every point, there is some energy spend. Unit of energy is joules.
3. The specific amount of energy spent in a conductive element of the circuit depends on how hard it is for charges to pass there. Energy uses are higher in elements where charge passing is harder.

#### Building a Conceptual Model
A model is always a simplification.
#### Voltage:
1.5 V means 1.5J is supplied and consumed per coulomb. Time is not a factor here, joules are measured in terms of coulombs here.

Battery is moving the charges from negative towards positive, this created potential or energy difference causes a flow from positive terminal to a return point at the negative terminal.

A unit of charge is hard to conceptualize, need to investigate the concept of a coulombs further.

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american]
    % Draw the main horizontal line at top
    \draw (0,2)
    to[vsource, i<_=\Large$1A$, v_=\Large$100V$](18,2)--(18,4)
    node[circ, label=above:D]{}
    to[R, a=\Large$20\Omega$, l=Voltage Drop {=} $20V$, i<_=$1A$](12,4)
    node[circ, label=above:C]{}
    to[R, a=\Large$30\Omega$, l=Voltage Drop {=} $30V$, i<_=$1A$](6,4)
    node[circ, label=above:B]{}
    to[R, a=\Large$50\Omega$, l=Voltage Drop {=} $50V$, i<_=$1A$](0,4)
    node[circ, label=above:A]{}
    to[short](0,2);
    
    \draw[<-](0,5)--(0,6.5)--node[fill=white] {\Large$100V$}(6,6.5)--(18,6.5)--(18,5);
    \draw[<-](6,5)--(6,6)--node[fill=white] {\Large$50V$}(12,6)--(18,6);
    \draw[<-](12,5)--(12,5.5)--node[fill=white] {\Large$20V$}(18,5.5);
    \draw[-<](18,5);
    
\end{circuitikz}
\end{document}
```
$V_{ab} + V_{bc} + V_{cd} + V_{de} + V_{ef} + ....V_{nm} = V_{am}$

#### Current:
Currents are moving charges. When a voltage is connected to a conductive loop, it creates voltage potential, setting off a current. This is the flow rate of charges. The current is the same at every point in the circuit. They don't pile up or change speed.

Are electrons actually completing a cycle or are they pushing on one another? Can we think of them as a physical particle or are they just exerting force on one another?

#### Resistance
Resistivity is the inherent property of a conductor referring to the mobility of the free charges in the conductor. It is a material property on the atomic level. Inverse of conductivity.

The size and length of a conductor affects the current. 

**Resistance** on the other hand is a concept that relates the current through it and the voltage drop across the two ends. 

Given a circuit where the resistivity of tungsten is 3.3 times that of copper. If the tungsten is about 3cm long and 19$\micro m$ diameter. The copper wire is about 320$\micro m$. The resistance of the filament can be measured as roughly 42$\ohm$ while the copper connecting the battery to the filament is going to read as ~0$\ohm$ because the multimeter cannot likely measure the small resistance here. 

#### Ohms Law
$V=IR$ 

The potential difference across two points and the current to the current through are proportional to each other. The proportionality is the resistance of the conductive path  between points.

When the temperature of a conductor is higher, the lattice of atoms and electrons is vibrating at a higher rate.

Hot vs. Cold resistance? Investigate this!

This is a theoretical, not fundamental law.

#### Circuit Diagram
Battery can be represented a circle with positive and negative "sides", or power supply with 3 lines for ground and 1 for Vcc.

#### IA 2.2: Circuit Diagrams
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american]
	\draw(-1,3)
	node[label=right:$1.$]{};
	
	\draw(0,0)
	to[vsource, invert, v=$6.3V$](0,2)
	to[push button](3,2)
	to[bulb, l=$25\Omega$](3,0)--(0,0);
	
	\draw(6,3)
	node[label=right:$2.$]{};
	
	\draw(7,-1)
	to[vsource, invert, v=$6.3V$](7,1)
	to[bulb, l=$25\Omega$](11,1)
	to[short](11,-1)--(7,-1);
	\draw(7,0)--(7,2)
	to[push button](9,2)
	to[bulb, l=$25\Omega$](11,2)--(11,0);
	
	\draw(13,3)
	node[label=right:$3.$]{};
	
	\draw(14,0)
	to[vsource, invert, v=$6.3V$](14,2)
	to[bulb, l=$25\Omega$](16,2)
	to[push button](16,0)--(14,0);
	\draw(16,2)--(18,2)
	to[bulb, l=$25\Omega$](18,0)--(16,0);
	
\end{circuitikz}
\end{document}
```

The bulbs are #44 incandescent bulbs with 25$\ohm$ resistance
Rated at 6.3V and 1.575W
#### Power
Joules/second, the time rate of how energy is spent. Voltage times Current.
$P=VI = IRI = I^{2}R = V \frac{V}{R} = \frac{V^{2}}{R}$ 

#### IA 2.3: Power and Ohms Law Calculations
Given circuit #1 in the above diagram, imagine the bulb is now a #47 bulb with 42$\ohm$ resistance. It has a 6V battery and 20cm copper wire.
1. Diagram
```tikz
	\usepackage{circuitikz}
	\begin{document}
	\begin{circuitikz}[american, scale=1.5]
		\draw(0,0)
		to[vsource, invert, v=$6V$](0,2)--(1,2)
		to[spst](3,2)
		to[bulb, l=$42\Omega$](3,0)--(0,0);
	\end{circuitikz}
	\end{document}
	```
2. What is the power supplied by the battery and consumed in the circuit?
	$P = VI$, 
	$I = \frac{V}{R} = \frac{6}{42}$
	$P=V\frac{V}{R} = 6\frac{6}{42} = \frac{6}{7}W$

Resistors in parallel have distinct loops each with some current value, this adds to the entire current in the circuit. The total current is the sum of both loops.

Resistors in series don't create distinct "summable" loops.

#### Kirchhoff's Laws

## Class 4

Resistance can change with temperature. Observe the power rating of resistors.
Power in resistors: $P=I^{2}R = \frac{V^{2}}{R}$
#### IA 3.1: Calculate Power, Voltages, Current
###### Circuit 1
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=1.5, american]
	\draw(0,0)
	to[vsource, v=$120V$, invert](0,2)--(3,2)
	to[R=$144\Omega$](3,0)--(0,0);
\end{circuitikz}
\end{document}
```
$I_{S}=\frac{120V}{144\ohm} = \frac{5}{6}A$
$P=120V\times \frac{5}{6}A = 100W$

###### Circuit 2
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=1.5, american]
	\draw(0,0)
	to[vsource, v=$120V$, invert](0,2)--(3,2)
	to[R=$144\Omega$](3,0)--(0,0);
	\draw(3,2)--(5,2)
	to[R=$144\Omega$](5,0)--(3,0);
\end{circuitikz}
\end{document}
```
$I=\frac{120}{(\frac{1}{144}+\frac{1}{144})^{-1}} = \frac{120}{72} = \frac{5}{3}A$
$P_{total} = \frac{5}{3}\times 120 = 200W$ 
$P_{R1} = P_{R2} = \frac{120^{2}}{144} = 100W$

#### Kirchhoff's Current Law (KCL)
At a junction, the sum of currents in is equal to the sum of currents out.
$I_{1}+I_{2} = I_{3}$
At a junction, the sum of the currents in and out is zero.
$I_{1} + I_{2} - I_{3} = 0$
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=1.5]
	\draw(0,0)
	to[short, i^>=\Large $I_{1}$](3,0)
	to[short, i^>=\Large $I_{2}$](5,2)--(7,2);
	
	\draw(3,0)
	to[short, i^>=\Large $I_{3}$](5,-2)--(7,-2);
\end{circuitikz}
\end{document}
```
#### Kirchhoff's Voltage Law (KCL)
$V_{1} + V_{4}-V_{3} - V_{2} = 0$
$-V_{1} + V_{2} + V_{3} - V_{4} = 0$
The voltage can only drop across resistors going from high to low, otherwise, current cannot flow.
Charges will always flow from high to low, and in a DC circuit, the voltage drops will always sum to 0. 
In parallel branches, the voltage drop must be the same through all paths

#### Voltages and Currents
In a circuit with 2 branches, if the resistance changes in one branch, the current will be affected in all branches.
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[scale=2, font=\Large, american]
	\draw(0,0)
	to[vsource, invert, v=$6V$](0,3)
	node[circ, label=above:A]{}
	to[R=$R_{1}$, v=$5V$, i_>=$4A$](3,3)
	node[circ, label=above:B]{}
	to[R=$R_{2}$, v=$1V$](3,0)--(0,0);
	
	\draw(3,3)
	to[short, i_>=$3A$](5,3)
	to[R=$R_{3}$](5,0)
	to[R=$R_{4}$](3,0);
\end{circuitikz}
\end{document}
```

#### IA 3.2 : Calculate Voltages and Currents
Find the voltage and current across each of the 3 resistors
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, font=\Large, scale=2]
	\draw(0,0)
	to[vsource, invert, v=$20V$](0,2)
	to[R, a=$6\Omega$, l=$R_{1}$](3,2)
	to[R, l=$10\Omega$, a=$R_{2}$](3,0)--(0,0);
	

	\draw(3,2)--(5,2)
	to[R, l=$15\Omega$, a=$R_{3}$](5,0)--(3,0);
\end{circuitikz}
\end{document}
```
$R_{2+3} = (\frac{1}{10} + \frac{1}{15})^{-1} = 6\ohm$
$R_{1} = 6\ohm$
$I_{TOTAL} = \frac{12}{6+(\frac{1}{10}+ \frac{1}{15})^{-1}} = \frac{12}{12} = 1A$

$V_{1}= \frac{12}{2} = \frac{R_{1}}{I} = \frac{6}{1}=6V$
$I_{1}=$

$V_{2+3}= \frac{12}{2} = \frac{R_{1}}{I} = \frac{6}{1}=6V$
$V_{2}=$
$I_{2}=$

$V_{3}=$
$I_{3}=$

## Homework 2
1. A $\frac{1}{4}W$ resistor is a resistor which can be used safely to dissipate power  no more than $0.25W$. You are given $\frac{1}{4}W$ resistors, all of which are more than $1k\ohm$. No matter how you connect them, in parallel or in series, with  a $15V$ battery, any of the resistors in the circuit will not exceed the power rating. Is it true?
	$I_{1\ resistor} = \frac{15}{1000} = 0.015A$
	The current would only be less per resistor if connected in parallel
	$P = VI = 15V(0.015A) = 0.225W$ 
	In parallel or series, they will not exceed the power rating at $15V$
	
2. You are given resistors of these resistances (in $\ohm$)10, 12, 18, 22, 27, 33, 39, 47, 56, 68, 82, 100. Assume they are rated for $0.25W$

a) Which ones are safe to put across a $5V$ supply?  
	**100$\ohm$ Resistor:**
	$I_{100\ohm\ Resistor} = \frac{5V}{100\ohm} = 0.05A$
	$P_{100\ohm\ Resistor}= 5V(0.05A) = 0.25W$ 
	**10$\ohm$ Resistor:**
	$I_{10\ohm\ Resistor} = \frac{5V}{10\ohm} = 0.5A$ 
	$P_{10\ohm\ Resistor}= 5V(0.5A) = 2.5W$
	If the power rating of the resistors is still $0.25W$, the only safe resistor is the 100$\ohm$
	
b) Which ones are safe to put between $-15V$ and $+15V$?  
	None of them would be safe across $30V$ or even $15V$ because the lowest power rating was for the 100$\ohm$ resistor and that was already the maximum safe power. Any more voltage than 5V would increase the power to unsafe levels.	

3. What is the battery V s to use in the circuit to make the current through  
the 12$\ohm$ resistor 0.5 A?
	$I_{3\ohm} =I_{12\ohm} + I_{6\ohm}$ (Kirchhoff's current law)
	$R_{circuit} = 2\ohm + 3\ohm + ((\frac{1}{12\ohm} + \frac{1}{6\ohm})^{-1}=\frac{3}{6}^{-1} = 2\ohm)  = 7\ohm$    
	$V_{12\ohm}=IR=0.5A(12\ohm)=6V$
	By KVL, $V_{6\ohm}=6V$, so $I_{6\ohm}=\frac{6V}{6\ohm} = 1A$
	By KCL, $I_{2\ohm}=I_{s}=1.5A$
	So, $V_{s} = I_{s}R_{circuit}=1.5A(7\ohm)=10.5V$
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, font=\Large, scale=2]
	\draw(0,0)
	to[vsource, invert, v=$V_{s}$](0,3)
	to[R=$3\Omega$](3,3)
	to[R, a=$12\Omega$, i^>=$0.5A$](3,0)
	to[R, a=$2\Omega$](0,0);
	
	\draw(3,3)--(5,3)
	to[R, a=$6\Omega$](5,0)--(3,0);
\end{circuitikz}
\end{document}
```

