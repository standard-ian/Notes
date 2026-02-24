## Homework 5
#### 1. 
A second order polynomial $s^2 + bs + c$ that has complex roots is often seen in the Laplace transform of signals. 

In that case, we may want to translate the polynomial into the form $(s+a)^2 + \omega$. You may find this operation useful:
$$s^2 + bs + c = s^2 + bs + \left(\frac{b}{2}\right)^2 + \left(c-\left(\frac{b}{2}\right)^2\right) = \left(s+\frac{b}{2}\right)^2 +  \omega ^2$$
Where: 
$$\omega = \sqrt{c -\left(\frac{b}{2}\right)^2}$$
##### Example:
$$s^2 + 6s + 25 = (s + 3)^2 + 4^2$$
##### a. 
$$s^2 + 4s + 5 = \left(s + \frac{4}{2}\right)^2 + \left(\sqrt{5 - \left(\frac{4}{2}\right)^2}\right)^2 =\left(s + 2\right)^2 + \left(5 - 4\right)$$
$$=\color{orange} (s+2)^2+1^2$$
##### b.
$$s^2 + 10s + 169 = \left(s + \frac{10}{2}\right)^2 + \left(\sqrt{169 - \left(\frac{10}{2}\right)^2}\right)^2$$
$$=\left(s + 5\right)^2 + \left(169 - 5^2\right) = (s + 5)^2 + (169-25) = (s+5)^2 + (144)$$
$$=\color{orange}(s + 5)^2 + 12^2$$
##### c. 
$$s^2 + 12s + 100 = \left(s + \frac{12}{2}\right)^2 + \left(\sqrt{100 - \left(\frac{12}{2}\right)^2}\right)^2$$
$$= \left(s + 6\right)^2 + \left(100 - 36\right) = (s + 6)^2 + (64)$$
$$=\color{orange} (s + 6)^2 + 8^2$$

#### 2. 
Mark the poles and zeros of each of the Laplace transform in a complex plane. Find the time domain signals for the following Laplace transforms.
##### a.
$$F(s) = \frac{96\times 10^4}{s^2 + 10^5s + 16 \times10^8} = \frac{96\times10^{4}}{(s + 8\times 10^{4})(s+2\times 10^4)}$$

