## Class 1
#### Systems of Linear Equations
Recall we want solutions to the first order homogeneous system of linear ODEs:
$$\frac{d\vec{x}}{dt} = A\vec{x} $$
Where:
$$\frac{d\vec{x}}{dt} = \begin{bmatrix}x'(t)\\y'(t)\end{bmatrix}$$
$$\vec{x}=\begin{bmatrix}x(t)\\y(t)\end{bmatrix}$$
$$A = \begin{bmatrix}a & b\\c & d\end{bmatrix}$$

##### Definition
If two solutions:
$$\vec{x_1}(t) = \begin{bmatrix}\phi_1(t)\\\phi_2(t)\end{bmatrix}$$ 
$$\vec{x_2}(t) = \begin{bmatrix}\rho_1(t)\\\rho_2(t)\end{bmatrix}$$
Have  the property that their components satisfy:
$$\color{orange}Wronskian: w(t) = \phi_1(t)\rho_2(t) - \phi_2(t)\rho_1(t) \neq 0$$
for all $t$, then we say that it is a fundamental set of solutions, i.e. they are linearly independent.

##### Theorem
If $\vec{x_1}(t)$ and $\vec{x_2}(t)$  form a fundamental set of solutions to 
$$\vec{x}'(t) = \begin{bmatrix} a & b\\c & d\end{bmatrix}\vec{x}(t)$$
Then, 
$$\vec{x}'(t) = C_1\vec{x_1}(t) + C_2\vec{x_2}(t)$$

##### Eigenvalue Problem
Consider the two dimensional system:
$$\vec{x}' = A\vec{x}$$
We seek a solution of the form:
$$\vec{x} = \vec{v}e^{\lambda t}$$
Where $\lambda$ is a constant and $\vec{v}\neq \vec{0}$ (a vector of constant)

Substituting:
$$\lambda\vec{v}e^{\lambda t} = A\vec{v}e^{\lambda t}\to A\vec{v} =\lambda\vec{v}$$
Thus, every Eigen-pair $\{\lambda, \vec{v}\}$ of $A$ gives a solution:
$$\vec{x}(t) = \vec{v}e^{\lambda t}$$
If we have distinct Eigenvalues, the corresponding Eigen vectors are linearly independent.

##### Solving the Eigen Value Problem
To solve the Eigen Value Problem:
$$A\vec{v} = \lambda\vec{v}$$
for
$$A = \begin{bmatrix}a & b\\c & d\end{bmatrix}$$
###### 1. Find the characteristic equation.
$$det(A-\lambda I) = 0$$
or
$$\lambda^2 - tr A\lambda + det A = 0$$
Where $trA = a+d$ and $det A = ad-bc$, to find the Eigen values $\lambda$.
###### 2. Substitute each $\lambda$ into $(A-\lambda I)\vec{v} = \vec{0}$ to find $\vec{v}$.

###### Also recall:
1. Any non-zero constant multiple of an Eigen value is also an Eigen vector
2. If the Eigen values are unequal, i.e $\lambda_1 \neq \lambda_2$ (including conjugate pairs), then their corresponding Eigen vectors are linearly independent. 

#### 3.2: Review of the Three Cases, Using Linear Systems
The key idea is that each Eigen-pair $\{\lambda, \vec{v}\}$ of the coefficient matrix $A$ leads to solution:
$$\vec{x} = \vec{v}e^{\lambda t}$$
of $\vec{x}' = A\vec{x}$
##### Case 1: Real Distinct
In the case of real distinct Eigen values, $\lambda_1$ and $\lambda_2$, the corresponding Eigen vectors $\vec{v_1}$ and $\vec{v_2}$ are linearly independent, giving two solutions.

$$\vec{x_1} = \vec{v_1}e^{\lambda_1 t};\ \vec{x_2} =\vec{v_1}e^{\lambda_2 t} $$
From which we can form the general solution:
$$\vec{x}(t) = C_1\vec{v_1}e^{\lambda_1 t} + C_2\vec{v_2}e^{\lambda_2 t}$$
If asked to sketch, focus of the sign of $\lambda_{1,2}$

There are then **qualitatively different** sub-cases
###### Sub Case 1: Saddle Point
$\lambda_1$ and $\lambda_2$ have opposite sign
**Example**
Consider the system:
$$x' = x + y$$
$$y' = 4x + y$$
$$\vec{x}' = A\vec{x} = \begin{bmatrix}1 & 1\\4 & 1\end{bmatrix}\vec{x}$$
The coefficient matrix has the characteristic polynomial
$trA = a + d = (1+1)$
$det A = (ad - bc) = (1 -4)$
$$\lambda^2 - (1 + 1)\lambda + (1 - 4) = 0$$
$$\lambda^2 - 2\lambda -3 = (\lambda -3)(\lambda + 1) = 0$$
$$\lambda = -1, 3$$
Find the Eigen vectors:
###### $\lambda = -1$
$$(A - \lambda I)\vec{v} = \vec{0}\to \begin{bmatrix}1+1 & 1 \\ 4 & 1 +1 \end{bmatrix}\begin{bmatrix}v_1\\v_2\end{bmatrix} = \vec{0}$$
$2v_1 + v_2 = 0$
$4v_1 + 2v_2 = 0$
Take any one of these equations (or multiple)
For instance $2v_1 + v_2 = 0\to v_2 = - 2v_1$

