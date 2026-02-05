## Class 9
Use impedances and phasors to analyze RLC circuits at steady state.

Frequency responses of RLC circuits.

Filters: What passes and what's attenuated?

Given the ration of the RC circuit from the 3rd homework:
$$\frac{\tilde{V}_{out}}{\tilde{V}_{in}} = \frac{Z_C}{R + Z_C} = \frac{\frac{1}{j\omega C}}{R + \frac{1}{j\omega C}}$$
As capacitance and frequency increase, the gain above gets smaller and smaller.

The smaller capacitance and frequency get, larger $Z_C$ gets. Once $Z_C$ is significantly large, the gain approaches 1.

When frequency is small and/or capacitance is small, the filter will pass the frequency out.

When frequency increases, the ration becomes close to 0, attenuating the frequency.

#### IW 9.1
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[label=left:$\tilde{V}_{in}$]{}
	to[R=$R$]++(2,0)
	to[inductor, l=$L$]++(0,-2)
	node[ground, scale=2]{}++(0,2)--++(1,0)
	node[label=right:$\tilde{V}_{out}$]{};
\end{circuitikz}
\end{document}
```

Find $\frac{|\tilde{V}_o|}{|\tilde{V}_i|}$ as a function of $\omega$ and $\angle \frac{\tilde{V}_o}{\tilde{V}_i}$

$$\frac{|\tilde{V}_o|}{|\tilde{V}_i|} = \frac{Z_L}{R + Z_L} = \frac{j\omega L}{R + j\omega L}$$
$$=\frac{j\omega L}{R(\frac{j\omega L}{j\omega L}) + j\omega L} = \frac{1}{\frac{R}{j\omega L} + 1} = \frac{1}{1 - j\frac{R}{\omega L}} = \frac{1(1 + j\frac{R}{\omega L})}{1 - j\frac{R}{\omega L}(1 + j\frac{R}{\omega L})}$$
$$= \frac{1 + j\frac{R}{\omega L}}{1 - (j\frac{R}{\omega L})^2} =  \frac{1 + j\frac{R}{\omega L}}{1 - j^2(\frac{R}{\omega L})^2} = \frac{1 + j\frac{R}{\omega L}}{1 +(\frac{R}{\omega L})^2}$$
$$H = \left| \frac{1 + j\frac{R}{\omega L}}{1 +(\frac{R}{\omega L})^2}\right| =\frac{1}{\sqrt{1 + (\frac{R}{\omega L})^2}}$$

As frequency increases, the phase angle approaches $0^\circ$ from $90^\circ$
The gain approaches 1 from 0.

```tikz
\usepackage{pgfplots}

\begin{document}
\begin{tikzpicture}
\begin{axis}[
    width=14cm,
    height=10cm,
    title={Phase Response: RC Circuits},
    xlabel={Frequency (Hz)},
    ylabel={Phase (degrees)},
    xmode=log,
    ymode=linear,
    grid=both,
    legend pos=north east,
    legend style={font=\small},
    xmin=1, xmax=100000,
    ymin=-95, ymax=95,
    domain=1:100000,
    samples=200,
]
\addplot[red, thick, domain=1:1e6, samples=200] {90 - atan(x*2*pi*50/(2*pi*1000))};
\addlegendentry{High-pass}

\end{axis}
\end{tikzpicture}
\end{document}
```


```tikz
\usepackage{pgfplots}
\begin{document}

\begin{tikzpicture}
\begin{axis}[
    width=14cm,
    height=10cm,
    title={Magnitude Response: RC Circuits},
    xlabel={Frequency (Hz)},
    ylabel={Magnitude $|H|$},
    xmode=log,
    ymode=linear,
    grid=both,
    legend pos=north west,
    legend style={font=\small},
    xmin=1, xmax=100000,
    ymin=0, ymax=1.2,
    domain=1:100000,
    samples=200,
]
\addplot[blue, thick, domain=1:1e6, samples=200] {(x*2*pi*50) / sqrt((2*pi*1000)^2 + (x*2*pi*50)^2)};
\addlegendentry{High Pass}

