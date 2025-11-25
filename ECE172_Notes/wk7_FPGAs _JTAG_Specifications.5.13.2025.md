## Joint Test Action Group (JTAG) and FPGAs
Initially designed to support testing of circuit boards, but it is also now used to program FPGAs.
4 Common Pins:
1. Test Data In (TDI)
	1. Input to FSM
	2. Data Input
	3. Configuration info for FPG comes in here
2. Test Data Out (TDO)
	1. Output of FSM
3. Test Mode Select 
	1. 1 bit input to FSM
4. Test Clock


##### Serial Peripheral Interface (SPI) on FPGA
Holds configuration information, special flash memory. Small outline package, very compact.
No address lines. Only Data in/out, clock , Vcc, Ground, hold, and write protect.
Every clock cycle, the SPI can output a single bit of data.
Usually installed on the FPGA's board. It sends clock to the SPI and asserts CS.
It gets back the configuration bit by bit.
It is a volatile device, so upon powering, it must look for config data. 
The configuration method is set by the Mode pins using phenolic blocks to select the 1/0 bit pattern needed.

FPGA can be configured using:
1. JTAG
2. Onboard SPI
3. Onboard microprocessor if available

##### Hardware Implementation of FPGA
Everything is soldered, so how does the SPI get programmed?
Can't program it before soldering...if there is a design flaw SPI Flash cannot be reconfigured...or can it...?

FPGA is flashed a module specifically for programming the SPI.
As the FPGA is passed the SPI programming, it "forwards" it to the SPI.
Once complete, the actual FPGA program is transferred.

##### Download Cable
Used to transfer data between the USB port of a laptop and the 4 programming pins on the FPGA.


Moore State Diagram for the JTAG
Notice the parallel structure of state names and state transitions.
Initialize from any state by setting test mode input to 1 and clock 5 times. It will always send you to TEST-LOGIC-INPUT
![[Pasted image 20250513185015.jpg]]]

![[Pasted image 20250513185350.jpg]]


### Specifications
To set the scene, lets assume to be talking about a large corpo releasing a new microprocessor based product line with digital to analog conversion of some kind (sensors, driving motor, etc.)

##### What does a spec do?
Usually tells what is needed, not how to implement it.
Most of the time, the designer will need to make the implementation decisions for the particular system. There are, some times, where a specific component is actually specified by another department, for example when a certain kind is already stored on site or purchased previously.

##### What does it tell us, specifically?
To return to a hypothetical situation, a device that has specific requirements. Because of the level of specificity, the spec is broken into parts with a hierarchical structure with increasing levels of detail such as:
1. System Spec
		1. Overarching specification at a 10,000 yard view.
		2. Define operational environment: temps, atmospheric conditions, etc
		3. Provide high level performance descriptions
		4. Documentation requirements; "All specifications will be documented according to company requirements (catch all)".
			1. What tools and methods are used and how must these be recorded.
	1. Hardware Spec
			1. "This unit must send data at such a speed"
			2. "This unit must store this amount of data"
		1. Analog Spec
		2. Digital Spec
	2. Software Spec
			1. Depends on the amount of detail.
			2. May contain algorithms to result in a certain efficiency.
	3. Testing Specifications - See [[#Testing Types]]
			1. May or may not be a separate specification
			2. May be in a variety of other specifications.
##### Testing Types
This is usually determined by the systems engineers, things like processing speed, rates, etc.
In addition to actually performing and documenting the test and results, it should indicate which specification the test is verifying.

###### Test Types:
1. Functional: Test under real world conditions to ensure reliability
2. Environmental: Temperature, meets operational environment specifications. Simulate the environment and verify functional testing results. 
	1. Temperature: Listed below are some temperature range definitions which will inform IC choice.
		1. Commercial: 0$^{\circ}$C $\rightarrow$ 77$^{\circ}$C 
		2. Military: -55$^{\circ}$C $\rightarrow$ 125$^{\circ}$C 
		3. Commercial: application dependant
	2. Humidity
	3. Spray: water resistance from indirect exposure
	4. Radiation: 
		1. Absorbed: Nuclear radiation such as a power switching amplifier on a cruise missile that may fly through a nuclear radioactive environment.
		2. Emitted: FCC part 15 - how much EM radiation does the device emit and will this cause problems with other systems or internally. Test by sticking it into a https://en.wikipedia.org/wiki/Anechoic_chamber 
	5. Vibration
	6. Shock: Drop survivability


Results are generally presented in a "Design Review": Presenting a design to a group of engineers who have successfully done something similar and determine if your design choices are sound, based on their knowledge and experience. 
###### Design Review Types:
1. Preliminary design reviews 
		1. Specific and granular down to subsystems analysis
		2. Receive feedback after to improve final design
		3. Mostly technical peers
	1. System Spec Review
		1. Engineers:
			1. Digital
			2. Software
			3. Testing
			4. Mechanical: Heatsinks, packaging, etc.
			5. Analog Engineers
		2. Manufacturing Partners
		3. Financial
		4. Marketing/Sales
		5. Legal
		6. Management
		7. Testing Partners
		8. QA
		9. NEVER: Investors or Customers

2. Critical design review
	1. Present Environmental and functional tests of the system
	2. All types of parties involved
	3. If this passes, enter production
	   