## Class 19
#### Power in AC Circuits
##### Resistor
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=2, font=\Large]
	\draw(0,0)
	to[sV, l=$V$]++(0,2)
	to[short, i=$I$]++(1,0)
	to[R=$R$]++(0,-2)--++(-1,0);
	
\end{circuitikz}
\end{document}
```
$$V\cdot I > 0$$
$$V = V_0\sin(\omega t)$$
$$I = I_0\sin(\omega t),\ I_0 = \frac{V_0}{R}$$
```tikz
\usepackage{pgfplots}

\begin{document}

% Define AC signal parameters
\def\amplitude{100}      % Amplitude in volts
\def\myomega{4*2*pi}          % Angular frequency in rad/s
\def\phase{0}            % Phase shift in degrees
\def\tmax{1/4}         % Maximum time in seconds
\def\trig{sin}         % sin or cos
\def\cur{0.7}

\begin{tikzpicture}
\begin{axis}[
    width=12cm,
    height=8cm,
    xlabel={Time (s)},
    ylabel={Voltage (V)},
    domain=0:\tmax,
    samples=200,
    grid=major,
    axis lines=middle,
    enlargelimits=true,
]
\addplot[red, very thick] {\amplitude*\trig(deg(\myomega*x + \phase))};
\addlegendentry{$V_0\sin(\omega t)$}

\addplot[blue, very thick] {\cur *\amplitude*\trig(deg(\myomega*x + \phase))};
\addlegendentry{$I_0\sin(\omega t)$}


\end{axis}

\end{tikzpicture}
\end{document}
```
Average power
$$P = \frac{1}{T}\int_0^T V\cdot I\ dt\ \  > 0$$
$$\tilde{V}_R = V_0\angle -90^\circ$$
$$\tilde{I}_R = V_0\angle -90^\circ$$
##### Capacitor
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=2, font=\Large]
	\draw(0,0)
	to[sV, l=$V$]++(0,2)
	to[short, i=$I$]++(1,0)
	to[capacitor, l=$C$]++(0,-2)--++(-1,0);
	
\end{circuitikz}
\end{document}
```
$$I = C\frac{dV}{dt}$$
$$V = V_0\sin(\omega t)$$
$$I = \omega CV_0\cos(\omega t)$$
```tikz
\usepackage{pgfplots}

\begin{document}

% Define AC signal parameters
\def\amplitude{100}      % Amplitude in volts
\def\myomega{4*2*pi}          % Angular frequency in rad/s
\def\phase{0}            % Phase shift in degrees
\def\tmax{1/4}         % Maximum time in seconds
\def\trig{sin}         % sin or cos
\def\cur{0.3}

\begin{tikzpicture}
\begin{axis}[
    width=12cm,
    height=8cm,
    xlabel={Time (s)},
    ylabel={Voltage (V)},
    domain=0:\tmax,
    samples=200,
    grid=major,
    axis lines=middle,
    enlargelimits=true,
]

\addplot[red, very thick] {\cur* \amplitude*\trig(deg(\myomega*x + \phase)};
\addlegendentry{$V_0\sin(\omega t)$}

\addplot[blue, very thick] {\amplitude*\trig(deg(\myomega*x +(pi/2))};
\addlegendentry{$\omega C V_0\cos(\omega t )$}

\end{axis}

\end{tikzpicture}
\end{document}
```
##### Inductor
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=2, font=\Large]
	\draw(0,0)
	to[sV, l=$V$]++(0,2)
	to[short, i=$I$]++(1,0)
	to[inductor, l=$L$]++(0,-2)--++(-1,0);
	
\end{circuitikz}
\end{document}
```
$$V_0 = \cos(\omega t)$$
$$I =\frac{V_0}{\omega L}\sin(\omega t)$$

```tikz
\usepackage{pgfplots}

\begin{document}

% Define AC signal parameters
\def\amplitude{100}      % Amplitude in volts
\def\myomega{4*2*pi}          % Angular frequency in rad/s
\def\phase{0}            % Phase shift in degrees
\def\tmax{1/4}         % Maximum time in seconds
\def\trig{cos}         % sin or cos
\def\cur{0.3}

