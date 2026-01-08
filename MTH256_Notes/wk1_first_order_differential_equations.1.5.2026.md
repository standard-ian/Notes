## Class 1: 1.1 Modeling via Differential Equations
#### Differential Equations
A function that relates a function and it's derivatives
One of the primary ways we describe the natural world.
There are many different types:
1. Partial Differential Equations (PDE)
2. Fractional
3. Delay
4. Ordinary (ODE): The dependent variable is a function of one independent variable. Primary focus of this class.
	Examples:
	1. $ax'' + bx' + cx = f(t)$
	2. $x' + p(t) = f(t)$
	3. $\frac{dp}{dt} = rP(1-p)$

#### Example: Exponential Growth/Decay Model
A basic model for the growth of a population can be stated as follows:
"The rate of growth of a population is proportional to the size of the populations"
$t =$ time (independent)
$p =$ population (dependent)
$k =$ proportionality constant
$\frac{dP}{dt} =$ rate of growth

The ODE can then be written:
$$\frac{dP}{dt} = kP$$


What does this model predict?

Will the population ever reach a point where it no longer grows?
No growth: $\frac{dP}{dt} = 0$ 
Since, for population $k > 0$, $\frac{dP}{dt} = 0$ if the initial population $P(t) = 0$
$$\frac{dP}{dt}|_{t=t_0} = k \cdot P(t_0) = k\cdot 0 = 0$$ 
We call $p=0$ an equilibrium solution since there will be no change in the population. The only equilibrium solution is extinction.

Similarly if $P(t_0) > 0$, then $\frac{dP}{dt} > 0$ for all $t$ (unbounded positive growth), and if $P(t_0) < 0$ then $\frac{dP}{dt} < 0$ for all $t$ (unbounded negative growth).

To find an explicit solution consider the initial value problem (IVP):
$\frac{dP}{dt} = kP$
$P(0) = P_0$ 
An IVP consists of *both* an initial condition *and* a differential equation.

We will show later that for an arbitrary constant $C$, $P(t) = Ce^{kt}$ 

$\frac{d}{dt}e^{ft} = ke^{kt}$ 
$\frac{dP}{dt} = kP$ 
Since the constant C is arbitrary, we call this the general solution.

For the initial condition, we have $P(0) = Ce^{ft} = P_0$ 
$Ce^0 - P_0$
$C=P_0$
Therefore $P(t) = P_0 e^{kt}$ is a solution to the IVP.

#### Example: Actual Census Model
The US Census gives pop data every 10 years since 1790. In 1790 the US population was 3.9 million.
$P(0) = 3.9$
Assuming exponential growth:
$P(t) = 3.9e^{kt}$
To find $k$ we use the fact that in 1800 the population was 5.3M

If $t$ is in years, then $P(10) = 5.3 = 3.9e^{k(10)}$
$k = ln(\frac{5.3}{3.9})/10 \approx 0.03067$

The model predicts the population will be governed by the equation:
$P(t) = 3.9e^{0.003067t}$


|      | Actual (M) | Predicted(M) |
| ---- | ---------- | ------------ |
| 1810 | 7.2        | 7.2          |
| 1820 | 8.6        | 9.8          |
| 1830 | 13         | 13           |


If the population continued with purely exponential growth for later years, it is absurd.

|      | Actual (M) | Predicted(M) |
| ---- | ---------- | ------------ |
| 1960 | 17.9       | 717          |
| 1970 | 20.3       | 973          |
| 1980 | 22.6       | 1320         |

Because US territory expands, resources put a cap on this exponential growth.


## Class 2: 1.1 Continued
#### Logistic Model
We now want a model that satisfies:
1. The linear model $\frac{dP}{dt}=kP$ is good when the population is small
2. When the population is large, a negative growth rate is expected

$t=$ time
$p=$ population
$k=$ growth rate (in the absence of competition)

Additional parameter: $n=$ carrying capacity (population size the given resources can support. growth should be negative beyond this)


Starting from $\frac{dP}{dt}=kP\cdot x$
where $x$ is some other thing that takes in to account:

