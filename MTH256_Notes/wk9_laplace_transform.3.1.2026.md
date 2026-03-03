## Class 1
#### Deriving the Laplace Transform
Laplace Transform takes an equation in the $t$ domain, and transforms it to the $s$ domain. 

The Laplace transform of $x(t)$ is $X(s)$, denoted as $\mathcal{L}\{x(t)\} = X(s)$
Observe that the Laplace transform is a linear operator, meaning that if $x = x(t), y = t$ and $\alpha$ and $\beta$ are constants...
$$\mathcal{L}\{\alpha x+\beta y\} = \int_0^\infty[\alpha x + \beta y]e^{-st}\ dt = \int_0^\infty[\alpha xe^{-st} + \beta ye^{-st}]\ dt$$
$$ = \int_0^{\infty}\alpha xe^{-t}\ dt +\int_0^\infty\beta ye^{-st}\ dt = \alpha\int_0^\infty xe^{-st}\ dt + \beta \int_0^\infty ye^{-st}$$
$$=\alpha\mathcal{L}\{x(t)\} + \beta\mathcal{L}\{y(t)\}$$
We can compute the Laplace transform of many basic functions using the definition.
##### Example with Exponentials
Let $x(t) = e^{at}$
$$X(s) = lim_{b\to \infty}\int_0^be^{at}e^{-st}\ dt$$
$$ = lim_{b\to\infty}\int_0^be^{(a-s)t}\ dt = \frac{1}{a-s}lim_{b\to \infty} e^{(a-s)t}|^{t=b}_{t=0}$$
$$=lim_{b\to\infty}\frac{1}{a-s}(e^{(a-s)b}-1)$$
This limit only exists if $a-s<0$ or $a<s$
Hence, $X(s) = \frac{1}{s-a}$ provided $s>a$
Meaning:
$$\mathcal{L}\{e^{at}\}=\frac{1}{s-a}, s >a$$

For the rest of the class, the limit will be written as:
$$X(s) = \int_0^\infty x(t)e^{-st}\ dt$$
Try to find $\mathcal{L}\{x(t)\}$ for
#####  $x(t) = 1$

$$\int_0^\infty1\times e^{-st}\ dt = \frac{-1}{s}[e^{-st}]_{t=0}^{t=\infty} = -1[\frac{1}{-s}] = \frac{1}{s}$$
##### $x(t) = t$
$$\int_0^\infty te^{-st}\ dt$$
$$\int u\ dv = uv-\int v\ du $$
$u = t$
$\color{orange}du = 1$
$dv = e^{-st}$
$\color{orange} v = -\frac{1}{s}e^{-st}$

$$-\frac{t}{s}e^{-st} - \int -\frac{1}{s}e^{-st} = [-\frac{t}{s}e^{-st}]_0^{\infty} + \frac{1}{s}\int_0^\infty e^{-st} = 0+\frac{1}{s}\frac{1}{s} = \frac{1}{s^2}$$
##### $\mathcal{L}\{t^2\}$
$$\int_0^\infty t^2e^{-st}\ dt$$

| $u$   | $dv$                                       |
| ----- | ------------------------------------------ |
| $t^2$ | $e^{-st}$                                  |
| $2t$  | $\color{orange}+$$\frac{-1}{s}e^{-st}$     |
| $2$   | $\color{orange}-$$\frac{1}{s^2}e{-st}$<br> |
| 0     | $\color{orange}+$$\frac{-1}{s^3}e^{-st}$   |

$$=t^2\left(\frac{-1}{s}e^{-st}\right) |_{t=0}^{t=\infty} - 2t\left(\frac{1}{s^2}e^{-st}\right)|_{t=0}^{t=\infty} + 2\left(\frac{-1}{s^3}e^{-st}\right)|_{t=0}^{t=\infty}$$
$$=2\left(\frac{-1}{s^3}\right)[0-1] = \frac{2}{s^3}, s>0$$

##### Another Trick (Off-topic)
$$(fg)'' = f''g + 2f'g' + fg''$$
$$(fg)''' = f'''g+3f''g' + 3f'g''+fg''$$
#### Inverting the Laplace Transform
The inverse Laplace transform exists but it is too complicated for you now.
Since the Laplace Transform is a linear operator:
$$\mathcal{L}^{-1}\{\alpha X(s) + \beta Y(s)\} = \alpha\mathcal{L}^{-1}\{X(s)\} + \beta\mathcal{L}^{-1}\{Y(s)\}$$
$$\mathcal{L}^{-1}\left\{\frac{1}{s-a}\right\} = e^{-at}$$
$$\mathcal{L}^{-1}\left\{\frac{n!}{s^{n+1}}\right\} = t^{n}$$
What functions have Laplace Transforms?
##### 1. The Improper Integral $\int_0^\infty f(t)e^{-st}$ must exist. Bounded & Continuous
$f$ cannot grow too fast. There must exist constants $M$ and $r$ such that:
$$|f(t)|\leq Me^{rt}$$
For all $t>0$
$f(t)$ should be dominated by the exponential.
##### 2. Piecewise Continuous on $0\leq t\leq \infty$
$f(t)$ has finitely many discontinuities.

Often, we are interested in forcing functions that are discontinuous. i.e the forcing function can be "switched". This is okay too, as long as there are finitely many discontinuities.

Piecewise discontinuous functions like square or triangle waves are of particular interest.
###### Heavy-side Function
$$H(t) = \left\{\begin{matrix}0, t<0\\1, t>0\end{matrix}\right\}$$
And it's translation 8 units to the right
$$H(t-a) = \left\{\begin{matrix}0, t<a\\1, t>a\end{matrix}\right\}$$
We can think of this function as a switch that is "off" for $t<a$ and "on" for $t>a$.

Its Laplace Transform is **relatively** easy to compute.
$$\mathcal{L}\{H(t-1)\} = \int_0^\infty H(t-a)e^{-st}\ dt = -\int_0^a \cancel{0\cdot e^{st}\ dt} + \int_a^\infty1\cdot e^{-st}\ dt$$
$$= \frac{1}{-s}e^{-st}|_{t=a}^{t=\infty} = \frac{1}{-s}[0-e^{-aS}] = \frac{1}{s}e^{-aS}$$
##### Example
Consider
$$f(t) = \left\{\begin{matrix}3,\ 0\leq t <2\\4,\ 2\leq t<3\\2,\ 3\leq t < 6\\0,\ t\geq6\ \ \ \ \ \ \ \end{matrix}\right\}$$
We have 
1. $3H(t)$, Turn 3 on at 0
2. $(4-3)H(t-2)$, Turn 4 on and 2 off at 2
3. $(2 -4)H(t-3)$, Turn 2 on and 4 off at 3
4. $(-2)H(t-6)$, Turn -2 off at 6
$$f(t) = 3H(t) + (4-3)H(t-2) + (2-4)H(t-3) + (-2)H(t-6)$$
$$f(t) = 3H(t) + H(t-2) - 2H(t-3) -2H(t-6)$$
By Linearity
$$F(s) = \mathcal{L}\{f(t)\} = \frac{3}{5} + \frac{1}{5}e^{-2s} - \frac{2}{5}e^{-3s} - \frac{2}{5}e^{-6s}$$