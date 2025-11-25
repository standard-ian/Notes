## Signal Integrity
At higher speeds and with smaller devices, is what is sent what is received?

Without a proper layout on the PCB, components may be places most efficiently, but not best for signal clarity.

Increased capacitance in the circuit can cause "clock skew" to propagate through a circuit.

Net : signal path and return path
Impedance is resistance plus reactance times j (complex quantity)
Ratio of voltage and current
Round Trip Time of Flight: Time it takes for a signal to travel and return

Impedance:
1. Instantaneous: impedance of a transmission line at a given point in the circuit
2. Characteristic: the continuous impedance throughout a circuit
3. Input: Value seen by the signal before it completes the return path.

A circuit with continuous impedance has a consistent instantaneous impedance along the entire net.

Traces should avoid impedance mismatches. They should be uniform and are typically 50$\ohm$ 

Impedance mismatches can be caused by trace dimensions, improper termination, or other discontinuities.

The longer a line, the more inductance and capacitance.
As these increase, the signal cutoff frequency approaches 0, which leads to sloppy signal transitions. Therefore, longer traces can be problematic.

Multilayer boards allow for shorter connections (traces)

Crosstalk: coupling of energy between traces. Near end (NEXT) or far end (FEXT)
Separating the traces, minimizing parallel runs, and placing conductors close to the ground plane can minimize crosstalk.

Noise: Caused by crosstalk, power supply, EMI (electromagnetic interference)

Jitter: variations in timing of a signal. If sample times allow for setup/hold times, signal movement can cause these to be violated.

Simulation is performed in software to avoid costly and time consuming manufacture and retesting.

Vector Network Analyzer: Frequency domain analysis
Oscilloscope: Time domain analysis

Eye diagrams are created by enabling persistence and allowing multiple periods to overlay

Degradations will "close the eye" and "Masks" demonstrate the acceptable narrowing.

##### Transmission Line Effects
As the signal travels down an infinitely long trace, there is a delay for the signal to travel. 

If the circuit is open or short or anywhere in between, there is some reflection - positive or negative or some mixture.

This can cause noise and misread signals. To reduce this effect, a termination network can be used.





##### Eye Diagram
Data dependent electrical measurement used to evaluate high speed data quality and high-speed transmitter/receiver performance.

Eye diagrams:
1. Adding high speed signal conditioners can improve a diagram
2. Eye diagrams are constructed from overlaying different bit transitions
3. Eye diagrams can be verified with an eye mask
4. 

## Midterm Review

| Memory Types             | Volatile | Erasable        | Rewritable | Notes                          |
| ------------------------ | -------- | --------------- | ---------- | ------------------------------ |
| ROM                      | No       | No              | No         | Factory programmed, permenant  |
| OTP EPROM                | No       | No              | No         | OTP Cheaper EPROM              |
| PROM                     | No       | No              | No         | Programmable once by user      |
| EPROM                    | No       | UV Light        | Yes        | Remove and expose to UV        |
| EEPROM                   | No       | Electrically    | Yes        | Electrically erasable          |
| Flash                    | No       | Electrically    | Yes        | Sector/Block erasable          |
| SRAM                     | Yes      | N/A             | Yes        | Fast no refresh needed         |
| DRAM                     | Yes      | Needs refresh   | Yes        | High density, slower than SRAM |
| SROM                     | No       | Depends on type | Yes        | Static ROM                     |
| DROM                     | No       | No              | No         | Specific digital usage         |
| **PLDs & FPGAs**         |          |                 |            |                                |
| PAL (Programmable Logic) | No       |                 | No         | Fixed manufactured AND/OR      |
| GAL                      | No       |                 | Yes        | Reprogrammable PAL             |
| EPROM Based PLD          | No       |                 | Yes        | Stores, logic in LUT           |
| FPGA                     | Yes      |                 | Yes        | Reprogrammable uses CLBs       |
##### Data Sheets (Memory Devices):
Access time
CE/WE/OE timing needed to determine read/write windows
Package types: soldering compatibility importance
Temp ranges commercial vs. industrial

##### Data Sheet (PLDs)
Number of Macrocells
Number of I/Os
Type of output
Clocking and reset options

##### IC Packages and Soldering
DIP - Dual In-Line Package
SOIC - Small outline package
PLCC - Plastic leaded chip carrier
TSOP/SSOP/TSOP-11 - Space saving, smaller pitch (distance between pins)
BGA Ball grid array

Soldering:
Reflow: surface mounting
Hand: Feasible for DIP/SOIC

##### Design Review

| Preliminary          | Critical                               |
| -------------------- | -------------------------------------- |
| Early stage          | Late stage                             |
| Feasibility          | Implementation                         |
| Confirm design works | Confirm design is ready to manufacture |
| System/Block-level   | Detailed/Element-level                 |
| Go-ahead for design  | Go-ahead for Production                |


