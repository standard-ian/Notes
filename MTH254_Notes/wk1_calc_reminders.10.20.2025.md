## Derivative Rules

### Basic Rules

**Constant Rule**: $\frac{d}{dx}[c] = 0$

**Power Rule**: $\frac{d}{dx}[x^n] = nx^{n-1}$

**Constant Multiple**: $\frac{d}{dx}[cf(x)] = c \cdot f'(x)$

**Sum/Difference**: $\frac{d}{dx}[f(x) \pm g(x)] = f'(x) \pm g'(x)$

### Product and Quotient Rules

**Product Rule**: $\frac{d}{dx}[f(x)g(x)] = f'(x)g(x) + f(x)g'(x)$

**Quotient Rule**: $\frac{d}{dx}\left[\frac{f(x)}{g(x)}\right] = \frac{f'(x)g(x) - f(x)g'(x)}{[g(x)]^2}$

### Chain Rule

**Chain Rule**: $\frac{d}{dx}[f(g(x))] = f'(g(x)) \cdot g'(x)$

Alternative notation: $\frac{dy}{dx} = \frac{dy}{du} \cdot \frac{du}{dx}$

### Common Derivatives

**Exponential Functions**:

- $\frac{d}{dx}[e^x] = e^x$
- $\frac{d}{dx}[a^x] = a^x \ln(a)$
- $\frac{d}{dx}[e^{f(x)}] = f'(x)e^{f(x)}$

**Logarithmic Functions**:

- $\frac{d}{dx}[\ln(x)] = \frac{1}{x}$
- $\frac{d}{dx}[\log_a(x)] = \frac{1}{x \ln(a)}$
- $\frac{d}{dx}[\ln(f(x))] = \frac{f'(x)}{f(x)}$

**Trigonometric Functions**:

- $\frac{d}{dx}[\sin(x)] = \cos(x)$
- $\frac{d}{dx}[\cos(x)] = -\sin(x)$
- $\frac{d}{dx}[\tan(x)] = \sec^2(x)$
- $\frac{d}{dx}[\cot(x)] = -\csc^2(x)$
- $\frac{d}{dx}[\sec(x)] = \sec(x)\tan(x)$
- $\frac{d}{dx}[\csc(x)] = -\csc(x)\cot(x)$

**Inverse Trigonometric Functions**:

- $\frac{d}{dx}[\arcsin(x)] = \frac{1}{\sqrt{1-x^2}}$
- $\frac{d}{dx}[\arccos(x)] = -\frac{1}{\sqrt{1-x^2}}$
- $\frac{d}{dx}[\arctan(x)] = \frac{1}{1+x^2}$
- $\frac{d}{dx}[\text{arccot}(x)] = -\frac{1}{1+x^2}$
- $\frac{d}{dx}[\text{arcsec}(x)] = \frac{1}{|x|\sqrt{x^2-1}}$
- $\frac{d}{dx}[\text{arccsc}(x)] = -\frac{1}{|x|\sqrt{x^2-1}}$

**Hyperbolic Functions**:

- $\frac{d}{dx}[\sinh(x)] = \cosh(x)$
- $\frac{d}{dx}[\cosh(x)] = \sinh(x)$
- $\frac{d}{dx}[\tanh(x)] = \text{sech}^2(x)$

---

## Integral Rules

### Basic Rules

**Constant Rule**: $\int c , dx = cx + C$

**Power Rule**: $\int x^n , dx = \frac{x^{n+1}}{n+1} + C$ (where $n \neq -1$)

**Special Case**: $\int \frac{1}{x} , dx = \ln|x| + C$

**Constant Multiple**: $\int cf(x) , dx = c\int f(x) , dx$

**Sum/Difference**: $\int [f(x) \pm g(x)] , dx = \int f(x) , dx \pm \int g(x) , dx$

### Integration Techniques

**u-Substitution**: If $u = g(x)$, then $\int f(g(x))g'(x) , dx = \int f(u) , du$

**Integration by Parts**: $\int u , dv = uv - \int v , du$

Mnemonic for choosing u: **LIATE** (Logarithmic, Inverse trig, Algebraic, Trig, Exponential)

### Common Integrals

**Exponential Functions**:

- $\int e^x , dx = e^x + C$
- $\int a^x , dx = \frac{a^x}{\ln(a)} + C$

**Logarithmic Functions**:

- $\int \ln(x) , dx = x \ln(x) - x + C$
- $\int \frac{1}{x} , dx = \ln|x| + C$

**Trigonometric Functions**:

- $\int \sin(x) , dx = -\cos(x) + C$
- $\int \cos(x) , dx = \sin(x) + C$
- $\int \tan(x) , dx = -\ln|\cos(x)| + C$ or $\ln|\sec(x)| + C$
- $\int \cot(x) , dx = \ln|\sin(x)| + C$
- $\int \sec(x) , dx = \ln|\sec(x) + \tan(x)| + C$
- $\int \csc(x) , dx = -\ln|\csc(x) + \cot(x)| + C$
- $\int \sec^2(x) , dx = \tan(x) + C$
- $\int \csc^2(x) , dx = -\cot(x) + C$
- $\int \sec(x)\tan(x) , dx = \sec(x) + C$
- $\int \csc(x)\cot(x) , dx = -\csc(x) + C$

**Inverse Trigonometric Functions**:

- $\int \frac{1}{\sqrt{a^2-x^2}} , dx = \arcsin\left(\frac{x}{a}\right) + C$
- $\int \frac{1}{a^2+x^2} , dx = \frac{1}{a}\arctan\left(\frac{x}{a}\right) + C$
- $\int \frac{1}{x\sqrt{x^2-a^2}} , dx = \frac{1}{a}\text{arcsec}\left(\frac{|x|}{a}\right) + C$

**Hyperbolic Functions**:

- $\int \sinh(x) , dx = \cosh(x) + C$
- $\int \cosh(x) , dx = \sinh(x) + C$
- $\int \tanh(x) , dx = \ln(\cosh(x)) + C$

---

## Definite Integrals

**Fundamental Theorem of Calculus**: $\int_a^b f(x) , dx = F(b) - F(a)$, where $F'(x) = f(x)$

**Properties**:

- $\int_a^b f(x) , dx = -\int_b^a f(x) , dx$
- $\int_a^a f(x) , dx = 0$
- $\int_a^b f(x) , dx + \int_b^c f(x) , dx = \int_a^c f(x) , dx$
- $\int_a^b cf(x) , dx = c\int_a^b f(x) , dx$
- $\int_a^b [f(x) \pm g(x)] , dx = \int_a^b f(x) , dx \pm \int_a^b g(x) , dx$

**u-Substitution with Limits**: When $u = g(x)$, change limits from $x$ to $u$, or substitute back and use original limits

---

## Vector Calculus

### Vector Derivatives

**Position Vector**: $\mathbf{r}(t) = \langle x(t), y(t), z(t) \rangle$

**Velocity**: $\mathbf{v}(t) = \mathbf{r}'(t) = \langle x'(t), y'(t), z'(t) \rangle$

**Acceleration**: $\mathbf{a}(t) = \mathbf{r}''(t) = \mathbf{v}'(t) = \langle x''(t), y''(t), z''(t) \rangle$

**Speed**: $|\mathbf{v}(t)| = |\mathbf{r}'(t)| = \sqrt{[x'(t)]^2 + [y'(t)]^2 + [z'(t)]^2}$

