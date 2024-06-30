# Matlab-Projects
Creating and simulating basic electrical circuits in MATLAB.


Circuit's description and their properties are given below:-




## **Project: RLC Circuit Analysis**


#### 1. Define the Circuit Elements
An RLC series circuit with a resistor (R), inductor (L), and capacitor (C) in series with a voltage source V(t).


#### 2. Setting Up the Differential Equations
The differential equation governing the RLC circuit is:

V(t)=VR +VL +VC

​V(t)=Ri(t)+L(di(t)/dt) + (1/c)∫i(t)dt

For a step input voltage:-
𝑉(𝑡) = 𝑉0

𝑉0=𝑅𝑖(𝑡)+𝐿𝑑𝑖(𝑡)𝑑𝑡+1/𝐶∫𝑖(𝑡)𝑑𝑡

#### 3. Solving the Equations Using MATLAB
We will use numerical methods to solve these equations.
Explanation
Parameters: Set values for the resistor, inductor, capacitor, and input voltage.
Time Vector: Define a time range from 0 to 10 ms.
ODE Definition: The function rlcCircuit represents the system of differential equations describing the RLC circuit.
Initial Conditions: Start with zero current and charge.
Solving ODEs: Use MATLAB's ode45 to solve the system of differential equations.
Extract and Plot Results: Extract the current, charge, and voltage across the capacitor, and plot them over time.





## **Circuit: Bridge Rectifier**



#### 1)Circuit Description:- 

A bridge rectifier is used to convert AC (alternating current) to DC (direct current). It consists of four diodes arranged in a bridge configuration. We'll simulate the rectification of an AC signal.



#### 2)Analysis Using MATLAB:-  

We'll analyze the time-domain response of the bridge rectifier to an AC input signal.



#### 3)Bridge Rectifier:- 

Parameters for the AC source, load resistor, and diode are defined.
The input AC voltage is generated using a sine function.
The output voltage is calculated by rectifying the AC input (taking the absolute value and accounting for diode voltage drop).
The input and output voltages are plotted to observe the rectification process.




## **Circuit: Notch Filter**



#### 1)Circuit Description:

A notch filter (or band-stop filter) is used to attenuate a specific frequency band while allowing other frequencies to pass. We'll create a notch filter using resistors, capacitors, and an inductor.



#### 2)Analysis Using MATLAB:

We'll analyze the frequency response of the notch filter to see how it attenuates a specific frequency.



#### 3)Notch Filter:

Parameters for the resistor, inductor, and capacitor are defined.
A transfer function H(jω) is used to calculate the frequency response of the notch filter.
The magnitude and phase responses are plotted over a wide frequency range to observe the filter's behavior.




## **Circuit : Second-Order Band-Pass Filter**



#### 1)Circuit Description:

A second-order band-pass filter consists of a resistor (R), an inductor (L), and a capacitor (C) arranged to allow signals within a certain frequency range to pass while attenuating signals outside this range.



#### 2)Analysis Using MATLAB:

We'll analyze the frequency response of this filter.



#### 3)Band-Pass Filter:

We define the parameters for the R, L, and C components.
We use a logarithmic frequency range to analyze the filter's behavior.
We calculate the transfer function H(jω) and plot the magnitude and phase responses over the frequency range.




## **Circuit: Wien Bridge Oscillator**


#### 1)Circuit Description:-

The Wien Bridge Oscillator is a type of electronic oscillator that generates sine waves. It consists of resistors, capacitors, and an operational amplifier (op-amp). It uses a feedback network to generate sustained oscillations.


#### 2)Analysis Using MATLAB:-

We'll analyze the time-domain response to see the sine wave oscillations.


#### 3)Wien Bridge Oscillator:-

Parameters for resistors and capacitors are defined.
We use state-space equations to approximate the behavior of the Wien Bridge Oscillator.
We solve the differential equations using ode45 and plot the output voltage to observe the oscillations.




## **Circuit : RLC Series-Parallel Circuit**


#### 1)Circuit Description

An RLC series-parallel circuit consists of a resistor (R), an inductor (L), and a capacitor (C) arranged in a more complex configuration. For instance, the resistor and inductor are in series, and this series combination is in parallel with the capacitor.


#### 2)Analysis Using MATLAB

We'll analyze the time-domain response of this circuit to a step input voltage.


#### 3)RLC Series-Parallel Circuit:

We define the parameters for the R, L, and C components.
We set up and solve the differential equations describing the circuit using ode45.
We plot the time-domain response for the current, voltage across the capacitor, and voltage across the inductor.




## **Circuit: Common-Emitter Amplifier**


#### 1)Circuit Description :- 

A common-emitter amplifier is a basic transistor amplifier configuration. It provides significant voltage gain and is widely used in analog circuits. We'll simulate a common-emitter amplifier circuit with an NPN transistor, resistors, and capacitors.


#### 2)Analysis Using MATLAB :- 

We'll analyze the time-domain response to an input signal.




## **Circuit: Active Filter Design**


#### 1)Circuit Description:

An active filter uses operational amplifiers (op-amps) along with resistors and capacitors to achieve desired frequency response characteristics.


## **Circuit: Inverter Circuit**


#### 1)Circuit Description:

An inverter converts DC to AC and is commonly used in power electronics. It involves switches (e.g., transistors or MOSFETs), a control signal, and filtering components.


## **Circuit: Phase-Locked Loop (PLL)**

#### 1)Circuit Description

A Phase-Locked Loop is used in frequency synthesis, demodulation, and clock recovery. It involves a phase detector, a low-pass filter, and a voltage-controlled oscillator (VCO).
