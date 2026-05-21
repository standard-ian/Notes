## Class 15
#### Problems of Filter Design
1. Specification
2. Approximation
3. Realization
4. Analysis and Verification

Bilinear have a $20dB$ per decade rolloff, but for sharper peaks, we may need something beyond bilinear.
Something with a steeper slope than $20dB$ per decade must be more complex than bilinear.


$$T(s) = \frac{(s + z_1)(s + z_2)}{(s + p_1)(s + p_2)} = (T_1(s))(T_2(s)) = \left(\frac{s + z_1}{s + p_1}\right)\left(\frac{s + z_2}{s + p_2}\right)$$
A passive circuit made only of resistors and capacitors has transfer functions with poles and zeros on the real axis only. Complex conjugate poles or zeros do not occur without inductors or active elements. This means that without inductor, there won't be oscillation, and there won't be changes on the imaginary axis. 

Resonance will never be created by passive elements (R and C only)

#### Transfer Functions of a Second Order 
These are second order transfer functions that cannot be split into multiple first order functions as discussed above.
$$T(s) = \frac{N(s)}{D(s)} = \frac{b_2s^2 + B_1s + b_0}{a_2s^2 + a_1s + a_0}$$
**Low pass behavior**
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$V_1$]{}
	to[R=$R$]++(2,0)
	to[inductor, l =$L$]++(2,0)
	--++(1,0)
	node[ocirc, label=right:$V_2$]{}
	++(-1,0)
	to[capacitor, l=$C$]++(0,-2)
	node[ground]{};
\end{circuitikz}
\end{document}
```

The resistor and capacitor above have resonance because they are pumping energy back and forth in terms of voltage and current.
$$\frac{V_2}{V_1} = \frac{Z_2}{Z_1 + Z_2}=\frac{\frac{1}{sC}}{\frac{1}{sC} + sL + R} = \frac{1}{1 + s^2LC + sRC} =\frac{\frac{1}{LC}}{s^2 + s\frac{R}{L} + \frac{1}{LC}}$$

This results in a low pass filter because
$$T(j\omega) = \frac{\frac{1}{LC}}{j\omega^2 + j\omega\frac{R}{L} + \frac{1}{LC}}\Longrightarrow |T(j\omega)| \text{ (when R=L=C=1)}= \left|\frac{1}{(1-\omega^2) + j\omega}\right| = \frac{1}{\sqrt{(1-\omega)^2 + \omega^2}}$$
At $\omega=0$, $T(j\omega) = 1$
At $\omega=\infty$, $T(j\omega) = \frac{1}{\infty} = 0$
**High pass behavior**

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$V_1$]{}
	to[R=$R$]++(2,0)
	to[capacitor, l =$C$]++(2,0)
	--++(1,0)
	node[ocirc, label=right:$V_2$]{}
	++(-1,0)
	to[inductor, l=$L$]++(0,-2)
	node[ground]{};
\end{circuitikz}
\end{document}
```
$$T(s) = \frac{s^2}{s^2 + \frac{R}{L}s + \frac{1}{LC}}$$
**Band Pass Behavior**
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$V_1$]{}
	to[capacitor, l=$C$]++(2,0)
	to[inductor, l =$L$]++(2,0)
	--++(1,0)
	node[ocirc, label=right:$V_2$]{}
	++(-1,0)
	to[R=$R$]++(0,-2)
	node[ground]{};
