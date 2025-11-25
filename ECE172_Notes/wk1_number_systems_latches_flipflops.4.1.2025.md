This course will primarily use decimal, binary, and hex
Using hex will be important when working with memory devices, as addresses can be quite long
This course will use an H,D, or B following values to indicate base, i.e. 1010110B or 234D

Truth tables for all fundamental logic gates will be critical for this course.
The traditional symbols are positive logic notation. 
```
Truth Tables:

XOR = Odd function, odd # of 1s input = 1 output

NOT  AND   OR    NAND  NOR   XOR  XNOR

A|Y  AB|Y  AB|Y  AB|Y  AB|Y  AB|Y  AB|Y

0|1  00|0  00|0  00|1  00|1  00|0  00|1

1|0  01|0  01|1  01|1  01|0  01|1  01|0

     10|0  10|1  10|1  10|0  10|1  10|0

     11|1  11|1  11|0  11|0  11|0  11|1

Half Adder   Full Adder  SR Latch  D Latch

AB|S C       ABC|S C     SR|Q Q    D E|Q Q'

00|0 0       000|0 0     00|h h    0 0|h h

01|1 0       001|1 0     01|0 1    1 0|h h

10|1 0       010|1 0     10|1 0    0 1|0 1

11|0 1       011|0 1     11|x x    1 1|1 0

             100|1 0     T Flip-F  D Flip-F

JK Flip-Flop 101|0 1s    T|Q+      D|Q+

JK|Q+        110|0 1     0|Q       0|0

00|Q         111|1 1     1|Q'      1|1

10|1

11|Q'
```
Propagation delay is the time an input change takes to affect an output

The column for $T_{A}=25^{\circ}C$ is generally irrelevant because it can only guarantee accuracy for operation at exactly $25^{\circ}C$ 

A multiplexer selects one output from $n$ inputs using a select signal that can be multi-bit

A tri-state buffer has control input as well as one bit signal input. When control is 0, the output of the buffer is Z, or a high impedance signal. When control is 1, the output is the signal input.

Multi-bit inputs may be denoted with a line and a slash.

A comparator may take multi bit inputs and select between one of many outputs.

A decoder takes a number of inputs and expands them into more bits, while an encoder does the opposite

Combinational logic: output is only a function of the current input. Results are deterministic. 
Sequential logic: output is a function of the input and the current state. 
This course will deal primarily with sequential logic.

Clock signal is a square wave alternating between high and low. Period ($T$) is the time from one point to another reoccurrence in the cycle.  

Positive edge is the leftmost edge of the cycle high, rightmost is the negative edge.

Period will be in seconds, but could be nanoseconds, milliseconds, etc.
Frequency($Hz$) is the inverse of period.  $Hz = \frac{1}{seconds}$ 
$\tau$ is the amount of time a signal is high in a given period.
Duty cycle(%) = $\frac{\tau}{T}*100$ 
Duty cycle can give period and length of a signal high in a clock cycle.
Be aware of units.
## Latches

#### Intro to Latches
SR-Latch using 2 nor gates with feedback from one another (active high)
```
R S | Q
0 0 | no change
0 1 | 1 (set)
1 0 | 0 (reset)
1 1 | illegal
```

SR-Latch using 2 nand gates with feedback from one another (active low)
```
R S | Q
0 0 | illegal
0 1 | 0 (reset)
1 0 | 1 (set)
1 1 | no change
```

We can add 2 more NAND with a common enable signal to the above NAND gate SR latch
When enable is 0, Q = last Q (no change)
When enable is 1, S/R control Q, but via active high instead
This is because when enable is 1, the new NAND gates "invert" their respective S/R signals
```
R S | Q
0 0 | illegal
0 1 | 0 (reset)
1 0 | 1 (set)
1 1 | no change
```
The invalid states can be eliminated by reducing R and S to a single signal "D" that is split with one branch inverted. This way, "S" is always not "R"

#### Switching Characteristics and Timing Requirements
Critical edge indicates the moment when the enable allows the set pulse (D on a D latch)
Switching:
	$t_{pd}$ indicates the time it takes for D or LE to propagate to output
	$t_{en}$ indicates delay to enable
	$t_{ds}$ indicates delay to disable
