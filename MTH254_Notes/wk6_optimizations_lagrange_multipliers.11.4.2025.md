## 14.7 Optimization in Several Variables

In single variable calculus, we were concerned with where the rate of change (tangent line to the function) has a slope of 0.
We were looking for "critical points" and often performed a "second derivative test" if the second derivative was negative, local max, if it was positive, local max. If it's 0, inconclusive.

If we're now in 3 space, this is a tangent plane, where that plane's normal vector is pointing directly up or directly down.

The general equation for the tangent plane to a curve $z=f(x,y)$ at the point $(a,b)$
$$z=f(a,b)+f_{x}(a,b)(x-a)+f_{y}(a,b)(y-b)$$
To have a plane parallel to the $z$ axis, $z$ has to equal a constant in the above equation. For this to happen, both partial derivatives will have to be 0.

In 3 space, the "critical points" are where $\frac{\partial f}{\partial x} = 0$ or undefined and $\frac{\partial f}{\partial y} = 0$ or undefined 

The 3 space analog for the **second derivative test**:
1. Let some point $P=(a,b)$ be a critical $f(x,y)$
2. Assume $f_{xx}$, $f_{yy}$, and $f_{xy}$ are continuous in some disk containing $(a,b)$
3. Then, the discriminant $D=\begin{vmatrix} f_{xx}(a,b) & f_{xy}(a,b) \\ f_{yx}(a,b) & f_{yy}(a,b)\end{vmatrix} = f_{xx}(a,b)f_{yy}(a,b)-[f_{xy}(a,b)]^2$
4. The following list of cases is exhaustive:
	1. $D \gt 0$ and $f_{xx}(a,b) \gt 0$, $(a,b)$ is a local min
	2. $D \gt 0$ and $f_{xx}(a,b) \lt 0$, $(a,b)$ is a local max
	3. $D\lt 0$, $f$ has a saddle point at $(a,b)$
	4. $D=0$, the test is inconclusive

#### Example 
Find the critical points of the function and use the second derivative test to determine if they are local max, min, saddle, or inconclusive.
$f(x,y) = x^{3}-xy+y^3$

1. Find solutions to the system $f_{x} = 0$, $f_{y} = 0$
	 $f_{x} = 3x^{2}-y$
	$f_{y} = -x+3y^2$

	$3x^{2}-y = 0$
	$3y^{2}-x=0$
	By checking edge cases (where either x or y are equal to 0), (0,0) is a solution to this system
	could rewrite as:
	$3x^{2} = y$
	$3y^{2} = x$
	
	We can substitute to get: 
	$3(3x^2)^{2}-x = 0$
	$3(9x^{4})-x=0$
	$27x^{4}-x = 0$
	$x(27x^{3} - 1) = 0$

	Either $x=0$ or $27x^{3}-1=0$
	So, $x=0$ or $x=\frac{1}{3}$

	Now we can substitute these $x$ values back into the original equations to see what $y$ could be.
	1. For $x=0$:
		1. $3(0)^{2}-y = 0$
		2. $3y^{2} - 0 = 0$ 
		3. critical point 1: $(0,0)$
	2. For $x=\frac{1}{3}$
		1. Using our previous substitution, $3(\frac{1}{3})^{2} = y$
		2. $\frac{1}{3} = y$
		3. critical point 2: $(\frac{1}{3}, \frac{1}{3})$

	Critical numbers: $(0,0)$, $(\frac{1}{3}, \frac{1}{3})$
	$f_{x}=3x^{2}-y \rightarrow f_{xx}=6x$
	$f_{y} = 3y^{2}-x \rightarrow f_{yy} = 6y$
	$f_{xy}=\frac{\partial}{\partial y}[3x^{2}-y] = 0-1 = -1$ (This is going to be equivalent to $f_{yx}$)
	
	$D(0,0) = f_{xx}(0,0)f_{yy}(0,0)-[f_{xy}(0,0)]^2$
	$=0(0)-(-1)^2 = 0-1=-1$
	$D \lt 0$ so $D(0,0)$ is a saddle point for this function!
	
	$D(\frac{1}{3},\frac{1}{3}) = f_{xx}(\frac{1}{3},\frac{1}{3})f_{yy}(\frac{1}{3},\frac{1}{3})-[f_{xy}(\frac{1}{3},\frac{1}{3})]^2$
	$=2(2)-(-1)^2 = 4-1 = 3$
	$D>0$ and $f_{xx}(\frac{1}{3}, \frac{1}{3}) \gt 0$ so $D(\frac{1}{3}, \frac{1}{3})$ is a local min!