\end{circuitikz}
\end{document}
```
$$T(s) = \frac{\frac{R}{L}s}{s^2 + \frac{R}{L}s + \frac{1}{LC}}$$
#### Back to Low Pass Example
More generally:
$$\frac{1}{as^2 + bs + 1c}$$
We could use quadratic formula to find the poles
$$as^2 + b2 + 1c = 0\Longrightarrow s_{1,2}=\frac{-b \pm\sqrt{b^2 - 4ac}}{2a} = \frac{-1\pm\sqrt{-3}}{2} = -\frac{1}{2} \pm j\frac{\sqrt{3}}{2}$$

Or
$$\frac{1}{(s + 0.5b)^2 + (1-0.25b)} = \frac{1}{(s + \frac{1}{2})^2+(\sqrt{0.75})^2}$$

##### Example
$$s^2 + 2s + 4$$
If we pull out $(s + \frac{1}{2}b)^2 = s^2 + 2s + 1$, we still need another 3
$$(s + \frac{1}{2}(2))^2 + 3 = s^2 + 2s + 4 = 0$$
$$(s + 1)^2 =-3$$
$$s + 1 = \pm j\sqrt{-3}\Longrightarrow s_{1,2} = -1\pm j\sqrt{3}$$

##### Example 2
$$s^2 + 6s + 25 = 0$$
$$(s + 3)^2 + 16 = 0$$
$$(s + 3)^2 = -16$$
$$s + 3 = \pm j\sqrt{16}\Longrightarrow s_{1,2} = -3\pm j4$$
The condition that results in complex poles
$$\frac{s^2 + b_1s + b_0 = 0}{b_0>\left(\frac{b_1}{2}\right)^2}$$
$$\left(s + \frac{b_1}{2}\right)^2 + \left[b_0 - \left(\frac{b_1}{2}\right)^2\right] = 0$$
When $\left[b_0 - \left(\frac{b_1}{2}\right)^2\right] > 0$ so that when we subtract it to the right side, and take the $\sqrt{\ \ }$, we get a complex number $j$.

**Poles are**
Real if $b_0\leq \left(\frac{b_1}{2}\right)^2$
Complex if $b_0> \left(\frac{b_1}{2}\right)^2$
## Class 16
#### Biquad Circuits
Recall that in general, a second order biquad transfer function looks like this
$$T(s) =  \frac{b_2s^2 + B_1s + b_0}{a_2s^2 + a_1s + a_0}$$
This form does not **guarantee** it is a biquad circuit - it could be multiple cascaded first order filters.

A biquad circuit however cannot be factored into two first order circuits.

Note all three of the circuits below have the same polynomial in the denominator. The numerator changes based on the shunt component.

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$V_1$]{}
	to[R=$R$]++(2,0)
	to[inductor, l =$L$]++(2,0)
	--++(1,0)
	node[ocirc, label=right:$V_2$]{}
	++(-1,0)
	to[capacitor, l=$C$]++(0,-2)
	node[ground]{};
\end{circuitikz}
\end{document}
```
$$T(s) = \frac{\frac{1}{LC}}{s^2 + \frac{R}{L}s + \frac{1}{LC}}$$
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$V_1$]{}
	to[R=$R$]++(2,0)
	to[capacitor, l =$C$]++(2,0)
	--++(1,0)
	node[ocirc, label=right:$V_2$]{}
	++(-1,0)
	to[inductor, l=$L$]++(0,-2)
	node[ground]{};
\end{circuitikz}
\end{document}
```
$$T(s) = \frac{s^2}{s^2 + \frac{R}{L}s + \frac{1}{LC}}$$
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	node[ocirc, label=left:$V_1$]{}
	to[capacitor, l=$C$]++(2,0)
	to[inductor, l =$L$]++(2,0)
	--++(1,0)
	node[ocirc, label=right:$V_2$]{}
	++(-1,0)
	to[R=$R$]++(0,-2)
	node[ground]{};
\end{circuitikz}
\end{document}
```
$$T(s) = \frac{\frac{R}{L}s}{s^2 + \frac{R}{L}s + \frac{1}{LC}}$$

Examining the pole:

$$s^2 + \frac{R}{L}s + \frac{1}{LC}$$
When $R \geq 2\sqrt{\frac{L}{C}}$, the pole will be real.
When $R< 2\sqrt{\frac{L}{C}}$ the pole will be complex.

We want to focus on the complex poles. 
Which could be also said to have the form
$$s^2 + \frac{R}{L}s + \frac{1}{LC}= s^2 + a_1^2 + a_0 = 0$$
We want to write this in this way:
$$\boxed{s^2 + \frac{\omega_0}{Q}s + \omega_0^2 = 0}$$
##### Example
For:
$$s^2 + 6s +13 =0$$
$$s^2 + \frac{\sqrt{13}}{\sqrt{13}/6} + \sqrt{13}^2 \approx s^2 + \frac{3.61}{0.6}s + 3.61 =0$$
Where $Q =0.6$ and $\omega_0 = 3.61$

To plot the complex poles
$$s_1, s_2 = -\alpha \pm j\beta$$
$$\alpha = \frac{\omega_0}{2Q}$$
$$\beta = \omega_0\sqrt{1 - \frac{1}{4Q^2}}$$
$\omega_0$ is the distance from the pole to the origin.

The angle $\psi$ that the $\omega_2$ vector makes with the $\mathcal{R}e$ axis has this relationship with $Q$
$$\cos\psi = \frac{1}{2Q}$$

