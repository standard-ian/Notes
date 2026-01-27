## Class 1
#### Slope Fields
The slope of the graph $y$ at the point $(t, y(t))$ is $f(t,y(t))$.
1. Choose a grid of points $(t_i, y_i)$.
2. Compute slopes of $f(t_i, y_i)$ at each point.
3. Draw small line segments centered at each point having the correct slope.
#### Euler's Method
1. $y_0$ is given, $y_{k + 1} = y_k + (\Delta t)f(t_x, y_k)$
2. $\Delta y_k = \Delta t f(t_x, y_x)$
##### Example
$$y' = -ty,\ y(0) = 1$$
$t_0 = 0$
$y_0 = 1$
Choose a $\Delta t$
$\Delta t = \frac{1}{4}$
$f(t,y) = -ty$

| $k$ | $t_k$         | $y_k$                                             | $f(t_k, y_k)$    | $\Delta y_k$      |
| --- | ------------- | ------------------------------------------------- | ---------------- | ----------------- |
| 0   | 0             | 1                                                 | 0                | 0                 |
| 1   | $\frac{1}{4}$ | 1                                                 | $-\frac{1}{4}$   | $-\frac{1}{16}$   |
| 2   | $\frac{1}{2}$ | $\frac{15}{16}$                                   | $-\frac{15}{32}$ | $-\frac{15}{128}$ |
| 3   | $\frac{3}{4}$ | $\frac{15}{16} -\frac{15}{128} = \frac{105}{128}$ | ...              | ...               |
| ... | ...           | ...                                               | ...              | ...               |

#### Another Derivation
To give some insight into other methods beside Euler

Start with the fundamental theorem of Calculus
$$\int_{t_k}^{t_{k+1}}y'(t)dt = t(t_{k+1}) - y(t_k)$$
$$y_{t_{k + 1}} = y(t_k) + \int_{t_l}^{t_{k+1}}y'(t)dt$$
$$(\Delta t)y'(\sigma_k)  = \int_{t_l}^{t_{k+1}}y'(t)dt$$
$$\int_{t_l}^{t_{k+1}}y'(t)dt = Area\ Under\ the\ Curve$$
Euler's Method uses the left endpoint rule, basically, to estimate the area under the curve.

Because Euler's method moves stepwise, the total error accumulates.