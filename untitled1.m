% Parameters
R1 = 1e3;     % 1 kOhm
R2 = 2e3;     % 2 kOhm
C1 = 1e-6;    % 1 uF
C2 = 2e-6;    % 2 uF
L = 1e-3;     % 1 mH
V_DC = 5;     % 5 V DC
V_AC_amp = 1; % 1 V AC amplitude
f = 50;       % 50 Hz AC frequency
omega = 2 * pi * f;

% Time vector
t = linspace(0, 0.1, 1000);  % 0 to 100 ms

% Differential equation setup
% di1/dt = (V_DC + V_AC - i1*R1 - q1/C1 - i2*R2) / L
% dq1/dt = i1
% dq2/dt = i2

% Define the system of ODEs
function dydt = mixedCircuit(t, y, R1, R2, C1, C2, L, V_DC, V_AC_amp, omega)
    i1 = y(1);  % Current through R1 and C1
    q1 = y(2);  % Charge on C1
    q2 = y(3);  % Charge on C2
    V_AC = V_AC_amp * sin(omega * t);  % AC voltage source
    V_R2 = (q1 / C1) - (q2 / C2);      % Voltage across R2
    V_L = L * (V_DC + V_AC - i1 * R1 - q1 / C1 - V_R2) / L;  % Inductor voltage
    i2 = V_R2 / R2;  % Current through R2
    dydt = [(V_DC + V_AC - i1 * R1 - q1 / C1 - i2 * R2) / L; i1; i2];
end

% Initial conditions
y0 = [0; 0; 0];  % Initial current and charges

% Solve the ODEs
[t, sol] = ode45(@(t, y) mixedCircuit(t, y, R1, R2, C1, C2, L, V_DC, V_AC_amp, omega), t, y0);

% Extract currents and charges
i1_t = sol(:, 1);
q1_t = sol(:, 2);
q2_t = sol(:, 3);
v_c1 = q1_t / C1;  % Voltage across C1
v_c2 = q2_t / C2;  % Voltage across C2

% Plot results
figure;
subplot(4, 1, 1);
plot(t, i1_t, 'r', 'LineWidth', 1.5);
title('Current through R1 and C1');
xlabel('Time (s)');
ylabel('Current (A)');
grid on;

subplot(4, 1, 2);
plot(t, v_c1, 'b', 'LineWidth', 1.5);
title('Voltage across Capacitor C1');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;

subplot(4, 1, 3);
plot(t, v_c2, 'g', 'LineWidth', 1.5);
title('Voltage across Capacitor C2');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;

subplot(4, 1, 4);
plot(t, V_DC + V_AC_amp * sin(omega * t) - v_c1 - R1 * i1_t, 'm', 'LineWidth', 1.5);
title('Voltage across Inductor');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;