| Q     | $\psi$ |
| ----- | ------ |
| 0.707 | 45     |
| 1     | 60     |
| 2     | 75.52  |
| 5     | 84.3   |
| 20    | 88.5   |
| 100   | 89.7   |

As $\psi$ increases, $Q$ increases.
$$\psi = \arccos\left(\frac{\alpha}{\omega_0}\right) = \arccos\left(\frac{1}{2Q}\right)$$
##### IW 16.1
Two poles of a give $T(s)$ are located in the s-plane on lines of slope $\pm2$. The distance from the pole to the origin is $9$.
$\omega_0$ must be $\text{distance to origin} = 9$
$$\omega_0 = 9$$

$$\psi = \arctan\left(\frac{2}{1}\right) = 63.4^\circ$$
$$\cos(\psi) = \frac{1}{2Q} \Longrightarrow \frac{1}{2\cos(\psi)} = \frac{1}{2\cos(63.4)}  \approx 1.12$$
$$Q \approx 1.12$$

A filter can be tuned by changing $Q$ and $\omega$.

##### Review of Op-Amp Circuits
###### B.
```tikz
\usepackage{circuitikz}
    \def\opamp(#1)#2{%Customized opamp
    \begin{scope}[shift={(#1)}]
    %Component Shape
    \draw[line join=round] (0,0)++(-1,1.5)
        --++(2.5,-1.5) -- ++(-2.5,-1.5)-- cycle; 
    % Label and component identifier.
    \draw(0,0) node{\sf #2}; % IC LABEL
    % Draw the pins
    \draw(-1,1) node [anchor=180]{$-$} -- ++(-0.5,0)  coordinate (#2 IN-); % IN - 
    \draw(-1,-1) node [anchor=180]{$+$}  -- ++(-0.5,0) coordinate (#2 IN+); % IN +
    \draw(1.5,0)  -- ++(0.5,0) coordinate (#2 OUT); % OUT
    % Power supply pins
    \draw(0.25,0.77) -- ++(0,0.5) coordinate (#2 VCC); % VCC
    \draw(0.25,-0.77) -- ++(0,-0.5) coordinate (#2 VEE); % VEE
    \end{scope}
    }
    
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	% invoke the opamp	
	\opamp(0,0){U1}
	
	\draw(U1 IN+) 
	node[ground]{};
	
	\draw(U1 IN-)--++(0,1)
	to[R=$R$]++(-2,0)
	%--++(-0.5,0)
	%--++(0,0.25)
	%to[R, a=$2\Omega$]++(-2,0)
	%++(2,0)
	%--++(0,-0.5)
	%to[capacitor, l=$1F$]++(-2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(-0.5,0)
	node[circ, label=left:$V_1$]{};
	
	\draw(U1 IN-)--++(0,1)
	to[capacitor, a=$C$]++(2,0)
	
	%--++(0.5,0)
	%--++(0,0.25)
	%to[R=$\frac{1}{3}\Omega$]++(2,0)
	%++(-2,0)
	%--++(0,-0.5)
	%to[capacitor, a=$1F$]++(2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(0.5,0)
	--++(2,0)--++(0,-2);
	
	\draw(U1 OUT)--++(2,0)
	node[circ, label=right:$V_{2}$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};

	
\end{circuitikz}
\end{document}
```
$$T(s) = -\frac{Y_1}{Y_2} = -\frac{\frac{1}{R}}{Cs} = -\frac{1}{RCs}$$
###### C.

