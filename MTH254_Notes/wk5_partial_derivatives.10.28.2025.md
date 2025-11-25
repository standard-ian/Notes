## 14.3
#### #20
Compute the first order partial derivatives of $z=\frac{x}{x-y}$
There are 2 input variables, so there are going to be 2 forms

$y=f(x)\frac{dx}{dy} = lim_{h\to 0} \frac{f(x+h)-f(x)}{h}$
$z=f(x,y) = \frac{\partial f}{\partial x} = lim_{h\to 0} \frac{f(x+h, y)-f(x,y)}{h}$
$f(x,y) = \frac{\partial f}{\partial y} = lim_{k\to 0} \frac{f(x, y+k)-f(x,y)}{k}$
$z=f(x,y) = \frac{x}{x-y}$
$\frac{\partial}{\partial x}(x) = 1$
$\frac{\partial z}{\partial x} = \frac{(x-y)(1)-(x)(1)}{(x-y)^2}$
$=\frac{x-y-x}{(x-y)^2}$
$\frac{\partial z}{\partial x}=-\frac{y}{(x-y)^2}$

$\frac{\partial}{\partial y}(x) = 0$
$\frac{\partial}{\partial y}(x-y) = 0 -1 = -1$
$\frac{\partial x}{\partial y}=\frac{(x-y)(0)-(x)(-1)}{(x-y)^2} = \frac{0+x}{(x-y)^2}$
$\frac{\partial z}{\partial y} = \frac{x}{(z-y)^2}$

In the x-y plane, if I am only moving parallel to the x and y individually, how is my elevation changing?
$\frac{\partial z}{\partial x}$is the slope of the tangent line along the line tangent to an arbitrary plane parallel to the x 
$\frac{\partial z}{\partial y}$is the slope of the tangent line along the line tangent to an arbitrary plane parallel to the y

#### #25
Compute the first order partial derivatives of $z=cos(\frac{1-x}{y})$
Take the derivative with respect to x and y independently.
Which ever variable we are not differentiating with respect to (not in the bottom of the $\frac{\partial z}{\partial x/y}$ symbol) treated as a constant!
$\frac{\partial z}{\partial x} = -sin(\frac{1-x}{y})(\frac{\partial}{\partial x}\frac{1-x}{y})$
$\frac{1}{y}$ can be pulled out as a constant
$=-sin(\frac{1-x}{y})(\frac{1}{y})(\frac{\partial}{\partial x}(1-x))$
$=-sin(\frac{1-x}{y})(\frac{1}{y})(-1))$
$=\frac{1}{y}sin(\frac{1-x}{y})$

$\frac{\partial z}{\partial y} = -sin(\frac{1-x}{y})(\frac{\partial}{\partial y}\frac{1-x}{y^1})$
$=-sin(\frac{1-x}{y})(\frac{\partial}{\partial y}(1-x)y^{-1})$
$=-sin(\frac{1-x}{y})(1-x)\frac{\partial}{\partial y}y^{-1})$
$=-sin(\frac{1-x}{y})(1-x)(-y^{-2})$
$=sin(\frac{1-x}{y})(1-x)(y^{-2})$

#### #27
Compute the derivative indicated:
$f_{yy}(2,3)$ (This means take the second order partial derivative for y, twice, then plug in $(x,y) = (2,3)$)
For:
$f(x,y) = x\ ln(y^2)$

$f_{y}(x,y) = x \frac{1}{y^2}(\frac{\partial}{\partial y}y^2)$
$= x \frac{1}{y^2}(2y)$
$=\frac{2x}{y}$
$=2xy^{-1}$

$f_{yy}(x,y) = -2xy^{-2}$
$=-\frac{2x}{y^2}$

$f_{yy}(2,3) = -\frac{2(2)}{3^2} = -\frac{4}{9}$

---
So what's the point of looking at partial derivatives?
The point of finding the derivative in 2D is to find the slope of the tangent line, which represents instantaneous rate of change
This would be parameterized using the formula $L(x) = f'(a)(x-a)+f(a)$
This linear approximation was used for finding square roots, but it is still a useful data analysis technique.

In 3 space, the linear approximation results in a tangent **plane**
From this plane, we need a normal vector. We have the partial with respect to x and another with respect to y. These define 2 vectors we can take the cross product of to find the normal vector. $\frac{\partial z}{\partial x}\times \frac{\partial z}{\partial y} = \vec{n}$