This gives:
$$\vec{v_1} = \begin{bmatrix}v_1 \\ v_2\end{bmatrix} = \begin{bmatrix}v_1\\-2v_1\end{bmatrix} = v_1\begin{bmatrix}1\\-2\end{bmatrix}$$
Any $v_1$ will work, so pick something simple.
It is always easy to check:
$$A\vec{v_1} = \begin{bmatrix}1 & 1\\4 & 1\end{bmatrix}\begin{bmatrix}1\\-2\end{bmatrix} = \begin{bmatrix}1 &-2\\4 & -2\end{bmatrix}= \begin{bmatrix}-1\\2\end{bmatrix} = -1\begin{bmatrix}1\\-2\end{bmatrix} = \lambda\vec{v_1}$$
###### $\lambda = 3$
...
$$\vec{v_2} = \begin{bmatrix}1\\2\end{bmatrix}$$
Therefore, the general solution is:
$$\vec{x}(t) = C_1\begin{bmatrix}1\\-2\end{bmatrix}e^{-t} + C_2\begin{bmatrix}1\\2\end{bmatrix}e^{3t}$$
Note that $C_1$ and $C_2$ are constants. This gives 4 "straight line" solutions.
$C_1 = const, C_2 =0$ and vice versa.

```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
\begin{axis}[
    title={Saddle Point: $x' = x+y,\quad y' = 4x+y$
           \quad ($\lambda_1=-1,\ \lambda_2=3$)},
    width=15cm,
    height=15cm,
    xmin=-3, xmax=3,
    ymin=-3, ymax=3,
    xlabel={$x$},
    ylabel={$y$},
    axis lines=center,
    xtick={-3,-2,...,3},
    ytick={-3,-2,...,3},
    tick label style={font=\small},
    grid=major,
    grid style={gray!30},
    view={0}{90},
]
% Vector field: u = x+y,  v = 4x+y, L2-normalized
\addplot3[
    orange,
    quiver={
        u={(x + y)   / sqrt((x+y)^2 + (4*x+y)^2 + 0.001)},
        v={(4*x + y) / sqrt((x+y)^2 + (4*x+y)^2 + 0.001)},
        w=0,
        scale arrows=0.3,
    },
    -stealth,
    samples=15,
    domain=-3:3,
    y domain=-3:3,
] (x,y,0);
% Stable manifold: eigenvector v1=(1,-2), i.e. y = -2x
% Trajectories on this line flow TOWARD origin (lambda=-1 < 0)
\addplot[yellow, thick, -stealth, domain=-3:-0.05, samples=2] {-2*x};
\addplot[yellow, thick, stealth-, domain=0.05:3,   samples=2] {-2*x};
% Unstable manifold: eigenvector v2=(1,2), i.e. y = 2x
% Trajectories on this line flow AWAY from origin (lambda=3 > 0)
\addplot[red, thick, stealth-, domain=-3:-0.05, samples=2] {2*x};
\addplot[red, thick, -stealth, domain=0.05:3,   samples=2] {2*x};
% Equilibrium at origin
\addplot[black, only marks, mark=*, mark size=2.5] coordinates {(0,0)};
\legend{
    Vector field,
    Stable manifold $y=-2x$\ ($\lambda=-1$),
    ,
    Unstable manifold $y=2x$\ ($\lambda=3$),
    ,
    Equilibrium
}
\end{axis}
\end{tikzpicture}
\end{document}
```
###### Sub Case 2: Stable
$\lambda_1$ and $\lambda_2$ are both negative 
$$\vec{x}' = \begin{bmatrix}-2 & 2\\2&5\end{bmatrix}\vec{x}$$
The characteristic polynomial is:
$$det A(A -\lambda I) = \lambda^2 +7\lambda + 6 = 0$$
$$(\lambda + 6)(\lambda+1);\ \lambda = -1,-6$$
Find Eigen vectors using $(A-\lambda I)\vec{v}=\vec{0}$ 
$$(A - \lambda I)\vec{v} = \left[\begin{bmatrix}-2 & 2\\2 &-5\end{bmatrix} - \begin{bmatrix}-1 & 0\\0 &  -1\end{bmatrix}\right]\begin{bmatrix}v_1\\v_2\end{bmatrix} = \begin{bmatrix}0\\0\end{bmatrix}$$
$$\begin{bmatrix}-1 & 2\\2 & -4\end{bmatrix}\begin{bmatrix}v_1\\v_2\end{bmatrix} = \begin{bmatrix}0\\0\end{bmatrix}$$
$$-v_1 + 2v_2 = 0;\ v_1 = 2v_2$$
$$\vec{v_1} = \begin{bmatrix}2v_2\\v_2\end{bmatrix} = v_2\begin{bmatrix}2\\1\end{bmatrix}$$
Letting $v_2 = 1$
$$\vec{v_1} = \begin{bmatrix}2\\1\end{bmatrix}$$
Hence, $\{-1,\begin{bmatrix}2\\1\end{bmatrix}\}$ is an Eigen pair
The other is $\{-6, \begin{bmatrix} 1\\-2 \end{bmatrix}\}$ is the other
Finally, the general solution is:
$$\vec{x}(t) = C_1\begin{bmatrix}2\\1\end{bmatrix}e^{-t} + C_2\begin{bmatrix}1\\-2\end{bmatrix}e^{-6t}$$
**Sketching solutions**
First, sketch the straight line solutions $\pm\vec{x_1}$, $\pm\vec{x_2}(t)$
This time, all 4 lines face inward towards the origin
```tikz
\usepackage{pgfplots}
% Stable Node:
%   x' = -2x + 2y
%   y' =  2x - 5y
%   A = [-2 2; 2 -5],  eigenvalues lambda = -1, -6
%   Eigenvectors: v1 = (2, 1)  [lambda=-1, slow],  v2 = (1,-2) [lambda=-6, fast]
\begin{document}
\begin{tikzpicture}
\begin{axis}[
    title={Stable Node: $x'=-2x+2y,\quad y'=2x-5y$
           \quad ($\lambda_1=-1,\ \lambda_2=-6$)},
    width=15cm,
    height=15cm,
    xmin=-3, xmax=3,
    ymin=-3, ymax=3,
    xlabel={$x$},
    ylabel={$y$},
    axis lines=center,
    xtick={-3,-2,...,3},
    ytick={-3,-2,...,3},
    tick label style={font=\small},
    grid=major,
    grid style={gray!30},
    view={0}{90},
]
% Vector field: u = -2x+2y,  v = 2x-5y, L2-normalized
\addplot3[
    orange,
    quiver={
        u={(-2*x + 2*y) / sqrt((-2*x+2*y)^2 + (2*x-5*y)^2 + 0.001)},
        v={( 2*x - 5*y) / sqrt((-2*x+2*y)^2 + (2*x-5*y)^2 + 0.001)},
        w=0,
        scale arrows=0.3,
    },
    -stealth,
    samples=15,
    domain=-3:3,
    y domain=-3:3,
] (x,y,0);
% Slow eigendirection: v1=(2,1), line y = x/2
% lambda=-1: both rays point TOWARD origin
% x<0 ray: direction is rightward (+x), so arrow tip at right end
\addplot[yellow, thick, -stealth, domain=-3:-0.05, samples=2] {x/2};
% x>0 ray: direction is leftward (-x), so arrow tip at left end
\addplot[yellow, thick, stealth-, domain=0.05:3,   samples=2] {x/2};
% Fast eigendirection: v2=(1,-2), line y = -2x
% lambda=-6: both rays point TOWARD origin
% x<0 ray: direction is rightward (+x), so arrow tip at right end
\addplot[red, thick, -stealth, domain=-3:-0.05, samples=2] {-2*x};
% x>0 ray: direction is leftward (-x), so arrow tip at left end
\addplot[red, thick, stealth-, domain=0.05:3,   samples=2] {-2*x};
% Equilibrium at origin (stable: filled dot)
\addplot[black, only marks, mark=*, mark size=2.5] coordinates {(0,0)};
\legend{
    Vector field,
    Slow direction $y=x/2$\ ($\lambda=-1$),
    ,
    Fast direction $y=-2x$\ ($\lambda=-6$),
    ,
    Equilibrium
}
\end{axis}
\end{tikzpicture}
\end{document}
```
###### Sub Case 3: Unstable
$\lambda_1$ and $\lambda_2$ are both positive
Consider
$$\vec{x}' = \begin{bmatrix}\frac{5}{2} & -\frac{3}{2}\\-\frac{3}{2} & \frac{5}{2}\end{bmatrix}\vec{x}$$
The Eigen paris of the coefficient matrix are:
$$\{1, \begin{bmatrix}1\\2\end{bmatrix}\},\ \{4, \begin{bmatrix}1\\-2\end{bmatrix}\}$$
This gives the general solution:
$$\vec{x}(t) = C_1\begin{bmatrix}1\\2\end{bmatrix}e^t + C_2\begin{bmatrix}1\\-2\end{bmatrix}e^{4t} $$
```tikz
\usepackage{pgfplots}
% Unstable Node:
%   x' = (5/2)x - (3/2)y
%   y' = -(3/2)x + (5/2)y
%   A = [5/2 -3/2; -3/2 5/2],  eigenvalues lambda = 1, 4
%   Eigenvectors: v1 = (1, 2)  [lambda=1, slow],  v2 = (1,-2) [lambda=4, fast]
\begin{document}
\begin{tikzpicture}
\begin{axis}[
    title={Unstable Node: $x'=2.5x-1.5y,\quad y'=-1.5x+2.5y$
           \quad ($\lambda_1=1,\ \lambda_2=4$)},
    width=15cm,
    height=15cm,
    xmin=-3, xmax=3,
    ymin=-3, ymax=3,
    xlabel={$x$},
    ylabel={$y$},
    axis lines=center,
    xtick={-3,-2,...,3},
    ytick={-3,-2,...,3},
    tick label style={font=\small},
    grid=major,
    grid style={gray!30},
    view={0}{90},
]
% Vector field: u = (5/2)x-(3/2)y,  v = -(3/2)x+(5/2)y, L2-normalized
\addplot3[
    orange,
    quiver={
        u={(2.5*x - 1.5*y) / sqrt((2.5*x-1.5*y)^2 + (-1.5*x+2.5*y)^2 + 0.001)},
        v={(-1.5*x + 2.5*y) / sqrt((2.5*x-1.5*y)^2 + (-1.5*x+2.5*y)^2 + 0.001)},
        w=0,
        scale arrows=0.3,
    },
    -stealth,
    samples=15,
    domain=-3:3,
    y domain=-3:3,
] (x,y,0);
% Slow eigendirection: v1=(1,2), line y=2x
% lambda=1: both rays point AWAY from origin
% x<0 ray: trajectory moves in -x direction, arrowhead at left end
\addplot[yellow, thick, stealth-, domain=-3:-0.05, samples=2] {2*x};
% x>0 ray: trajectory moves in +x direction, arrowhead at right end
\addplot[yellow, thick, -stealth, domain=0.05:3,   samples=2] {2*x};
% Fast eigendirection: v2=(1,-2), line y=-2x
% lambda=4: both rays point AWAY from origin
% x<0 ray: trajectory moves in -x direction, arrowhead at left end
\addplot[red, thick, stealth-, domain=-3:-0.05, samples=2] {-2*x};
% x>0 ray: trajectory moves in +x direction, arrowhead at right end
\addplot[red, thick, -stealth, domain=0.05:3,   samples=2] {-2*x};
% Equilibrium at origin (unstable: open circle)
\addplot[black, only marks, mark=o, mark size=2.5] coordinates {(0,0)};
\legend{
    Vector field,
    Slow direction $y=2x$\ ($\lambda=1$),
    ,
    Fast direction $y=-2x$\ ($\lambda=4$),
    ,
    Equilibrium
}
\end{axis}
\end{tikzpicture}
\end{document}
```
###### Sub Case 4: Zero Eigen Values
If both are zero, every point in the plane is a solution.
If one is zero:
$$\vec{x}' = \begin{bmatrix}1 & 2\\2 & 4\end{bmatrix}\vec{x}$$
$$\vec{x}(t) = C_1\begin{bmatrix}-2\\1\end{bmatrix} + C_2\begin{bmatrix}1\\2\end{bmatrix}e^{5t}$$
```tikz
\usepackage{pgfplots}
% One Zero Eigenvalue:
%   x' = x + 2y
%   y' = 2x + 4y
%   A = [1 2; 2 4],  eigenvalues lambda = 0, 5
%   Eigenvectors: v1 = (-2, 1) [lambda=0, line of equilibria],  v2 = (1,2) [lambda=5, unstable]
\begin{document}
\begin{tikzpicture}
\begin{axis}[
    title={One Zero Eigenvalue: $x'=x+2y,\quad y'=2x+4y$
           \quad ($\lambda_1=0,\ \lambda_2=5$)},
    width=15cm,
    height=15cm,
    xmin=-3, xmax=3,
    ymin=-3, ymax=3,
    xlabel={$x$},
    ylabel={$y$},
    axis lines=center,
    xtick={-3,-2,...,3},
    ytick={-3,-2,...,3},
    tick label style={font=\small},
    grid=major,
    grid style={gray!30},
    view={0}{90},
]
% Vector field: u = x+2y,  v = 2x+4y, L2-normalized
\addplot3[
    orange,
    quiver={
        u={(x + 2*y)   / sqrt((x+2*y)^2 + (2*x+4*y)^2 + 0.001)},
        v={(2*x + 4*y) / sqrt((x+2*y)^2 + (2*x+4*y)^2 + 0.001)},
        w=0,
        scale arrows=0.3,
    },
    -stealth,
    samples=15,
    domain=-3:3,
    y domain=-3:3,
] (x,y,0);
% Line of equilibria: v1=(-2,1), i.e. y = -x/2
% lambda=0: no movement, draw as thick line with no arrows
\addplot[yellow, thick, domain=-3:3, samples=2] {-x/2};
% Unstable direction: v2=(1,2), i.e. y = 2x
% lambda=5: both rays point AWAY from origin
% x<0 ray: moves in -x direction, arrowhead at left end
\addplot[red, thick, stealth-, domain=-3:-0.05, samples=2] {2*x};
% x>0 ray: moves in +x direction, arrowhead at right end
\addplot[red, thick, -stealth, domain=0.05:3,   samples=2] {2*x};
% Equilibrium at origin
\addplot[black, only marks, mark=*, mark size=2.5] coordinates {(0,0)};
\legend{
    Vector field,
    Line of equilibria $y=-x/2$\ ($\lambda=0$),
    Unstable direction $y=2x$\ ($\lambda=5$),
    ,
    Equilibrium
}
\end{axis}
\end{tikzpicture}
\end{document}
```
## Class 2
#### Reviewing Case 1
$$\vec{x}' = A\vec{x}$$
Where:
$$\vec{x} = \begin{bmatrix}x(t)\\ y(t)\end{bmatrix};\ \vec{x}' = \begin{bmatrix}x'(t)\\ y'(t)\end{bmatrix}$$
And:
$$A = \begin{bmatrix}a & b\\ c & d\end{bmatrix}$$
The solutions are of the form $\vec{x} = \vec{v}e^{\lambda t}$. Where $\lambda$ satisfies:
$$\lambda^2 -trA\lambda + detA = 0$$ Case 1: $\lambda$ is real and distinct.