```tikz
\usepackage{circuitikz}
    \def\opamp(#1)#2{%Customized opamp
    \begin{scope}[shift={(#1)}]
    %Component Shape
    \draw[line join=round] (0,0)++(-1,1.5)
        --++(2.5,-1.5) -- ++(-2.5,-1.5)-- cycle; 
    % Label and component identifier.
    \draw(0,0) node{\sf #2}; % IC LABEL
    % Draw the pins
    \draw(-1,1) node [anchor=180]{$-$} -- ++(-0.5,0)  coordinate (#2 IN-); % IN - 
    \draw(-1,-1) node [anchor=180]{$+$}  -- ++(-0.5,0) coordinate (#2 IN+); % IN +
    \draw(1.5,0)  -- ++(0.5,0) coordinate (#2 OUT); % OUT
    % Power supply pins
    \draw(0.25,0.77) -- ++(0,0.5) coordinate (#2 VCC); % VCC
    \draw(0.25,-0.77) -- ++(0,-0.5) coordinate (#2 VEE); % VEE
    \end{scope}
    }
    
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	% invoke the opamp	
	\opamp(0,0){U1}
	
	\draw(U1 IN+) 
	node[ground]{};
	
	\draw(U1 IN-)--++(0,1)
	to[R=$1$]++(-2,0)
	%--++(-0.5,0)
	%--++(0,0.25)
	%to[R, a=$2\Omega$]++(-2,0)
	%++(2,0)
	%--++(0,-0.5)
	%to[capacitor, l=$1F$]++(-2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(-0.5,0)
	node[circ, label=left:$V_1$]{};
	
	\draw(U1 IN-)--++(0,1)
	to[R, a=$1$]++(2,0)
	
	%--++(0.5,0)
	%--++(0,0.25)
	%to[R=$\frac{1}{3}\Omega$]++(2,0)
	%++(-2,0)
	%--++(0,-0.5)
	%to[capacitor, a=$1F$]++(2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(0.5,0)
	--++(2,0)--++(0,-2);
	
	\draw(U1 OUT)--++(2,0)
	node[circ, label=right:$V_{2}$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};

	
\end{circuitikz}
\end{document}
```
$$T(s) = -\frac{1}{1}$$


