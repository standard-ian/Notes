## 15.1 
#### 15.1 #2 
Compute the Riemann Sum with $M = N = 2$ to estimate the integral of $\sqrt{x+y}$ over $R=[0,1]\times[0,1]$ use the rectangular partition and midpoints of the sub-rectangles as sample points.

$f\left( \frac{1}{4}, \frac{1}{4} \right) = \sqrt{ \frac{1}{2} } =\frac{\sqrt2}{2}$
$f(\frac{3}{4}, \frac{1}{4}) = 1$
$f(\frac{1}{4}, \frac{3}{4}) = 1$
$f(\frac{3}{4}, \frac{3}{4}) = \sqrt{\frac{6}{4}} = \frac{\sqrt{6}}{2}$

There will be a factor of $\frac{1}{4}$ in every partition of the Riemann Sum because the area of each base is $\frac{1}{4}$
So:
$$S_{2,2} = \frac{1}{4}(\frac{\sqrt{ 2 } }{2} + 1 + 1 + \frac{\sqrt{ 6 }}{2})$$
This becomes:
$$\frac{1}{4}(\frac{4+\sqrt{6}+\sqrt{2}}{2}) = \frac{4+\sqrt{6}+\sqrt{2}}{8}$$

#### Example
Evaluate the double integral $$\int^{\frac{\pi}{4}}_{0}\int^{\frac{\pi}{2}}_{\frac{\pi}{4}}cos(2x+y)dy\ dx$$
An irregular curved surface where a given point on this surface is a function of $x, y$ 
We can imagine the area ($A$) as a function of $y$. This is the area of a vertical slice under the surface:
$$A(y) = \int^{x=az}_{x=a_{1}}f(x,y)dx$$
In the above, the function $f(x,y)$ can be treated as a constant.

Then, we integrate with respect to the second variable, we can get volume $V$ to determine the sum of infinitely thin slices of the above area.
$$V = \int^{b_z}_{y=b_1}A(y)dy$$

To evaluate $\int_{0}^{\frac{\pi}{4}}\int_{\frac{\pi}{4}}^{\frac{\pi}{2}}cos(2x+y)dy\ dx$ work inside out.

$u=2x+y$
$du=dy$
$\int^{\frac{\pi}{2}}_{\frac{\pi}{4}} cos(2x+y)dy$ 

$\int^{2x + \frac{\pi}{2}}_{2x+\frac{\pi}{4}} cos(u)du$ 
$=sin(4)|^{2x + \frac{\pi}{2}}_{2x+\frac{\pi}{4}}$
$=sin(2x + \frac{\pi}{2}) - sin(2x+\frac{\pi}{4})$

Now we do the outer integral, after eliminating all $y$
$\int^{\frac{\pi}{4}}_{0}sin(2x + \frac{\pi}{2}) - sin(2x+\frac{\pi}{4})dx$
$\int^{\frac{\pi}{4}}_{0}sin(2x + \frac{\pi}{2})dx - \int^{\frac{\pi}{4}}_{0}sin(2x+\frac{\pi}{4})dx$

On the left:
$u=2x+\frac{\pi}{2}$
$\frac{1}{2}du=dx$
$=\frac{1}{2}\int^{\pi}_{\frac{\pi}{2}}sin(u)du$

On the right:
$u=2x+\frac{\pi}{4}$
$du=2dx$
$\frac{1}{2}du=dx$
$=\frac{1}{2}\int^{\frac{3\pi}{4}}_{\frac{\pi}{4}}sin(u)du$

$=\frac{1}{2}\int^{\pi}_{\frac{\pi}{2}}sin(u)du - =\frac{1}{2}\int^{\frac{3\pi}{4}}_{\frac{\pi}{4}}sin(u)du$

$=\frac{1}{2}[-cos(u)]^{\pi}_{\frac{\pi}{2}} - \frac{1}{2}[-cos(u)]^{\frac{3\pi}{4}}_{\frac{\pi}{4}}$
$=\frac{1}{2}[-(-1)-(-0)]-\frac{1}{2}[0] = \frac{1}{2}$

## 15.2
#### 15.2 #11
Evaluate $\int\int_{D}\frac{y}{x}dA$ where $D$ is the shaded part in the semicircle of radius 2.
Pictured is a semicircle with radius $x=2$. 
The region we are concerned with is the space bounded by the semicircle and the vertical line at $x=1$
This means treat these as independent variables and with respect to $A$ means smaller and smaller slices.
```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
\begin{axis}[
    axis lines=middle,
    xlabel={$x$},
    ylabel={$y$},
    xmin=-0.5, xmax=2.5,
    ymin=-0.5, ymax=1.5,
    axis equal,
    xtick={1,2},
    ytick={},
    samples=100
]

% Fill the shaded region
\addplot[fill=brown!20, draw=none, domain=1:2] {sqrt(1-(x-1)^2)} \closedcycle;

% Draw the semicircle
\addplot[thick, magenta, domain=0:2] {sqrt(1-(x-1)^2)};

\end{axis}
\end{tikzpicture}
\end{document}
```