that is if $P(t) > N$:
$\frac{dP}{dt} < 0$ 

if $P(t) < N$:
$\frac{dP}{dt} > 0$

The simplest function that satisfies these assumptions is $x=1-\frac{P}{N}$

Notice:
1. If $P = N$ $\frac{dP}{dt} = 0$ (no growth, equilibrium
2. If $P>N$, $(1-\frac{P}{N}) < 0$
3. If $P<N$, $(1-\frac{P}{N}) > 0$

So the model is the logistic growth model:
$\frac{dP}{dt}=kP(1-\frac{P}{N})$

To represent this:
Find all the equilibrium solutions. This happens when $\frac{dP}{dt} = 0$. Set $\frac{dP}{dt} = 0$ and solve for P. In the case above, these is equilibrium at 0 and $N$.

And graphically the result would be a downward facing parabola with zeros at 0 and $N$ where the $y$ axis is $\frac{dP}{dt}$ and the $x$ axis is $P$.
Thus:
if $P<0$ , then $\frac{dP}{dt} < 0$
if $0<P<N$, then $\frac{dP}{dt} > 0$ 
if $P > N$, then $\frac{dP}{dt} < 0$

#### Section 1.2 Separation of Variables
The standard form of a first order ODE is $\frac{dy}{dt} = f(t,y)$

A solution is any function $y(t)$ that can be substituted into the above and satisfy the equation for all values of $t$

##### Example
Determine whether:
$y_1(t) = 3e^t$
$y_2(t) = sin(t)$ 
are solutions to $y' = y$

Look at left hand side and right hand side, try to determine if they can be manipulated to be equal

For $y_1(t)$:
Left: $y_1(t)' = \frac{d}{dt} 3e^t = 3e^t$ 
Right:  $y_{1}(t) = 3e^t$
So it is a solution.

For $y_2(t)$:
Left: $y_2(t)' = cos(t)$
Right: $y_2(t) = sin(t)$
So it is not a solution.

##### Example
Verify that $y(t) = 1+t$ is a solution to the differential equation $\frac{dy}{dt} = \frac{y^2 + 1}{t^2 + 2t}$

Left: $\frac{d}{dt}y = \frac{d}{dt}(1+t) = 1$
Right: $\frac{y^2 + 1}{t^2 + 2t} = \frac{(1+t)^2 - 1}{t^2 + 2t} = \frac{t^2 + 2t + 1 -1}{t^2 + 2t} = 1$
Since left=right for all $t$ $y(t)$ is a solution to the differential equation.

##### Example
Determine whether $x(t) = \frac{t}{2} + \frac{2}{t}$ is a solution to the IVP:
$x' + \frac{1}{t}x =1$
$x(1)=\frac{5}{2}$
$x' = \frac{1}{2} + 2t^{-2}$
$x' +\frac{1}{t}x = (\frac{1}{2} + 2t^{-2}) + \frac{1}{t}(\frac{t}{2} + \frac{2}{t}) = 1$
and $x(1) = \frac{1}{2} + \frac{4}{2} = \frac{5}{2}$

Recall an IVP has the form $\frac{dy}{dt} = f(x,y)$ and $y(t_{0}) = y_{0}$
A function $y(t)$ is a solution to the IVP if it satisfies **both** the diff eq and the initial condition
##### Example
Find the solution to the IVP:
$\frac{dy}{dt} = 12t^3 - 2sin(t)$
$y(0) =3$ 
Since the right side of the diff eq is only a function of $t$, we solve by integrating with respect to $t$:
$$\int\frac{dy}{dt}\ dt = \int(12t^3 - 2sin(t)) dt$$
$$y=3t^4 + 2cos(t) + C$$
This family of solutions is called the general solution. It solves the differential equation for any possible initial value condition. To solve the IVP, we need the value of $C$ that satisfies the given IC.

$y(0) = 3 = 3(0)^4 + 2cos(0) + C$
$C= 3-2 = 1$
Thus: $y(t) = 3t^4 + 2cos(t) + 1$ is the solution to the IVP

#### Separable Equations
$\frac{dy}{dt} = f(t,y)$ 
A DE can be called separable if it can be written in the form $y'=g(t)h(y)$

For example:
1. $\frac{dy}{dt} = ty$ 
2. $\frac{dy}{dt} = \frac{t+ 1}{t(y +1)} = (\frac{t+1}{t})(\frac{1}{y+1})$

$y' = yt^2 + 1$ is not separable however. 

##### Two Special Cases
1. $\frac{dy}{dt} = g(t)$ Solve this by integrating with respect to $t$
2. $\frac{dx}{dt} = d(x)$ "Autonomous" DE, for example the logistic growth equation.

#### Method of Separation of Variables
Consider the separable ODE:
$\frac{dy}{dt} = g(t)h(y)$
1. Move everything with $h(y)$ over to the left hand side, leave $g(t)$ on the right, "separating" the variables.
	$\frac{1}{h(y)} \frac{dy}{dt} = g(t)$
2. Integrate with respect to $t$
	$\int \frac{1}{h(y)} \frac{dy}{dt} dt =\int g(t) dt$
3. The integral on the right hand side is straightforward, but what about the left?
	Recall $y$ is a function of $t$. $y = y(t)$
	So on the left, we really have $\int\frac{1}{h(y(t))} \frac{dy}{dy} dt$ 
	We can then make the substitution $u=y(t)$
	$du = \frac{dy}{dt} dt$
	Making the left simply $\int\frac{1}{h(u)} du$
4. Since $u$ is a dummy variable we can write in terms of $y$:
	$\int\frac{1}{h(y)} dy = \int g(t) dt$

Since step 4 is always true, we can "cheat" a little, gathering the $y$'s on the left and the $t$'s on the right
$\frac{1}{h(y)} dy = g(t) dt$
and integrate
$\int\frac{dy}{h(y)} = \int g(t) dt$ 
Integrating and solving for $y$ gives the general solution.

##### Example
Find the general solution to the DE $\frac{dy}{dt} = 2-y$ 
This is a linear, first order, separable equation

$\frac{dy}{dt} = -(y-2)$ re-writing in this form will save additional negative when taking the integral

$\int\frac{dy}{y-2} = \int -1 dt$
$ln|y-2| = -t + C$
$e^{ln|y-2|}= e^{-t + C}$
$|y-2| = e^C e^{-t}$ (re-write $e^{-t+C}$)
Next, let $A = \pm e^C$, which allows us to drop the absolute value bars.

Now:
$y-2 = Ae^-t$
$y(t) = Ae^{-t} + 2$

**Review partial fraction decomposition** 

##### Example Solve the IVP
$\frac{dy}{dt} = \frac{t}{y-t^2y}$
$y(\sqrt{2})=4$

$\frac{dy}{dt} = \frac{t}{y(1-t^2)}$
Implies:
$\int y dy = \int \frac{t}{1-t^2} dt$

On the left:
$\int ydy = \frac{y^2}{2} + C$ 

Using u-sub on the right:
$\int\frac{t}{t^2 -1}dt$
$u = t^2 -1$
$\frac{du}{2} = tdt$
$-\int\frac{t}{t^2-1}dt = -\frac{1}{2}\int \frac{1}{u} du$ 
$=-\frac{1}{2}ln|u| + C$
$=-\frac{1}{2} ln|t^2 -1| + C$
$=ln|\frac{1}{\sqrt{t^2 - 1}} + C$

Thus:
$\frac{y^2}{2} = -\frac{1}{2} ln|t^2 -1| + C$
$y^2 = C - ln|t^2 - 1|$
$y = \pm \sqrt{C-ln|t^2 -1|}$
$y(t) = \sqrt{C - ln(t^2 - 1)}$

To satisfy the IC:
$y(\sqrt{2}) = 4 = \sqrt{C - ln(t^2 -1)}$ 
$16 = C-ln(2-1)$
$C = 16$

Hence:
$y(t) = \sqrt{16 - ln(t^2 -1)}$ 
		







