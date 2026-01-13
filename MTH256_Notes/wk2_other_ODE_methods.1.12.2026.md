## Class 1

#### Review: Separation of Variables
Given a separable ODE:
$$\frac{dy}{dt} = g(y)h(t)$$
can be done as such:
$$\int\frac{1}{g(y)}dy = \int h(t)dt$$
#### Example
Find the general solution:
$$\frac{dy}{dt} = (y^2 -4)$$
This is separable, assuming $h(t)$ is just 1.
$\int \frac{1}{y^2 - 4}dy = \int dt$

$\int \frac{1}{(y + 2)(y -2)} = \int dt$ 

This is solvable using partial fraction decomposition.
We have a product of distinct, linear, factors
$\frac{1}{(y + 2)(y -2)} = \frac{A}{(y+2)}\frac{B}{(y-2)}$

Multiply through by the denominator on the right:
$A(y-2) + B(y+2) = 1$
The resulting equation (above) should be solvable for all values of $y$.
We'll pick the respective terms that make the terms "vanish". For example:
1. $y=2$
	$4B = 1$, $B=\frac{1}{4}$
2.	$y=-2$
	$-4A = 1$, $A = -\frac{1}{4}$

Giving:
$$\int \frac{1}{(y+2)(y-2)} dy = -\frac{1}{4}\int\frac{1}{y+2}dy + \int\frac{1}{y-2} dy = -\frac{1}{4}ln(y+2) + \frac{1}{4}ln(y-2) = \int dt = t+C$$

$-\frac{1}{4}ln(y+2) + \frac{1}{4}ln(y-2) = \int dt = t+C$

$-ln(y+2) + ln(y-2) = 4t+C$
Using log rules:
$ln|\frac{y-2}{y+2}| = 4t + C$
$e^{ln|\frac{y-2}{y+2}|} = e^{4t + C}$
$|\frac{y-2}{y+2}| = e^ce^{4t}$, $A = \pm e^{C}$



$\frac{y-2}{y+2} = Ae^{4t}$
$y -2 = (y+2)Ae^{4t}$
$y=yAe^{4y} + 2Ae^{4t} + 2$A
$y(1-Ae^{4t}) = 2(Ae^{4t} + 1)$
Note above, $A$ is present on the left and right, so it must be preserved and the 2 coefficient cannot be "absorbed"
$$y = \frac{2(Ae^{4t} + 1)}{1 - Ae^{4t}}$$
#### Example: IVP
Solve the initial value problem:
$\frac{dx}{dt} = -xt$ with the initial condition $x(0) = 5$ 
If you can, leave minus signs and constants on the right, giving:
$\int\frac{1}{x} dx = -\int t dt$
$ln|x| = -\frac{1}{2}t^2 + C$
$e^{ln|x|} = e^{-\frac{1}{2}t^2 + C}$
$|x| = e^{C}e^{-\frac{1}{2}t^2}$, $A = \pm e^C$
$x(t) = Ae^{-\frac{1}{2}t^2}$
$5 = Ae^{-\frac{1}{2}(0)^2}$
$5 = A(1)$, $A = 5$
$$x(t) = 5e^{-\frac{1}{2}t^2}$$

#### Example: Mixing Problem
Given a tank, with some source of filling with a base $R_{in}$ and mixing agent $C_{in}$ at a particular rate, a volume of the tank $V(t)$, a mass of the substance in the tank $y(t)$ and an outlet ratio of base and mixing agent $R_{out}$ and $C_{out}$.

Rate in/out = $R_{in}, R_{out}$ 
Concentration in/out = $C_{in}, C_{out}$
Volume of the tank = $V(t)$
Amount of mass in tank = $y(t)$ 
Later....
$V_{0} =$ initial volume
$y_0 =$ initial amount

Mixing occurs instantaneously. 
In the initial section, we'll assume the volume of mixture in the tank is constant ($R_{in} = R_{out}$ and $V(t) = V_0$)

The change in mass with respect to time $\frac{dy}{dt} = R_{in}\times C_{in} - R_{out}\times C_{out}$ 
This should be in units of mass over time.
$(\frac{v}{t})(\frac{m}{v}) - (\frac{v}{t})(\frac{m}{v}) = (\frac{m}{t})$

If we assume perfect mixing, $C_{out}  = \frac{V(t)}{V(t)} = \frac{y(t)}{V_0}$

The equation for the change in mass with regards to time of the tank is:
$$\frac{dy}{dt} = R_{in}C_{in} - R_{out}(\frac{y(t)}{V_0})$$
This entire thing is a separable equation, where $t$ is just 1.

A tank contains $5gal$ of pure water. (This means the initial concentration is $0$). A saline solution containing $\frac{1}{2}lb/gal$ flows in at a rate of $\frac{1}{2}gal/min$. The solution flows out of the tank at the same rate.
Find an expression for the amount of salt in pounds in the tank as a function of time.

$V_0 = 5$
$y_0 = 0$
$C_{in} = \frac{1}{2}$
$R_{in} = \frac{1}{2} = R_{out}$
$$\frac{dy}{dt} = \frac{1}{2}(\frac{1}{2}) - (\frac{1}{2}\times\frac{y(t)}{5})$$
$$y(0) = 0$$

