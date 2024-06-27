
%Circuit Description
%A common-emitter amplifier is a basic transistor amplifier configuration. It provides significant voltage gain and is widely used in analog circuits. We'll simulate a common-emitter amplifier circuit with an NPN transistor, resistors, and capacitors.

%Analysis Using MATLAB
%We'll analyze the time-domain response to an input signal.





% Parameters
Vcc = 12;     % Supply voltage
Rc = 1e3;     % Collector resistor (1 kOhm)
Re = 100;     % Emitter resistor (100 Ohm)
Rb = 10e3;    % Base resistor (10 kOhm)
C1 = 10e-6;   % Coupling capacitor (10 uF)
C2 = 10e-6;   % Bypass capacitor (10 uF)
beta = 100;   % Current gain of the transistor

% Input signal
f = 1e3;      % 1 kHz frequency
Vin = 0.1 * sin(2 * pi * f * t);  % 100 mV peak

% Time vector
t = linspace(0, 0.01, 1000);  % 0 to 10 ms

% DC bias point
Ib = (Vcc - Vbe) / (Rb + (beta+1) * Re);
Ic = beta * Ib;
Vce = Vcc - Ic * Rc;

% Small-signal parameters
gm = Ic / Vt;  % Transconductance
rpi = beta / gm;
ro = V_A / Ic;  % Output resistance

% Transfer function
H = @(omega) -gm * Rc ./ (1 + 1j * omega * (Rc * C2) + (1 ./ (1j * omega * C1)));

% Calculate output voltage
Vout = Vin .* H(2 * pi * f);

% Plot input and output signals
figure;
subplot(2, 1, 1);
plot(t, Vin, 'b', 'LineWidth', 1.5);
title('Input Signal');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;

subplot(2, 1, 2);
plot(t, Vout, 'r', 'LineWidth', 1.5);
title('Output Signal of Common-Emitter Amplifier');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;
