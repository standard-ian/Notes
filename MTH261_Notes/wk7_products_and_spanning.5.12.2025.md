### Dot Products vs Cross Products
Dot Product: $\vec{u} \cdot \vec{v}$ = $||\vec{u}||\ ||\vec{v}||\ cos\theta$  if = 0, $\theta = 90^{\circ}$, orthogonal
Cross Product: $\vec{u} \times \vec{v}$ = $\begin{bmatrix} \vec{i} & u_{1} & v_{1} \\\ \vec{j} & u_{2} & v_{2} \\\ \vec{k} & u_{3} & v_{3} \end{bmatrix}$ = $||\vec{u}||\ ||\vec{v}||\ sin\theta$ if = 0, $\theta = 0^{\circ} or\ \pi$, parallel
### 4.3 Cross Products
##### Theorem: Determinant form of the Cross Product
If $\vec{v_{1}} = \begin{pmatrix}x_{1} \cr y_{1} \cr x_{1} \end{pmatrix}$  and $\vec{v_{2}} = \begin{pmatrix}x_{2} \cr y_{2} \cr z_{2} \end{pmatrix}$ are two vectors, then:
$\vec{v_{1}} \times \vec{v_{2}} =  det \begin{pmatrix} \vec{i}\ x_{1}\ x_{2} \cr \vec{j}\ y_{1}\ y_{2} \cr \vec{k}\ z_{1}\ z_{2} \end{pmatrix} = |\begin{pmatrix}y_{1}\ \ y_{2} \cr z_{1} \ \ z_{2} \end{pmatrix}|\ \vec{i} - |\begin{pmatrix}x_{1}\ \ x_{2} \cr z_{1}\ \ z_{2} \end{pmatrix}|\ \vec{j} + |\begin{pmatrix}x_{1}\ \ x_{2} \cr y_{1}\ \ y_{2} \end{pmatrix}|\ \vec{k}$   
Where the determinant is expanded along the first column

![[Pasted image 20250512104018.png]]

### 5.1 Spanning
##### Subspaces:
Set = {1, 2, 3}
Subset = {1}, {}, {1, 2}, {1, 3}, etc.

A subspace is a space contained in an original space; and generally inheriting it's properties

A set $U$ of vectors in $\mathbb{R}^{n}$ is called a subspace of $\mathbb{R}^{n}$ if it satisfies the following:
1. The zero vector $\vec{0}\ \in\ U$     
2. If $\vec{x} \in U$ and $\vec{y}\ \in\ U$, then $\vec{x} + \vec{y}\ \in\ U$ 
3. If $\vec{x}\ \in\ U$ then $a\vec{x}\ \in\ U$ for every real number $a$

Example:
$\vec{u} = \begin{bmatrix} a \cr b \cr c \cr d \end{bmatrix}, a = 1; b, c, d\ in\  \mathbb{R}$
1. $\vec{0} \notin \vec{u}$ 
2. $\vec{x} = \begin{bmatrix}1 \cr b_{1} \cr c_{1} \cr d_{1}\end{bmatrix};\ \vec{y} = \begin{bmatrix}1 \cr b_{2} \cr c_{2} \cr d_{2}\end{bmatrix};\ \vec{x} + \vec{y} = \begin{bmatrix}2 \cr b_{1} + b_{2} \cr ... \cr ... \end{bmatrix}\notin \vec{u}$ 
3. $r\vec{x} = \begin{bmatrix}r \cr b_{1} \cr c_{1} \cr d_{1} \end{bmatrix} \notin \vec{u}$ 
##### Image and Null Space
Given matrix $A_{n\times n}$:
Null Space of $A$: $nullA = \{\vec{x} \in \mathbb{R}^{n} | A\vec{x} = \vec{0}\}$
Image Space of $A$: $imA = \{\vec{b} | \vec{b} = A\vec{x}, \vec{x} \in \mathbb{R}^{n}\}$ A

Example: 
$A = \begin{bmatrix}3 & -6 & 3 \cr 1 & -1 & 0 \cr 3 & -9 & 6 \cr 1 & -3 & 3 \end{bmatrix}; \vec{b_{1}} = \begin{bmatrix}-6 \cr 0 \cr -12 \cr -5 \end{bmatrix}$ Is $\vec{b_{1}}$ in $imA$? 
$\begin{bmatrix}3 & -6 & 3 & | & -6 \cr 1 & -1 & 0 & | & 0 \cr 3 & -9 & 6 & | & -12 \cr 1 & -3 & 3 & | & -5\end{bmatrix}\rightarrow$
row operations to reduced row echelon $\rightarrow$ If it has a solution $\vec{x}$, then $\vec{b_{1}}\ \in imA$    
If $A \times \vec{b_{1}} =  \vec{0}$ , $\vec{b_{1}} \in nullA$ 