$$\int_{x=1}^{x=2}\int_{y=f_1(x)}^{y=f_2(x)}\frac{y}{x}dy\ dx$$

OR
$x^2 + y^2 = z^2$
$1 + y^2 = 4$
$y=\sqrt{3}$
$$\int_{y=0}^{y=\sqrt{3}}\int_{x=g_1(y)}^{x=g_2(y)}\frac{y}{x} dx\ dy$$

We can choose the **x-simple** or **y-simple** from the versions above.

If we choose the **y-simple** or **vertically simple**:
$\int_{x=1}^{x=2}\int_{y=0}^{y=\sqrt{4-x^2}}\frac{y}{x} dy\ dx$

If we choose the **x-simple** or **horizontally simple**:
$\int_{y=0}^{y=\sqrt{3}}\int_{x=1}^{x=\sqrt{4-y^2}}\frac{y}{x}dx\ dy$
This version produces $\frac{1}{x}$ which starts to involve natural logs for the inner integral. We should avoid this one.

**Inner:**
$\int_{y=0}^{y=\sqrt{4-x^2}}\frac{y}{x} dy\ dx = \frac{1}{x}\int_{y=0}^{y=\sqrt{4-x^2}}y\ dy = \frac{1}{x}[\frac{y^2}{2}]_{y=0}^{y=\sqrt{4-x^2}} =\frac{1}{2x}[y^2]_{y=0}^{y=\sqrt{4-x^2}}$
$= \frac{1}{2x}[(\sqrt{4-x^2})^2 - 0^2] = \frac{1}{2x}[4-x^2]$
$= \frac{2}{x} - \frac{x}{2}$
**Outer:**
$\int_{x=1}^{x=2} \frac{2}{x} - \frac{x}{2} dx = [2ln(x) - \frac{x^2}{4}]_{x=1}^{x=2}$
$= 2ln(2) -\frac{2^{2}}{4} - (2ln(1) - \frac{1^{2}}{4})$
$=2ln(2) - 1 - (0-\frac{1}{4}) = 2ln(2)-\frac{3}{4}$


#### 15.2 #16
Integrate $f(x,y) = x$ over the region bounded by $y=x$, $y=4x-x^2$ and $y=0$ in two ways: as a vertically simple region and as a horizontally simply region.

```tikz
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
\begin{axis}[
    axis lines=middle,
    xlabel={$x$},
    ylabel={$y$},
    xmin=-0.5, xmax=4.5,
    ymin=-0.5, ymax=4.5,
    samples=100,
    width=10cm,
    height=10cm
]

% Fill the region: under y=x from x=0 to x=3, then under y=4x-x^2 from x=3 to x=4
\addplot[fill=blue!20, draw=none, domain=0:3] {x} \closedcycle;
\addplot[fill=blue!20, draw=none, domain=3:4] {4*x-x^2} \closedcycle;

% Draw the curves
\addplot[thick, red, domain=-0.5:4.5] {x};
\addplot[thick, blue, domain=-0.5:4.5] {4*x-x^2};

% Add labels
\node at (axis cs:1,2) {$y=x$};
\node at (axis cs:2,3.5) {$y=4x-x^2$};

\end{axis}
\end{tikzpicture}
\end{document}
```
$y=x(4-x)$
$x=4x-x^2$
$x^{2}-3x=0$
$x(x-3) = 0$
**Vertically Simple:**
$$\int_{x=0}^{x=3}\int_{y=0}^{y=x}x\ dy\ dx + \int_{x=3}^{x=4}\int_{y=0}^{y=4x-x^2}x\ dy\ dx$$
**Horizontally Simple:**

$y=4x-x^2$
We want this in terms of $x=$
$x^2-4x + y = 0$ and use the quadratic formula
$x=4\pm\frac{\sqrt{16-4(1)y}}{2}$
We want the positive x values, so:
$x=\frac{4+\sqrt{16-4y}}{2}$
$x=4+\frac{\sqrt{4(4-y)}}{2}$
$x=2+\sqrt{4-y}$
$$\int_{y=0}^{y=3}\int_{x=y}^{x=2+\sqrt{4-y}}x\ dx\ dy$$

#### Example
Calculate the integral of $f(x,y) = 8x$ over the region $\mathbb{D}$  bounded above by $y=x(2-x)$ and below by $x=y(2-y)$. Apply the quadratic formula to the lower boundary curve to solve for $y$ as a function of $x$.
```desmos-graph
	left=-1; right=3;
	top=2; bottom=-1;
	---
	y=x(2-x) | green 
	y=1-\sqrt{(1-x)}|red
	
	x(2-x) >y>1-\sqrt{1-x} | orange
```

