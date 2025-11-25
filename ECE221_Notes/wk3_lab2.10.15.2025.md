# Lab 2
## Step 1
Choose 4 different R such that:
1. $R_{1}$ and $R_{2}$ have an order of magnitude
2. $R_{3}$ and $R_{4}$ $10x$ magnitude of $R_{1}$ and $R_{2}$
3. Resistors Chosen: $R_{1}$ = 100$\ohm$, $R_{2}$ = 150$\ohm$, $R_{3}$ = $1k\ohm$, $R_{4}$ = $1.5k\ohm$
## Step 2
Design and draw several circuits using the resistors and identify the nodes of each circuit.

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
    
    % Circuit 1 - Top Left
    \draw (0,8) 
    to[vsource, l_=$5V$] (0,6);
    \draw(0,8)
    to[R=$100\Omega$](2,8)
    node[circ, label=above:A, color=red]{}
    to[R=$150\Omega$](4,8)
    node[circ, label=above:B, color=red]{}
    to[short](4,6)
    to[R=$1k\Omega$](2,6)
    node[circ, label=below:C, color=red]{}
    to[R=$1.5k\Omega$](0,6)
    node[circ, label=below:D, color=red]{};
    
    \node at (0,9) {\Huge Circuit 1};
    
    % Circuit 2 - Top Right
    \draw (10,8) 
    to[vsource, l_=$5V$] (10,6);
    \draw(10,8)
    to[R=$100\Omega$](12,8)
    node[circ, label=above:A, color=red]{}
    to[short](12,6)
    to[R=$1.5k\Omega$](10,6)
    node[circ, label=below:D, color=red]{};
    \draw(12,8)
    to[R=$150\Omega$](12,6)
    node[circ, label=below:C, color=red]{};
    \draw(12,8)
    to[short](14,8)
    to[R=$1k\Omega$](14,6)
    node[circ, label=below:B, color=red]{}
    to[short](12,6);
    
    \node at (10,9) {\Huge Circuit 2};
    
    % Circuit 3 - Bottom Left
    \draw (0,2) 
    to[vsource, l_=$5V$] (0,-1);
    \draw(0,2)
    to[short](2,2)
    node[circ, label=above:A, color=red]{}
    to[short](4,2)
    to[short](6,2)
    to[short](8,2);
    \draw(2,2)
    to[R=$100\Omega$](2,-1)
    to[short](0,-1);
    \draw(4,2)
    to[R=$150\Omega$](4,-1)
    node[circ, label=below:D, color=red]{}
    to[short](2,-1);
    \draw(6,2)
    to[R=$1k\Omega$](6,-1)
    node[circ, label=below:C, color=red]{}
    to[short](4,-1);
    \draw(8,2)
    to[R=$1.5k\Omega$](8,-1)
    node[circ, label=below:B, color=red]{}
    to[short](6,-1);
    
    \node at (0,3) {\Huge Circuit 3};
    
    % Circuit 4 - Bottom Right
    \draw (10,2) 
    to[vsource, l_=$5V$] (10,-1);
    \draw(10,2)
    to[R=$100\Omega$](12,2)
    node[circ, label=above:A, color=red]{}
    to[short](14,2)
    to[short](16,2);
    \draw(12,2)
    to[R=$150\Omega$](12,-1)
    node[circ, label=below:D, color=red]{}
    to[short](10,-1);
    \draw(14,2)
    to[R=$1k\Omega$](14,-1)
    node[circ, label=below:C, color=red]{}
    to[short](12,-1);
    \draw(16,2)
    to[R=$1.5k\Omega$](16,-1)
    node[circ, label=below:B, color=red]{}
    to[short](14,-1);
    
    \node at (10,3) {\Huge Circuit 4};
    
