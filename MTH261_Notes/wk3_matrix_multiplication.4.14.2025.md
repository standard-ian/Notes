### Matrix Multiplication Review
Given the following, calculate AB and BA
```
A = [1  2] B = [1  0  1]
    [3  4]     [2  1  0]

A = 2x2 B = 2x3 Result = 2x3 (Ignore the inner 2 dimenstion numbers, use outer for new dimensions)

AB = [ (1x2 + 2x2)  (1x0 + 2x1)  (1x1 + 2x0) ]
     [ (3x1 + 4x2)  (3x0 + 4x1)  (3x1 + 4x0) ]
     
BA = No solution (Dimensions do not match)
Multiply row 1 by column 1, etc

```

### Transformation
Transformations are a function applied to a matrix.
Function $T: R^{n} \rightarrow R^{m}$ where $m$ and $n$ represent the dimension of the vectors.
$R^{n}$ = `[x_{1}]`  $n$ dimension vector
    `[x_{2}]`
	    .
		.
    `[x_{n}]`
    
Can determine what operations constitute a transformation by following rules of matrix multiplication.

### Matrix Inverse
Given the following, calculate AI:
```
A = [1  2]  I = [1  0]
    [3  4]      [0  1]
I is an Identity Matrix
AI = [ (1x1 + 2x0) (0x1 + 2x1) ]
     [ (3x1 + 4x0) (3x0 + 4x1) ]

AI = [1  2]
     [3  4]
```
Identity Matrix: Square matrix (rows = columns) where the values are only on the diagonal
Diagonal Matrix: Only values on the diagonal starting from the top left corner

If BA and AB are both the same exact identity matrix, then A is the inverse of B.
We can say $A = B^{-1}$

Given:
```
B = [-1  1] A = [0  1]
    [1   0]     [1  1]
    
BA = [(-1x0 + 1x1) (-1x0 + 1x1)]
     [( 1x0 + 0x1) ( 1x1 + 0x1)]
     
BA = [1  0]
     [0  1]
     
AB = [1  0]
     [0  1]
Because AB == BA == Identity Matrix, these are inverses of eachother.
     
```

### Adjugates and Determinants
Theorem 2.4.1: If B and C are both inverses of A, then B = C

Determinant:  det(A) or |A|
```
For 2x2 matrix, A = [a  b]
                    [c  d]
det(A) = ad=bc
```
Given:
```
A = [1  2]
    [3  4]
|A| = det(A) = 1x4 - 3x2 
det(A) = -2
```
Adjugate: adj(A)
```
For 2x2 matrix, A = [a  b]
                    [c  d]
adj(A) = [d -b]
         [-c a]
```
Given:
```
A = [1  2]
    [3  4]
    
adj(A) = [4 -2]
		 [-3 1]
```

Theorem:
```
A = [1  2]
    [3  4]

A has an inverse if and only if det(A) != 0

And:

A^{-1} = 1/det(A) x adj(A) = 1/(ad-bc)[ d -b]
									  [-c  a]
```
Given the following, find the inverse of A:
```
A = [1  2]
    [3  4]

det(A) = 1x4 - 3x2 = 4-6 = -2
```
$A^{-1}$ = $\frac{1}{determinant}$ x $adj(A)$ = $\frac{1}{-2} adj(A)$
$adj(A)$ = 
```
(1/-2) x [ 4 -2] = [  -2      1]
         [-3  1]   [(3/2) (-1/2)]
```
$A^{-1}A$ = 
```
[1  0]
[0  1]
``` 
$AA^{-1}$ = 
```
[1  0]
[0  1]
```
Because both $A^{-1}A$ and $AA^{-1}$ result in an identity matrix, the inverse is correct!

If A is invert-able: 
$A^{-1}Ax\rightarrow$ = $A^{-1}b\rightarrow$
$Ix\rightarrow$ = $A^{-1}b\rightarrow$
$x\rightarrow$ = $A^{-1}b\rightarrow$

There is a unique solution.

Example: Given the following system:
$5x_{1} - 3x_{2} = -4$
$7x_{1} + 4x_{2} = 8$

Augmented matrix :
```
A = [5 -3 | -4]
	[7  4 |  8]
```

Inverse = 1/det(A) x (adj(A))
```
b-> = [-4]
      [ 8]
      
det(A) = 41

adj(A) = [ 4  3]
         [-7  5]

x-> = A^{-1}b-> = (1/41) x [ 4  3] x [-4]
						   [-7  5]   [ 8]

= 1/41 x [ 8]
         [68]

```
So:
$x_{1} = \frac{8}{41}$
$x_{2} = \frac{68}{41}$

Theorem: Matrix Inversion Algorithm
```
[A | I] --> [I | A^-1]
```
Example: Given the following, 

```
[A | I] = [1  2 | 1  0]
          [3  4 | 0  1]

R2 = r2-3r1
[A | I] = [1  2 |  1  0]
          [0 -2 | -3  1]

R2 = r2/-2
[A | I] = [1  2 |    1       0 ]
          [0  1 | (3/2)  (-1/2)]
          
R1 = r1 - 2r2
[A | I] = [1  0 |   -2       -1]
          [0  1 | (3/2)   (-1/2)]

A^-1 = [  -2      1 ]
       [(3/2) (-1/2)]
```

### Elementary Matrices
An n x n matrix E is called an elementary matrix if it can be obtained from the identity matrix by a single elementary row operation (corresponding operation to E) We can say that E is of type I, II, III if the operation is of that type:
	I. Interchange 2 rows.
	II. Multiply 1 row by a nonzero number.
	III. Add multiple of one row to a different row.
##### Given:
```
I3 = [1 0 0]
     [0 1 0]
     [0 0 1]
```

##### If $r_{1} \leftarrow\rightarrow r_{2}$ :
Result is a matrix called alled $E_{1}$
```
Elementary Matrix, type I.
I3 =[0 1 0] 
    [1 0 0]
    [0 0 1]
```
For $E_{1}$ matrices, the inverse is the original matrix

##### Or, if $r_{2} = 2r_{2}$ :
Result is a matrix called alled $E_{2}$
```
Elementary Matrix, type II.
I3 = [1 0 0]
     [0 2 0]
     [0 0 1]
```
For $E_{2}$ matrices, the inverse is simply the normal inverse of the non-1 term
##### Or, if $r_{3} = r_{3} + 2r_{1}$ :
Result is a matrix called called $E_{3}$
```
Elementary Matrix, type III.
I3 = [1 0 0]
     [0 1 0]
     [2 0 1]
```
For $E_{3}$ matrices, the inverse is simply the negative of the non-1 term

###### To Summarize:
![[Pasted image 20250416093917.png]]

Some matrices can be composed from elementary matrices:
```
Not an Elementary matrix, because more than 1 row operation away from Identity
[2 0 0]
[0 1 0]
[2 0 1]

However, this is a result of 2 Elemetary matrices combined.
```
Find the inverse of a Elementary matrix:
$[A | I] - row\ operations\rightarrow [I | A^{-1}]$ 

```
A = [1 0 3]
	[0 1 0]
	[0 0 1]

Create compound matrix:
[1 0 3 | 1 0 0]
[0 1 0 | 0 1 0]
[0 0 1 | 0 0 1]

Perform row operations:
R1 = r1 - 3r3
[1 0 0 | 1 0 -3]
[0 1 0 | 0 1  0]
[0 0 1 | 0 0  1]

A^{-1} = [1 0 -3]
		 [0 1  0]
		 [0 0  1]
```
Performing row operations can be represented as matrix multiplication of the original matrix by the corresponding elementary matrix.