Gives:
$$\frac{dy}{dt} = \frac{1}{4} - \frac{y}{10},\ \ \ y(0) = 0$$
$\frac{dy}{dt} = \frac{-1}{10}(y - \frac{5}{2})$
$\int \frac{1}{y - \frac{5}{2}} dy = \int\frac{-1}{10} dt$
$ln|y-\frac{5}{2}| = \frac{-t}{10} + C$
$y = Ae^{-\frac{t}{10}} + \frac{5}{2}$

Since $y(0) = 0$, $0 = A + \frac{5}{2}$ 
$A = -\frac{5}{2}$ 
So, $y(t) = -\frac{5}{2}e^{-\frac{t}{10}} + \frac{5}{2}$
Factoring and moving the sign:
$y(t) = \frac{5}{2} (1 - e^\frac{-t}{10})$
After 10 minutes, 
$y(10) = \frac{5}{2} (1-e^{-1})$

#### Notes on Separation of Variables
If $R_{in}$ did not match $R_{out}$, we could not use the separation of variables method as above. 
Separation of variables only works when the equations are separable. It is the only method in this course we can use when the equations are non-linear.
Undetermined coefficients does not require the but the coefficients have to be constant$, we could not use the above method. We'd separation of variables method as above. This
Undetermined coefficients does not require the variables be equal, but the coefficients have to be constant.
Integrating factors allows for both.
Depending on the traits of the equation, we will choose different techniques for solving the ODE.
#### 1.8 Linear Equations
If a first order ODE is linear if it can be written in the form:
$$\frac{dy}{dt} = a(t)y + b(t)$$
A linear ODE is homogeneous if the **forcing function** $b(t) = 0$, otherwise **non-homogeneous**.
The ODE has constant coefficients if $a(t)$ is a constant.

If $b(t) = 0$ or if $a(t) = b(t)$, then a linear equation is also separable. 
In this section, the focus will be on the non-separable case.

#### Examples
Note the last technique will require new techniques.
$\frac{dP}{dt} = rP(1-\frac{P}{k})$ **Non-linear**, but **Separable**
$\frac{dy}{dt} = R_{in}C_{in} - R_{out}y(t)$  **Linear**, **Non-Homogeneous**, **Constant-Coefficients**, **Separable**
$\frac{dx}{dt} - \frac{1}{t}x = t$ **Linear**, **Non-homogeneous**, **Non-Constant-Coefficients**, **Non-Separable**

#### Incorporating Linear Algebra
Typically, we write the standard form of a first order ODE as:
$$y' + p(t) y = q(t)$$ The corresponding, non-homogeneous equation is written (because the equation is homogeneous if the forcing function is 0):
$$y' + p(t)y = 0$$
Any solution to the linear system $$A\vec{x} = \vec{b}$$ can be written as the sum of a homogeneous solution $\vec{x}_n$ such that $A\vec{x}_{n} = \vec{0}$. And a particular solution $\vec{x}_p$ such that $A\vec{x}_p = \vec{b}$.
Since:
$$A(\vec{x}_n + \vec{x}_p) = A\vec{x}_n + A\vec{x}_p = \vec{b} + \vec{0} = \vec{b}$$
The same is true of linear ODEs! That is any homogeneous solution $y_n(t)$ to the equation:
$$y'_n + p(t)Y_n = 0$$
and any particular solution $y_p(t) that satisfies $y'_p + p(t)y_p = q(t)$ can be combined as $y(t) = y_n(t) + y_p(t)$ to form the solution of the linear ODE:
$$y' + p(t)y = q(t)$$
If $p(t)$ is actually a constant, this whole process is relatively straightforward.


#### Recap
So far, we know that any homogeneous equation $y' + p(t) y = 0$ can be solved using separation of variables. $y(t) = Ae^{-\int p(t) dt}$


#### The Method of Undetermined Coefficients 
This method assumes $p(t)$ is a constant.

Given the linear equation with the constant coefficients, $y' + ky = b(t)$ for constant $k$ we write the solution as $y = y_h + y_p$
We call $y_h$ "**y homogeneous**"
Where $y_h$ is the solution to the equation $y'_h + ky_h = 0$
This equals: $y_h = Ae^{-kt}$ using separation of variables.

Then, to find "**y particular**", $y_p(t)$ to the non-homogeneous equation $y'_p +ky_p = q(t)$ by guessing the form of $y_p$ based on the form of $q(t)$.
Is it exponential, polynomial, trig?

Example, if $k$ is a constant, and $q(t)$ is a polynomial, we know the derivative of a polynomial plus a constant times a polynomial will be a polynomial.

#### Example
Find the general solution to $\frac{dy}{dt} = -2y + e^t$

Write in standard form:
$y' + 2y = e^t$

The solution the homogeneous equation $y'_h + 2y_h = 0$
$y_n = Ae^{-2t}$ 

Next, we find a particular solution by guessing. 
$y'_p + 2y_p = e^t$
Since the RHS is an exponential (that does not match $y_n$) we will choose the guess $y_p = xe^t$

Plugging in:
$(y_p)' + 2yp = xe^t + 2xe^t = 3xe^t = e^t = RHS$
$3xe^t = e^t$
$x = \frac{1}{3}$
All together:
$$y = y_n + y_p = Ae^{-2t} + \frac{1}{3}e^t$$