###### A.
```tikz
\usepackage{circuitikz}
    \def\opamp(#1)#2{%Customized opamp
    \begin{scope}[shift={(#1)}]
    %Component Shape
    \draw[line join=round] (0,0)++(-1,1.5)
        --++(2.5,-1.5) -- ++(-2.5,-1.5)-- cycle; 
    % Label and component identifier.
    \draw(0,0) node{\sf #2}; % IC LABEL
    % Draw the pins
    \draw(-1,1) node [anchor=180]{$-$} -- ++(-0.5,0)  coordinate (#2 IN-); % IN - 
    \draw(-1,-1) node [anchor=180]{$+$}  -- ++(-0.5,0) coordinate (#2 IN+); % IN +
    \draw(1.5,0)  -- ++(0.5,0) coordinate (#2 OUT); % OUT
    % Power supply pins
    \draw(0.25,0.77) -- ++(0,0.5) coordinate (#2 VCC); % VCC
    \draw(0.25,-0.77) -- ++(0,-0.5) coordinate (#2 VEE); % VEE
    \end{scope}
    }
    
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	% invoke the opamp	
	\opamp(0,0){U1}
	
	\draw(U1 IN+) 
	node[ground]{};
	
	\draw(U1 IN-)--++(0,1)
	%to[R=$1$]++(-2,0)
	--++(-0.5,0)
	--++(0,0.25)
	to[R, a=$1$]++(-2,0)
	node[circ, label=left:$V_2$]{}
	++(2,0)
	--++(0,-0.5)
	to[R=$\frac{1}{H}$]++(-2,0)
	node[circ, label=left:$V_1$]{}
	++(0,0.5)
	++(0,-0.25);
	%--++(-0.5,0);
	
	\draw(U1 IN-)--++(0,1)
	%to[R, a=$1$]++(2,0)
	
	--++(0.5,0)
	--++(0,0.25)
	to[R=$Q$]++(2,0)
	++(-2,0)
	--++(0,-0.5)
	to[capacitor, a=$1$]++(2,0)
	--++(0,0.5)
	++(0,-0.25)
	--++(0.5,0)
	--++(2,0)--++(0,-2);
	
	\draw(U1 OUT)--++(2,0)
	node[circ, label=right:$V_{2}'$]{};
	
	\path(U1 VCC) node[ocirc, above]{};
	\path(U1 VEE) node[ocirc, below]{};

	
\end{circuitikz}
\end{document}
```
Using superposition:
$$T(s) = V_2\left(\frac{-1}{\frac{1}{Q} + s}\right) + V_1\left(\frac{-H}{\frac{1}{Q} + s}\right)$$
```tikz
\usepackage{circuitikz}
    \def\opamp(#1)#2{%Customized opamp
    \begin{scope}[shift={(#1)}]
    %Component Shape
    \draw[line join=round] (0,0)++(-1,1.5)
        --++(2.5,-1.5) -- ++(-2.5,-1.5)-- cycle; 
    % Label and component identifier.
    \draw(0,0) node{\sf #2}; % IC LABEL
    % Draw the pins
    \draw(-1,1) node [anchor=180]{$-$} -- ++(-0.5,0)  coordinate (#2 IN-); % IN - 
    \draw(-1,-1) node [anchor=180]{$+$}  -- ++(-0.5,0) coordinate (#2 IN+); % IN +
    \draw(1.5,0)  -- ++(0.5,0) coordinate (#2 OUT); % OUT
    % Power supply pins
    \draw(0.25,0.77) -- ++(0,0.5) coordinate (#2 VCC); % VCC
    \draw(0.25,-0.77) -- ++(0,-0.5) coordinate (#2 VEE); % VEE
    \end{scope}
    }
    
\begin{document}
\begin{circuitikz}[american, scale=1.2]
	% invoke the opamp	
	\opamp(0,0){A}
	
	\draw(A IN+) 
	node[ground]{};
	
	\draw(A IN-)--++(0,1)
	%to[R=$1$]++(-2,0)
	--++(-0.5,0)
	--++(0,0.25)
	to[R, a=$1$]++(-2,0)
	node[circ, label=left:$V_2$]{}
	++(2,0)
	--++(0,-0.5)
	to[R=$\frac{1}{H}$]++(-2,0)
	node[circ, label=left:$V_1$]{}
	++(0,0.5)
	++(0,-0.25);
	%--++(-0.5,0);
	
	\draw(A IN-)--++(0,1)
	%to[R, a=$1$]++(2,0)
	
	--++(0.5,0)
	--++(0,0.25)
	to[R=$Q$]++(2,0)
	++(-2,0)
	--++(0,-0.5)
	to[capacitor, a=$1$]++(2,0)
	--++(0,0.5)
	++(0,-0.25)
	--++(0.5,0)
	--++(2,0)--++(0,-2);
	
	
	\path(A VCC) node[ocirc, above]{};
	\path(A VEE) node[ocirc, below]{};

	\opamp(7,-2){C}
	
	\draw(C IN+) 
	node[ground]{};
	
	\draw(C IN-)--++(0,1)
	to[R=$1$]++(-2,0)
	%--++(-0.5,0)
	%--++(0,0.25)
	%to[R, a=$2\Omega$]++(-2,0)
	%++(2,0)
	%--++(0,-0.5)
	%to[capacitor, l=$1F$]++(-2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(-0.5,0)
	%node[circ, label=left:$V_1$]{};
	coordinate(C INPUT);
	
	\draw(C IN-)--++(0,1)
	to[capacitor, a=$C$]++(2,0)
	
	%--++(0.5,0)
	%--++(0,0.25)
	%to[R=$\frac{1}{3}\Omega$]++(2,0)
	%++(-2,0)
	%--++(0,-0.5)
	%to[capacitor, a=$1F$]++(2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(0.5,0)
	--++(2,0)--++(0,-2);
	
	
	\path(C VCC) node[ocirc, above]{};
	\path(C VEE) node[ocirc, below]{};
	
	\draw(A OUT)--++(2,0)
	%node[circ, label=right:$V_{2}'$]{};
	--(C INPUT);
	
	% invoke the opamp	
	\opamp(14,-4){B}
	
	\draw(B IN+) 
	node[ground]{};
	
	\draw(B IN-)--++(0,1)
	to[R=$1$]++(-2,0)
	%--++(-0.5,0)
	%--++(0,0.25)
	%to[R, a=$2\Omega$]++(-2,0)
	%++(2,0)
	%--++(0,-0.5)
	%to[capacitor, l=$1F$]++(-2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(-0.5,0)
	%node[circ, label=left:$V_1$]{};
	coordinate(B INPUT);
	
	\draw(B IN-)--++(0,1)
	to[R, a=$1$]++(2,0)
	
	%--++(0.5,0)
	%--++(0,0.25)
	%to[R=$\frac{1}{3}\Omega$]++(2,0)
	%++(-2,0)
	%--++(0,-0.5)
	%to[capacitor, a=$1F$]++(2,0)
	%--++(0,0.5)
	%++(0,-0.25)
	%--++(0.5,0)
	--++(2,0)--++(0,-2);
	
	\draw(B OUT)--++(2,0)
	node[circ, label=right:$V_{3}$]{};
	
	\path(B VCC) node[ocirc, above]{};
	\path(B VEE) node[ocirc, below]{};

	\draw(C OUT)--++(2,0)
	--(B INPUT);
	%node[circ, label=right:$V_{2}$]{};
	
\end{circuitikz}
\end{document}
```