### Vector Integrals

**Position from Velocity**: $\mathbf{r}(t) = \int \mathbf{v}(t) , dt = \left\langle \int v_x , dt, \int v_y , dt, \int v_z , dt \right\rangle + \mathbf{C}$

(Don't forget: $\mathbf{C}$ is actually a vector $\langle C_1, C_2, C_3 \rangle$!)

**Arc Length**: $L = \int_a^b |\mathbf{r}'(t)| , dt = \int_a^b \sqrt{[x'(t)]^2 + [y'(t)]^2 + [z'(t)]^2} , dt$

---

## Special Integrals & Tricks

### Trigonometric Integrals

$\int \sin^2(x) , dx = \frac{x}{2} - \frac{\sin(2x)}{4} + C$

$\int \cos^2(x) , dx = \frac{x}{2} + \frac{\sin(2x)}{4} + C$

$\int \tan^2(x) , dx = \tan(x) - x + C$

$\int \sec^3(x) , dx = \frac{1}{2}\left[\sec(x)\tan(x) + \ln|\sec(x) + \tan(x)|\right] + C$

### Useful Identities

**Pythagorean Identities**:

- $\sin^2(x) + \cos^2(x) = 1$
- $1 + \tan^2(x) = \sec^2(x)$
- $1 + \cot^2(x) = \csc^2(x)$

**Double Angle**:

- $\sin(2x) = 2\sin(x)\cos(x)$
- $\cos(2x) = \cos^2(x) - \sin^2(x) = 2\cos^2(x) - 1 = 1 - 2\sin^2(x)$

**Power Reducing**:

- $\sin^2(x) = \frac{1 - \cos(2x)}{2}$
- $\cos^2(x) = \frac{1 + \cos(2x)}{2}$

---

## Important Reminders

⚠️ **Always add $+ C$ for indefinite integrals!**

⚠️ **For vector integrals, you get a constant vector $\langle C_1, C_2, C_3 \rangle$**

⚠️ **Chain rule is your friend** — most complicated derivatives need it

⚠️ **Check your answer** by differentiating your integral (or integrating your derivative)

⚠️ **Absolute values matter** in logarithms: $\ln|x|$ not $\ln(x)$

⚠️ **Don't forget to change limits** when doing u-substitution with definite integrals