# Lab 2: RC Audio Filter Background and Preparation

**Ian Leuty** **Quinn Hathaway**

---

## Table of Contents

- [[#Introduction]]
    - [[#USB Audio Adapter]]
- [[#Initial Schematics and Calculations]]
    - [[#Measuring Output Impedance of a Phone]]
    - [[#Measuring Input Impedance of USB Audio Adapter]]
- [[#Experimental Measurements]]
    - [[#1kHz from Laptop Audio Jack Across Divider with 33Ω R_test]]
    - [[#1kHz from Function Generator Across Divider with 10kΩ R_test]]
- [[#Test and Simulation Results]]
    - [[#Figure 2.6: Output Impedance of Phone: Experimental Setup]]
    - [[#Figure 2.7: Input Impedance of the USB Audio Adapter: Experimental Setup]]
- [[#Analysis]]
    - [[#Output Impedance of Audio Source (smartphone)]]
    - [[#Input Impedance of USB Audio Adapter]]
- [[#Conclusion]]

---

## Introduction

Lab 2 and 3 will both work towards the same project. The overall goal is to design a device using an RC filter, that will filter certain frequencies of a song input through a 3.5mm headphone jack, and allow them to be output via another jack to a powered speaker or laptop.

Lab 2 is the prep section for Lab 3, and there are four main goals of Lab 2.

1. Design system to receive audio signal, and expose the tip, ring, and sleeve of the TRS cable via 3.5mm jack.
2. Using another 3.5mm jack, allow the signal to be sent from the breadboard out to a USB audio adapter/laptop sound card. This will allow the manipulated signal in Lab 3 to be analyzed or listened to.
3. Determine the input impedance of the speakers/headphones/USB sound card and laptop speakers.
4. Determine the output impedance of the device supplying an audio signal.

### USB Audio Adapter

The device used to receive the signal will be this Sabrent USB-C audio adapter. The TRS output of the breadboard based filter in Lab 3 will be fed into the mic input, then looped back to a laptop's speakers using recording software such as Apple's Garageband.

#### Figure 2.1: Sabrent USB-C Audio Adapter

![[wk3_lab2_images/usb_audio_device.png]]

---

## Initial Schematics and Calculations

The audio signal will be supplied by a cell phone, through a 3.5 TRS cable. The output will be through the USB-C audio adapter, plugged into a laptop, and looped back to output via Garageband software.

In the following schematics, blue sections of the circuit represent parts inaccessible to us, either inside the phone, adapter, or cable.

### Measuring Output Impedance of a Phone

Initially, measure between $A$ and $B$ with no resistor. This will be the source voltage supplied by the phone using [Online Tone Generator](https://onlinetonegenerator.com/). A $1\text{kHz}$ signal at ~80% Volume will be used.

Then, use a test resistor of $33\Omega$ to create a divider as pictured.

First, we'll measure across $AB$ without $R_{test}$. This will give the open circuit voltage. Because the impedance of the open circuit is very high, the voltage will all "drop" across the open circuit. The DMM will have a very large internal impedance similar to the open circuit. It follows that this open circuit voltage measured across $AB$ is therefore $V_S$.

The voltage divider equation and manipulation to solve for $R_{unknown}$ can be applied.

#### Figure 2.2: Detail of Measuring Output Impedance of Phone with $33\Omega$ Test Resistor

```tikz
\usepackage{circuitikz}
\begin{document}

% female TRS connector
\def\trsf(#1)#2#3{
    \begin{scope}[shift={(#1)}]
        \draw[color=#3](0,2) coordinate (#2 RING) to[short] ++(1,0) -- ++(-45:0.2) -- ++(45:0.2);
        \draw[color=#3](0,1) coordinate (#2 TIP) to[short] ++(.6,0) -- ++(45:0.2) -- ++(-45:0.2);
        \draw[color=#3](2,0.5) coordinate (#2 SLEEVE) to[short] ++(0,0.5) rectangle ++(-0.2,1);
    \end{scope}
}

% male TRS connector
\def\trsm(#1)#2#3{
    \begin{scope}[shift={(#1)}]
        \draw[opacity=0.8, color=#3] (2, 1.859) -- (0.7, 1.859) --++(-135:0.1) --++(135:0.1) --++(-.1, 0) -- (0.25, 1.5) -- (0.45, 1.141) --++(0.1,0)--++(45:0.1) --++(-45:0.1)--(2, 1.141);
        \filldraw(0.941, 1.141) rectangle (1.041, 1.859);
        \filldraw(1.341, 1.141) rectangle (1.441, 1.859);
        \draw[opacity=0.8, color=#3](2, 1) rectangle (2.2, 2.0);
        \draw[opacity=0.8, dashed, color=#3](3.25, 1.75) coordinate (#2 RING) -- (1.391, 1.75);
        \draw[opacity=0.8, dashed, color=#3](3.25, 1.3) coordinate (#2 TIP) -- (0.991, 1.3);
        \draw[opacity=0.8, color=#3](2.2, 1) coordinate (#2 SLEEVE);
    \end{scope}
}

\begin{circuitikz}[american]

    % invoke the male side, skip the sleeve ground, indicated on the female side in this schematic
    % phone laptop impedance R_L
    \trsm(0,0){T1M}{blue};
    \draw[color=blue](T1M TIP)
    node[ocirc, label=below:$R$]{}--++(1,0)--++(0,0.23)
    coordinate(A);
    \draw[color=blue](T1M RING)
    node[ocirc, label=above:$L$]{}--++(1,0)--(A)
    to[R=$R_{unknown}$]++(2,0)--++(1,0)
    node[circ, label=right:TRS From Phone($V_S$)]{};

    % and the female side with pinouts matching 3.5mm breakout board
    \trsf(0,0){T1F}{black};
    \draw(T1F SLEEVE)--++(0,-2)
    node[ground]{};
    \draw(T1F TIP)
    node[ocirc, label=left:$A$]{}
    to[R, a=$R_{test} {=} 33\Omega$]++(0,-2)
    node[ocirc, label=left:$B$]{}--++(2,0);
    \draw(T1F RING)--++(-2,0)
    node[circ, label=left:$L$ (Unused)]{};

\end{circuitikz}
\end{document}
```

### Measuring Input Impedance of USB Audio Adapter

For the input impedance of the sound card, we know the source voltage as it will be supplied by the function generator. We can confirm it by measuring across $A\to C$.

We will measure across $B\to C$ to get a ratio of $\frac{V_{out}}{V_{in}}$, then algebraically manipulate the voltage divider formula to find $Z_{in}$ of the USB audio device.

Since the adapter uses a mono microphone line in, carried only on the tip of the TRS cable, we need to make sure we only use the tip side on the connector, as pictured below, when measuring input impedance and in the subsequent filter circuit.

#### Figure 2.3: Detail of Measuring Input Impedance of USB Audio Adapter with $10k\Omega$ Test Resistor

```tikz
\usepackage{circuitikz}
\begin{document}

% female TRS connector
\def\trsf(#1)#2#3{
    \begin{scope}[shift={(#1)}]
        \draw[color=#3](0,2) coordinate (#2 RING) to[short] ++(1,0) -- ++(-45:0.2) -- ++(45:0.2);
        \draw[color=#3](0,1) coordinate (#2 TIP) to[short] ++(.6,0) -- ++(45:0.2) -- ++(-45:0.2);
        \draw[color=#3](2,0.5) coordinate (#2 SLEEVE) to[short] ++(0,0.5) rectangle ++(-0.2,1);
    \end{scope}
}

% male TRS connector
\def\trsm(#1)#2#3{
    \begin{scope}[shift={(#1)}]
        \draw[opacity=0.8, color=#3] (2, 1.859) -- (0.7, 1.859) --++(-135:0.1) --++(135:0.1) --++(-.1, 0) -- (0.25, 1.5) -- (0.45, 1.141) --++(0.1,0)--++(45:0.1) --++(-45:0.1)--(2, 1.141);
        \filldraw(0.941, 1.141) rectangle (1.041, 1.859);
        \filldraw(1.341, 1.141) rectangle (1.441, 1.859);
        \draw[opacity=0.8, color=#3](2, 1) rectangle (2.2, 2.0);
        \draw[opacity=0.8, dashed, color=#3](3.25, 1.75) coordinate (#2 RING) -- (1.391, 1.75);
        \draw[opacity=0.8, dashed, color=#3](3.25, 1.3) coordinate (#2 TIP) -- (0.991, 1.3);
        \draw[opacity=0.8, color=#3](2.2, 1) coordinate (#2 SLEEVE);
    \end{scope}
}

\begin{circuitikz}[american]

    % invoke the male side, skip the sleeve ground, indicated on the female side in this schematic
    % phone laptop impedance R_L
    \trsm(0,0){T1M}{blue};
    \draw[color=blue](T1M TIP)
    node[ocirc, label=below:$R$]{}--++(1,0)--++(0,0.23)
    coordinate(A);
    \draw[color=blue](T1M RING)
    node[ocirc, label=above:$L$]{}--++(1,0)--(A)--++(1,0)
    to[R=$Z_{in}$]++(2,0)
    node[circ, label=below:Sabrent USB Audio Adapter]{};
    % and the female side with pinouts matching 3.5mm breakout board
    \trsf(0,0){T1F}{black};
    \draw(T1F SLEEVE)--++(0,-1)
    node[ocirc, label=right:$C$]{}--++(0,-1)
    node[ground]{};
    \draw[black](T1F TIP)
    node[ocirc, label=above:$B$]{}
    to[R=$R_{test} {=} 10k\Omega$]++(-2,0)
    node[ocirc, label=above:$A$]{}
    --++(-1,0)
    node[circ, label=below left:$1kHz\ 50mV$ Function Generator ($V_S$)]{};
    \draw[black](T1F RING)--++(-2,0)
    node[circ, label=left:$L$ (Unused)]{};

\end{circuitikz}
\end{document}
```

---

## Experimental Measurements

### $1\text{kHz}$ from Laptop Audio Jack Across Divider with $33\Omega$ $R_{test}$

| $V_S$ | $V_{R_{test}}$ | $R_{test}$ |
| ----- | -------------- | ---------- |
| $0.959\text{ V}$ | $0.939\text{ V}$ | $33\Omega$ |

#### Figures 2.4.a-b: Output Impedance of Phone: Scope Screenshots

![[wk3_lab2_images/lab2_out1.jpg]]

![[wk3_lab2_images/lab2_out2.jpg]]

### $1\text{kHz}$ from Function Generator Across Divider with $10k\Omega$ $R_{test}$

| $V_S = V_{A\to C}$ | $V_{A\to B}$ | $R_{test}$ |
| ------------------ | ------------ | ---------- |
| $1.029$ | $0.441$ | $10k\Omega$ |

#### Figures 2.5.a-b: Input Impedance of USB Audio Adapter: Scope Screenshots

Voltage across the entire circuit $V_S$ (left) and voltage across the audio adapter (right).

![[wk3_lab2_images/lab2_out1.jpg]]

![[wk3_lab2_images/lab2_out2.jpg]]

---

## Test and Simulation Results

Included are some images of the experimental setup to measure input impedance of the sound card and output impedance of the audio source.

### Figure 2.6: Output Impedance of Phone: Experimental Setup

Shown below is the setup of the circuit measuring the voltage drop across the $33\Omega$ test resistor.

![[wk3_lab2_images/lab2_out3.jpg]]

### Figure 2.7: Input Impedance of the USB Audio Adapter: Experimental Setup

Shown below is the setup of the circuit measuring the voltage across the audio device using a $10k\Omega$ resistor in the divider.

![[wk3_lab2_images/lab2_in3.jpg]]

---

## Analysis

### Output Impedance of Audio Source (smartphone)

#### Figure 2.8: Circuit Diagram to Measure Output Impedance

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2]
   \draw(0,0)
   to[sV, l=$V_{S}$]++(0,1)
   to[R=$R_{unknown}$]++(2,0)
   node[ocirc, label=above:$A$]{}
   --++(0,-1)
   node[ocirc, label=below:$B$]{}
   --++(-2,0);

   \draw(4,0)
   to[sV, l=$V_{S}$]++(0,1)
   to[R=$R_{unknown}$]++(2,0)
   node[ocirc, label=above:$A$]{}
   to[R=$R_{test}$]++(0,-1)
   node[ocirc, label=below:$B$]{}
   --++(-2,0);
\end{circuitikz}
\end{document}
```

$$V_{A\to B} = V_{S}\frac{R_{test}}{R_{test} + R_{unknown}}$$

$$V_{A\to B}(R_{test}) + V_{AB}(R_{unknown}) = V_{S}(R_{test})$$

$$(V_{A\to B})R_{unknown} = V_{S}(R_{test}) - V_{A\to B}(R_{test})$$

$$R_{unknown} = \frac{V_{S}(R_{test})}{V_{A\to B}} - R_{test}$$

$$R_{unknown} = \frac{V_{S}(R_{test})}{V_{R_{test}}} - R_{test} = \frac{0.959(33)}{0.939} - 33 \approx 0.7\Omega$$

### Input Impedance of USB Audio Adapter

#### Figure 2.9: Circuit Diagram to Measure Input Impedance

```tikz
\usepackage{circuitikz}
\begin{document}
\begin{circuitikz}[american, scale=2]
   \draw(0,0)
   to[sV, l=$V_{S}$]++(0,1)
   node[ocirc, label=above:$A$]{}
   to[R=$R_{test} {=} 10k\Omega$]++(2,0)
   node[ocirc, label=above:$B$]{}--++(1,0)
   node[circ, label=right:$V_{B\to C}$]{}++(-1,0)
   to[generic, l=$Z_{Audio\ Adapter}$]++(0,-1)
   node[ocirc, label=below:$C$]{}
   --++(-2,0);
\end{circuitikz}
\end{document}
```

$$\frac{V_{B\to C}}{V_{A \to C}} = \frac{Z_{Audio\ Adapter}}{R_{test} + Z_{Audio\ Adapter}}$$

$$\frac{V_{B\to C}}{V_{A\to C}}(R_{test}) + \frac{V_{B\to C}}{V_{A\to C}}(Z_{Audio\ Adapter}) = Z_{Audio\ Adapter}$$

$$\frac{V_{B\to C}}{V_{A\to C}}(R_{test}) = Z_{Audio\ Adapter} - \frac{V_{B\to C}}{V_{A\to C}}Z_{Audio\ Adapter}$$

$$Z_{Audio\ Adapter} = \frac{\frac{V_{B\to C}}{V_{A\to C}}(R_{test})}{1 - \frac{V_{B\to C}}{V_{A\to C}}} = \frac{\frac{0.441}{1.029}(10k)}{1 - \frac{0.441}{1.029}} \approx 7.5k\Omega$$

---

## Conclusion

1. The phone supplying the audio signal had a very low output impedance.
2. The input impedance of the USB-C audio adapter was $7.5k\Omega$.
3. The output impedance of the iPhone used for an audio source was $0.7\Omega$.
4. The mic input on the audio adapter uses only a mono signal on the tip of the TRS, so on the breadboard side, we need to only use the tip pin for the female connector. If the jack is facing you, and the pins are facing down as they would be when plugged in to the breadboard, the 2 redundant ring pins are located in the upper right corner of the component.
5. A output impedance of the filter should be selected so that it is at most $\frac{1}{10}$ the input impedance of the USB audio adapter.