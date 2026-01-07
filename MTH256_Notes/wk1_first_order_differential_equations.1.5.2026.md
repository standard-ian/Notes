## Class 1: Modeling via Differential Equations
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


## Class 2: