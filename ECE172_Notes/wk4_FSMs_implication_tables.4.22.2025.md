### Boolean Postulates and FSMs
Assuming a Moore FSM with 9 states, 4 FFs are needed.
Can be reduced to 8 states. If we can reduce the number of states needed, this increases the number of "don't care", meaning the K-maps will result in simplified excitation equations even if the number of FFs is not reduced.

How can we determine if the FSM can use a smaller number of states and retain the same behavior? Implication Tables.

Implication Tables: a graphical technique similar to K-maps, lets us determine if we can reduce the number of states in the FSM. 

2 states can be said to be equivalent if:
1. Outputs are the equivalent
2. Next states are equivalent

In the table below a and b are equivalent

| Present | Next  |       | Out |
| ------- | ----- | ----- | --- |
|         | r = 0 | r = 1 |     |
| a       | a     | c     | 0   |
| b       | c     | d     | 0   |
| c       | d     | d     |     |
| d       | a     | d     |     |
Transitivity: If m < n and n < k, m < k
Transitivity holds: If state a is equivalent to state b and of b is equivalent to f, a is equivalent to f.

Implication tables place all values but the first along vertical axis, and all values but last along horizontal.

Draw boxes as pictured below.
![[Pasted image 20250422190350.jpg]]

When designing an FSM, start with the specification and when creating the state table, don't worry about redundancy. The implication table will eliminate these later on in the process.