#### Cases 2 & 3
##### Case 2: Real Equal Eigen Values
Suppose:
$$\lambda_1 = \lambda_2 = \lambda$$
**Special Case** Then there are either 2 distinct Eigen vector $\vec{v}_1$ and $\vec{v}_2$ (i.e diagonal system)
$$\vec{x} = C_1 \vec{v}_1e^{\lambda t} + C_2\vec{v}_2e^{\lambda t}$$
For instance:
$$\vec{x}_1 = \begin{bmatrix}1 & 0 \\0 & 1\end{bmatrix}\begin{bmatrix}x\\y\end{bmatrix}$$
**Non-Trivial Case**: There is only one Eigen vector $\vec{v}$. In this case, we say that the matrix is deficient. We can construct one solution as:
$$\vec{x}_1(t) = \vec{v} e^{\lambda t}$$
But we still need another solution. It is given by:
$$\vec{x}_2(t) = e^{\lambda t}(t\vec{v} + \vec{w})$$
$\vec{w}$ is called the **generalized Eigen vector**, given by:
$$(A - \lambda I)\vec{w} = \vec{v}$$
###### Example
$$\vec{x}' = \begin{bmatrix} 2 & 1 \\ -1& 4\end{bmatrix}\vec{x}$$
We have the characteristic equation:
$$\lambda^2 -6\lambda + 9 =0$$
$$(\lambda -3)^2\to \lambda = 3$$
Find the corresponding E-vector
From $(A - \lambda I)\vec{v}=\vec{0}$ we have:
$$\begin{bmatrix}-1 & 1\\ -1 & 1\end{bmatrix} \begin{bmatrix}v_1\\v_2\end{bmatrix}= \begin{bmatrix}0\\0\end{bmatrix}$$
$$\vec{v}_2 = \vec{v}_1$$
$$\vec{v} = \begin{bmatrix}1\\1\end{bmatrix}$$
Thus:
$$\vec{x}_1(t)=\begin{bmatrix}1\\1\end{bmatrix} e^{3t}$$
To find $\vec{x}_2$, consider:
$$(A-\lambda I)\vec{w} = \vec{v}$$
$$\begin{bmatrix}-1 & 1\\-1 & 1\end{bmatrix}\begin{bmatrix}w_1\\w_2\end{bmatrix} = \begin{bmatrix}1\\1\end{bmatrix}$$
$$-w_1 + w_2 = 1$$
$$w_2 = 1+w_1$$
$$\vec{w} = \begin{bmatrix}w_1\\1 + w_1\end{bmatrix} = \begin{bmatrix}0\\1\end{bmatrix}$$
If $w_1 = 0$
This gives:
$$\vec{x}_2 = e^{3t}\begin{bmatrix}t\vec{v} + \vec{w}\end{bmatrix} = e^{3t}\left[t\begin{bmatrix}1\\1\end{bmatrix} + \begin{bmatrix}0\\1\end{bmatrix}\right]=\begin{bmatrix}te^{3t}\\(t+1)e^{3t}\end{bmatrix} $$
Thus the general solution is:
$$\vec{x}(t) = C_1\begin{bmatrix}1\\1\end{bmatrix}e^{3t} + C_2\begin{bmatrix}t\\t+1\end{bmatrix}e^{3t}$$
In this case where $\lambda > 0$, the origin is classified as a **degenerate**, **unstable**, node.

