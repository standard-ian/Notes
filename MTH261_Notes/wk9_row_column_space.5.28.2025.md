##### Row Space and Column Space
img(A) $\rightarrow$ column(A); because img(A) is a linear combination of columns.
null(A) $\rightarrow$ row(A); but choose the rows, not the columns.

Row space is the column space of A transpose.

Given a Row Echelon matrix $\mathbb{R}$:
1. The nonzero rows are basis for row($\mathbb{R}$)
2. columns of $\mathbb{R}$ containing the leading ones are the basis for col($\mathbb{R}$)


| Space          | Reduced Row                             |
| -------------- | --------------------------------------- |
| col(A) / im(A) | Correspond                              |
| null(A)        | Represent solutions $\rightarrow$ basis |
| row(A)         | Nonzero rows                            |
##### Rank Theorem
Let A denote any $n \times m$ matrix of rank $r$
dim(col A) = dim (row A) = $r$

##### Rank and Nullity
Given an $m \times n$ matrix:
1. rank(A) + dim\[null(A)\] = n
2. The n-r basic solutions to the system $Ax = 0$ provided by the basis for the Gaussian Algorithm are a basis of null(A) so dim\[null(A)\] = n - r
3. im(A) = col(A), and dim\[im(A)\] = r

### Eigenvalues and Eigenvectors
If $A$ is an $n \times m$ matrix, a number $\lambda$ is called an eigenvalue of $A$ if:
$A\vec{x} = \lambda \vec{x}$ for some column $\vec{x} \neq \vec{0}$ 
In this case, $\vec{x}$ is called the eigenvector

$(A - \lambda I)\vec{x} = 0$  where $I$ is an identity matrix

If $det(A - xI) = 0$ 

##### Characteristic polynomial
$C_{A} = det(A = xI)$ 

Example: Find the eigenvalues and eigenvectors for:
$A = \begin{bmatrix}3 & 5 \\ 1 & -1\end{bmatrix}$
1. Calculate eigenvalues
	1. $det(A - \lambda I) = 0$ 
	2. $A - \lambda I = \begin{bmatrix}3 & 5 \\ 1 & -1 \end{bmatrix} - \lambda\begin{bmatrix} 1 & 0 \\ 0 & 1\end{bmatrix} = \begin{bmatrix}3 - \lambda & 5 \\ 1 & -1-\lambda \end{bmatrix}$  
	3. let $det(A - \lambda I) = 0$
	4. $det(\begin{bmatrix}3 - \lambda & 5 \\ 1 & -1-\lambda \end{bmatrix}) = (3 - \lambda)(-1-\lambda) - (5)(1) = 0$
	5. $-3 - 3 \lambda + \lambda + \lambda^{2} - 5 = 0$ 
	6. $\lambda^{2} - 2\lambda - 8 = 0$ 
	7. Factorize or use $\frac{-b \pm \sqrt(b^{2} - 4ac)}{2a}$ 
	8. $\lambda_{1} = 4$, $\lambda_{2} = -2$ 
	9. 4, -2 are the eigenvalues for A
2. Calculate eigenvectors
	1. Case 1: when $\lambda_{1} = 4$ 
	2. $(\lambda_{1}I - A)\vec{x} = \vec{0}$ 
	3. $(4\begin{bmatrix}1 & 0 \\ 0 & 1\end{bmatrix} - \begin{bmatrix}3 & 5 \\ 1 & -1 \end{bmatrix})\vec{x} = \vec{0}$
	4. $\begin{bmatrix}1 & -5 \\ -1 & 3 \end{bmatrix}\vec{x} = \vec{0}$
	5. 