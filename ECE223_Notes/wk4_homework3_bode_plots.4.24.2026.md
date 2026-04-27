## Homework 3
#### Problem 1
```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw[thick](0,0)
	to[sV, l=$V_1$]++(0,4)--++(1,0)
	to[R=$R_1$]++(0,-2)
	node[circ, label=left:$V_A$]{}--++(1,0)
	node[ocirc, label=above right:$+$]{}++(-1,0)
	to[R=$R_1$]++(0,-2)++(0,4)--++(3,0)
	to[capacitor, l=$C_1$]++(0,-2)
	node[circ, label=right:$V_B$]{}--++(-1,0)
	node[ocirc, label=above left:$-$]{}++(1,0)
	to[R=$R$]++(0,-2)
	--(0,0);
	
	\draw(2.5,2)
	node[label=above:$V_2$]{};
\end{circuitikz}
\end{document}
```
$$V_A = V_1\frac{R_1}{R_1 + R_1} = \frac{1}{2}V_1$$
$$V_{B} = V_1\frac{R}{R + \frac{1}{sC}}$$
$$V_2 = V_A - V_B$$
$$V_2 = V_1\frac{1}{2} - V_1\frac{R}{R + \frac{1}{sC}} = V_1\left(\frac{1}{2}-\frac{R}{R + \frac{1}{sC}}\right)$$
$$T(j\omega) = \frac{V_2}{V_1} = \left(\frac{1}{2} - \frac{j\omega}{j\omega + \frac{1}{RC}}\right) = \frac{\frac{1}{2}j\omega + \frac{1}{2RC} - j\omega }{j\omega  + \frac{1}{RC}}$$
$$\boxed{T(j\omega) = \frac{-\frac{1}{2}(j\omega-\frac{1}{RC})}{j\omega + \frac{1}{RC}}}$$

```tikz
\usepackage{pgfplots}

\begin{document}

\begin{tikzpicture}
\begin{axis}[
    width=15cm,
    height=15cm,
    xlabel={$\{\mathcal{R}e(s)\}$},
    ylabel={$\{\mathcal{I}m(s)\}$},
    xmin=-2, 
    xmax=2, 
    ymin=-2, 
    ymax=2,
    grid=major,
    axis lines=middle,
    enlargelimits=true,
]
\addplot[orange, thick, only marks, mark=x, mark size=6pt] coordinates {(-1, 0)};
\node[orange, rotate=45, above right, font=\Large] at (axis cs:-1, 0) {$-\frac{1}{RC}$};

\addplot[green!70!black, thick, only marks, mark=o, mark size=6pt] coordinates {(1,0)}; \node[green!70!black, rotate=45, above right, font=\Large] at (axis cs:1, 0) {$\frac{1}{RC}$};

\end{axis}

\end{tikzpicture}
\end{document}
```

![[hw3_1.png]]
#### Problem 2

##### a.
$$T_1(s) = \frac{s + 3}{s + 0.5}$$
$$T_1(j\omega) = \frac{3}{0.5}\left(\frac{j\frac{\omega}{3} + 1}{j\frac{\omega}{0.5} + 1}\right) =6 \left(\frac{j\frac{\omega}{3} + 1}{j\frac{\omega}{0.5} + 1}\right) $$
$$|T_1(j\omega)| = 20\log_{10}(6) + 20\log_{10}\left|j\frac{\omega}{3} + 1\right| - 20\log_{10}\left|j\frac{\omega}{0.5}+1\right|$$
We choose the pole first because it is closer to $(\mathcal{R}e,, \mathcal{I}m) = (0,0)$.
![[hw3_2a_hand.png]]

