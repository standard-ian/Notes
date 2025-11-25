#### Defensive Programming
Understand what is required, develop a written specification. Without this it's impossible to tell if programs are doing what is intended. 

Develop software in a way that it can be tested. This starts with modular programming, and incrementally building the software so you can do unit and systems test along the way.

Testing and debugging are not the same. 

Testing is the process of running a program to determine if it does what it is supposed to do,
Debugging is fixing code that doesn't return the expected result.

#### Types of testing
##### Black box testing: 
Develop tests based solely on the specification document, no knowledge of the code

Should test boundary conditions without knowing what types of loops or other syntax constructs are used
These tests should be written before writing the code! Assumptions will be made based on the specification

Example: 
```
Online store 
	- purchase $500, get 5%
	- purchase $1000, get 7%
	- test for positive/negative inputs
	- test 0-499, 500-999, 1000+
	- calculate intended results
	- more than $3000/mo, additional 5% is applied
	- now need to test multiple inputs and agregate the total
	- as specification gets more complex, it introduces ambiquities
	- we need to clarify these BEFORE writing software by asking client questions
```

##### Glass box testing:
Start off with input, and knowledge of the code and make sure every single path through the the program gets "exercised"

Are flags correct? Are logical flow statements directing control correctly? Are the correct values kept and used?

##### Integration Testing:
Test your program as a whole and to make sure that the interactions between the different
pieces work as expected. If it doesn’t, then go back to unit testing
"scenario testing” and  mix of automated tests and manual tests
##### System Testing:
Checking for errors throughout the entire program, making sure the software works as intended with all edge cases.



