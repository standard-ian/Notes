## Class 1
#### Parallel Plate Capacitor
##### Example
In a basic capacitor circuit, where a 12V battery is connected to a top and bottom plate, if the area of the plates doubles and the cap is allowed to charge again...
1. The potential difference will remain the same because the plates are connected to the battery.
2. $$E =\frac{\Delta V}{d}$$
3. The electric field will stay the same, area is not a part of the way that potential difference relates to $E$
##### Example
A capacitor is fully charged, then disconnected. It the cap plates are pulled apart...
1. The charge will not change
2. The distance will increase
3. The equation for electric field between 2 plates is $E = \frac{\sigma}{\epsilon_0}$, Potential is the integral of this field with respect to $d$, so $\Delta V \propto d$ after integrating. 
4. As $d$ increases, $\Delta V$ must also.

##### Energy Stored in a Capacitor
How much energy a cap stores is equal to how much work must be done by the battery to charge the cap.

The battery must "roll" charge $dq$ up to a potential "hill" of $V$, which increases as more charge is added.

$$dW_{battery} = dU_{charge} = Vdq $$
$$V=\frac{q}{C}$$
$$V = \frac{qdq}{C}$$
The total work done by the battery, transferring charge $Q$:
$$W_{ext} = \int_0^Qq\ \frac{dq}{C} = \frac{1}{C}\int_0^Q q\ dq = \frac{q^2}{2C}|^Q_0= \frac{Q^2}{2C}$$
**The change in the capacitor's potential energy is:**
$$U = \frac{Q^2}{2C}$$
Since $Q = CV$
$$U = \frac{C^2V^2}{2C} = \color{orange}\frac{1}{2}CV^2$$
Stored energy is proportional to the square of the voltage of the cap. The cap holds this energy until it is released, discharging the cap - much like a stretched spring.

The potential energy stored in a cap is stored in the electric field between the plates. As the cap charges, electric field strengthens, increasing the amount of stored energy.

The energy density $u_E$ of the electric field is defined as:
$$u_E = \frac{energy\ stored\ in\ capacitor = \frac{1}{2}CV^2}{volume\ of\ space\ occupied\ by\ electric\ field = Ad} = (\frac{1}{2}CV^2)(\frac{1}{Ad})$$
$$C = \frac{\epsilon_0A}{d};\ \ V = Ed$$
$$ = \frac{\epsilon_0AE^2d^2}{d2Ad} = \color{orange}\frac{\epsilon_0E^2}{2}$$
**The energy density is just proportional to the square of the electric field strength**

##### Example
The plates of a parallel plate cap are separated by $1.0mm$. When the cap is charges to $500V$, what is the energy density of the electric field between the plates? ($\Delta V = 500V$)

$$u_E = \frac{\epsilon_0E^2}{2}$$
So, how can we find $E$ with the given info?
1. Electric field from a charge plate is $\frac{\sigma}{\epsilon_0}$, where $\sigma = \frac{Q}{A}$ But we don't have any way to find $A$.
2. Electric field strength is $\frac{\Delta V}{d}$. We do know these things.
$$u_E = \frac{\epsilon_0 \Delta V^2}{2d^2} = \frac{8.85\times 10^{-12} \times (500)^2}{2\times (10^{-3})^2} = 1.106J$$
##### Example
A parallel plate cap of spacing $d$ is charged to $500V$, then disconnected and isolated. If the plates are separated so that $d$ doubles, what happens to the energy density of $E$ between the plates?

We know:
$$E = \frac{\Delta V}{d};\ \ u_E = \frac{\epsilon_0E^2}{2}$$
Because the plates are **disconnected** $\Delta V$ can change, so we cannot really find $E$ here.

But we can use:
$$E = \frac{\sigma}{\epsilon_0}$$
We know the charge density remains the same, so $E$ remains the same, and so does the potential energy.

In the same problem, what happens to the stored energy between the plates?
$$U = (energy\ density)(volume\ between\ plates)$$
Energy density remains the same, the volume between the plates is doubling as $d$ does.

#### Cylindrical Capacitor
We could have other geometries of capacitor. 
How would we find $C$ the capacitance?

![[Pasted image 20260210121244.png]]