$L(x,y)=f(a,b) + f_{x}(a,b)(x-a) + f_{y}(a,b)(y-b)$
---
## 14.4
#### #7
Find an equation of the tangent plane at the given point.
$P(2,1)$
For:
$F(r,s)=r^{2}s^\frac{1}{2}+s^{-3}$
1. Take the first order partial derivatives.
	Remember, the non-differentiating variables can be treated as constants (i.e. $\frac{\partial}{\partial r}s^{-3} = 0$)
	$F_{r}(r,s)=2rs^{\frac{1}{2}} + 0 = 2r\sqrt{s}$
	
2. Plug in the point
	$F_{r}(2,1)=2(2)\sqrt{1} = 4$
	
3. Then the other variable
	$F_{s}(r,s) = r^{2}(\frac{1}{2})s^{-\frac{1}{2}}+(-3)s^{-4}$
	$=\frac{r^{2}}{2s^{\frac{1}{2}}} - \frac{3}{s^{4}}$
	$\frac{r^2}{2\sqrt{s}}-\frac{3}{s^{4}}$
	
4. Again, plug in the point
	$F_{s}(2,1) = \frac{2^2}{2\sqrt{1}}-\frac{3}{1^{4}} = \frac{4}{2} - \frac{3}{1} = 2-3 = -1$
	
5. So, the linearization centered at $(r,s)=(2,1)$ is 
	$L(r,s) = F(2,1)+F_{r}(2,1)(r-2)+F_{s}(2,1)(s-1)$
	$=5+4(r-2)+(-1)(s-1)$
	$=4r-s-2$
This is the equation of the tangent plane centered at point

#### #17
Let $f(x,y)=x^{3}y^{-4}$ Use this equation: $\Delta f\approx f_{x}(a,b)\Delta x + f_{y}(a,b)\Delta y$
to estimate the change:
$\Delta f=f(2.03, 0.9) - f(2,1)$

1. Partial Derivatives
	$f_{x}(x,y)= 3x^{2}y^{-4} = \frac{3x^{2}}{y^{4}}$
	$f_{y}(x,y) = (-4)x^{3}y^{-5} = \frac{-4x^{3}}{y^{5}}$
	
2. Evaluate at the points
	$f_{x}(2,1) = \frac{3(2)^{2}}{(1)^{4}} = 12$
	$f_{y}(2,1) = \frac{-4(2)^3}{(1)^5} = -32$

3. Use formula
	$\Delta f = f(2.03, 0.9) - f(2,1) \approx 12(2.03-2) + (-32)(0.9-1)$
	$=12(0.03) + (-32)(-0.1) = 0.36+3.2 = 3.56$
	$\Delta f \approx 3.56$

#### #30
Use the linear approximation to estimate the value and compute the % error using a calculator

$\frac{8.01}{\sqrt{(1.99)(2.01)}}$

$f(2,2) = \frac{8}{\sqrt{2(2)}}$
$f(x,y) = \frac{y+6}{\sqrt{xy}}$
We need a function that is easy to evaluate at (2,2) such that $f(1.99,2.01)=\frac{8.01}{\sqrt{(1.99)(2.01)}}$
Just adding 6 to $y=2$ is a simple way to make the numerator about 8.

$=(y+6)(xy)^{-\frac{1}{2}}$
$=(y+6)(x^{-\frac{1}{2}})(y^{-\frac{1}{2}})$
$=(y^{\frac{1}{2}} + 6y^{-\frac{1}{2}})(x^{-\frac{1}{2}})$

$f_{x}(x,y) = (y^\frac{1}{2} + 6^{-\frac{1}{2}})(-\frac{1}{2}x^{-\frac{3}{2}})$
$=(\sqrt{y}+\frac{6}{\sqrt{y}})(-\frac{1}{2})(\frac{1}{\sqrt{x}^{3}})$
$f_{x}(2,2) = -1$

$f_{y}(x,y) = (\frac{1}{2}y^{-\frac{1}{2}}-3y^{-\frac{3}{2}})(x^{-\frac{1}{2}})$
$=(\frac{1}{2\sqrt{y}}-\frac{3}{(\sqrt{y})^{3}})(\frac{1}{\sqrt{x}})$
$f_{y}(2,2) = -\frac{1}{4}$

$L(1.99, 2.01) = 4 + (-1)(1.99-2) + (-\frac{1}{4})(2.01-2) = 4 + (-1)(-0.01) + (-0.25)(0.01)$
$\approx 4+0.01-0.0025 = 4.0075$


## 14.5
#### #2
Let $f(x,y) = xy^2$ and $\vec{r}(t) = <1/2t^2, t^3>$

1. Calculate $\nabla f$ and $\vec{r}(t)$
2. use the chain rule for paths to evaluate $\frac{d}{dt} f(\vec{r}(t))$ at $t=1$ and $t=-1$