```tikz
\usepackage{pgfplots}

\begin{document}

\begin{tikzpicture}
\begin{axis}[
    width=15cm,
    height=15cm,
    xlabel={$\{\mathcal{R}(s)\}$},
    ylabel={$\{\mathcal{I}(s)\}$},
    xmin=-100000, xmax=100000, ymin=-50000, ymax=50000,
    grid=major,
    axis lines=middle,
    enlargelimits=true,
]
\addplot[orange, only marks, mark=x, mark size=4pt] coordinates {(-20000, 0) (-80000, 0)};
\node[orange, rotate=45, above right] at (axis cs:-20000, 0) {$pole_1 = -2\times10^4$};
\node[orange, rotate=45, above right] at (axis cs:-80000, 0) {$pole_2 = -8\times10^4$};

\end{axis}

\end{tikzpicture}
\end{document}
```
##### b.
$$F(s) = \frac{96(s + 5)(s+12)}{s(s+8)(s+6)}$$
```tikz
\usepackage{pgfplots}

\begin{document}

\begin{tikzpicture}
\begin{axis}[
    width=15cm,
    height=15cm,
    xlabel={$\{\mathcal{R}(s)\}$},
    ylabel={$\{\mathcal{I}(s)\}$},
    xmin=-15, 
    xmax=15, 
    ymin=-15, 
    ymax=15,
    grid=major,
    axis lines=middle,
    enlargelimits=true,

]
\addplot[thick, orange, only marks, mark=x, mark size=4pt] coordinates {(-8, 0) (-6, 0) (0, 0)};
\node[orange, above right, rotate=45, font=\small] at (axis cs:-8, 0) {$pole_1 = -8$};
\node[orange, above right, rotate=45, font=\small] at (axis cs:-6, 0) {$pole_2 = -6$};
\node[orange, above right, rotate=45, font=\small] at (axis cs:0, 0) {$pole_3 = 0$};

\addplot[thick, green, only marks, mark=x, mark size=4pt]
coordinates {(-5, 0) (-12, 0)};
\node[green, above right, rotate=45, font=\small] at (axis cs:-5, 0){$zero_1 = -5$};
\node[green, above right, rotate=45, font=\small] at (axis cs:-12, 0){$ zero_2 = -12$};




\end{axis}

\end{tikzpicture}
\end{document}
```
##### c.
$$F(s) = \frac{100(s+3)}{(s+6)(s^2 + 6s + 25)}$$
For $s^2 + 6s + 25$
$$s = \frac{-b\pm\sqrt{b^2 -4ac}}{2(a)} = \frac{-6\pm\sqrt{6 ^2-4(1)(25)}}{2} = -3\pm\frac{\sqrt{36-100}}{2}$$
$$= -3\pm \frac{\sqrt{-64}}{2} = \color{orange}-3\pm j4$$
```tikz
\usepackage{pgfplots}

\begin{document}

\begin{tikzpicture}
\begin{axis}[
    width=15cm,
    height=15cm,
    xlabel={$\{\mathcal{R}(s)\}$},
    ylabel={$\{\mathcal{I}(s)\}$},
    xmin=-15, 
    xmax=15, 
    ymin=-15, 
    ymax=15,
    grid=major,
    axis lines=middle,
    enlargelimits=true,

]
\addplot[thick, orange, only marks, mark=x, mark size=4pt] coordinates {(-6, 0) (-3, 4) (-3, -4)};
\node[orange, above left, font=\small] at (axis cs:-6, 0) {$pole_2 = -6$};
\node[orange, above right, rotate=45, font=\small] at (axis cs:-3, 4) {$pole_2 = (-3, j4)$};
\node[orange, above right, rotate=45, font=\small] at (axis cs:-3, -4) {$pole_2 = (-3, -j4)$};

\addplot[thick, green, only marks, mark=x, mark size=4pt]
coordinates {(-3, 0)};
\node[green, above right, rotate=45, font=\small] at (axis cs:-3, 0){$zero_1 = -3$};




\end{axis}

\end{tikzpicture}
\end{document}
```
##### d.
$$F(s) = \frac{1000(s+5000)}{s^2 + 6000s+25\times 10^6}$$
For $s^2 + 6000s+25\times 10^6$:
$$s = -3000 \pm j4000$$
```tikz
\usepackage{pgfplots}

\begin{document}

\begin{tikzpicture}
\begin{axis}[
    width=15cm,
    height=15cm,
    xlabel={$\{\mathcal{R}(s)\}$},
    ylabel={$\{\mathcal{I}(s)\}$},
    xmin=-10000, xmax=10000, ymin=-10000, ymax=10000,
    grid=major,
    axis lines=middle,
    enlargelimits=true,
]
\addplot[thick, orange, only marks, mark=x, mark size=4pt] coordinates {(-3000, 4000) (-3000, -4000)};
\node[orange, above left] at (axis cs:-3000, 4000) {$pole_1 = -3k, j4k$};
\node[orange, above left] at (axis cs:-3000, -4000) {$pole_2 = -3k, -j4k$};

\addplot[thick, green, only marks, mark=x, mark size=4pt]
coordinates {(-5000, 0)};
\node[green, above right, rotate=45, font=\small] at (axis cs:-5000, 0){$zero_1 = -5\times10^3$};
\end{axis}

\end{tikzpicture}
\end{document}
```

#### 3.
Find the transfer functions $H(s) = \frac{V_{out}(s)}{V_{in}(s)}$ for the following circuits.
##### a. 
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[label=left:$V_{in}$]{}
	to[R=$R$]++(2,0)--++(2,0)
	node[label=right:$V_{out}$]{}++(-2,0)--++(0,-1)
	to[short]++(-0.25,0)
	to[inductor, a=$L$]++(0,-2)
	to[short]++(0.25,0)
	node[ground, scale=2]{}
	to[short]++(0.25,0)
	to[capacitor, a=$C$]++(0,2)--++(-0.25,0);