#### Global Mins and Maxes
We need to also check the endpoints of an interval, because the global max might not be at a critical point.
Similarly, in 3 space we have to do the same
#### Example
Find the global extrema of the function on the given domain.
$f(x,y) = x^{3}+x^{2}y+2y^{2}$
$x,y \ge 0$
$x+y \le 1$

Looking down so that the $z$ axis is coming straight up at us:
The function is the region in the first quadrant, below and at the line $y=1-x$ and greater than or at the lines at $x=0$ and $y=0$

We're looking for critical points inside this triangle, then we also need to consider the extreme values at the border lines.

###### To start, we'll search for critical points on the interior of this region.
$f_{x} = 3x^{2} + 2xy$
$f_{y} = x^{2} + 4y$

$0=x^{2} + 4y$ is a better starting place because variables are not being multiplied together.
We'll solve this for $y$ and substitute it in to $f_{x}  =0$

$y=-\frac{x^{2}}{4}$

$3x^{2} + 2x(-\frac{x^{2}}{4}) = 0$
$0=3x^{2}-\frac{1}{2}x^{3}$

We can make this easier by multiplying everything by 2 to clear denominators
$0=6x^{2}-x^3$
$0=(6-x)x^2$

We already have a formula for $y$ given $x$:
$y=-\frac{x^{2}}{4}$
$y=-\frac{(6)^2}{4} = -\frac{36}{4} = -9$
$y=-\frac{(0)^{2}}{4} = 0$

Critical points would be $(6, -9)$ and $(0,0)$
$x=6$ is not in the given domain.
$x=0$ is on the border.

This portion of the problem (dealing with the interior of the domain) will potentially generate a list of critical points. 
If we found critical points, we'd then plug all these back in to the original function to see which was the global extrema.

######  Now for the boundary
We have 3 sides of a triangle, so we need 3 functions to describe each side.
We'll call the y-axis boundary 1, x-axis boundary 2, and the hypotenuse boundary 3.
$b_1(y) = f(0,y) = 2y^{2}$ so $y\in [0,1]$
$b_{2}(x) = f(x,0)=x^3$ so $x\in[0,1]$
To deal with the hypotenuse, we need to use the constraint that $x+y = 1$ We replace all the $y$ values with $-x+1$
$b_{3}(x) = f(x,-x+1)=x^{3} + x^{2}(-x+1) + 2(-x+1)^{2}$ so $x\in[0,1]$

These boundaries meet at the points $(0,0)$, $(1,0)$, and $(0,1)$. With this noted, we need not test end values of our intervals because they are the endpoints of the boundaries.

$b_{1}'(y) = 4y$
$4y=0$
$y=0$
Not in interior of $[0,1]$

$b_{2}'(x) = 3x^{2}$
$3x^{2} = 0$
$x=0$
Not in interior of $[0,1]$

$b_{3}(x) = x^{3} + x^{2}(-x+1) + 2(-x+1)^2$
$=x^{3} - x^{3} + x^{2} + 2(x^{2}-2x + 1)$
$=3x^2 + -4x+2$

$b_{3}'(x) = 6x-4$
$x=\frac{4}{6} = \frac{2}{3}$

We just plug this $x=\frac{2}{3}$ back in to $b_{3}$

$3\left( \frac{2}{3} \right)^2 - 4\left( \frac{2}{3} \right) + 2$
$=3(\frac{4}{9}) - \frac{8}{3} + \frac{6}{3} = \frac{2}{3}$

$f(\frac{2}{3}, \frac{1}{3}) = b_{3}(\frac{2}{3}) = \frac{2}{3}$
$f(0,0) = 0$
$f(1,0) = 1 + 0 + 0 = 1$
$f(0,1) = 0 + 0 + 2 = 2$

The global maximum is the biggest, 2, occurring at $(x,y) = (0,1)$
The global minimum is the smallest, 0, occurring at $(x,y) = (0,0)$


## 14.8 Lagrange Multipliers: Optimizing with a Constraint
We are trying to optimize a function $f(x,y)$
Create a constraint $g(x,y)$ where the value of $g$ does not change at any point along that curve. At every point along this curve, the gradient of $g$ is perpendicular to $g$
As we move along the constraint curve, we may eventually get to a point where the gradient of $f$ is perpendicular to the tangent to the $g$ constraint curve
We're looking for a point $P$ where the constrain curve's gradient is a constant scalar multiple of the gradient of the function we're trying to optimize.