Solutions will look like:
$$A_{unstable} = \begin{bmatrix}2 & 1\\-1 & 4\end{bmatrix}$$
```tikz
\usepackage{pgfplots}
% Real Equal Eigenvalues (Improper Node):
%   x' = 2x + y
%   y' = -x + 4y
%   A = [2 1; -1 4],  lambda = 3 (repeated)
%   Eigenvector: v = (1,1),  eigendirection y=x
\begin{document}
\begin{tikzpicture}
\begin{axis}[
    title={Real Equal Eigenvalues: $x'=2x+y,\quad y'=-x+4y$
           \quad ($\lambda=3$ repeated)},
    width=15cm,
    height=15cm,
    xmin=-10, xmax=10,
    ymin=-10, ymax=10,
    xlabel={$x$},
    ylabel={$y$},
    axis lines=center,
    xtick={-10,-8,...,10},
    ytick={-10,-8,...,10},
    tick label style={font=\small},
    grid=major,
    grid style={gray!30},
    view={0}{90},
]
% Vector field: u = 2x+y,  v = -x+4y, L2-normalized
\addplot3[
    orange,
    quiver={
        u={(2*x + y)  / sqrt((2*x+y)^2 + (-x+4*y)^2 + 0.001)},
        v={(-x + 4*y) / sqrt((2*x+y)^2 + (-x+4*y)^2 + 0.001)},
        w=0,
        scale arrows=0.6,
    },
    -stealth,
    samples=15,
    domain=-10:10,
    y domain=-10:10,
] (x,y,0);
% Eigendirection: v=(1,1), line y=x
% lambda=3 > 0: both rays point AWAY from origin
\addplot[yellow, thick, stealth-, domain=-10:-0.05, samples=2] {x};
\addplot[yellow, thick, -stealth, domain=0.05:10,   samples=2] {x};
% Sample solution curves starting near origin, growing outward
\addplot[yellow, thick, samples=300, domain=-2:0, variable=\t]
    ({exp(3*\t)*(3 + 8*\t) - exp(3*\t)*3},
     {exp(3*\t)*(3 + 8*\t) + exp(3*\t)*3});
\addplot[yellow, thick, samples=300, domain=-2:0, variable=\t]
    ({exp(3*\t)*(-3 - 8*\t) + exp(3*\t)*3},
     {exp(3*\t)*(-3 - 8*\t) - exp(3*\t)*3});
% Equilibrium at origin (unstable: open circle)
\addplot[black, only marks, mark=o, mark size=2.5] coordinates {(0,0)};
\legend{
    Vector field,
    Eigendirection $y=x$\ ($\lambda=3$),
    ,
    Sample trajectories,
    ,
    Equilibrium
}
\end{axis}
\end{tikzpicture}
\end{document}
```
If $\lambda < 0$, this will be **degenerate** and **stable**, and solutions will look like:
$$A_{stable} = \begin{bmatrix}-2 & -1\\1 & -4\end{bmatrix}$$
```tikz
\usepackage{pgfplots}
% Real Equal Eigenvalues (Stable Improper Node):
%   x' = -2x - y
%   y' =  x - 4y
%   A = [-2 -1; 1 -4],  lambda = -3 (repeated)
%   Eigenvector: v = (1,1),  eigendirection y=x
\begin{document}
\begin{tikzpicture}
\begin{axis}[
    title={Real Equal Eigenvalues: $x'=-2x-y,\quad y'=x-4y$
           \quad ($\lambda=-3$ repeated)},
    width=15cm,
    height=15cm,
    xmin=-10, xmax=10,
    ymin=-10, ymax=10,
    xlabel={$x$},
    ylabel={$y$},
    axis lines=center,
    xtick={-10,-8,...,10},
    ytick={-10,-8,...,10},
    tick label style={font=\small},
    grid=major,
    grid style={gray!30},
    view={0}{90},
]
% Vector field: u = -2x-y,  v = x-4y, L2-normalized
\addplot3[
    orange,
    quiver={
        u={(-2*x - y)  / sqrt((-2*x-y)^2 + (x-4*y)^2 + 0.001)},
        v={( x - 4*y) / sqrt((-2*x-y)^2 + (x-4*y)^2 + 0.001)},
        w=0,
        scale arrows=0.6,
    },
    -stealth,
    samples=15,
    domain=-10:10,
    y domain=-10:10,
] (x,y,0);
% Eigendirection: v=(1,1), line y=x
% lambda=-3 < 0: both rays point TOWARD origin
\addplot[yellow, thick, -stealth, domain=-10:-0.05, samples=2] {x};
\addplot[yellow, thick, stealth-, domain=0.05:10,   samples=2] {x};
% Sample solution curves starting far out, converging to origin
\addplot[yellow, thick, samples=300, domain=0:2, variable=\t]
    ({exp(-3*\t)*8*\t},
     {exp(-3*\t)*(6 + 8*\t)});
\addplot[yellow, thick, samples=300, domain=0:2, variable=\t]
    ({-exp(-3*\t)*8*\t},
     {-exp(-3*\t)*(6 + 8*\t)});
% Equilibrium at origin (stable: filled dot)
\addplot[black, only marks, mark=*, mark size=2.5] coordinates {(0,0)};
\legend{
    Vector field,
    Eigendirection $y=x$\ ($\lambda=-3$),
    ,
    Sample trajectories,
    ,
    Equilibrium
}
\end{axis}
\end{tikzpicture}
\end{document}
```

