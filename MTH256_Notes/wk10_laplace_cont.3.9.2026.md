## Class 1
#### Shift Property and Switching Property of Laplace Transform
##### Shift
$$\mathcal{L}\{f(t)e^{at}\} = F(s-a)$$
$$\mathcal{L}^{-1}\{F(s-a)\} = f(t)e^{at}$$
##### Switching
$$\mathcal{L}\{H(t-a)f(t-a)\} = e^{-as}F(s)$$
$$\mathcal{L}^{-1}\{e^{-as}F(s)\} = H(t-a)f(t-a)$$
##### Example
Find the Laplace transform of
$$f(t) = te^{-2t}$$
$$\mathcal{L}\{te^{-2t}\}$$
$$f(t) = t;\ e^{at} = e^{-2t}$$
$$F(s) = \frac{1}{s^2}$$
And since $a$ in $e^{-2t}$ is $-2$, 
We know the transform should be $F(s-a) = F(s-(-2))$
$$\mathcal{L}\{te^{-2t}\} = \frac{1}{(s + 2)^2}$$

##### Example
Find the inverse transform of
$$F(s) = \frac{1}{s-2}e^{-3s}$$
We know:
$$\mathcal{L}^{-1}\{e^{-as}F(s)\} = H(t-a)f(t-a)$$
Letting $a=3$ and $F(s) = \frac{1}{s-2}$.
$$\mathcal{L}^{-1}\left\{\frac{1}{s-2}\right\} = e^{2t} = f(t)$$

