### Design for Test
##### Controllability
The ability to control using just circuit under test (CUT) inputs to put any internal node into some desired logic state.

Given some CUT with $n$ bit input, if I can change the state of any internal combinational logic node on demand with a change in the n bit input, the CUT is controllable.
##### Observability
Using just the inputs and observing the outputs, the ability to determine the logic state of any internal node.

For a circuit with $k$ registers and $n$ inputs, an exhaustive test requires $2^{n+k}$ possible test inputs.

##### Design for Controllability and Observability
1. Remove all registers
2. Replace D and Q with pseudo inputs and outputs.
However, now the circuit may function differently and we have to deal with many additional pins for each combinational logic block that was previously connected to a register.

A better solution is to use something called a Scan Flip Flop.
 This is a FF with a MUX on the D input to allow selection between normal DATA and a SCAN-IN. The Q output branches to provide a normal output and a SCAN-OUT.

We can now eliminate all registers, no matter the number and replace with Scan FFs. 

These pass a $n$ bit vector where $n$ depends on the number of Scan FFs.

This way only SCAN-IN, SCAN-OUT, and SCAN-ENABLE are the only 3 pins added.

Chaining these registers with scan testing leads to high overhead of "loading" or "unloading" the data.

Build in Self Testing (BIST) can be used instead. 
##### Built in Self Test
Pseudo random pattern generator (LSFR/Counter) $\rightarrow$ CUT $\rightarrow$ Monitor (Signature Register or MISR)

These 3 systems are all controlled by a central controller and the system can run at full speed because there is no scan-in/out loading.

### PCB Construction
Copper sheet is etched away leaving traces between ICs.

Single layer or double layer: copper sheet on one or both side.

Modern electronics require more compact PCBs, and have multilayer PCBs.

Two or more 2 layer PCB's laminated with some resin known as the pre-preg layer which allows the individual layers to be established, then fused together in manufacturing.

Some layers may be Vcc or Ground plates to create shorter connections.
Some multi-layer PCBs may have 15+ layers

Connections between layers are made with pathways called "via"
1. Through hole touches all layerrs
2. Blind Via: travel from bottom layer to some internal layer
3. Buried Via: travel between internal layers

##### Test Access Problems and Boundary Scan Testing
With multilayer boards and surface mount devices, there are limitations on using "bed-of-nails" testing systems.

To get around this problem, boundary scan testing using JTAG can be used.
This is the original purpose of JTAG - testing.

Requires additional circuitry on the chip. Original circuitry will not modify the original circuit, however.

Not just for testing digital circuits, but can also test the integrity of the board itself.

Chips themselves can be manufactured and supported as JTAG compatible by adding boundary scan cells

### Bed of Nails Testing
##### Power On
Checking pin connection
Impedance level
##### Power Off
##### Functional Test

##### Boundary Scan Cell Operation
1. Normal: Boundary Scan Chain is transparent. The system and pin are connected together.
2. Scan: Data shifts from one Scan FF to the next. Doesn't interfere with System Logic. Clock DR shift the boundary scan chain.
3. Update: loads the data from the Scan FF to the Output FF. Applies the test pattern to the System Logic.
4. Capture: Captures a response from the system pin to the capture FF.

##### Boundary Scan Cell Instructions
![[Pasted image 20250522193830.jpg]]
1. Extest: Not concerned with the core logic, just seeing if inputs match outputs.
	1. Applies test patterns to interconnect structures (traces) on the board.
2. Intest: Applies patterns to device itself
	1. Boundary cells have permission to write to their outputs (device in test mode)
3. Bypass: Allows quick passthrough this device to others on the chain
4. Sample and Preload: Used to preload known values into the boundary scan cells
	1. Function mode, not test mode
	2. Need one scan cell per input, and one per output, unless output is "tri-statable." In that case, 2 cells are needed. One for data and one to control output.
	3. Bidirectional I/O pins need 3:
		1. 1 for data, 1 for control, 1 for output

##### Memory Testing
RAM: 
1. Write:
	1. 00H = 00000000 = Stuck at 1 faults 
	2. 55H = 01010101 = Shorted/open
	3. AAH = 10101010 = Shorted/open
	4. FFH = 11111111 = Stuck at 0 faults
2. It really doesn't matter what location you access.
3. Write this data, then read it back.
4. If the RAM chip is operational the write matches the read.

Non-Volatile (Excluding EEPROM):
1. Given a series of memory locations:
	1. Address 0000 = 00H
	2. Address 0001 = 3CH
	3. Address 0010 = F2H
	4. ...etc
2. Compute a checksum. 
	1. Add contents of memory locations disregarding carries/overflows across all locations data. The result is a total sum called the checksum. If the data is as expected, it should match a known checksum.
	2. XOR the contents across all register's data to create the checksum.
	3. Ideally, this checksum could be stored in EEPROM because the contents can be updated/read/written when the checksum changes as the software stored on memory changes.