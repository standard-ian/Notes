### Testing
##### Stuck at Faults
Two types: Stuck at logic 0 or 1
1. Manufacturing Error: The location in the circuit is inadvertently connected to logic 1 or logic 0
2. Design Error:
	```
	assign y = A+B
	assign y = a + 1
	```
##### Test Patterns
An n-bit binary input to a **circuit under test (CUT)** also called a test vector
At this stage, assume the CUTs are combinational logic only

Let:
$k$ = number of detectable faults
$n$ = number of possible faults
$\frac{k}{n} \times 100$ = fault coverage percent

Exhaustive Test: All possible unique test patterns are used in the test.

Given a test pattern of 20 bits, an exhaustive test may take 20 minutes or more to test depending on the runtime of a single test.

Because of this, a portion of test patterns may be used (i.e 5000 instead of $2^{20}$)
However, this may lead to some faults being missed.

If there are 5 possible fault locations, and 3 possible states at each:
1. Stuck at 1
2. Stuck at 0
3. No fault
Then, there are $3^{5}-1$ possible fault combinations.

There is no [[https://en.wikipedia.org/wiki/NP_(complexity)|nondeterministic polynomial time]] solution to finding the ideal percentage of tests for maximum coverage.

20-40% is considered excellent.
##### Generating Test Patterns
Presume to use a binary counter.
Just generating and feeding in all possible combinations may not be enough.
If we're testing for power consumption, we'll want to maximize switching for example.

To get a pseudo-random order of inputs, we can create a circuit called a Linear Feedback Shift Register.
##### Linear Feedback Shift Registers (LFSR)
In a LFSR, the symbol $\oplus$ will be used instead of the logic XOR as it's easier to represent.
The circuit is implemented with just D Flip-Flops and XOR Gates.
Pattern is pseudo-random because it repeats. 000...0 (all 0 value) will always be missing
Can be init to any value other than 0; for internal or external types.

The placement of the XOR gates matters. 
We use the generating polynomial to determine the placement of the XORs
A generating polynomial that produces the maximum count sequence is called a primitive polynomial.

If the polynomial is primitive, the sequence will be of the maximum length.
Tables and proofs exist to determine what polynomials are needed for a given bit length.
![[Pasted image 20250515201001.jpg]]
These can be used for exhaustive tests, but bear in mind, 0000...0 will not be generated.

##### Data Compression and LFSRs
When testing with a "slice" of the bit patterns needed, it would be nice to compress these values to the smallest representation of each distinct value.

By placing a signature register at the output of the CUT, we only need to compare an ideal (no-fault) signature to the actual.

Locations of stuck at faults can be mapped to certain bits in the signature.
Leads to rapid identification of the type and location of faults.

For this to work, sig. register must be initialized to the same known value every time a test starts.

If the CUT has multiple outputs, there would be that same number of signature registers. Unless...we add another XOR somewhere in the chain of FFs and connect the other outputs to it.