$$\mathcal{L}^{-1}\left\{\frac{1}{s-2}e^{-3s}\right\} = H(t-3)e^{2(t-3)}$$
#### Applying to Ordinary Differential Equations
##### Theorem
Let $x(t)$ be a function and $X(s)$ it's Laplace Transform.
Then:
$$\mathcal{L}\{x'\} = sX(s) - x(0)$$
$$\mathcal{L}\{x''\} = s^2X(s) - sx(0) - x'(0)$$
##### Proof
Consider:
$$\mathcal{L}\{x'\} = \int_0^\infty x'(t)e^{-st}\ dt$$
$$= e^{-st} x(t)|_0^\infty - \int_0^\infty-se^{-st} x(t)\ dt$$
If $x(t)$ has a Laplace transform, then at infinity the left portion of the above is just $x(0)$.
$$= -x(0) + s\int_0^\infty e^{-st}x(t) dt = s X(s) - x(0)$$
And:
$$\mathcal{L}\{x''\} = \mathcal{L}\{(x')'\} = \mathcal{L}\{u'\} = s\mathcal{L}\{u\} - u(0) = s\mathcal{L}\{x'\} - x'(0)$$
$$= s(sX(s) - x(0)) - x'(0)$$
$$= s^2X(s) - sx(0) - x'(0)$$
#### IVPs
$$x'' + k^2x =0$$
$$x(0) = 0$$
$$x'(0) = 1$$
Taking the Laplace Transform, linear and constants can be pulled out ($k^2$ is a constant):
$$\mathcal{L}\{x''\} + k^2 \mathcal{L}\{x\} = \mathcal{L}\{0\}$$
Hence
$$s^2X(s) - sx(0) - x'(0) + k^2X(s) = 0$$
$$s^2X(s) + k^2X(s) = s$$
$$X(s)\cdot(s^2 + k^2) = 1$$
Hence
$$X(s) = \frac{1}{s^2 + k^2} = \frac{1}{k}\left(\frac{k}{s^2 + k^2}\right)$$
$$x(t) = \frac{1}{k}sin(kt)$$
#### Completing the Square
A common problem when solving ODEs is:
$$X(s) = \frac{1}{s^2 + bs + C}$$
If the denominator can't be factored, we'll need to complete the square.

Consider:
$$X(s) = \frac{1}{s^2 + 3s + 5} = \frac{1}{s^2 + 3s + \left(\frac{3}{2}\right)^2 - \left(\frac{3}{2}\right)^2 + 6}$$
$$=\frac{1}{\left(s + \frac{3}{2}\right)^2 + \frac{15}{4}} = \frac{1}{\left(s + \frac{3}{2}\right)^2 + \left(\frac{\sqrt{15}}{2}\right)^2}$$
$$= \left(\frac{2}{\sqrt{15}}\right)\frac{\sqrt{15}/2}{\left(s+\frac{3}{2}\right)^2 + \left(\frac{\sqrt{15}}{2}\right)^2}$$
This matches:
$$\mathcal{L}\left\{e^{at}sin(kt)\right\} = \frac{k}{(s-a)^2 + k^2}$$
With $a = \frac{-3}{2}$ and $k = \frac{\sqrt{15}}{2}$ 
$$x(t) = \frac{2}{\sqrt{15}}e^{\frac{-3}{2}t}\sin\left(\frac{\sqrt{15}}{2}t\right)$$
## Class 2
#### Example
Solve the IVP using Laplace Transforms.
$$x'' - 2x' +2x = e^{-t}$$
$$x(0) = 0;\ \ x'(0) = 1$$
We have:
$$\mathcal{L}\{x'' - 2x' + 2x\} = \mathcal{L}\{e^{-t}\}$$
$$\mathcal{L}\{x''\} -2\mathcal{L}\{x'\} + 2\mathcal{L}\{x\} = \frac{1}{s+1}$$
Right side is:
$$\mathcal{L}\{e^{at}\} = \frac{1}{s-a};\ w/\ a=-1$$
Next:
$$\mathcal{L}\{x''\} = s^2X(s) - \cancel{sx(0)} - 1 \cancel{x'(0)}$$
$$\mathcal{L}\{x'\} = s2X(s) - \cancel{x(0)} $$
$$\mathcal{L}\{x\} = X(s)$$
Hence:
$$s^2X(s) - 1 -2(sX(s)) + sX(s) = \frac{1}{s + 1}$$
$$X(s)(s^2 -2s + 2) - 1 = \frac{1}{s+1}$$
$$X(s) = \frac{1}{s^2-2s+2} + \frac{1}{(s+1)(s^2+2s + 2)}$$
Note $s^2-2s+2$ does not factor since $b^2-4ac < 0$.

Partial Fraction Decomposition
$$\frac{1}{(s+1)(s^2 + 2s + 2)} = \frac{A}{s+1} + \frac{Bs + C}{s^2 -2s + 2}$$
$$1 = A(s^2 + 2s + 2) + (Bs+C)(s+1)$$
$$\ \ \ \ \ \ \ \ 1 = As^2 -2AS + 2A$$
$$+ Bs^2\ +\ \ Bs$$
$$\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ +Cs\ \ \ \  + C$$
$A+B =0$
$-2A + B = 0$
$2A + B = 1$

$A = \frac{1}{5}$
$B = -\frac{1}{5}$
$C = \frac{3}{5}$

Thus
$$X(s) = \frac{1}{5(s+1)}+\frac{-s+3}{5(s^2 - 2s+2)} + \frac{1}{s^2-2s + 2}$$
$$=\frac{1}{5(s+1)} + \frac{-s + 8}{5(s^2 -2s+2)} = \frac{1}{5(s+1)} + \frac{-s + 8}{5((s^2-2s+2) - 1 + 2)}$$
$$ = \frac{1}{5(s+1)} + \frac{-2+8}{5((2-1)^2 + 1)} = \frac{1}{5(s+1)}-\frac{1}{5}\left[\frac{s-1-7}{((s-1)^2 + 1)}\right]$$
$$=\frac{1}{5(s+1)} - \frac{1}{5}\left[\frac{s-1}{((s-1)^2 + 1)} - \frac{7}{(s-1^2) + 1}\right]$$
This gives:
$$x(t) = \frac{1}{5}\mathcal{L}^{-1}\left[\frac{1}{s+1}\right] - \frac{1}{5}\mathcal{L}^{-1}\left[\frac{s-1}{(s-1)^2 + 1}\right] + \frac{7}{3}\left[\frac{1}{(s-1)^2 + 1}\right]$$
$$=\frac{1}{5}e^{-t} -\frac{1}{5}e^t\cos(t) + \frac{7}{3}e^t\sin(t)$$
This is a lot, and this might not be the best method to solve this IVP.

#### IVPs with Piecewise Continuous Forcing

Consider:
	$$f(t) = \left\{\begin{matrix}t,\ 0\leq t \lt 1\\ 2,\ 1\leq t \lt 3\\ 0,\ t\ge 3\ \ \ \ \ \ \ \end{matrix}\right\}$$
Find $\mathcal{L}[f(t)]$.

In terms of Heavyside functions:
$$f(t) = t + (2-t)H(t-1) + (0-2)H(t-3)$$
$$F(s) = \mathcal{L}[t] + 2\mathcal{L}[H(t-1)] -\mathcal{L}[tH(t-1)] - 2\mathcal{L}[H(t-3)]$$
Directly from the table:
$$\mathcal{L}[t] = \frac{1}{s^2}$$
$$\mathcal{L}[t^n] = \frac{n!}{s^{n+1}}$$
And 
$$2\mathcal{L}[H(t-1)] = \frac{2}{s}e^{-s},\ 2\mathcal{L}[H(t-3)] = \frac{2}{s}e^{-3s}$$
Since 
$$\mathcal{L}[H(t-a)] = \frac{1}{s}e^{-as}$$
Finally, using:
$$\mathcal{L}[f(t)H(t-a)] = e^{-as}\mathcal{L}[f(t-a)]$$
with $f(t) = t$ and $a=1$

Gives:
$$\mathcal{L}[tH(t-1)] = e^{-s}\mathcal{L}[t+1] = e^{-s}\left(\frac{1}{s^2} + \frac{1}{s}\right)$$
Finally:
$$F(s) = \frac{1}{s^2} + \frac{2}{s}e^{-s} - e^{-s}\left(\frac{1}{s^2} + \frac{1}{s}\right) - \frac{2}{s}e^{-3s}$$
#### Example
Solve the IVP
$$x' + 5x = H(t-2),\ x(0) = 1$$
$$\mathcal{L}[x'+5x] = \mathcal{L}[H(t-2]$$
$$sX(s) - x(0) + sX(s) = \frac{1}{s}e^{-2s}$$
$$X(s)(s+5) = \frac{1}{s}e^{-2s} + 1$$
$$X(s) = e^{-2s}\frac{1}{s(s+5)} + \frac{1}{s+5}$$
Partial Fraction Decomp
$$\frac{1}{s(s+5)} = \frac{A}{s} + \frac{B}{s+5}$$
$$1 = A (s+5) + B(s)$$
$s=-5$ 
$$1 = -5B,\ B = -\frac{1}{5}$$
$s=0$
$$1 = 5A,\ A = \frac{1}{5}$$
$$X(s) = e^{-2s}\left(\frac{1}{5s}\right) - e^{-2s}\left(\frac{1}{5(s+5)}\right) + \frac{1}{s+5}$$
$$x(t) = \frac{1}{5}\mathcal{L}^{-1}\left[e^{-2s}\frac{1}{5}\right] - \frac{1}{5}\mathcal{L}^{-1}\left[e^{-2s}\frac{1}{s+5}\right] + \mathcal{L}^{-1}\left[\frac{1}{s+5}\right]$$
$$x(t) = \frac{1}{5}H(t-2) - \frac{1}{5}H(t-2)e^{-5(t-2)} + e^{-5t}$$
