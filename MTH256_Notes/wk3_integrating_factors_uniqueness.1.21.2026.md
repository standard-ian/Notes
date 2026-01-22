## Class 1
#### Example
Find the general solution to:
$$\frac{dx}{dt} + 2x = sin(t)$$
If we try integrating factor...we may not have a good time:
$\mu(t) = e^{\int2dt} = e^{2t}$ 
The equation becomes:
$$\int[\frac{d}{dx}(e^2tx)dt] = \int e^{2t}sin(t) dt$$
$$e^{2t}x = \int
e^{2t}sin(t) dt$$
So we'd have to use integration by parts on the RHS, but it will go on infinitely.

###### Integration by parts ($\int udv = uv - \int vdu$)
1. Log
2. Inverse Trig
3. Algebraic
4. Trig
5. Exponential
$u = sin(t)$
$dv = e^{2t}$
$$\int e^{2t} sin(t) dt= sin(t)(\frac{1}{2}e^{2t}) - \int(\frac{1}{2}e^{2t})cos(t) dt$$
Next, integration by parts again:
$$\frac{1}{2}\int(e^{2t})cos(t) dt = \frac{1}{2}[cos(t)(\frac{1}{2}e^{2t}) - \int(\frac{1}{2}e^{2t})(-sin(t))dt]$$
We substitute back in and get the following, which eventually simplifies.
$$\int e^{2t} sin(t) dt = \frac{1}{2}sin(t) e^{2t} - \frac{1}{4}cos(t) e^{2t} - \frac{1}{4}\int e^{2t}sin(t) dt$$

$$e^{2t}[\frac{2}{5}sin(t) = \frac{1}{5}cos(t)]$$
#### Section 1.5: Existence and Uniqueness
Recall the standard for for a first order ODE.
$y' = f(t,y)$

When are there solutions, when are they guaranteed to be unique?

Assume that the function $f(t,y)$ and its partial derivative $\frac{\partial}{\partial y}f(t,y) = f_y(t,y)$ are continuous in a rectangle:
$$a \lt t \lt b,\ c \lt x \lt d$$
Then, for any value $t_0\epsilon(a,b)$ and $x_0 \epsilon(c,d)$

Then IVP:
$$y' = f(t,y),\ y(t_0) = x_0$$
Has a unique solution on some open interval $(x, \beta) C (a,b)$ containing $t_0$

Function $f$ and it's partial derivative, check if they are continuous??

##### Example
For $x' = 1 + x^2$
We have $f(t,x) = 1 + x^2$ and $f_x(t,x) = 2x$ 
Since $f$ and $f_x$ are polynomials in $x$ they are continuous on the whole $t-x$ plane. 

Thus, for any choice of initial condition $x(t_0) = x_0$, there is guaranteed to be a unique solution about the point $(t_0, x_0)$

##### Example
$y' = 2\sqrt{y}$
$y(0) = 0$

Both $y(t) = 0$ and $y(t) = t^2$ are solutions on $-\infty < t < \infty$. Why? 
$f(t,y) = 2\sqrt(y)$ 
$f_y(t,y) = \frac{1}{\sqrt{y}}$

Both $f$ and $f_y$ are only continuous for $y > 0$.

The initial condition $(t_0, y_0) = (0,0)$ lies on the boundary, therefore, there is not a guaranteed unique solution passing through the initial condition.