The gradient of $f$ is the vector of partial derivatives $\nabla f = <\frac{\partial f}{\partial x}, \frac{\partial f}{\partial y}, \frac{\partial f}{\partial z}>$
$\nabla f p$  is the direction of greatest increase of $f$ at the point $p$, and that rate of increase is $||\nabla fp||$ 
1. $f(x,y) = xy^2$
	$f_{x}(x,y) = y^z$
	 $f_y(x,y) = 2xy$

$\vec{r}(t) = <1/2t^2, t^3>$
$\vec{r}'(t) = <t, 3t^2>$
$\nabla f = <y^2, 2xy>$

2. The chain rule for paths: $\frac{d}{dt}f(\vec{r}(t)) = \nabla f_{\vec{r}(t)} \cdot \vec{{r}'(t)}$
	At $t=1$: $\vec{r}(1) = <\frac{1}{2}, 1>$ $\vec{r}'(1) = <1,3>$
	$\nabla f_{\vec{r}(1)} = <1^2, 2(\frac{1}{2})(1)> = <1,1>$
	$\frac{d}{dt}f(\vec{r}(t))|_{t=1} = <1,1> \cdot <1,3> = 1(1) + 1(3) = 4$
	This is saying that at time unit 1, the elevation is changing by 4 units per time measurement, the rate of change

	At 	$t=-1$: $\vec{r}(-1) = <\frac{1}{2}, -1> \vec{r}'(-1) = <-1,3>$
	$\nabla f_{\vec{r}(-1)} = <(-1)^2, 2(\frac{1}{2})(-1)> = <1,-1>$
	$\frac{d}{dt}f(\vec{r}(t))|_{t=-1} = <1,-1>\cdot <-1,3> = 1(-1) + 3(-1) = -4$
	This is saying that at -1 time units, the elevation would be downwards by 4 units per time measurement

#### Example
Calculate the directional derivative in the direction of the vector $\vec{v}$ at the given point.
Remember to use a unit vector in your directional derivative computation.
$f(x,y) = e^{xy-y^2}$ , $v=<12,-5>$, $P=(2,2)$

What is our directional derivative? What if we don't want to travel in the $x$ or $y$ direction? What if we want to travel in the direction of the given vector $v$? 
For $\vec{u}$, a unit length vector, $\vec{u} = <h,k>$ the directional derivative with respect to $\vec{u}$ at 
$$D_{\vec{u}}(a,b) = lim_{t \to 0} \frac{f(a+th, b +tk) - f(a,b)}{t}$$
For practical purposes, use the formula: $$D_{\vec{u}}f(a,b)= \nabla f_{(a,b)}\cdot{\vec{u}}$$
$||\vec{v}|| = \sqrt{12^2+(-5)^2} = \sqrt{164} = 13$
$\vec{u} = \frac{1}{13}<12,5> = <\frac{12}{13}, -\frac{5}{13}>$
$f(x,y) = e^{xy-y^2}$
$f_{x}(x,y) = e^{xy-y^2}(\frac{\partial}{\partial x}(xy-y^2))$
$=e^{xy-y^2}(y-0) = ye^{xy-y^2}$

$f_{y}(x,y) = e^{xy-y^2}(\frac{\partial}{\partial y}(xy-y^2))$
$=e^{xy-y^2}(x-2y)$

$f_{x}(2,2) = 2e^{2(2) - 2^2} = 2e^0 = 2$
$f_{y}(2,2) = e^{2(2) - 2^2}(2-2(2)) = 1(2-4) = -2$
$D_{\vec{u}}f(2,2)= \nabla f_{(2,2)}\cdot{\vec{u}} = <2,-2> \cdot <\frac{12}{13}, -\frac{5}{13}> =\frac{34}{13}$
If we are standing at (2,2), elevation is changing at a rate of $\frac{34\ distance\ units}{13\ time\ units}$ in our direction vector

#### Example
Determine the direction in which $f$ has a maximum rate of increase from $P$, and give the rate of change in that direction.
Then, find the rate of change in a direction $45^{\circ}$ to the maximum change direction.
$$f(x,y) = xe^{x^2-y}, P=(1,1)$$
Solution:
$f_{x}(x,y) = 1e^{x^2-y} + (x)e^{x^2-y}(2x-0)$
$=e^{x^2-y}+2x^2(e^{x^2}-y)$
$=e^{x^2-y}(2x^2+1)$

$f_{y}(x,y) = xe^{x^2-y}(0-1)=-xe^{x^2-y}$

The direction of maximum increase is going to be the gradient $\nabla$ at $P$
$f_{x}(1,1) = e^{1^2-1}(2(1)^2) + 1) = 2+1=3$
$f_{y}(1,1) = -(1)e^{1^2-1} = -1$
$\nabla f_{(1,1)} = <3,-1>$ is the direction of maximum increase

