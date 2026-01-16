 1. An RL circuit is given below. The inductor is connected to a switch, which can be switched between nodes $A$ and $B$. First, the switch has been at position $A$ for a long time, being powered by the $20V$ battery, when it is switched to position $B$. That time is marked as $t=0$. 
	1. Before the switch is moved to position B, the inductor has been reached a steady state, and the current and voltage are at a stable maximum.
	2. After the switch moves to $B$,  for time $t \ge 0$ the inductor, there will no longer be a voltage supplied to the inductor, and it will release energy countering the drop in current (transient response), rapidly at first until eventually reaching $0V$ (steady state) at the positive terminal of the inductor.
	3. The circuit reaches steady state (the transient will die out) when $-\frac{t}{L/R} = -\frac{t}{0.01} = -5$, or when $t=0.05s$.
	4. After it reaches the steady state at $B$, and is moved to $A$, it will take another $5\tau$ to once more reach a  point where the maximum current is passing through the circuit (steady state), however, it will reach the steady state when $\frac{t}{0.02} = -5$ or when $t = 0.1s$.
	5. https://claude.ai/share/f63b24f5-9191-4308-942d-7107707c1cbf
	
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[vsource, v=$20V$, invert]++(0,2)
	to[R=$5\Omega$]++(2,0)
	node[label=above:$A$, ocirc]{}++(0.25,0)
	to[inductor, l=$0.1H$]++(0,-2);
	
	\draw(2.5,2)
	node[label=above:$B$, ocirc]{}
	to[R=$10\Omega$]++(2,0)--++(0,-2)--(0,0);
	
\end{circuitikz}
\end{document}
```
$$v(t) = v_{final} + (v_{initial} - v_{final})e^{-\frac{t}{L/R}}$$
$$i(t) = i_{final} + (i_{initial} - i_{final})e^{-\frac{t}{L/R}}$$
2. An RC circuit is given below. The inductor is connected to a switch, which can be switched between nodes $A$ and $B$. First the switch has been at position $B$ for a long time. Then, at $t = 0$ the switch is moved to position $A$ to be powered by the $20V$ battery.
	1. Before the switch is moved to position $A$, the current through the capacitor is at a minimum, and the voltage is $0$ in the B loop.
	2. After the switch moves to $B$, the capacitor will begin building up charge. The cap is placed in a voltage divider and will charge to a $15V$ max. The output impedance at the cap will be the equivalent of 4, $15M\ohm$ resistors in parallel, or $3.75M\ohm$. 
	3. The circuit will reach a steady state where no current can flow when the capacitor is fully charged, at $-\frac{t}{RC} = -\frac{t}{3.75\times 10^6(1\times 10^{-6})} = -5$, this occurs at $t = 18.75s$. At this point, $v_C(18.75) = 15 - 15e^{-\frac{18.75}{3.75}} = 14.9V$. The capacitor is 99% charged and current will no longer flow, effectively.
	4. https://gemini.google.com/share/ea6796b007fa
	   
```tikz
\usepackage{circuitikz}

\begin{document}
\begin{circuitikz}[american, scale=2, font=\Large]
	\draw(0,0)
	to[vsource, v=$20V$, invert]++(0,2)
	to[R=$5M\Omega$]++(2,0)
	to[R=$15M\Omega$]++(0,-2)++(0,2)--++(1,0)
	node[label=above:$A$, ocirc]{}++(0.25,0)
	to[capacitor, l=$1\mu F$]++(0,-2);
	
	\draw(3.5,2)
	node[label=above:$B$, ocirc]{}
	to[R=$10M\Omega$]++(2,0)--++(0,-2)--(0,0);
	
\end{circuitikz}
\end{document}

```

3. A 2H inductor has an AC current $i(t) = 0.7sin(500t - 15^\circ)A$.
	1. $i(t) = 0.7cos(500t-105^\circ)$ 
		1. Amplitude: 0.7
		2. Angular Frequency ($\omega$): 500
		3. Frequency: $\frac{\omega}{2\pi} =\frac{500}{2\pi} = 79.58Hz$
	2. The inductor voltage is found using $v(t) = L\frac{di}{dt}$
		1. Chain rule: $\frac{di}{dt} = 0.7sin(500t-15^\circ) = 350cos(500t - 15^\circ)$
		2. $\frac{di}{dt}\times L = 350cos(500t-15^\circ) \times 2 = 700cos(500t-15^\circ)V$, so the current lags behind the voltage, and the voltage has a 1000 times greater amplitude.
		3. If the frequency of the AC current is doubled, the voltage would be $2\times 1400cos(1000t - 15^\circ)$ so the amplitude would double also, and the same phase lag would be present. If the frequency of the current was halved, the amplitude of the voltage would be also.

4. At a steady state of a circuit, a $40\micro F$ capacitor in the circuit has an $AC$ current $i_C(t) = 0.1cos(1000t - 90^\circ)A$
	1. For the current:
		1. Amplitude: 0.1
		2. Angular Frequency ($\omega$): 1000
		3. Frequency: $\frac{\omega}{2\pi} =\frac{1000}{2\pi} = 159Hz$
	2. The capacitor voltage is $v(t) = \frac{1}{C}\int\ i(t)\ dt$
		1. $\frac{1}{40\times 10^{-6}}\int 0.1 cos(1000t - 90^\circ) = 250\int cos(1000t - 90^\circ) = \frac{1}{4}sin(1000t - 90^\circ) = 0.25cos(1000t - 180^\circ)$
		2. We can see here that for the capacitor, voltage lags behind current (inverse of the inductor)
	3. If the current frequency is doubled, the capacitor voltage will be $\frac{1}{8}cos(1000t - 180^\circ)V$, the amplitude will be halved. If the current frequency is halved, the amplitude will double. This resembles the pattern with RC circuits and the DC sine waves from 221!
		