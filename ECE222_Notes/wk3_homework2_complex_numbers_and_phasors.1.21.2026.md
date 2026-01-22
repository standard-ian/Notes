## Homework 2
1. Convert the numbers into rectangular form
	1. $z_2 = 2e^{-j\frac{\pi}{2}}$
		$=2(cos(-\frac{\pi}{2}) + jsin(-\frac{\pi}{2}))$
		$=2(0 + -1)$
		$= 2(-1) = -2j$
	2. $z_3 = 3j^3$
		$=3(cos(3))$
		
2. Complex numbers $z_1$ and $z_2$ are:
   $$z_1=-3+ 2j\ \ \ \ \ z_2=1-2j$$
	Convert them into polar form and compute:
	1. $z_1z_2$
		1. $z_1 = -3 + 2j = \sqrt{(-3)^2 + 2^2}(cos(\theta)+jsin(\theta)) = \sqrt{13}e^{j\theta}$
		2. $\theta = arctan(\frac{2}{-3}) = -0.588 rad + \pi = 2.56rad$, Quadrant 2, add $\pi$
		3. $z_1 = \sqrt{13}e^{j2.56}$
		4. $z_2 = 1 - 2j = \sqrt{1^2+(-2)^2}(cos(\theta) + jsin(\theta))= \sqrt{5}e^{j\theta}$
		5. $\theta = arctan(\frac{-2}{1}) = -1.11rad$, Quadrant 4, leave negative
		6. $z_2 = \sqrt{5}e^{-j1.11}$
		7. $z_1z_2 = \sqrt{13}e^{j2.56}\sqrt{5}e^{-j1.11} =\sqrt{13}\sqrt{5}e^{2.56j - 1.11j} = \sqrt{13}\sqrt{15}e^{1.45} = \sqrt{195}e^{1.45}$
	2. $\frac{z_1}{\bar{z_1}}$
		1. $z_1 = \sqrt{13}e^{j2.56}$
		2. $\bar{z_1} = \sqrt{13}e^{-j2.56}$
		3. $\frac{\sqrt{13}e^{j2.56}}{\sqrt{13}e^{-j2.56}} = e^{j5.12}$
	3. $\frac{z_1}{\bar{z_2}}$
		1. $z_1 = \sqrt{13}e^{j2.56}$
		2. $\bar{z_2} = \sqrt{5}e^{j1.11}$
		3. $\frac{\sqrt{13}e^{j2.56}}{\sqrt{5}e^{j1.11}} = \frac{\sqrt{13}}{\sqrt{5}}e^{j2.56 - j1.11} = \frac{\sqrt{65}}{5}e^{j1.45}$
	
3. Express the sinusoidal functions in complex and phasor form
	1. $i(t) = 5 cos(\omega t + \frac{\pi}{6}) A$
		1. Complex: $5(cos(\omega t + \frac{\pi}{6}) + jsin(\omega t + \frac{\pi}{6})) = 5e^{j(\omega t + \frac{\pi}{6})}$
		2. Phasor: $5\angle 30^\circ$ or $5e^{j\frac{\pi}{6}}$
	2. $i(t) =-2cos(\omega t + \frac{3\pi}{4})A$
		2. $-2(cos(\frac{3\pi}{4})+jsin(\frac{3\pi}{4}))$
		3. Multiply by -1 and add $\pi$ to cancel
		4. Complex: $2(cos(\frac{7\pi}{4})+jsin(\frac{7\pi}{4}))$
		5. Phasor: $2\angle315^{\circ}$ or $2e^{j\frac{7\pi}{4}}$
	
4. Use Phasors to add sinusoidal functions: $x(t) = 20cos(\omega t - 30^\circ)$ and $y(t) =40cos(\omega t + 60^\circ)$
	1. $\tilde{x} = 20\angle-30^\circ = 20(cos(-30^\circ) + jsin(-30^\circ)) = 20(\frac{\sqrt{3}}{2}-j\frac{1}{2}) = 10\sqrt{3} - j10$
	2. $\tilde{y} = 40\angle 60^\circ = 40(cos(60^\circ) + jsin(60^\circ)) = 40(\frac{1}{2}+j\frac{\sqrt{3}}{2}) = 20 + j20\sqrt{3}$
	3. $\tilde{x} + \tilde{y} = j20\sqrt{3} - j10 +  10\sqrt{3} + 20 = 37.3 + j24.6$
	4. $37.3 + j24.6 = \sqrt{(37.3^2)+(24.6)^2} cos(\omega t + \phi)$
	5. $\phi = \arctan(\frac{24.6}{37.3}) = 33.4^\circ$
	6. $=\sqrt{1996.5}cos(\omega t + 33.4^\circ ) \approx 44.7cos(\omega t + 33.4^\circ)$