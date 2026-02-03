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
