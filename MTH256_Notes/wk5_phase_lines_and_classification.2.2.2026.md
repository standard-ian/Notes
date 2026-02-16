## Class 1
#### Classification of Equilibrium Points Cont.
Suppose $y_0$ is an EQ point of the ODE $y' = f(y)$ where $f$ is continuously differentiable.

1. If $f'(y_0) < 0$: $y_0$ is a sink/stable
2. If $f'(y_0) > 0$: $y_0$ is a source/unstable
3. If $f'(y_0) = 0$: More information is needed. The first derivative is not enough.
	1. This often occurs when $f$ is "too flat" near $y_0$.
	2. Need higher order derivative information. "Inconclusive" as far as this class is concerned. 
##### Example:
Logistic growth equation:
$$y' = ry(1-\frac{y}{k})$$
The EQ points are at $0$ and $k$ 
If we consider the function to be:
$$f(y) = ry(1-\frac{y}{k})\to f'(y) = r - \frac{2r}{k}y$$
Finally, we check the stability at each point.
EQ point ($y*$):
###### $y* = 0$:
For $f'(0) = r-\frac{2r}{k}(0) = r$
Since $r$ is positive, the growth rate at $f'(0)>0$. $y*=0$ is a source/unstable 
###### $y* = k$
For $f'(k) = r - \frac{2r}{k}k = r - 2r = -r$
$f'(k)  = -r < 0$ so $r$ is negative, and the $y*$ is a sink or stable point.

#### Section 1.7 Bifurcations
We've studied autonomous 1st order ODE's of the form:
$$y'=f(y)$$
Now, suppose the RHS depends on some parameter $\mu$, i.e $y'= f(y;\mu)$

Now, we can ask, what happens to the equilibrium points as $\mu$ us changed.

We refer to this as a **one parameter family of equations**
##### Example
Consider the following 1 parameter family:
$$\frac{dy}{dt} = f(y; \mu) = y^2 -2y + \mu$$
This will be a parabola, where shifting $\mu$ will move the parabola up or down.

###### Find EQ Points
If $\frac{dy}{dt} = 0$, this means $y$ isn't changing and the solution will remain constant.
$$0 = y^2 -2y + \mu$$
Use quadratic formula:
$$y = \frac{2 \pm\sqrt{4 - 4\mu}}{2} = 1\pm \sqrt{1 - \mu}$$
1. If $\mu$ is less than 1, there will be 2 EQ points at:
	$y* = 1 + \sqrt{1 - \mu}$
	$y* = 1 - \sqrt{1 - \mu}$
2. If $\mu$ is greater than 1, we'll have the $\sqrt{\ \ }$ of a negative, which is non-real meaning no EQ there.
3. If $\mu=1$, there is exactly one EQ point.
	$y* = 1$

```tikz
\usepackage{pgfplots}

\begin{document}

\begin{tikzpicture}
\begin{axis}[
    width=12cm,
    height=12cm,
    title={$f(y;\mu) =y^2 - 2y + \mu$},
    domain=-3:3,
    range=-3:3,
    samples=200,
    grid=major,
    axis lines=middle,
    enlargelimits=true,
]
\addplot[red, very thick] {x*x -2*x + 1};
\addlegendentry{$\mu = 1$}
\addplot[blue, very thick] {x*x -2*x + 0};
\addlegendentry{$\mu < 1$}
\addplot[green, very thick] {x*x -2*x + 2};
\addlegendentry{$\mu > 1$}

\end{axis}

\end{tikzpicture}
\end{document}
```

###### Checking Stability
1. Take the derivative of $f(y; \mu)$
	$f'(y;\mu) = 2y - 2$
2. $y*_1 = 1 + \sqrt{1 - \mu}$
	$f'(y*_1;\mu) = 2(1 + \sqrt{1-\mu}) - 2 = 2\sqrt{1 - \mu} > 0$, if $\mu<1$.
	Unstable
3. $y*_2 = 1 - \sqrt{1 - \mu}$
	$f'(y*_2;\mu) = 2(1 - \sqrt{1-\mu}) - 2 = -2\sqrt{1 - \mu} < 0$, if $\mu<1$.
	Stable
###### Bifurcation Line
We can plot the 2 EQ points as functions of $\mu$ and plot their stabilities.

We work out what the fixed points are as functions of the parameter $\mu$, then plot them.

```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
\begin{axis}[
    width=12cm,
    height=12cm,
    title={Bifurcation Diagram: $x^2 + 2x + \mu = 0$},
    xlabel={$\mu$},
    ylabel={$x$},
    domain=-3:3,
    samples=200,
    grid=major,
    axis lines=middle,
    enlargelimits=true,
    legend pos=north west,
]
% Upper branch: x = -1 + sqrt(1 - mu)
\addplot[blue, very thick, domain=-3:1] {-1 + sqrt(1 - x)};
\addlegendentry{$x = -1 + \sqrt{1-\mu}$}

% Lower branch: x = -1 - sqrt(1 - mu)
\addplot[red, very thick, domain=-3:1] {-1 - sqrt(1 - x)};
\addlegendentry{$x = -1 - \sqrt{1-\mu}$}

% Mark bifurcation point at mu = 1
\addplot[mark=*, mark size=3pt, only marks] coordinates {(1,-1)};
\end{axis}
\end{tikzpicture}
\end{document}
```
##### Pitchfork Bifurcation
$$\frac{dy}{dt} = y^3 - \alpha y = y(y^2 - \alpha)$$
As $\alpha$ increases, the line becomes flatter and flatter, with one equilibrium at 0. 
As $\alpha$ decreases, the equilibrium point at 0 changes from stable to unstable, and additional equilibriums appear.