##### Start with Definition of Capacitance
$$C = \frac{Q}{V}$$
There is a potential difference between the inner and outer surfaces and it will be different than with the parallel plate geometry.

$|Q|$ is the amount of charge on each shell (conductor). $V$ is the difference in potential between the two shells. 

##### Strategy:
1. Put charges $\pm Q$ on the opposite conductors.
2. Use Gauss's Law to find the electric field between the two conductors.
3. Find the potential difference $V$ between the conductors by integrating $\vec{E}$ across the plates.
4. Take the ratio $\frac{Q}{V}$ to get $C$.

##### 1. "Putting" the Charges on the Conductors
The charge is located on the surface **only** of the surfaces, because they are conductors.

This matters because it sets out limits of integration. Where are the charges located?

If we place a Gaussian surface **inside** the outer conductor, it can represent the $E$ at that point. We know $E$ in a conductor is 0. This means the Gaussian surface must enclose a positive charge on the inner surface of the outer shell, because it must cancel the negative charge in the inner cylinder.

If we do this again on the inner shell, it is again 0 because that is also a conductor. 
Therefore, we know that all the negative charge is located on the **outside** surface of the inner shell.

##### 2. Setting up Gauss's Law
That means we are integrating from $a_2 \to a_3$ in the above image. (Outer surface of inner cylinder ($-$) to the inner surface of the outer cylinder ($+$)).

We'll then use a Gaussian surface of length $L$ and radius $r$ placed between the cylinders.

The electric flux through one side of the cylinder, which has $A = 2\pi rL$
$$-E(2\pi rl) = \frac{Q_{enclosed}}{\epsilon_0} = \frac{\lambda l}{\epsilon_0} = \frac{-(\frac{Q}{L})l}{\epsilon_0}$$
$$|E| = \frac{Q}{2\pi rL \epsilon_0}$$
##### 3. Finding Potential Difference
Integrate $\vec{E}$ between plates:
$$V_+ - V_- = -\int_{a_2}^{a_3} \vec{E}\cdot d\vec{r} = \int_{a_2}^{a_3}E\ dr$$
$$E = \frac{1}{2\pi \epsilon_0}\frac{Q}{Lr}$$
$$\Delta V = \frac{1}{2\pi \epsilon_0}\frac{Q}{L}\int_{a_2}^{a_3}\frac{dr}{r} = \frac{1}{2\pi \epsilon_0}\frac{Q}{L}ln(r)|_{a_2}^{a_3}$$
$$= \frac{1}{2\pi \epsilon_0}\frac{Q}{L}(ln\ a_3 - ln\ a_2)$$
$$V = \frac{1}{2\pi\epsilon_0}\frac{Q}{L}ln\left(\frac{a_3}{a_2}\right)$$
##### 4. Take the Ratio $\frac{Q}{V}$
$$C = \frac{Q}{V};\ \ V = \frac{1}{2\pi\epsilon_0}\frac{Q}{L}ln\left(\frac{a_3}{a_2}\right)$$
$$\color{orange}C = \frac{2\pi \epsilon_0 L}{ln\left(\frac{a_3}{a_2}\right)}$$
#### Capacitors in Circuit
##### Parallel
In parallel, the potential across all caps in parallel is the same as the source because voltage is the same in all branches of a parallel circuit.

##### Series
The potential across caps in series, the potential across each will differ. If we sum all potentials though, they must add to the source potential. 

If all caps have the same $C$ they would be the same potential difference though.

## Class 2
#### Dielectric Materials
Real world capacitors will have some material between the parallel plates to maintain separation of charges. 

When adding a dielectric material between the plates, this will increase the capacitance relative to a vaccum.

Dielectrics are polarizable. Their charge can be separated into positive and negative regions in the material.

Once an electric field is sent through the dielectric material, a dipole will be created, which will create it's own electric field $\vec{E}_{induced}$.
$$\vec{E} = \vec{E}_0 + \vec{E}_{induced}$$
Adding a dielectric reduces the electric field inside the capacitor because a dipole is induced in the dielectric that produces a field pointing in the opposite direction of the $\vec{E}$ created by the charged plates, effectively reducing it when they are summed.

$$\color{orange} Dielectric\ Constant: k \equiv \frac{E_0}{E}$$