If $A$ is an $m\times n$ matrix:
1. $nullA$ is a subspace of $\mathbb{R}^{n}$ 
2. $imA$ is a subspace of $\mathbb{R}^{m}$ 

##### Spanning Set
$U = span\{vec{x}, \vec{y}\} = \{a\vec{x} + b\vec{y}\ |\ a, b \in \mathbb{R}\}$ 
A span just means a linear combination of all all vectors

Let $\vec{x} = \begin{bmatrix}2 \cr -1 \cr 2 \cr 1 \end{bmatrix}$ and $\vec{y} = \begin{bmatrix}3 \cr 4 \cr -1 \cr 1 \end{bmatrix}$ in $\mathbb{R}^{n}$ 
Determine whether $\vec{p} = \begin{bmatrix}0 \cr -11 \cr 8 \cr 1 \end{bmatrix}$ or $\vec{q} = \begin{bmatrix}2 \cr 3 \cr 1 \cr 2 \end{bmatrix}$ are in span $U = span\{\vec{x}, \vec{y}\}$ 

We need to calculate $a\vec{x} + b\vec{y} = \vec{p}$ for $a, b$ 

$a\begin{bmatrix}2 \cr -1 \cr 2 \cr 1\end{bmatrix} + b \begin{bmatrix}3 \cr 4 \cr -1 \cr 1\end{bmatrix} = \vec{p}$ 
$\begin{bmatrix}2 & 3 & | & 0 \cr -1 & 4 & | & -11 \cr 2 & -1 & | & 8 \cr 1 & 1 & | & 1\end{bmatrix} \rightarrow \begin{bmatrix}1 & 0 & | & 3 \cr 0 & 1 & | & -2 \cr 0 & 0 & | & 0 \cr 0 & 0 & | & 0\end{bmatrix}$ so $a = 3, b = -2 \rightarrow \vec{p} = 3\vec{x} - 2 \vec{y} \rightarrow \vec{p} \in U$  

##### Connecting span to null and image space
$\vec{x}$ denote rows (solutions to the system $A\vec{x} = 0$) and $\vec{c}$ denote columns:
$nullA = span\{\vec{x_{1}}, \vec{x_{2}}, ..., \vec{x_{n}}\}$ 
$imA = span\{\vec{c_{1}}, \vec{c_{2}},...,\vec{c_{n}}\}$ 

### Independence and Dimension
A set of vectors is linearly independent (independent) if it satisfies the following:
$t_{1}\vec{x_{1}} + t_{2}\vec{x_{2}} + ... +t_{k}\vec{x_{k}} = \vec{0}$ then $t_{1} = t_{2} = ... = t_{k} = 0$ 

Linear **dependent** has at least one non-zero solution.
##### Theorem 5.2.1
If a set of vectors is linearly independant, every vector in the span of those vectors has a **unique** representation as a linear combination of the $\vec{x_{1}}$ 
To prove a set of vectors is linearly independent, perform a linear combination and determine if the solutions are all 0.

##### Theorem 5.2.3
The following are equivalent for an $m \times n$ matrix $A$:
1. $A$ is invert-able
2. The columns of $A$ are linearly independent
3. The columns of $A$ span $\mathbb{R}^{n}$  
4. The rows of $A$ are linearly independent
5. The rows of $A$ span the set of all $1 \times n$ rows.

##### Theorem 5.2.4: Fundamental Theorem
Let $U$ be a subspace of $\mathbb{R}^{n}$. if $U$ is spanned by $m$ vectors, and if $U$ contains $k$ linearly independent vectors, then $k \leq m$ 
##### Basis
If $U$ is a subspace of $\mathbb{R}^{n}$ a set $\{\vec{x_{1}}, \vec{x_{2}},...,\vec{x_{m}}\}$  of vectors in $U$ is called a **basis** of $U$ if it satisfies:
1. $\{\vec{x_{1}}, \vec{x_{2}},...,\vec{x_{m}}\}$ is linearly independent.
2. $U = span\{\vec{x_{1}}, \vec{x_{2}},...,\vec{x_{m}}\}$ 
##### Theorem 5.2.5: Invariance Theorem
If $\{\vec{x_{1}}, \vec{x_{2}},...,\vec{x_{m}}\}$ and $\{\vec{y_{1}}, \vec{y_{2}},...,\vec{y_{k}}\}$ are bases of a subspace $U$ of $\mathbb{R}^{n}$, then $m =k$ 
