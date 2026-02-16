## Class 1
#### Second Order Differential Equations Review
Linear, second order ODEs w/ constant Coefficients

$$ax'' + bx' + cx = 0$$
The solution is of the form:
$$x(t) = c_1x_1(t) + c_2x_2(t)$$
So $x_1$ and $x_2$ are the solutions.
Suppose, $x(t) = e^\lambda$.
Substituting back in:
$$a\lambda^2 e^{\lambda t} + b\lambda e^{\lambda t} + ae^{\lambda t} = 0$$
$$a\lambda^2 + b\lambda + c = 0$$
Can solve for lambda:
$$\lambda = \frac{-b\pm\sqrt{b^2 - 4ac}}{2 a}$$
This results in some different cases
##### Case 1:
$$b^2 - 4ac > 0$$
Real distinct Eigen Values
$$x_1(t) = e^{\lambda_1 t};\ \ x_2(t) = e^{\lambda_2 t}$$

##### Case 2:
$$b^2 - 4ac = 0$$
Real repeated Eigen Values
$$x_1(t) = e^{\lambda t};\ \ x_2(t) = te^{\lambda t} $$
##### Case 3: 
$$b^2 - 4ac < 0$$
Eigen Values are a conjugate pair

$$\lambda_1 = \alpha + i\beta;\ \ \lambda_2 = \alpha - i\beta$$
Where $\alpha = -\frac{b}{2a}$ and $\beta = \frac{1}{2a}\sqrt{4ac-b^2}$

This results in two complex values. The complex valued solutions are:
$$x_1(t) = e^{(\alpha + i\beta) t};\ \ x_2(t) = e^{(\alpha - i\beta)t}$$
###### Proposition 1:
If:
$$x(t) = g(t) + ih(t)$$
Is some complex solution to our second order ODE, each component is a real solution. $g(t)$ and $h(t)$ are both real solutions.

How did we go from the complex part in the exponent to having it in front of $h(t)$? Euler's Formula!
###### Proposition 2: Euler's Formula
$$e^{i \beta t} = cos(\beta t) + i sin(\beta t)$$
###### Combining Propositions 1 & 2:
$$e^{(\alpha+i\beta)t} = e^{\alpha t}e^{i\beta t} = e^{\alpha t}(cos(\beta t) + isin(\beta t))$$
$$=e^{\alpha t}cos(\beta t) + ie^{\alpha t}sin(\beta t)$$
Where:
$$g(t) = e^{\alpha t}cos(\beta t);\ \ h(t) = ie^{\alpha t}sin(\beta t)$$
So, if $x_1(t) = e^{(\alpha + i \beta)t}$ is a complex valued solution, then:
$$x_1(t) = e^{\alpha t}cos(\beta t); \ \ x_2(t) = e^{\alpha t}sin(\beta t)$$
Are two real valued solutions.

#### Case 1 Example
$$x'' + x'  -12 = 0$$
We can jump straight from the DE to the characteristic equation.

$$\lambda 2 - \lambda - 12 = 0$$
This can factor easily to:
$$(\lambda - 4)(\lambda + 3)$$
Thus:
$$\lambda = 4, -3$$
Real, distinct case. We can easily go to general solutions, which are:
$$x(t) = c_1e^{\lambda_1t} + c_2e^{\lambda_2t} = c_1e^{4t} + c_2e^{-3t}$$
#### Case 2 Example
$$x'' + 4x' + 4x = 0$$
Has the characteristic equation:
$$\lambda^2 + 4\lambda + 4 = 0$$
$$(\lambda + 2)(\lambda + 2) = 0$$
Real, repeated case.
Thus:
$$\lambda = -2$$
$$x(t) = c_1e^{\lambda t} + c_2te^{\lambda t} = c_1e^{-2t} + c_2te^{-2t}$$
#### Case 3 Example
$$x'' + 2x' + 5x = 0$$
Characteristic equation:
$$\lambda^2 + 2\lambda + 5 = 0$$
Have to use quadratic formula:
$$\lambda = -1 \pm 2i;\ \ \alpha = -1, \ \beta = 2$$
Thus, the general solution is:
$$x(t) = c_1 e^{\alpha t}cos(\beta t) + c_2e^{\alpha t} sin(\beta t)$$
$$=c_1e^{-t}cos(\alpha t) + c_2e^{-t}sin(\alpha t)$$
#### IVP Example
$$x'' + 7x = 0;\ \ x(0) = 1,\ x'(0) = 2$$
Characteristic equation:
$$\lambda^2 + 7 = 0$$
$$\lambda = \pm\sqrt{7}\ i$$
Thus, the general solution is:
$$x(t) = c_1cos(\sqrt{7} t) + c_2 sin(\sqrt{7} t)$$
Since we have two initial conditions, we need to plug these both in.

We'll start with $x(0) = 1$
$$x(0) = 1 = c_1cos(0) + c_2sin(0) = c_1(1) + 0;\ \ c_1 = \frac{1}{1}$$
Since:
$$x'(t) = - \sqrt{7} c_1sin(\sqrt{7}t) + \sqrt{7}\ c_2\ cos(\sqrt{7}t)$$
$$= -\sqrt{7}sin(\sqrt{7}t) + \sqrt{7}\ c_2\ cos(\sqrt{7}t)$$
$$x'(0) = 2 = -\sqrt{7}sin(0) + \sqrt{7}c_2cos(0)$$
$$2  = \sqrt{7}c_2$$
$$c_2 = \frac{2}{\sqrt{7}} = \frac{2\sqrt{7}}{7}$$
So, the solution to the IVP:
$$x(t) = cos(\sqrt{7 t}) + \frac{2\sqrt{7}}{7}sin(\sqrt{7}t)$$
This is a purely oscillatory solution w/ period $\frac{2\pi}{7}$ and frequency $\sqrt{7}$

#### Next Time...
For some general spring mass, we'll consider a spring mass system.
1. Mass of mass $m$
2. Origin $x=0$
3. Displacement as a function of time $x(t)$
4. Force due to the spring in the positive $x$: $F_s = -kx$
5. Force due to damping in the negative $x$: $F_d = -\gamma x'$

Giving the differential equation:
$$mx'' + \gamma x' + kx = 0$$
We want to know the values of $m$, $\gamma$ , and $k$ that give us all of the qualitatively different solutions? 

What are those solutions?
## Class 2


Midterm 1