##### Case 3: Complex Eigen Values
Recall, we seek a solution of the form:
$$\vec{V} = \vec{v}e^{\lambda t}$$
Suppose $\lambda = \alpha t \beta$. Then the corresponding Eigen Vectors are of the form:
$$\vec{v} = \vec{w} \pm i\vec{z}$$
Giving complex solutions.

$$\vec{x}(t) = (w\pm iz)e^{(\alpha\pm i\beta)t}$$
As before, we use Euler's formula to rewrite the complex exponential.

This give:
$$(\vec{w} + i\vec{z})e^{\alpha t}e^{i\beta t} = e^{\alpha t} (\vec{w} + i\vec{z})(cos(\beta t) + isin(\beta t))$$
$$ = e^{\alpha t}(\vec{w}\ cos(\beta t) - \vec{z}\ sin(\beta t)) + ie^{\alpha t}(\vec{z}\ cos(\beta t) + \vec{w}\ sin(\beta t))$$
$$\vec{x}_1(t) = e^{\alpha t}(\vec{w}\ cos(\beta t) - \vec{z}\ sin(\beta t))$$
$$\vec{x}_2(t) = e^{\alpha t}(\vec{z}\ cos(\beta t) + \vec{w}\  sin(\beta t))$$
The general solution is then:
$$\vec{x}(t) = C_1e^{\alpha t}(\vec{x}_1(t)) + C_2e^{\alpha t}(\vec{x}_2(t))$$
There are then 3 sub cases:
###### Sub Case 1: Stable Spiral
$\alpha < 0$
Origin is a stable spiral
```tikz
\usepackage{pgfplots}
% Stable Spiral:
%   x' = -x - 2y
%   y' =  2x - y
%   eigenvalues lambda = -1 +/- 2i  (alpha=-1, beta=2)
%   Trajectories spiral inward toward origin
\begin{document}
\begin{tikzpicture}
\begin{axis}[
    title={Stable Spiral: $x'=-x-2y,\quad y'=2x-y$
           \quad ($\lambda=-1\pm 2i$)},
    width=15cm,
    height=15cm,
    xmin=-3, xmax=3,
    ymin=-3, ymax=3,
    xlabel={$x$},
    ylabel={$y$},
    axis lines=center,
    xtick={-3,-2,...,3},
    ytick={-3,-2,...,3},
    tick label style={font=\small},
    grid=major,
    grid style={gray!30},
    view={0}{90},
]
% Vector field: u = -x-2y,  v = 2x-y, L2-normalized
\addplot3[
    orange,
    quiver={
        u={(-x - 2*y) / sqrt((-x-2*y)^2 + (2*x-y)^2 + 0.001)},
        v={( 2*x - y) / sqrt((-x-2*y)^2 + (2*x-y)^2 + 0.001)},
        w=0,
        scale arrows=0.3,
    },
    -stealth,
    samples=15,
    domain=-3:3,
    y domain=-3:3,
] (x,y,0);
% Equilibrium at origin (stable: filled dot)
\addplot[black, only marks, mark=*, mark size=2.5] coordinates {(0,0)};

\legend{Vector field, Equilibrium}

   
\addplot[yellow, thick, samples=300, domain=0:12.56, variable=\t]
    ({2.5*exp(-0.4*\t)*cos(deg(\t))}, {2.5*exp(-0.4*\t)*sin(deg(\t))}); 
\end{axis}
\end{tikzpicture}
\end{document}
```
###### Sub Case 2: Unstable Spiral
$\alpha > 0$
Origin is an unstable spiral
```tikz
\usepackage{pgfplots}
% Center:
%   x' = -2y
%   y' =  2x
%   eigenvalues lambda = +/- 2i  (alpha=0, beta=2)
%   Trajectories are closed ellipses, no convergence or divergence
\begin{document}
\begin{tikzpicture}
\begin{axis}[
    title={Center: $x'=-2y,\quad y'=2x$
           \quad ($\lambda=\pm 2i$)},
    width=15cm,
    height=15cm,
    xmin=-3, xmax=3,
    ymin=-3, ymax=3,
    xlabel={$x$},
    ylabel={$y$},
    axis lines=center,
    xtick={-3,-2,...,3},
    ytick={-3,-2,...,3},
    tick label style={font=\small},
    grid=major,
    grid style={gray!30},
    view={0}{90},
]
% Vector field: u = -2y,  v = 2x, L2-normalized
\addplot3[
    orange,
    quiver={
        u={(-2*y) / sqrt(4*y^2 + 4*x^2 + 0.001)},
        v={( 2*x) / sqrt(4*y^2 + 4*x^2 + 0.001)},
        w=0,
        scale arrows=0.3,
    },
    -stealth,
    samples=15,
    domain=-3:3,
    y domain=-3:3,
] (x,y,0);
% Equilibrium at origin (neutral: open circle)
\addplot[black, only marks, mark=o, mark size=2.5] coordinates {(0,0)};
\legend{Vector field, Equilibrium}
    ({2*cos(deg(2*x))}, {2*sin(deg(2*x))});

\addplot[yellow, thick, samples=300, domain=0:12.56, variable=\t]
    ({0.1*exp(0.4*\t)*cos(deg(\t))}, {0.1*exp(0.4*\t)*sin(deg(\t))});
\end{axis}
\end{tikzpicture}
\end{document}
```
###### Sub Case 3:
$\alpha = 0$
Purely Oscillatory Solutions
```tikz
\usepackage{pgfplots}
% Unstable Spiral:
%   x' =  x - 2y
%   y' =  2x + y
%   eigenvalues lambda = 1 +/- 2i  (alpha=1, beta=2)
%   Trajectories spiral outward from origin
\begin{document}
\begin{tikzpicture}
\begin{axis}[
    title={Unstable Spiral: $x'=x-2y,\quad y'=2x+y$
           \quad ($\lambda=1\pm 2i$)},
    width=15cm,
    height=15cm,
    xmin=-3, xmax=3,
    ymin=-3, ymax=3,
    xlabel={$x$},
    ylabel={$y$},
    axis lines=center,
    xtick={-3,-2,...,3},
    ytick={-3,-2,...,3},
    tick label style={font=\small},
    grid=major,
    grid style={gray!30},
    view={0}{90},
]
% Vector field: u = x-2y,  v = 2x+y, L2-normalized
\addplot3[
    orange,
    quiver={
        u={(x - 2*y) / sqrt((x-2*y)^2 + (2*x+y)^2 + 0.001)},
        v={(2*x + y) / sqrt((x-2*y)^2 + (2*x+y)^2 + 0.001)},
        w=0,
        scale arrows=0.3,
    },
    -stealth,
    samples=15,
    domain=-3:3,
    y domain=-3:3,
] (x,y,0);
% Equilibrium at origin (unstable: open circle)
\addplot[black, only marks, mark=o, mark size=2.5] coordinates {(0,0)};
\legend{Vector field, Equilibrium}

\addplot[yellow, thick, samples=200, domain=0:6.28, variable=\t]
    ({2*cos(deg(\t))}, {2*sin(deg(\t))});
\end{axis}
\end{tikzpicture}
\end{document}
```


