% Parameters
R1 = 10e3;  % 10 kOhm
R2 = 10e3;  % 10 kOhm
R3 = 1e3;   % 1 kOhm (part of gain setting)
R4 = 1e3;   % 1 kOhm (part of gain setting)
C1 = 100e-9; % 100 nF
C2 = 100e-9; % 100 nF
A = 3;      % Gain (must be slightly greater than 3 for sustained oscillations)

% Time vector
t = linspace(0, 0.05, 1000);  % 0 to 50 ms

% Differential equation setup
% We approximate the Wien Bridge Oscillator behavior using state-space equations

function dydt = wienBridgeOscillator(t, y, R1, R2, R3, R4, C1, C2, A)
    Vout = y(1);  % Output voltage
    Vfb = y(2);   % Feedback voltage
    dydt = [
        (A * Vfb - Vout) / (R3 * C1);
        (Vout / R1 + (Vout - Vfb) / R2 - Vfb / (R4 * C2))
    ];
end

% Initial conditions
y0 = [0; 0];  % Initial output voltage and feedback voltage

% Solve the ODEs
[t, sol] = ode45(@(t, y) wienBridgeOscillator(t, y, R1, R2, R3, R4, C1, C2, A), t, y0);

% Extract output voltage
Vout_t = sol(:, 1);

% Plot results
figure;
plot(t, Vout_t, 'b', 'LineWidth', 1.5);
title('Wien Bridge Oscillator Output Voltage');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;