$y* = 0, \pm\sqrt{\alpha}$
Thus:
$\alpha < 0$: 1 EQ point
$\alpha > 0$: 3 EQ points
$\alpha = 0$: Bifurcation occurs

###### Check Stability
$g'(y; \alpha) = 3y^2 - \alpha$
$g'(0; \alpha) = -\alpha$
Stable if $\alpha > 0$, unstable if $\alpha < 0$ 

$y* = \sqrt{\alpha}$
$g'(\sqrt{\alpha}; \alpha) = 3 \alpha - \alpha = 2 \alpha >  0$ if $\alpha > 0$: Unstable

$y* = -\sqrt{\alpha}$
$g'(-\sqrt{\alpha}; \alpha) = 3 \alpha - \alpha = 2 \alpha >  0$ if $\alpha > 0$: Unstable

##### Transcritical Bifurcation
Consider: 
$$\frac{dx}{dt} = rx-x^3$$
The EQ points are $x* = 0, r$ 
Since:
$$f'(x, r) = r -2x$$
We have:
$x* = 0$
$f'(0; r) = r$
Stable if $r<0$
Unstable if $r > 0$

$x* = r$
$f'(r;r) = -r$
Stable if $r > 0$
Unstable if $r < 0$

## Class 2
#### Second Order Equations 3.6/4.1
The standard form of a linear second order equation with constant coefficients is:
$$ax'' + bx' +cx = f(t)$$
These often appear in classical mechanics.

For instance if $m$ is the mass of an object and $x''$ is its acceleration, we can write Newton's second law as:
$$mx'' = F(t, x, x')$$
Importantly, a second order IVP requires 2 ICs:
$$ax'' + bx' + cx = f(t)$$
$$x'(t_0) = v_0$$
$$x(t_0) = x_0$$
##### Harmonic Oscillator Example:
Imagine a mass on a frictionless table attached to a wall by a spring. 
At time $t=0$, the spring is displaced from equilibrium an amount $x_0$ and released. 

How can we describe the motion of the mass?

By Newton's Second Law, $mx'' = F_s$
The force due to the spring is equal to the mass times the acceleration.

Here $F_s$ is the force due to the spring constant, and by Hooke's Law, we know that this force is proportional to the displacement from equilibrium and opposes positive motion.

Hence:
$$F_s = -kx$$
Here we must assume the spring constant $k>0$.
This gives the classical spring-mass equation:
$$mx'' = -kx$$

If we displace the mass and release it, we get the ICs:
$$x(0) = x_0$$
$$x'(0) = 0$$

We will show that the solution to this IVP is:
$$x(t) = x_0 cos(\sqrt{k/m}\cdot t)$$
If we allow for friction, Newton's Second Law states:
$$mx'' = F_s + F_d$$
Where the damping force $F_d$ is proportional to the velocity:
$$F_d = \gamma x$$
Where the damping coefficient $\gamma > 0$ (mass/time)

The dampened oscillator equation is given by:
$$mx' = -kx-\gamma x'$$
Depending on the ICs we will show that one possible solution is:
$$x(t) = Ae^{-\lambda t}cos(\omega t)$$
($\lambda$ to be specified later)

###### General Solution to the 2nd Order Linear Equations w/ Constant Coefficients
Consider the IVP:
$$ax'' + bx' + cx = 0$$
$$x(0) = x_0,\ x'(0) = v_0$$
**Theorem: The IVP has a unique solution that exists on $-\infty < t < \infty$**

Importantly, with no initial conditions, the equation $ax'' + bx' + cx = 0$ alwas has **exactly 2** linearly independent solutions: $x_1(t)$ and $x_2(t)$.

Therefore, any solution to the IVP can be written:
$$x(t) = Ax_1(t) + Bx_2(t)$$
Where $A$ and $B$ satisfy the ICs. 
Note that $x_1(t)$ and $x_2(t)$ are called the fundamental set of solutions.

###### Finding the Fundamental Set
As with first order equations, we assume solutions of the form:
$$x(t) = e^{\lambda t}$$
Thus, $ax'' + bx' + cx = 0$ implies:
$$a\lambda^2e^{\lambda t} + b\lambda e^{\lambda t} + ce^{\lambda t} = 0,\ (e^{\lambda t}> 0, \forall t)$$
We call this the characteristic equation.

Solving for $\lambda$ gives:
$$\lambda = \frac{-b\pm\sqrt{b^2 -4ac}}{2a}$$
These solutions are called the Eigen values for the homogeneous equation.

Depending on the discriminant, there are 3 cases. We have to go through these values case by case. 

###### Case 1: $b^2 - 4ac > 0$:
Real distinct evals $\lambda_1$, and $\lambda_2$:
The general solution is: 
$$x(t) = c_1e^{\lambda_1 t} + c_2e^{\lambda_2t}$$
Remember:
$$\lambda_1\ne \lambda_2$$
###### Case 2: $b^2 - 4ac = 0$:
The real repeated eval
The general solution is:
$$x(t) = c_1e^{\lambda t} + c_2 t e^{\lambda t}$$
Continued next week.....