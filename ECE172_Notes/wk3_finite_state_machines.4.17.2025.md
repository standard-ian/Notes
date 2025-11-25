##### Finite State Machines (FSM)
Two types exist: Mealy and Moore
Describes by a 5-tuple: FSM $\rightarrow$ {$S, S_{0}, I, O, T$}
Where: 
	$S \rightarrow$ set of states
	$S_{0} \rightarrow$ initial state
	$I \rightarrow$ set of inputs
	$O \rightarrow$ set of outputs
	$T \rightarrow$ $S^{2}$, cartesian product of set of allowed transitions
	
Elevator Example: 
	$S$:  6 states: {B, 1, 2, 3, 4, 5}	
	$S_{0}$: Start at floor 1
	$I$: {$f_{1}, f_{2}, f_{3}, f_{4}, 5_{5}, f_{b}$ }

($k$ bits) Inputs $\rightarrow$ Combinational Logic $\rightarrow$ ($m$ bits) Outputs
				$\rightarrow$ ($l$ bits) Next State $\rightarrow$ State Memory $\rightarrow$ ($l$ bits) Present State
###### Moore:
Output - $f_{1}$(current state)
###### Mealy:
Output = $f_{2}$ (current state, current input)
