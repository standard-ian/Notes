### Reliability
Qualitative: The system works when you power it up.
Qualitative: Probability of the system working.
$0 \leq R(+) \leq 1$

Suppose there are N total units at time $t$
$W(t)$ = working at time $t$
$R(t) = \frac{W(t)}{N}$

Limited by sample size ($N$ in this case)
Small $N$ means not very accurate.
So, add limit:
$R(t) = lim_{n \rightarrow \infty}\frac{W(t)}{N}$

Assume $\lambda$ is constant, **then** $R(t) = e^{-\lambda\ t}$ 

Suppose a system has $m$ components with failure rates: $\lambda_{1}, \lambda_{2}, ..., \lambda_{m}$
What is $R_{sys}(t)$?

$R_{sys}(t) = e^{-\lambda_{1}\ t} \times e^{-\lambda_{2}\ t} \times e^{-\lambda_{3}\ t} \times\ ...\ \times\ e^{-\lambda_{m}\ t}$
$= \displaystyle\prod_{i = 1}^m = e^{-\lambda\ i\ t}$ 
$= e^{-(\lambda_{1} + \lambda_{2} + ... + \lambda_{m})\ \times\ t} = \lambda\ sys$
$\therefore\,\ Rsys(t) = e^{-\lambda sys\ \times\ t}$ 

Mean Time Between Failures (MTBF): if MTBF is 1yr, there is a 68.2% probability of getting a failure.

$MTBF = \frac{1}{\lambda}$

Some MBTFs are extremely long (1000s of years)

$R(t) = e ^{-\lambda\ t}$
$\lambda = \frac{1}{MBTF} \rightarrow R(t) = e^\frac{-t}{e^{MBTF}}$

Also N is not tied to time, so ratio may not reflect relationship$\frac{d}{t}$ the same usits across a time period.

Failure Rate: Number of units that fail during a particular time (per unit time)

Example:
$N = 10,000$ 
Tested for 1000 hrs + 8 failures
$\lambda = \frac{8\ failures}{10^{4} \times 10^{3}} = 8 \times 10^{-7} failures/hr$

FIT = Failure in time $=\frac{1}{10^9\ hrs}$
$\lambda = 800 FITS$ 
$=\frac{8\ failures}{10^{4}\ \times\ 10^{3}}\ \times\ \frac{10^{9}\ hrs}{1\ Failure}$

Bathtub Curve:
![[Pasted image 20250606101834.jpg]]

Reflection coefficient 
Minimizing reflections in the transmission lines
Small chips to build a larger chip, what are the address lines used for
Given FSMs determine the final state given a sequence
Configuring SDRAM
Scan Testing and Boundary Scan