\begin{tikzpicture}
\begin{axis}[
    width=12cm,
    height=8cm,
    xlabel={Time (s)},
    ylabel={Voltage (V)},
    domain=0:\tmax,
    samples=200,
    grid=major,
    axis lines=middle,
    enlargelimits=true,
]

\addplot[red, very thick] {\amplitude*\trig(deg(\myomega*x + \phase ))};
\addlegendentry{$V_0\cos(\omega t)$}

\addplot[blue, very thick] {\cur* \amplitude*\trig(deg(\myomega*x -(pi/2))};
\addlegendentry{$\frac{V_0}{\omega L}\sin(\omega t )$}


\end{axis}

\end{tikzpicture}
\end{document}
```
##### Conclusion
Average Power:
$R > 0$
$I = C = 0$

##### RC Circuit

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=2, font=\Large]
	\draw(0,0)
	to[sV, l=$V$]++(0,2)
	to[R = $R$, i=$I$]++(2,0)
	to[capacitor, l=$C$]++(0,-2)--++(-2,0);
	
\end{circuitikz}
\end{document}
```
$$\tilde{V} = V_0 \cos(\omega t)$$
$$\tilde{I}\cdot C = \tilde{V}$$
$$\tilde{I} = \frac{\tilde{V}}{Z}$$
$$Z = R + \frac{1}{1\omega C} = R-\frac{j}{\omega C}$$
$$\tilde{I} = \frac{\tilde{V}}{Z} = \frac{V_0}{R - \frac{j}{\omega C}}$$
For example:
$\omega = 1000$
$C = 10^{-6}$
$R = 1k$
$V_0 = 1V$
$$\tilde{I} = \frac{1}{1000 - j1000} = \frac{0.001}{\sqrt{2}}e^{j45^\circ}$$
$$\tilde{V} = 1e^{j0^\circ}$$
$$I(t) = \frac{0.001}{\sqrt{2}}\cos(\omega t + 45^\circ)$$
$$V(t)  = \frac{1}{\sqrt{2}}\cos(\omega t + 45^\circ)$$
$$V\cdot I_R = \frac{1}{2}\times (0.001)(\cos(\omega t + 45^\circ))^2$$

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[scale=2, font=\Large]
	\draw(0,0)
	to[sV, l=$1\angle0^\circ$ at $\omega {=} 1000$]++(0,2)
	to[R = $1000\Omega$, i=$\tilde{I}$]++(2,0)
	to[capacitor, l=$1 \mu F$]++(0,-2)--++(-2,0);
	
\end{circuitikz}
\end{document}
```
$$V_s(t) = 1 cos(1000t)$$
$$I(t) = \frac{0.001}{\sqrt{2}} \cos(\omega t + 45^\circ)$$
$$V_R(t) = I\cdot R = \frac{1}{\sqrt{2}}\cos(\omega t + 45^\circ)$$
$$P_r = \frac{1}{T}\int_0^TV_R\times I > 0 = \frac{1}{T}\int\frac{0.001}{2}\cos^2$$
$$\tilde{V} = 1e^{j0^\circ}$$
$$\tilde{I} = \frac{0.001}{\sqrt{2}}e^{j45^\circ}$$
$\tilde{I}*$ is the complex conjugate of the $\tilde{I}$ 
$$\tilde{I*} = \frac{0.001}{\sqrt{2}}e^{-j45^\circ}$$
$$[\tilde{V}\times\tilde{I*}] = \frac{0.001}{\sqrt{2}}e^{-j45^\circ}$$
$$Real\ Power = \mathcal{R}e[\tilde{V}\times\tilde{I}*] = \frac{0.001}{\sqrt{2}}\cos(45^\circ) = \frac{0.001}{2}$$
$$Reactive\ Power = \mathcal{I}m = \frac{0.001}{\sqrt{2}}\sin(45^\circ)$$
For an RC circuit, the real power is $P = \mathcal{R}e[\tilde{V}\times\tilde{I}]$
The average power is $\frac{1}{T}\int_0^{T}(V\times I)\ dt$

Industrial customers par reactive power and real power because of all of the motors and transformers made of windings, which act like inductors, pumping current back and forth.
## Class 20
Review Homework 3,4,5 and Review Problems A and B