\end{circuitikz}
\end{document}
```
$$\frac{V_{out}}{V_{in}} = \frac{Z_{LC}}{R + Z_{LC}}$$
$$Z_R = R$$
##### $s$ encodes differentiation
###### Inductor
$$Z_L = j\omega L$$
$$\mathcal{L}\left\{v_L(t)\right\} = \mathcal{L}\left\{ L\frac{dI_L}{dt}\right\} \to V(s) = sL\times I(s)$$
$$Z_L = \frac{V}{I} = \frac{sL \times \cancel{I}}{\cancel{I}} = sL$$
###### Capacitor 
$$Z_C = \frac{1}{j\omega C} $$
$$\mathcal{L}\left\{I_C\right\} = \mathcal{L}\left\{C\frac{dV_C}{dt}\right\}\to I(s) = sC \times V(s)$$
$$Z_C = \frac{V}{I} = \frac{\cancel{V}}{sC\times \cancel{V}} = \frac{1}{sC}$$
###### $Z_{LC}(s)$
$$= \frac{1}{\frac{1}{sL} + sC} = \frac{sL}{1 + s^2LC}$$ 
##### Together...
$$\frac{V_{out}(s)}{V_{in}(s)} = \frac{Z_{LC}}{Z_R + Z_{LC}} = \frac{ \frac{sL}{1 + s^2LC}}{R +  \frac{sL}{1 + s^2LC}}$$
$$= \frac{ (1+s^2LC)\left(\frac{sL}{1 + s^2LC}\right)}{(1 + s^2LC)\left(R +  \frac{sL}{1 + s^2LC}\right)} =\color{orange}\frac{sL}{RLCs^2 + sL + R}$$
##### b. 
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[label=left:$V_{in}$]{}
	to[R=$1k\Omega$]++(2,0)--++(2,0)
	node[label=right:$V_{out}$]{}++(-2,0)--++(0,-1)
	to[short]++(-0.25,0)
	to[R, a=$250\Omega$]++(0,-1)
	to[inductor, a=$50mH$]++(0,-1)
	to[short]++(0.25,0)
	node[ground, scale=2]{}
	to[short]++(0.25,0)
	to[capacitor, a=$1 \mu F$]++(0,2)--++(-0.25,0);
\end{circuitikz}
\end{document}
```
$$\frac{V_{out}}{V_{in}} = \frac{ Z_{R_{250}LC}}{R_{1k} + Z_{R_{250}LC}}$$
$$Z_{R_{250}LC}(s) = \frac{1}{\frac{1}{R + sL} + sC} = \frac{R + sL}{LCs^2 + RCs + 1}$$
$$\frac{V_{out}(s)}{V_{in}(s)}  = \frac{\frac{R_{250} + sL}{LCs^2 + R_{250}Cs + 1}}{R_{1k} + \frac{R_{250} + sL}{LCs^2 + R_{250}Cs + 1}}$$
$$= \frac{(LCs^2 + R_{250}Cs + 1)\left(\frac{R_{250} + sL}{LCs^2 + R_{250}Cs + 1}\right)}{(LCs^2 + R_{250}C + 1)\left(R_{1k} + \frac{R_{250} + sL}{LCs^2 + R_{250}Cs + 1}\right)}$$
$$=\color{orange} \frac{R_{250} + sL}{R_{1k}(LCs^2 + R_{250}Cs + 1) + R_{250} + sL}$$
$$= \frac{250 + 0.05s}{1000\left((5\times 10^{-8})s^2 + (2.5\times10^{-4})s + 1\right) + 250 + 0.05s}$$
$$\color{orange}\frac{V_{out}(s)}{V_{in}(s) } = H(s) = \frac{250 + 0.05s}{5\times10^{-5}s^2 + 0.29s + 1250} $$
