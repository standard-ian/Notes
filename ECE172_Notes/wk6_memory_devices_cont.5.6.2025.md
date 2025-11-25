### Memory Addressing and Design
Multiple memory chips can be combined to create the desired memory system. In advance, a memory map is created to inform which types of memory are needed there.

Assuming a microprocessor able to write up to 1M of data addresses, and 4, 32K x 8 bit chips, not every address is used.

If the same address is sent to multiple chips, the request collides and the memory is corrupted.
Ideally, when a write operation is performed, only one chip responds.

In a system like the one described above, all chips see the same address, write signal, data, etc, however, CS or CE (chip select/enable) is driven by independent circuitry to enable the selection of the desired chip.

The select circuitry can be composed of 
![[Pasted image 20250506192408.jpg]]
### DRAM Addressing
Time Multiplexed: At different times, data can be interpreted differently. 
There is asynchronous and synchronous DRAM: It's connected to a clock or not.
Dram is composed of capacitors. when they are charged, there is a logic 1.
When the capacitor discharges, this is a logic 0.
The problem is that the capacitor slowly discharges due to internal impedance and therefore requires "refresh"

##### Refresh Operations:
###### RAS Only Refresh: 
1. Row address is put on the lines
2. RAS is dropped
3. CAS held high, that row will be refreshed.
4. RAS is brought high again and cycle repeats as CAS is held high
###### CBR (CAS before RAS)
1. Drop CAS, then drop RAS
2. One refresh cycle occurs each time RAS falls.
##### Burst Mode on SDRAM Modules
Burst mode allows faster writing to multiple memory locations instead of waiting for an entire write cycle, we can use burst to write a location every clock cycle instead.

SDRAM often needs to be initialized; that is the chip needs to be init before read or write.

### Register Definitions
##### Data Register
Concerned about value stored
Purpose is to store data values
##### Mode Register
Concerned about the state of individual bits.
Purpose is to configure hardware.

### Programable Logic Devices (PLD)
##### Single PLD (SPLD)

##### Complex PLD (CPLD)
##### Field Programmable Gateway (FPGA)
Has a Configurable Logic Block (CLB) which is a matrix 