\end{circuitikz}
\end{document}
```
## Step 3
For each circuit, choose several pairs of two nodes and calculate the $R_{eq}$ between them.
What is a node in this context? I understand it is a point in the circuit, but is there a method to picking them? 
Is there a comprehensive set of nodes?
###### Circuit 1
 $A\rightarrow B = 150\ohm$
 $A\rightarrow D = 150 + 1000 + 1500 = 2650\ohm$ 
###### Circuit 2
$A \rightarrow D = (\frac{1}{150} + \frac{1}{1000}) + 1500 = 1630.435\ohm$
$C\rightarrow D = 1500\ohm$
###### Circuit 3
$A \rightarrow Ground = (\frac{1}{100} + \frac{1}{150} + \frac{1}{1000} + \frac{1}{1500})^{-1} = 51.54\ohm$
###### Circuit 4
$A\rightarrow D = (\frac{1}{150} + \frac{1}{1000} + \frac{1}{1500})^{-1} = 120\ohm$
$A\rightarrow C = 100 + 1000 = 1100\ohm$
## Step 4
For circuit 4, assemble it on the breadboard:
$R_{eq} = 100 + (\frac{1}{150} + \frac{1}{1000} + \frac{1}{1500})^{-1} = 220\ohm$
$I_{circuit} = \frac{5V}{220\ohm} = 0.022727A = 22.727mA$
###### Circuit 4 Measured and Calculated

| Node    | Measured Current (mA) | Calculated Current (mA)                          | Measured Volts (V) | Calculated Volts (V)        |
| ------- | --------------------- | ------------------------------------------------ | ------------------ | --------------------------- |
| A       | 22.67                 | 22.727                                           |                    |                             |
| B       | 18.20                 | $\frac{2.73V}{150\ohm} = 18.2mA$                 |                    |                             |
| C       | 2.74                  | <br>$\frac{2.73V}{1000\ohm} = 0.00273A = 2.73mA$ |                    |                             |
| D       | 1.84                  | <br>$\frac{2.73V}{1500\ohm} = 0.00182A = 1.82mA$ |                    |                             |
| $R_{1}$ |                       |                                                  | 2.26               | $5(\frac{100}{220}) = 2.27$ |
| $R_{2}$ |                       |                                                  | 2.74               | By KVL:$5-2.27 = 2.73$      |
| $R_{3}$ |                       |                                                  | 2.74               | 2.73                        |
| $R_{4}$ |                       |                                                  | 2.74               | 2.73                        |
| Circuit | 22.671                | $\frac{5V}{220\ohm} = 0.022727A = 22.727$        | 5                  | 5                           |
KCL Verified: $I_{B} + I_{C} + I_{D} = I_{A} = I_{circuit} = 22.78mA$


## How does the digital meter measure the resistance of a circuit of resistors?
It seems there may be 2 types of resistance measurement, but common handheld tools like Fluke multimeters use a known current.
###### Type 1 - Known Current and "Shunt" Resistor (Common, simpler calculation, used in most handheld meters)
Monitors current with op-amp to ensure known consistent value, applies this constant current, and measures the voltage drop, then uses this to calculate the resistance.
Is this why voltage and resistance can be measured with the leads plugged in to the same connection on the meter? If we want to measure current, we cannot supply a know current, but something else!
###### Type 2 - Known Voltage
It applies a small, known voltage across the resistor. It then measures the current by measuring the strength or force of the magnetic field resulting from this. On an analog meter, the needle is calibrated to a certain value based on 0 current and mechanically engineered to move proportionally to the change in magnetic field.
## Explore the questions: How does an analog voltmeter work? How does an  analog ammeter work?  
Analog meters are based on something called galvanometer. A galvanometer is a device that is made of a magnetic coil, a permanent magnet, and a needle attached to a spring. As a current passing through the conductive coil, it produces a magnetic force that moves the needle. This device is also called a movement. A movement, with additional resistors, in series and in parallel, it becomes an instrument for measuring voltage—a voltmeter, or current—an ammeter.