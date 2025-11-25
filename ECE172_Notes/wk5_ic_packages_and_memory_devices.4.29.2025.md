### ICs - Constructing a Purchasing List
To do this, a chief concern is IC packages.

Inline - standard like in the lab kits, 2.54mm pin spacing (pitch)
Flatpack - considerably smaller, 0.8mm pin pitch
Small outline - similar to inline, 1.27mm pitch with gull-wing pin shape
Small plastic leaded carrier - pads on the PCB sit directly below the IC

There are many forms of package that are used for SMD ICs. Although there is a large variety, each one has the areas where its use is particularly applicable.

- ﻿﻿SOIC - Small Outline Integrated Circuit: This SMD IC package has a dual in line configuration and gull wing leads with a pin spacing of 1.27 mm
- ﻿﻿SOP - Small Outline Package: There are several versions of this SMD package:
- ﻿﻿TSOP - Thin Small Outline Package: This SMD package is thinner than the SOIC and has a smaller pin spacing of 0.5 mm
- ﻿﻿SSOP - Shrink Small Outline Package: This package has a pin spacing of 0.635 mm
- ﻿﻿TSSOP - Thin Shrink Small Outline Package:
- ﻿﻿QSOP - Quarter-size Small Outline Package: It has a pin spacing of 0.635 mm
- ﻿﻿VSOP - Very Small Outline Package: This is smaller than the QSOP and has pin spacing of 0.4, 0.5, or 0.65 mm.

On pin and ball grid array ICs, an alphanumeric coordinate system is used. 'I' and 'O' are left off to avoid confusion. 

With the pins being 1mm apart, and with so many, the surface mount devices have to be soldered by reflow soldering. 

### Memory Devices
##### Preliminary knowledge
Use "k-notation" for integer powers of 2
k $\equiv$ 1024
$2^{10} = 1024 = 1k$
$2^{11} = 2048 = 2k$
$2^{12} = 4096 = 4k$
$.$
$.$
$2^{16} = 65563 = 16k$

Memorize:
$2^{0} - 2^{9}$ $\rightarrow 1, 2, 4, 8, 16, 32, 64, 128, 256, 512$ 
$2^{10} \rightarrow 1k \rightarrow 1024$
$2^{16} \rightarrow 64k$ (ubiquitous amount for early memory devices)
$2^{20} \rightarrow 1M$
$2^{30} \rightarrow 1G$

##### Memory systems
Definitions:
1. Read operation: process of extracting from a memory location (non-destructive)
2. Write operation: process of storing data in a memory location (destructive)

In the scope of this class, memory devices is implied to mean silicon based.
Memory devices are either volatile or non-volatile

Volatile: data storage is power dependent
Non-volatile: data is preserved when power is switched off

One time programable (OTP): can only write once

##### Types of Memory Chips
1. Read Only Memory (ROM): One time programmable, Non-volatile, data is initially loaded during the manufacturing process. A potential application would be where a large amount of the chip is needed, and no changes are foreseen in the short term. Expensive set-up fee for manufacturer to create a process to write to the memory during manufacturing.
2. Programmable Read Only Memory (PROM): One time programmable, Non-volatile, data is loaded by the end consumer using a zero-insertion-force socket type device (for DIP package)
3. Erasable Programmable Read Only Memory(EPROM): Non-volatile, IC will have a small window to view a silver point. Can be exposed to UV light and erased...then re-programmed. Erasing in this case means everything (all bits) are set to logic 1.
4. Electronically Erasable Programmable Read Only Memory(EPROM): Read or write, because the chip can be written to, reprogramming can be done through write operations. Significantly different from the previous devices. When writing to an individual location, the location is erased and re-programmed.
5. Flash Memory: Erase or reprogram entire blocks of memory. Write to a buffer, then software handles the erasure and reprogramming.
6. Static Random Access Memory (SRAM): Volatile, read and write. Can be thought of as a D-FF per bit of memory. In reality, it is implemented as transistor cells.
7. Dynamic Ram (DRAM): Similar to SRAM but can be synchronous. Uses a Row address strobe and column address strobe to assert what the address lines mean at different times.

### Addressing
Bus: a set of lines, each carrying 1 bit of data where all lines serve a common purpose.
Each address stores the same amount of data.
A location is given via an address over the address bus. The data is transferred over a separate data bus.

LSB is $A_{0}$ for addressing or $d_{0}$ for data

Locations on the chip is $2^{n} \times b$ where b is the number of bits per address.

$2^{14} \times 4$ means the chip has 14 address lines, 16k locations, and 4 bits per address

Every memory chip has tri-state buffers at the data bus
When either of the following are asserted, the chip will allow data to flow through the buffers instead of the high impedence signal:
1.  OE: Output enable
2. CS/CE: Chip select/Chip Enable

A decoder with polarity control can be used to both decode a bit pattern into one particular output being active, as well as selecting if it is active high or active low.
![[Pasted image 20250501190957.jpg]]

This is called a Lookup Table (LUT)

| $A_{2}$ (POL) | $A_{1}$ ($I_{1}$) | $A_{0}$ ($I_{0}$) | $D_{0}$ ($Y_{0}$) | $D_{1}$ ($Y_{1}$) | $D_{2}$ ($Y_{2}$) | $D_{3}$ ($Y_{3}$) |
| ------------- | ----------------- | ----------------- | ----------------- | ----------------- | ----------------- | ----------------- |
| 0             | 0                 | 0                 | 0                 | 1                 | 1                 | 1                 |
| 0             | 0                 | 1                 | 1                 | 0                 | 1                 | 1                 |
| 0             | 1                 | 0                 | 1                 | 1                 | 0                 | 1                 |
| 0             | 1                 | 1                 | 1                 | 1                 | 1                 | 0                 |
|               |                   |                   |                   |                   |                   |                   |
| 1             | 0                 | 0                 | 1                 | 0                 | 0                 | 0                 |
| 1             | 0                 | 1                 | 0                 | 1                 | 0                 | 0                 |
| 1             | 1                 | 0                 | 0                 | 0                 | 1                 | 0                 |
| 1             | 1                 | 1                 | 0                 | 0                 | 0                 | 1                 |


**Any** combinational logic circuit can be implemented in this way!

##### Memory Timing Diagram
![[Pasted image 20250501193002.jpg]]

### Memory Chip Datasheets

##### PROM/EPROM
$VPP$ and $\bar{PGM}$ are only used in programming.
$A_{0} - A_{n}$ are address inputs
There are one time programmable versions of some chips still made because they are cheaper.

Cost of a memory chip is informed by density (how many locations) and speed (how fast is data extraction?)

Mot important timing parameter for read operations $T_{a}(A)$: Access time from address - How long is it from giving an address to valid data on the bus?

##### EEPROM 
When a chip is read-write, it generally has a CE, RE, and WE. 
Microcontroller will send enable signals based on if it is executing read/write instructions.
On the block diagram, the data arrow will be bi-directional.
When the enable goes high, there is a data set up and hold, referring to the transition of the enable from low to high

##### Flash
Vss means GND.  On these chips they need to all be connected. 
This allows the current to flow separately and keep the chip operating at a cooler temerature.
BYTE pin determines how the chip is organized. 
Some pins are NC (No Connection)
###### Command Interface on Flash Memory Chips
Software Driver: program that defines how some hardware operates.
Unlike EEPROM/EPROM/ROM flash memory relies upon a software driver to actually erase are write blocks.


