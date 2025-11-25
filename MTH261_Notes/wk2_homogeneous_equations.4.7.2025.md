#### 1.3 Homogeneous Equations
A system of equations is homogeneous when the right hand value (constant) is always 0
For these systems, an augmented matrix is not needed because the right hand side is always 0
A coefficient matrix will suffice
```
r1 [ 1 -2  3 -2] <--leading 1
r2 [-3  6  1  0]
r3 [-2  4  4 -2]

R2 = r2 + 3r1

r1 [1  -2  3 -2]
r2 [0   0 10  6]
r3 [-2  4  4 -2]

R3 = r3 + 2r1

r1 [1  -2  3 -2]
r2 [0   0 10 -6] <--divide this row by 10 to create next leading 1
r3 [0   0 10 -6]

R2 = r2 / 10

r1 [1  -2  3  -2    ]
r2 [0   0  1  -(3/5)] <--row 2 now has leading 1, use to make row 3 leading 1
r3 [0   0 10  -6    ]

change rows above and below row 2 now
R3 = r3 + -(10r2)
R1 = r1 + -(3r2)

r1 [1  -2  0  -(1/5)]
r2 [0   0  1  -(3/5)] <--row 2 now has leading 1, use to make row 3 leading 1
r3 [0   0  0  0     ]

This is now redued row echelon
```
Homogeneous form:
$x_{1} - 2x_{2} - \frac{1}{5} x _{4} = 0$
$x_{3} - \frac{3}{5}x_{4} = 0$

Is the resulting solution, which can be paremetrized:
let $x_{2}$ = s and $x_{4}$ = t]\[;'lkd ]

For Homogeneous solution, there is always a trivial solution, where all variables are 0.
For a unique solution, there will only be this trivial solution. For many, there will be other forms.

#### Linear Combinations and Basic Solutions
Given a vector (1-D matrix) with $n$ elements, add corresponding positions for the sum vector.
A linear combinations describes the multiplying the constants for each vector, then adding them together.

Any combination of solutions to a  homogeneous system is again a solution.
```
A = [ 1  -2   3  -2]
	[-3   6   1   0]
	[-2   4   4  -2]
	
  = [1  -2   0  -(1/5)]
    [0   0   1  -(3/5)]
    [0   0   0   0]

x =  [x1,x2,x3,x4] 
  = [(2s + (1/5)t), s, (3/5)t, t] 
  =  s[2,1,0,0] + t[(1/5),0,(3/5),1] 
  = sx1 + tx2
```
So:
$x_{1}  = \frac{1}{5}$
$x_{2} = 0$
$x_{3} = \frac{3}{5}$
$x_{4} = 1$

To determine if a vector is a linear combination of other vectors:
x, y linear combination $\rightarrow$ sx + ty = w
x, y, z linear combination $\rightarrow$ rx + sy + tz = v

So, if we can find r, s, t (solve for) we can prove that a valid linear combination exists.

