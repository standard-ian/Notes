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