![[hw3_2a.png]]
##### b.
$$T_2(s) = 50\frac{1 + 0.025s}{1 + 0.05s} = 50\left(\frac{0.025}{0.05}\right)\frac{\frac{1}{0.025} + s}{\frac{1}{0.05} + s}  = 25\frac{40 + s}{20+s}$$
$$\Longrightarrow T(j\omega) = 50\frac{j\frac{\omega}{40} + 1}{j\frac{\omega}{20} + 1}$$
$$|T(j\omega)| = 20\log_{10}|50| + 20\log_{10}\left|j\frac{\omega}{40} + 1\right| - 20\log_{10}\left|j\frac{\omega}{20} + 1\right|$$
![[hw3_2b_hand.png]]
![[hw3_2b.png]]
##### c.
$$T_3(s) = \frac{1}{s}$$
The method of modeling and dealing with a divide by 0 means the plot goes to infinity as $\omega_{+\to0}$
$$|T_3(j\omega)| = 20\log_{10}(1) - 20\log_{10}(j\omega)$$
At $\omega = 0$ 
$$|T_3| = 0dB - 20\log_{10}(0) = \infty dB$$
At $\omega = 1$ 
$$|T_3| = 0dB - 20\log_{10}(0) = 0 dB$$

As $\omega \to \infty$
$$T_3 = -\infty\ dB$$
$$\angle T_3 = \arctan(\text{numerator}) - \arctan(\text{denominator})$$
$$ = \arctan(\mathcal{R}e) - \arctan(\mathcal{I}m) = 0^\circ - 90^\circ$$
Since the denominator will always be only $j\omega$ (Imaginary) and the numerator always a constant (Real), the phase will always be $90^\circ$
![[hw3_2c_hand.png]]
![[hw3_2c.png]]

#### Code Used for Plots
```python
#!.venv/bin/python3

'''
Transfer function analysis for simple circuits

Takes a raw numerator and denominator per a voltage divider method

Simplifies, creates a Bode plot
'''

from sympy import symbols, simplify, Poly
import control as ct
import matplotlib.pyplot as plt
import numpy as np

s = symbols('s')

# Defining the raw transfer function
#numerator = (-1/2)*(s-(1/10))
#denominator = ((1/10) + s)
numerator = (s + 3)
denominator = (s + 0.5)

H = numerator / denominator

# Simplify it
H_simplified = simplify(H)

# Split the simplified expression into numerator and denominator
num_expr, den_expr = H_simplified.as_numer_denom()

num_coeffs = Poly(num_expr, s).all_coeffs()
den_coeffs = Poly(den_expr, s).all_coeffs()

# Force the constant term to be 1
den_coeffs = Poly(den_expr, s).all_coeffs()

# Force the constant term to be a float

# Use a list comprehension to ensure every element is a standard Python float

# guard against divide by 0
const_term = float(den_coeffs[-1])
if const_term == 0:
    normalized_num = [float(c) for c in num_coeffs]
    normalized_den = [float(c) for c in den_coeffs]
else:
    normalized_num = [float(c) / const_term for c in num_coeffs]
    normalized_den = [float(c) / const_term for c in den_coeffs]


sys = ct.TransferFunction(normalized_num, normalized_den)
print(sys)

# 1. Step Response: How V2 responds if you suddenly turn on V1 (to 1V)
time, response = ct.step_response(sys)
plt.figure()
plt.plot(time, response)
plt.title("Step Response (Charging the Capacitor)")
plt.xlabel("Time (s)")
plt.ylabel("Output Voltage (V)")
plt.grid()

# 2. Bode Plot: How the circuit handles different frequencies
plt.figure()
#ct.bode_plot(sys, dB=True)
omega = np.logspace(-10,10,500)

response = ct.frequency_response(sys, omega)
mag   = response.magnitude   # linear ratio
phase = response.phase       # radians


fig, ax1 = plt.subplots()
ax2 = ax1.twinx()

ax1.semilogx(omega, 20 * np.log10(mag), color='black')
ax2.semilogx(omega, np.degrees(phase), color='red')


ax1.set_xlabel('Frequency (rad/s)')
ax1.set_ylabel('Gain (dB)', color='black')
ax2.set_ylabel('Phase (deg)', color='red')
ax1.tick_params(axis='y', labelcolor='black')
ax2.tick_params(axis='y', labelcolor='red')
ax1.grid(True, which='both', linestyle='--', alpha=0.5)

ax1.axvline(x=1, color='gray', linestyle=':', linewidth=1)
ax1.annotate('$\\omega_0$', xy=(1, -20), color='gray')

plt.savefig('step_response.png')

print("Plot saved to step_response.png")
```