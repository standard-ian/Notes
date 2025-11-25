#### 1.1 Elementary Operations
If there are m ore variables than there are equations in a system, it certainly has multiple solutions.
Instead of using subtraction method for solving, matrices can be used.

For these equations:
$x = 2y = -2$
$2x + y = 7$
```
[ 1  2 | -2 ]
[ 2  1 | 7  ]
```
Multiply first equation by some coefficient, then imul by lower equation
```
imul 2 by 1 * -2*
[ 1  2  | -2  ]
[ 0  -3 | 11  ]
```
```
Then, divide row 2 by -3 (y coefficient)
this is row echelon order meaning variables correspond to rows

  x. y.    rvalue
[ 1  2  | -2      ]
[ 0  1  | -(11/3) ] <-- solution for y
```
```
reduce by multiplying row 2 by some coefficient, then adding it to row 1
reduced row-echelon form
  x. y.    rvalue
[ 1  0  | 16/3      ] <-- soultion for x
[ 0  1  | -(11/3)   ] <-- solution for y
```
If all variables are 0 and the solution is non-zero, it indicates there is no solution.
If all variables are 0 and the solution is also zero, it indicates many solutions

Row echelon is defined as:
1. All zero rows are at the bottom
2. The first non-zero entry from the left in each non-zero row is a 1 (leading 1)
3. Each leading 1 is to the right of all leading 1s above it
Reduced Row echelon adds:
4. Each leading 1 is the only non-zero value in its column

#### 1.2 Gaussian Theorem
1.  If the matrix is all 0s, stop it is already row-echelon
2. Otherwise, find the first column from the top left containing a non-zero entry ($a$) and move the row containing that entry to the top position
3. Now multiply the new top row by 1/a to create a leading 1
4. By subtracting multiples of that row from the rows below it, make each entry below the leading 0

This completes the first row
5. Repeat steps 1-4 on the matrix consisting of the remaining rows

Stop when either now rows remain or the remaining rows are all 0s.

Rank of a matrix is the number of leading 1s in any row-echelon matrix to which the matrix can be carried by row operations. 

A system is consistent if it has at least one solution, no solutions is inconsistent.
If a system of $m$ equations in $n$ variables is consistent, and the rank of the matrix is r:
1. The set of solutions involves exactly n-r parameters 
2. if r < n, the system will have infinitely many solutions
3. if r = n, the system has a unique solution.

For a system of equations, $m$ represents number of equations, $n$ is number of variables. When $m$ is less than $n$, these will be multiple solutions. 

$x_{1} + 3x_{2} + x_{3} = a$
$-x_{1} -2x_{2} + x_{3} = b$
$3x_{1} + 7x_{2} - x_{3} = c$

```
Starting Matrix:
	[ 1   3   1   a]
	[-1  -2   1   b]
	[ 3   7  -1   c] 
	
R2 = r2 + r1 
R3 = r3 - 3r1
	[ 1   3   1   a]
	[ 0   1   2   b + a]
	[ 0  -2  -4   c - 3a] 

R3 = r3 + 2r2
	[ 1   3   1   a]
	[ 0   1   2   b + a]
	[ 0   0   0   c - a + 2b] 
```
In the above example, when `c - a + 2b = 0` there will be many solutions.
These solutions still need to be simplified, because we stopped at row-echelon without reduction. We'll have to still perform back-substitution.
$x_{1} + 3x_{2} + x_{3} = a$
$x_{2} + 2x_{3} = b + a$

Reduced echelon form:
```
From previous solution:
	[ 1   3   1   a]
	[ 0   1   2   b + a]
	[ 0   0   0   c - a + 2b] 

R1 = r1 - 3r2:
	[ 1   0  -5   -2a - 3b]
	[ 0   1   2   b + a]
	[ 0   0   0   c - a + 2b] 
```

Now the equations:
$x_{1} - 5x_{3} = -2a - 3b$
$x_{2} + 2x_{3} = b + a$
$if$ $x_{3} = 0$, parametrize $t$ and solve for $x_{1}, x_{2}, x_{3}$:
	$x_{1} = -2a - 3b + 5t$
	$x_{2} = a + b - 2t$
	$x_{3} = t$

Always try to go straight to reduced echelon form.

No soultion is inconsistent, all other cases are consistent.