$\sqrt{3^2+(-1)^2}= \sqrt{10}$

$\vec{u} = <\frac{3}{\sqrt{10}}, -\frac{1}{\sqrt{ 10 }}>$
The rate of change in this direction is $||\nabla f_{(1,1)}|| = \sqrt{10}$
It turns out that if we travel in a direction $\theta$ rotation from the gradient, the rate of change in the new direction is $||\nabla f_{p}||cos \theta = \sqrt{10}cos(45^{\circ}) = \sqrt{10}\frac{\sqrt{2}{2}} = \frac{\sqrt{4}\sqrt{5}}{2} = \frac{2\sqrt{5}}{2} = \sqrt{5}$

## 14.6
#### #14
Use the chain rule to evaluate $\frac{dg}{ds}$ at $s=4$, where 
$g(x,y)=x^2-y^2$
$x=s^2+1$
$y=1-2s$

The general chain rule states:
$$\frac{\partial f}{\partial t_{k}} = <\frac{\partial f}{\partial x_{1}}, \frac{\partial f}{\partial x_{2}},\dots,\frac{\partial f}{\partial x_{i}}>\cdot <\frac{\partial x_{1}}{\partial t_{k}}, \frac{\partial x_{2}}{\partial t_{k}},\dots, \frac{\partial x_{n}}{\partial t_{k}}> = \frac{\partial f}{\partial x_{1}}\cdot\frac{\partial x_{1}}{\partial t_{k}} + \frac{\partial f}{\partial x_{2}}\cdot\frac{\partial x_{2}}{\partial t_{k}}+\dots\frac{\partial x_{n}}{\partial t_{k}}$$
The first vector is $\nabla f$, this is dot product with another vector

For our problem we need $\frac{\partial g}{\partial x}, \frac{\partial g}{\partial y}, \frac{\partial x}{\partial s}, \frac{\partial y}{\partial s}$
$\frac{\partial g}{\partial x} = 2x = 2(s^2+1)$
$\frac{\partial g}{\partial y} = -2y = -2(1-2s)$
$\frac{\partial x}{\partial s} = 2s$
$\frac{\partial y}{\partial s} = -2$
$$\frac{d g}{d s} =\frac{\partial g}{\partial x} \cdot \frac{\partial x}{\partial s} + \frac{\partial g}{\partial y} \cdot \frac{\partial y}{\partial s} = 2(s^2+1)(2s)+(-2)(-1-2s)(-2)$$
To evaluate at $s=4$, plug 4 in for $s$ in the above.

#### #19
A baseball player hits the ball and runs down the first base line at $20\frac{ft}{s}$. The first baseman fields the ball and runs toward first base along the second base line at $18\frac{ft}{s}$.

Determine how the distance between the players is changing when the hitter is $8ft$ from first base and the fielder is $6ft$ from 1st base.
![[baseball.jpeg]]
$d=\sqrt{x^2+y^2}$
What we are looking for mathematically is $\frac{dz}{dt} = \frac{\partial z}{\partial x}\frac{\partial x}{\partial t} + \frac{\partial z}{\partial y}\frac{\partial y}{\partial t}$
Based on the problem text, $\frac{\partial x}{\partial t} = -20$ and $\frac{\partial y}{\partial t} = -18$

$\frac{d z}{d x} = \frac{\partial}{\partial x}\sqrt{x^2+y^2} = \frac{\partial}{\partial x}(x^2 + y^2)^{\frac{1}{2}} = \frac{1}{2}(x^2 + y^2)^{-\frac{1}{2}}(\frac{\partial}{\partial x}[x^2+y^2])$
$=\frac{1}{2}(\frac{1}{(x^2+y^2)^{\frac{1}{2}}})(2x)$
$=\frac{2x}{2\sqrt{x^2+y^2}} = \frac{x}{\sqrt{x^2+y^2}}$
$\frac{d z}{d x}|_{(x,y) = (8,6)} = \frac{8}{\sqrt{8^2+6^2}} = \frac{4}{5}$
$\frac{d z}{d y}|_{(x,y) = (8,6)} = \frac{6}{\sqrt{8^2+6^2}} = \frac{6}{5}$
$\frac{dz}{dt} = \frac{\partial z}{\partial x}\frac{\partial x}{\partial t} + \frac{\partial z}{\partial y}\frac{\partial y}{\partial t}$
$=\frac{4}{5}(-20)+(\frac{3}{5})(-18) = \frac{-134}{5}$
The distance between the players is decreasing at a rate of $\frac{134}{5}\frac{ft}{s}$
