## 14.1-2 Functions of Several Variables, Limits, and Continuity
#### Example 1:
At each point, evaluate the function or indicate that the function is undefined there.
$g(x,y)=\frac{y}{x^2-y^2}$ $(1,3), (3,3),(\sqrt{2}, 2)$
$g(1,3) = \frac{3}{1^2-3^2} = -\frac{3}{8}$
...etc - divide by 0 is undefined.

#### Example 2:
Sketch the domain of $g(x,y)=\frac{y}{x^2-y^2}$ 
$x^{2}-y^{2} = 0$ 
$(x+y)(x-y) = 0$
$y + x = 0\rightarrow x = -y$
$x - y = 0 \rightarrow x = y$
$x = \pm y$ 
In the sketch, everything but the points on the lines $y=x$ and $y=-x$ would be excluded

#### Example 3:
Sketch the domain of the function $f(x, y) = \sqrt{81-x^{2}}$
The value of the function doesn't depend on $y$
$81-x^2 \geq 0$
$9^{2}-x^2 \geq 0$
$(9 + x)(9-x) \geq 0$
So, $x=\pm9$ 
We test a single point, say $x=-10$ and check the positivity/negativity of the factors to determine if they satisfy the inequality
At -9 and 9, and for every value in between these values the original equation is greater than 0, so the domain is $x \in [-9,9]$

#### Example 4:
On a flat map we can create curves indicating coordinates that are at the same elevation. 
For the base curve: $h(x,y)=0ft$
One curve up: $h(x,y)=100ft$
Another: $h(x,y)=200ft$ 
Lastly: $h(x,y) = 300ft$

#### Example 5:
Evaluate, if the limit exists:
$\lim_{(x,y)\to(1,2)}e^{-x^{2}+2y}$

Always try to evaluate by direct substitution first. 
$\lim_{(x,y)\to(1,2)}e^{-1^{2}+2(2)} = e^{-1+4} = e^3$

#### Example 6:
Examine $\lim_{(x,y)\to(0,0)}\frac{x^2}{x^2+y^2}$ Prove the limit does not exist.
The quantity denoted $\lim_{(x,y)\to(0,0)}\frac{x^2}{x^2 + y^2}$ only exists along any possible path also exists and if they are all equal.
###### Step 1: try direct substitution
$\lim_{(x,y)\to(0,0)}\frac{x^2}{x^2+y^2} = \frac{0^2}{0^2 + 0^2} = \frac{0}{0}$ Indeterminate form.

###### Step 2: If we suspect the limit does not exist, try approaching as $x=0$, then as $y=0$
Assume y=0 
$\lim_{x\to0}\frac{x^2}{x^2+0^2} = \lim_{x\to0}\frac{x^2}{x^2} = \lim_{x\to0}1 = 1$
Assume y=0 
$\lim_{y\to0}\frac{0^2}{0^2+y^2} = \lim_{y\to0}\frac{0}{y^2} = \lim_{y\to0}0 = 0$
The limits along the chosen paths exist, but are unequal, thus $\lim_{(x,y)\to(0,0)}\frac{x^2}{x^2+y^2} DNE$

#### Example 7:
The standard trick when evaluating limits of expressions in two variables is to translate to polar coordinates.
$(x,y)\to(0,0)$ convert to $r\to0
$x=rcos\theta$
$y=rsin\theta$
$x^2 + y^2 = r^2$

$lim_{(x,y)\to{(0,0)}}\frac{x^2}{x^2+y^2} = lim_{r\to0}\frac{(rcos\theta)^2}{r^2} = lim_{r\to0} cos^2\theta$
Since the limit depends on the variable $\theta$, the limits of the various paths are not equal and $\lim_{(x,y)\to(0,0)}\frac{x^2}{x^2+y^2} DNE$

#### Example 8:
Determine whether or not the following limit exists. Direct substitution will give indeterminite form $\frac{0}{0}$ so we need to use polar coords.
$lim_{(x,y)\to(0,0)}\frac{x^2y}{x^4+y^2} = lim_{r\to0}\frac{(rcos\theta)^2(rsin\theta)}{(rcos\theta)^4+(rsin\theta)^2}$
$=lim_{r\to0}\frac{r^2cos^2\theta(rsin\theta)}{r^4cos^4\theta + r^2sin^2\theta}$
$=lim_{r\to0}\frac{r^3cos^2\theta sin\theta}{r^4cos^4\theta+r^2sin^theta}$
$=lim_{r\to0}\frac{r^3cos^2\theta sin\theta}{r^2(r^2cos^4\theta + sin^2\theta)}$
$=lim_{r\to0}\frac{rcos^2\theta sin\theta}{r^2cos^4\theta+sin^2\theta}$
$=\frac{0(cos^2\theta sin\theta)}{0^2cos^4\theta+sin^2\theta}$
$=\frac{0}{0+sin^2\theta}$
$=\frac{0}{sin^2\theta} = 0$

