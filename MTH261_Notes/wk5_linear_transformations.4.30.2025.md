### Unit 2.6
##### Linear vs. Affine 
Compare a linear transformation to a linear function. 

Linear Function: $f(x) = ax$ 
For a linear function: $f(k_{1}x_{1} + k_{2}x_{2} = k_{1}f(x_{1}) + k_{2}f(x_{2})$

Affine Function: $f(x) = ax + b$
Whereas for an affine function:  $f(k_{1}x_{1} + k_{2}x_{2} \not\equiv k_{1}f(x_{1}) + k_{2}f(x_{2})$

##### Performing a transformation 
standard basis of $R^{3}$ is \{$e_{1}, e_{2}, e_{3}$\}. If $R^{3} \rightarrow R^{2}$ is a transformation and the action of T on the vectors $e_{1}$ is given, find a formula for $T(x)$ where $x$ is any vector in $R^{3}$

$T(e_{1})$ = $[-8, 6]^{T}$ 
$T(e_{2})$ = $[1, -8]^{T}$ 
$T(e_{3})$ = $[7, -5]^{T}$ 
$T[x, y, z]^{T} = T(xe{1} + ye_{2} + ze_{3})$ 

A linear transformation can be represented as a combination of transformation of components
The constants ($x, y, z$) can be taken out:

$T:R^{3} \rightarrow R^{2} = xT(e_{1}) + yT(e_{2}) + zT(e_{3})$ 
$T:R^{2} = [-8x + y + 7z, 6x - 8y - 5z]^{T}$

### Unit 3.1
Recall how to find the inverse of a matrix...
$A^{-1}$ = $\frac{1}{determinant}$ x $adj(A)$ = $\frac{1}{-2} adj(A)$

##### Definition 3.1
Assume that the determinants of $(n-1) \times (n-1)$  matrices have been defined. Given the $n \times n$ matrix $A$, let:
$A_{ij}$ denote the $(n-1) \times (n-1)$ matrix obtained from A by deleting row $i$ and column $j$
Then, the $(i, j) - cofactor\  c_{ij}(A)$ is the scalar defined by:
$c_{ij} = (-1)^{i + j} \times det(A_{ij})$ 

```
[1 2]
[3 4]

```
$C_{11}(A) = (-1)^2 \times 4 = 4$
$C_{12}(A) = (-1)^3 \times 3 = -3$
$C_{21}(A) = (-1)^3 \times 2 = -2$
$C_{22}(A) = (-1)^4 \times 1 = 1$

```
This is the pattern for 4x4:
[+  -]
[-  +]
```

For larger matrix:
```
A = [1  2  3]
    [4  5  6]
    [7  8  9]
```
$C_{21}(A) = (-1)^{2 + 1 = 3} \times det(A_{21})$ 
$det(A_{21}) = 2$ 
$C_{21}(A) = -1 \times 2 = -2$ 
```
Eliminated 2nd row, 1st column
  = [2  3] = (2 x 9) - (3 x 8) = 18 - 16 = 2
    [8  9]
```

$C_{32}(A) = (-1)^{3 + 2 = 5} \times det(A_{21})$ 
$det(A_{32}) = -6$ 
$C_{32}(A) = -1 \times -6 = 6$ 
```
Eliminated 3rd row, 2nd column
  = [1  3] = (1 x 6) - (3 x 4) = 6 - 12 = -6
    [4  6]
```

##### Definition 3.1
Assume that the determinants of $(n-1) \times (n-1)$ matrices have been defined. If $A = [a_{ij}]$ is an $n \times n$ 
$det\ A = a_{11}c_{11}(A) + a_{12}c_{12}(A)+...+a_{1n}c_{1n}(A)$ 

This is called the cofactor expansion of $det A$ along row 1

##### Theorem 3.1.1
The determinant of an $n \times n$ matrix can be computed using the cofactor expansion along  any row of column of A. That is $det A$ can be computed by multiplying each entry of the row or column by the corresponding cofactor and adding the results.

If there is a zero present, pick the row/column that contains the most 0s since all are equal and the 0s make calculation easier.

##### Theorem 3.1.2
Let $A$ denote a $n\times n$ matrix
1. If A has a row or column of entirely 0s, $det\ A = 0$
2. If two distinct rows (or columns) of A are interchanged, the determinant of the resulting matrix is $-det\ A$ 
3. If a row (or column) of $A$ is multiplied by a constant $u$, the determinant of the resulting matrix is $u(det\ A)$.
4. If two distinct rows (or columns) of $A$ are identical, $det\ A=0$.
5. If a multiple of one row of $A$ is added to a different row (or if a multiple of a column is added to a different column), the determinant of the resulting matrix is $det\ A$.

Lower vs. Upper triangular matrix. If column operations are used to achieve row echelon form, the result will be an upper triangular matrix

##### Theorem 3.1.4
If a matrix $A$ is in triangular (upper or lower) form, $det\ A$ is the product of entries on the main diagonal.

##### Theorem 3.1.5
Consider a block matrix, the determinant is the product of the determinants of the minor matrices along the main diagonal

##### Theorem 3.1.3
If $A$ is a $n \times n$ matrix, then $det\ uA$ = $u^{n}\ det\ A$ for any constant $u$
