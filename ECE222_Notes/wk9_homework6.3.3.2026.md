## Homework 6
#### 1. Transfer function definition
A transfer function is the ratio of a metric (voltage, current, etc) at a certain point in the circuit to to the same metric at another point, generally the point of supply, for example $V_{out}/V_{in}$.

In $s$ domain, this function is basically a representation of a theoretical 3D space where the $x,y$ plane is $\mathcal{Re,Im}$ plane and the $z$ axis is a surface with height representing the gain.

To say the zero of a transfer function is $\infty$ for some function means that when $s\to\infty$ the function's denominator, it scales at an exponentially greater magnitude than the numerator.

For example:
$$H(s) = \frac{\frac{1}{2}s}{s^2 + s + \frac{1}{2}},\ \frac{1\ zero}{2\ poles},\ \frac{0, \infty}{-0.5\pm j0.5}$$
In the above function, when all $s$ are zero in the function, the output is obviously 0 since the numerator is 0.

Less obviously, when all $s$ are $\infty$, the denominator is a exponentially greater $\infty$, and so divides the numerator so greatly such that it approaches 0. 

#### 2. Find Transfer Function for Each Circuit
##### 1. 
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

	\draw(0,0)
	to[vsource, invert, V=$V_1$]++(0,2)
	to[R=$50k\Omega {=} 50000$]++(2,0)--++(1,0)
	node[ocirc, label=right:$V_2$]{}++(-1,0)
	to[capacitor=$100\mu F {=}\frac{1}{s(100\times10^{-6})}$]++(0,-2)--++(-2,0);
	
\end{circuitikz}
\end{document}
```
$$V_2 = V_1\frac{\frac{1}{10^{-8}s}}{50000 + \frac{1}{10^{-8}s}}$$
$$\frac{V_2}{V_1} = H(s) = \frac{\frac{1}{10^{-8}s}}{50000 + \frac{1}{10^{-8}s}}$$
$$= \frac{\frac{1}{10^{-8}s}}{50000 + \frac{1}{10^{-8}s}} \left(\frac{10^{-8}s}{10^{-8}s}\right) = \frac{1}{5\times10^4\times10^{-8}s + 1}$$
$$H(s) = \frac{1}{5\times10^{-4}s + 1}$$
##### 2.
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

	\draw(0,0)
	to[vsource, invert, V=$V_1$]++(0,2)
	to[capacitor=$100\mu F {=} \frac{1}{s100\times10^{-6}}$]++(2,0)--++(1,0)
	node[ocirc, label=right:$V_2$]{}++(-1,0)
	to[R=$50k\Omega {=} 50000$]++(0,-2)--++(-2,0);
	
\end{circuitikz}
\end{document}
```
$$V_2 = V_1\frac{50000}{50000 + \frac{1}{10^{-8}s}}$$
$$\frac{V_2}{V_1} = H(s) = \frac{50000}{50000 + \frac{1}{10^{-8}s}}\left(\frac{10^{-8}s}{10^{-8}s}\right)$$
$$H(s) = \frac{5\times10^{-4}s}{5\times10^{-4}s + 1}$$
##### 3.
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

	\draw(0,0)
	to[vsource, invert, V=$V_1$]++(0,2)
	to[switch]++(1,0)
	to[R=$6\Omega {=} 6$]++(2,0)
	to[capacitor, a=$\frac{1}{3}F {=} \frac{3}{s}$]++(0,-2)++(0,2)--++(2,0)
	node[ocirc, label=right:$V_2$]{}++(-1,0)
	to[R=$6\Omega {=} 6$]++(0,-2)--++(-4,0);
	
\end{circuitikz}
\end{document}
```
Using KCL:
$$\frac{V_2}{6} + \frac{V_2s}{3} + \frac{V_2 - V_1}{6}=0$$
$$V_2 + 2V_2s + V_2 - V_1=0$$
$$V_2(2 + 2s) = V_1$$
$$H(s) = \frac{1}{2+2s}$$
##### 4. 
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]

	\draw(0,0)
	to[vsource, invert, V=$V_1$]++(0,2)
	to[switch]++(1,0)
	to[capacitor, l=$0.5F{=}\frac{2}{s}$]++(1,0)
	to[inductor, l=$1H{=}s$]++(1,0)--++(1,0)
	node[ocirc, label=right:$V_2{=}2$]{}++(-1,0)
	to[R=$2\Omega$]++(0,-2)--++(-3,0);
	
\end{circuitikz}
\end{document}
```
$$V_2 = V_1\frac{2}{2 + s + \frac{2}{s} }$$
$$\frac{V_2}{V_1} = H(s) = \frac{2}{2 + s + \frac{2}{s} }\left(\frac{\frac{1}{2}s}{\frac{1}{2}s}\right) = \frac{s}{\frac{1}{2}s^2 + s+1}$$