\end{axis}
\end{tikzpicture}
\end{document}
```
#### Lab 3 Background
With the RLC circuit in the lab, a peak around $15.13kHz$ will be formed as frequency increases. 

At the half power point, the distance between half power points will give **Bandwidth**

$\frac{1}{\sqrt{2}}$ is the gain of the Half Power Point.


## Class 10
#### Power (Review)
##### DC
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[label=left:$V_{DC}\ \ +$]{}
	to[R]++(2,0)
	node[label=right:$-$]{};
\end{circuitikz}
\end{document}
```
$$P = V\cdot I$$
$$P = \frac{V^2}{R} = I^{2}\cdot R$$
##### AC
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[label=left:$V_{ac} {=} 100V\ @\ 60Hz\ \ +$]{}
	to[R]++(2,0)
	node[label=right:$-$]{};
\end{circuitikz}
\end{document}
```
In an AC circuit, the charges "wiggle" in place, which consumes energy, and causes release of heat/light/etc.

In $\frac{1}{60}$ of a second, 1 cycle occurs. 

```tikz
\usepackage{pgfplots}

\begin{document}

% Define AC signal parameters
\def\amplitude{100}      % Amplitude in volts
\def\omega{60*2*pi}          % Angular frequency in rad/s
\def\phase{0}            % Phase shift in degrees
\def\tmax{1/60}         % Maximum time in seconds
\def\trig{cos}         % sin or cos

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
\addplot[red, very thick] {\amplitude*\trig(deg(\omega*x + \phase))};

\end{axis}

\end{tikzpicture}
\end{document}
```
$$V(t) = 100cos(377t)$$
$$P(t) = \frac{[V(t)]^2}{R}$$

$$P = \frac{10000}{R} cos^2(377t)$$

Power consumption changes moment to moment, but on the average of the whole time period:
$$\frac{1}{T} = \int_{0}^{T}P(t) dt= \frac{1}{2}\frac{V_m^2}{R}$$
The instantaneous voltage squared is ($T = period$): 
$$V^2(t) = 100000 cos^2(\omega t)$$
$$\frac{1}{T} \int_0^T V^2(t) = \frac{10000}{2} = \frac{(100)^2}{T}$$

$$P_{average} = \frac{\frac{1}{T}\int_0^TV^2(t)dt}{R} = \frac{1}{2}\frac{V_m^2}{R}$$

Power is proportional to voltage squared.

Take the peak value, square it, multiply by $\frac{1}{2}$ and divide by resistance, and this is the average power of an $AC$ Circuit.

$$V_{rms} = \frac{V_m}{\sqrt{2}}:\ RMS\ Value\ of\ V_mcos(\omega + \phi)$$
The root-mean-squared value is the peak value divided by $\sqrt{2}$ **for cosine functions**

```tikz
\usepackage{pgfplots}

\begin{document}

% Define AC signal parameters
\def\amplitude{100}      % Amplitude in volts
\def\omega{60*2*pi}          % Angular frequency in rad/s
\def\phase{0}            % Phase shift in degrees
\def\tmax{4/60}         % Maximum time in seconds
\def\trig{cos}         % sin or cos

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
\addplot[red, very thick] {\amplitude*\trig(deg(\omega*x + \phase))};
\addlegendentry{$V_{in}$}

\addplot[black, dashed] {0.707 * \amplitude};
\addlegendentry{$V_{rms}$}

\end{axis}

\end{tikzpicture}
\end{document}
```
##### Example
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[label=left:$V_{ac} {=} 100V\ @\ 60Hz\ \ +$]{}
	to[R=$50\Omega$]++(2,0)
	node[label=right:$-$]{};
\end{circuitikz}
\end{document}
```
$$V(t) = 100cos(377t)V$$
$$V_{rms} = \frac{100}{\sqrt{2}} = 0.707V$$
$$I(t) = 2cos(377t)A$$
$$I_{rms} = \frac{2}{\sqrt{2}} = 1.41A$$
$$P_{average} = (70.7)(1.41) = \frac{(70.7V)^2}{50\Omega} = (1.41)^2\cdot50$$
$$P_{average} = (I_{rms})^2 \cdot R = \frac{V_{rms}}{R}$$
#### Returning to Filters, dB, and Gain

##### Defining Decibels (dB)
$$dB = \frac{A}{B}$$
Converting $\frac{A}{B} = 0.5$ to $dB$:
$$20log_{10}(\frac{1}{2}) = -6dB$$

##### Half Power Frequency
$$20 log(\frac{1}{\sqrt{2}}) = -3$$
This is the half power point. It is $-3dB$ from the peak **gain**. 
Maximum power is found from $V_{rms}$, so $\frac{V_m}{\sqrt{2}}$ is the point of average power.