This constant is referred to as $\lambda$.
In 3 dimensions, when we are optimizing a 4th we need additional constraint curve and additional constant scalar

#### Example
Find the minimum and maximum values of the function subject to the given constraint.

$f(x,y) = x^{2}y+x+y$
Constraint: $xy=4$

The constraint $xy=4$ is equivalent to $xy-4=0$
We can consider this a level curve of the function $g(x,y)=xy-4$

We need a second equation. We get that using Lagrange multipliers.
We are looking for the point where $\nabla f = \lambda \nabla g$

$f_{x} = \lambda g_{x}$
$2xy+1 = \lambda(y)$
$\frac{2xy + 1}{y} = \lambda$

$f_{y} = \lambda g_{y}$
$x^{2} + 1=\lambda(x)$
$\frac{x^{2} + 1}{x}=\lambda$

**Now we can solve each of these for lambda and set them equal to each other, giving us another equation with just $x$ and $y$.**
$x(2xy+1) = y(x^{2}+1)$

We now have 2 equations and 2 unknowns:
1. $x(2xy+1) = y(x^{2}+1)$
2. $xy=4$

Using substitution we can rewrite 1 as:
$x(2x(\frac{4}{x})+1)=(\frac{4}{x})(x^{2}+1)$
$9x=4x+\frac{4}{x}$
$9x^{2} = 4x^{2} + 4$
$5x^{2}=4$
$x^{2} = \frac{4}{5}$
$x=\pm\sqrt{\frac{4}{5}}$
$=\pm\frac{2\sqrt{5}}{5}$

To find the corresponding $y$ coordinates:
$y=\frac{4}{x}$
When $x=\frac{2\sqrt{5}}{5}$
$y=\frac{4}{\frac{2}{\sqrt{5}}} = 2\sqrt{5}$

When $x=-\frac{2\sqrt{5}}{5}$
$y=-2\sqrt{5}$

So the points are:
$(\frac{2\sqrt{5}}{5}, 2\sqrt{5})$
$(-\frac{2\sqrt{5}}{5}, -2\sqrt{5})$

Recall $f(x,y) = x^{2}y+x+y$
$f\left( \frac{2\sqrt{5}}{5}, 2\sqrt{5} \right) = \frac{8}{\sqrt{5}} + \frac{2}{\sqrt{5}} + 2\sqrt{5} = 4\sqrt{5}$
$f(-\frac{2\sqrt{5}}{5}, -2\sqrt{5}) = -4\sqrt{5}$
The maximum value of $f$ subject to the given constraint is $4\sqrt{5}$
The min is $-4\sqrt{5}$

#### Example
Find the rectangular box of maximum volume if the sum of the lengths of the edges is $300cm$
$4x + 4y + 4z = 300$
$f(x,y,z)= xyz$

$4x + 4y + 4z -300 = 0$
$g(x,y,z) = 4x+4y+4z - 300$
$\nabla f = \lambda \nabla g$

$f_{x} = yz = 4 \lambda$
$f_{y} = xz = 4\lambda$
$f_{z} = xy = 4\lambda$ 
And all partial derivatives of $g$ are $=4$

The end result is, shockingly, a cube with volume $25^{3}cm^3$

#### Example
Find the maximum of $f(x,y) = 2x+5y$ on the ellipse $(\frac{x}{4})^{2} + (\frac{y}{3})^{2} = 1$
1. Use the Lagrange multiplier method.
	1. $f(x,y) = 2x+5y$
	2. $(\frac{x}{4})^{2} + (\frac{y}{3})^{2} = 1\rightarrow 9x^{2} + 16y^{2} = 144$
	3. $g(x,y) = 9x^{2} + 16y^{2} -144 = 0$
		$f_{x} = 2$
		$f_{y} = 5$

		$g_{x} = 18x$
		$g_{y} = 32y$

		$\lambda = \frac{1}{9x}$
		$\lambda = \frac{5}{32y}$
		
		$2=18x$
		$5=32y$

		We now have 2 equations and 2 unknowns
		$32y = 45x$
		$(\frac{x}{4})^{2} + (\frac{y}{3})^{2} = 1$
		
		
		
	
2. Parametrize the ellipse and use single variable calculus.