Timing:
	Satisfying these requirements ensure the device's output predictably follows the input/enable
	$t_{su}$ is the setup time. Prior to critical edge, the input signal cannot be changed for this time
	$t_{h}$ is the hold time. Period of time after critical edge where input cannot be changed. 
	Setup and hold time decrease as $V_{cc}$ increases. 
	Failure to adhere to the setup and hold time reqs. will cause a "metastable state".
	Metastable State: A state in which you cannot reliably predict the output. This state will settle, but you don't know until it does what the output is
	$t_{w}$ is pulse duration. It indicates the minimum time the enable must be high in order for Q to follow D

#### Latch Applications
For example, a switch. When flipped, the signal will pulse due to the physics of the materials.
A latch can be added where R and S are the switch poles. This way when the switch is activated, S is applied and the latch is set. The bounce occurs, but the latch signal has been "cleaned"
![[Pasted image 20250403192528.jpg]]

### Flip Flops
Similar to a latch, but require a clock input.
D, JK, and T types. JK and T can be largely ignored for the scope of this course. 
JK designs remain unimproved largely over the last 30 years. T Flip Flops are just JKs with J and K connected to a single input. 

#### D Flip Flop
Referred to as a "register" 
"Data ($D$)" input and a $Q$ output, may include a $\bar{Q}$ as well as a clock signal
Clock signal may be positive or negative edge triggered. This means output will change either on the front or rear edge of the signal.

Free Running Clock: a clock that runs continuously so long as there is power in the circuit.
For a normal register, for every clock edge, whatever is on the D input will affect Q. 
To change this, we'll need some sort of third input to control enable.

Could put an AND gate on the clock input and and the clock signal with an enable signal.
Not a good idea because the enable signal could reach the Flip Flop during a pulse and cause Q to respond in the middle of a clock pulse.

Better to use a 2:1 MUX on $D$ with $Q$ as input 0 and the data signal as 1.
Then, the MUX select becomes an enable, so the enable signal doesn't change Q outside of the clock timing.
```
D CLK | Q
0  ^  | 0 
1  ^  | 1
```

#### Synchronous Input
Input that no effect on the device until an appropriate clock (edge) is received.
In the above D Flip Flop examples, D is synchronous.
Device operation is dependent on a clock signal.

D flip flops may also have $CLR$ and $PRE$ inputs, active low, which can set Q to 0 or 1 respectively. These would be asynchronous.

#### Week 1 Homework
1.  A D-latch is often referred to as a transparent latch because when the enable is active, the output Q of the D-Latch follows the input, then when the enable goes low, the latch holds the state it was in at the trailing edge.  It is said to be transparent because the state of D can be seen through Q as if it were "see-through".

2. Output Q of SN74LVC1G373 is at logic 0 initially. The current D is 1. LE is asserted for 2ns. The Q output will not reliably capture the state of D because the minimum $t_{w}$ for SN74LVC1G373 is 3ns. This means a control signal must have a minimum pulse width of 3ns to reliable enable the latch.

3. Output Q of SN74LVC1G373 is at logic 0 initially. The current D is 1. LE is asserted for 20ns. At 3.3 Vcc, with a capacitive load of 15 pF at -40 to 85 degrees Celcius, this IC - SN74LVC1G373 - will take 1-4ns to respond. This is given by the switching characteristic $t_{pd}$.

4. Failing to meet setup and hold time requirements for a latch means the latch can enter a "meta-stable" state. This means there is no way to accurately predict whether the output will settle to a 1 or 0. Q is effectively random, or may remain stuck or fluctuating between 0 and 1.

5.  Image of the D-FF vs D-Latch timing diagram is attached. I can conclude that the flip flop takes takes the state of D at each rising clock edge, then holds it until the next pulse. The D-Latch on the other hand, changes in exactly the same way as D, but only when clock (enable) is 1. At the trailing edge of the clock pulse, Q "latches" the state of D and holds that until the next pulse. The difference is that the D-Latch can change multiple times in a single clock pulse in order to follow D, with the D-FF changes only once on the rising clock edge and holds until the next pulse