##### Half-Power Point and V_RMS Relationship
###### Summary
The half-power point occurs when circuit power drops to 50% of maximum. Since $P \propto V^2$, this happens when voltage drops to $V_{\text{max}}/\sqrt{2} \approx 0.707V_{\text{max}}$.

For AC signals, $V_{\text{RMS}} = V_{\text{peak}}/\sqrt{2}$, making the half-power voltage equal to the RMS value of the peak voltage.

In frequency response: half-power points define the -3dB bandwidth where voltage amplitude falls to $1/\sqrt{2}$ of maximum.
###### Key Equations
- $P_{\text{half}} = P_{\text{max}}/2$
- $V_{\text{half}} = V_{\text{max}}/\sqrt{2} = 0.707V_{\text{max}}$
- $V_{\text{RMS}} = V_{\text{peak}}/\sqrt{2}$
- $-3\text{dB} = 20\log_{10}(1/\sqrt{2})$
###### Citations
[1] Nilsson, J.W. & Riedel, S.A. (2015). *Electric Circuits* (10th ed.). Pearson. Chapter 14: Frequency Response.
[2] Sedra, A.S. & Smith, K.C. (2015). *Microelectronic Circuits* (7th ed.). Oxford University Press. Section 1.5: Frequency Response of Amplifiers.


#### Review of Phasor Analysis Process:
1. Phasor of source signal
	1. Don't forget $j$
	2. Take $t$ out of the phasor
2. Impedances
3. Relate Phasors and Impedances
4. Find Voltage Phasor and Current Phasor
5. Go back to real value signals

##### Example
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[label=left:$V_{in}$]{}
	to[capacitor, l=$12.5\mu F$]++(2,0)--++(1,0)
	node[label=right:$V_{out}$]{}++(-1,0)
	to[R=$200\Omega$]++(0,-2)
	node[ground, scale=2]{};
	
\end{circuitikz}
\end{document}
```
$$V_{in}(t) = 100 cos(1000t + 30^\circ)V$$


```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[label=left:$100e^{j30^\circ}$]{}
	to[capacitor, l=$Z_C {=} -j80\Omega$, i_=$\tilde{I}$]++(2,0)--++(1,0)
	node[label=right:$V_{out}$]{}++(-1,0)
	to[R=$200\Omega$]++(0,-2)
	node[ground, scale=2]{};
	
\end{circuitikz}
\end{document}
```
$$Z_C = \frac{1}{j\omega C} = \frac{1}{j\times 1000\times 12.5\times 10^{-6}} = -j80$$

##### Example

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[sV, l=$V_i$, invert]++(0,2)
	to[R=$100\Omega$]++(2,0)
	to[inductor, l=$0.3H$]++(0,-2)--++(-2,0);
	
\end{circuitikz}
\end{document}
```
$$V_i(t) = 100cos(500t)V$$


```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[sV, l=$\tilde{V}_i {=} 100e^{j0^\circ}$, invert]++(0,2)
	to[R=$100\Omega$, i_=$\tilde{I}$]++(2,0)
	to[inductor, l=$j\omega L {=} j150$]++(0,-2)--++(-2,0);
\end{circuitikz}
\end{document}
```

$$\tilde{I} = \frac{100}{100+j150} = \frac{100}{180.3e^{j56.3^\circ}} = \frac{100}{180.3}e^{j(-56.3^\circ)} = 0.55e^{(-56.3^\circ)}$$
Back to the real:
$$i(t) = Re[\tilde{I} \cdot e^{j\omega t}] = 0.55cos(500t - 56.3^\circ)A$$

#### IW 10.1
Determine the impedance of all the elements in the circuit, if driven by a source at $\omega = 1000\frac{rad}{s}$

Also, determine the impedance between $A$ and $B$.

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[label=left:$A$]{}
	to[capacitor, l=$12.5\mu F $]++(2,0)
	to[R=$200\Omega$]++(0,-2)++(0,2)
	to[R=$100\Omega$]++(2,0)
	to[inductor, l=$0.1H$]++(0,-2)--++(-4,0)
	node[label=left:$B$]{};
\end{circuitikz}
\end{document}
```

$$Z_C = \frac{1}{j 100\times 12.5\times 10^{-6}} = -j80$$
$$Z_L = j\omega L = j\times 1000 \times 0.1 = j100$$
$$Z_{AB} = -j80 + \frac{1}{\frac{1}{200} + \frac{1}{100+ j100}}$$
Take step by step...