###### Example
Consider:
$$\vec{x}' = \begin{bmatrix} -2 & -3 \\ 3 & -2 \end{bmatrix}\vec{x}$$
We have:
$$\lambda^2 - trA\lambda + detA$$
$$\lambda^2 + 4\lambda + (4 + 9)$$
$$=\lambda^2 + 4\lambda + 13 = 0$$
$$\lambda = \frac{-4 \pm \sqrt{16-52}}{2} = -2\pm\sqrt{-36/4} = -2\pm i3$$
Next:
$$(A - \lambda I)\vec{v} = \vec{0}$$
$$\left(\begin{bmatrix}-2 & -3\\3 & -2\end{bmatrix} - \begin{bmatrix}-2+i3 & 0\\0 & -2+i3\end{bmatrix}\right)\vec{v} = \vec{0}$$
$$\begin{bmatrix}-i3 & -3\\3&-i3\end{bmatrix}\begin{bmatrix}v_1\\v_2\end{bmatrix}=\begin{bmatrix}0\\0\end{bmatrix}$$
$$-i3v_1 - 3v_2 = 0$$
$$iv_1 + v_2 = 0$$
$$v_2 = -iv_1$$
$$\vec{v} = \begin{bmatrix}v_1\\v_2\end{bmatrix} = \begin{bmatrix}v_1\\-iv_1\end{bmatrix}$$
Let $v_1 = 1$:
$$\vec{v} = \begin{bmatrix}1\\-i\end{bmatrix} = \begin{bmatrix}1\\0\end{bmatrix} + i\begin{bmatrix}0\\-1\end{bmatrix}$$
Where $\begin{bmatrix}1\\0\end{bmatrix} = \vec{w}$ and $i\begin{bmatrix}0\\-1\end{bmatrix} = \vec{z}$ 
Thus:
$$\vec{x} = \vec{v}e^{\lambda t} = \begin{bmatrix}1\\-i\end{bmatrix}e^{(-2 + i3)t} = e^{-2t}\begin{bmatrix}1\\ -i\end{bmatrix}e^{i3t}$$
$$= e^{-2t}\left(\begin{bmatrix}1\\0\end{bmatrix} + i\begin{bmatrix}0\\-1\end{bmatrix}\right)(cos(3t) + isin(3t))$$
$$ = e^{-2t}\begin{bmatrix}cos(3t) + i\ sin(3t)\\-i\ cos(3t) + sin(3t)\end{bmatrix}$$
$$ = e^{-2t}\left(\begin{bmatrix}cos(3t)\\sin(3t)\end{bmatrix} + i\begin{bmatrix}sin(3t)\\-cos(3t)\end{bmatrix}\right)$$
Hence:
$$\vec{x}_1(t) = e^{-2t}\begin{bmatrix}cos(3t)\\sin(3t)\end{bmatrix}$$
$$\vec{x}_2(t) = e^{-2t}\begin{bmatrix}sin(3t)\\-cos(3t)\end{bmatrix}$$
Then the general solution is:
$$\vec{x} = C_1\vec{x}_1(t) + C_2\vec{x}_2(t)$$
In this case, the origin is a stable spiral.

#### Laplace Transform
So far we have looked at IVPs of the form:
$$ax'' + bx'' + cx = f(t)$$
$$x(0) = x_0;\ x'(0) = v'_0$$
However, $f(t)$ was always "nice" and we could use undetermined coefficients. What happens when $f(t)$ is discontinuous?

$$\mathcal{L}\{\}$$
Transform to $s$ space using Laplace Transform where function is $F(s)$ and can be easily solved algebraically. Then, reverse back to $t$ domain with inverse Laplace Transform. 

##### Definition
Let $x = x(t)$ be a given function on $0 \leq t \leq \infty$. The Laplace Transform of $x$ is the function $X(s)$ defined by:
$$\mathcal{L}\{f(t)\} = F(s) =\int_0^{\infty}x(t)e^{-st}$$
Provided this integral exits, i.e $\lim_{b\to\infty}\int_0^{b}x(t)e^{-st} dt$ exists.

