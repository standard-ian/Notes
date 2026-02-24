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
for all $t$, then we say that it is a fundamental set of solutions, i.e. they are linearly independant.

##### Theorem
If $\vec{x_1}(t)$ and $\vec{x_2}(t)$  form a fundamental set of sulutions to 
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
##### Case 3: Complex Eigen Values
##### Case 2: Real Equal Eigen Values
