#### Counters
Counter: circuit with an output that is a finite length repeating sequence of whole numbers with no duplicates in the sequence.

These may be a counter output:
```
1,2,3,4,5,0,1,2...
0,1,17,63,5,0,1,17,63
```
This is not as "2" repeats:
```
0,1,2,3,2,4,0,1,2,3,2,4...
```
##### Some counter types:
1. This is a modulo-k counter because it can have $k$ states. 
```
0,1,2,3,...k-1, 0,1,2,3,...k-1...
```
2. A modulo-k counter with $k = 2^{m}$ is referred to as a binary counter.
3. This is a "decade counter"
```
0,1,2,3,4,5,6,7,8,9, 0,1,2,3...
```
Counters use a clock to cycle the sequence. At every clock pulse, a new number is output.
Counters can be synchronous or asynchronous. A vast majority are synchronous.
For a counter constructed from $n$ D-Flip-Flops, each FF contributes 1 bit. $D_{0}$ is the least significant bit, and $D_{n-1}$ is the MSB

Synchronous counters are more complex, but any and all changes to $Q$ occur at the same time, which is highly desirable.

Counters need to be initialized before use, this can be done using the PRE and CLR terminals of the D-FF.

As FF (and bits) are added, the clock frequency is halved with each new bit. 
##### To analyze a counter circuit:
1. From schematic, determine excitation equations
	1. These relate the input to the output for each FF (and consequently each bit)
	2. $D_{k} = Q_{k}$ , for example. Left hand is $D$ (input).
2. Diagram a clock cycle and the truth table for a D-FF.
3. Assume $t_{su}, t_{pd}, t_{h} = 0$
4. Assume $Q_{0} = Q_{1} = 0$
5. Diagram each of the FF outputs
6. Trace through each clock cycle

##### Counter ICs
Commonly referred to as the "160" series. 
54160-54163
4 bit counters, all 4 are synchronous

160 and 162 are "decade counters"
	160 is asynchronous reset vs 162 is synchronous
	This means clearing the counter using the reset terminal is or is not dependent on the clock signal.
161 and 163 are binary counters
	161 is asynchronous reset vs 163 is synchronous

Outputs are designated $Q_{A}-Q_{D}$ where $Q_{D}$ is the MSB
ENP and ENT are both active high enables.
CLR initializes counter to 0, active low synchronous LOAD initializes the counter to whatever is on A-D at the time of the LOAD signal.

Multiple ICs can be connected to form a "Cascade Counter"

##### Counter Implementations
Ring Counter:
	-not concerned with count sequence, but pattern
	- final bit (FF)'s output is looped back to the first FF's D(input)
	- all outputs are initialized to 0 except one.
Twisted Ring Counter:
	-same as ring, but use final bits $\bar{Q}$ instead of $Q$
	-again, not concerned with sequence, just pattern
	-no particular initialization
	-the resulting timing pattern for each bit will be:
		1. the same, but shifted with each next bit
		2. same period/frequency
		3. 50% duty cycle
##### Line Decoder
$n$ inputs and $2^{n}$ outputs.
Use combinational logic, so they are susceptible to glitches/hazards. 
The output can be "Registered" using counters to eliminate these (Pass them through D-FF)
##### Up/Down Counter
If an IC has a fractional label on a pin, it may be a "Mode Pin". i.e. UP/DN
Depending on the placement of the logic value of the mode, the counter will operate forward or backward. 

##### Shift Register
Converts data from serial to parallel
Can add a multiplexer at each D-FF to select between serial $\rightarrow$ parallel or parallel $\rightarrow$ serial.

##### Creating a Counter
1. Determine count sequence
2. Create a state table specifying each bit ($Q_{0}- Q_{n}$)
3. Create Karnaugh maps for each $D$ based on the bit representation of the count sequence
4. Mark all numbers not in the sequence as don't care
5. Derive excitation equations
6. Step through $n$ many clock pulses to verify states

A self starting counter can determine how many clock cycles from each number not in the sequence. We can define these non-sequence states and determine how far to go before we're there.

We could examine every state, but this would eliminate all the "don't cares" making our excitations equations far more complex. Instead, we pick regular intervals of states outside the main sequence and map how we move to the main sequence states.



### Week 2 Homework
1. You want to design a counter with the count sequence 0, 14, 89, 2, 7, 41, 0, 14, …. How many FFs are required?
	Since the maximum value is 89, we'll need 7 bits, one FF for each
	
2. What’s the difference between a synchronous and an asynchronous counter?
	A synchronous counter uses the same clock signal for each bit position's Flip Flop, while an asynchronous counter
	
3. The ring counter requires a special initialization. How would you initialize a ring counter?
	For a ring counter to be correctly initialized, all D values should be 0 except 1.
	
4. Design a counter whose count sequence is the set of prime numbers less than FH. (You need only provide the excitation equations.)![four-bit-prime-counter.jpg](https://gist.github.com/standard-ian/f2356f9c094539281c6a73d5e0698dfd#file-four-bit-prime-counter-jpg)
