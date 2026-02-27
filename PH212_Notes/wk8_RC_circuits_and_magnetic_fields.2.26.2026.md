## Class 1
Midterm 2
## Class 2
#### RC Circuits
Around a loop in a basic RC circuit while charging

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[battery, l=$\mathcal{E}$, invert]++(0,2)
	to[R=$R$, i_>=$i(t)$]++(2,0)
	to[capacitor, a=$C$, l=$V_C(t)$]++(0,-2)--++(-2,0);
	
\end{circuitikz}
\end{document}
```

$$\mathcal{E} - i(t)R -V_C(t) = 0$$
$V_C(t) = \frac{q(t)}{C}$
$$\mathcal{E} - i(t)R -\frac{q(t)}{C} = 0$$
Current is the derivative of charge $i(t) = \frac{dq}{dt}$. This gives a  separable differential equation.
$$\mathcal{E} - \frac{dq}{dt}R -\frac{q(t)}{C} = 0$$
$$\frac{dq}{dt}R = \mathcal{E}-\frac{q(t)}{C}$$
$$\to\frac{dq}{dt}RC = \mathcal{E}C-q(t)$$
$$\int_0^q\frac{dq'}{\mathcal{E}C-q(t)} = \int_0^t\frac{dt'}{RC}$$
$$-ln(\mathcal{E}C-q')|_0^q = \frac{t}{RC}$$
$$ln(\mathcal{E}C-q) - ln(\mathcal{E}C) = -\frac{t}{RC}$$
$$ln\left(\frac{\mathcal{E}C-q}{\mathcal{E}C}\right) = -\frac{t}{RC}\to ln\left(1-\frac{q}{\mathcal{E}C}\right) = -\frac{t}{RC}$$
$$1 - \frac{q}{\mathcal{E}C} = e^{-\frac{t}{RC}}$$
$$q = \mathcal{E}C(1 -e^{-\frac{t}{RC}})$$
$$q(t) = Q(1-e^{-\frac{t}{\tau}})\text{ Where: } \tau = RC$$
#### Magnetic Forces and Fields
