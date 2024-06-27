% Parameters
Vm = 10;          % Peak voltage of AC source
f = 50;           % Frequency of AC source (50 Hz)
R_load = 1e3;     % Load resistance (1 kOhm)
D = 0.7;          % Diode forward voltage drop (0.7V)
t = linspace(0, 0.1, 1000);  % Time vector (0 to 0.1 s)

% AC input voltage
Vin = Vm * sin(2 * pi * f * t);

% Output voltage of the bridge rectifier
Vout = abs(Vin) - D;
Vout(Vout < 0) = 0;

% Plot input and output voltages
figure;
subplot(2, 1, 1);
plot(t, Vin, 'b', 'LineWidth', 1.5);
title('Input AC Voltage');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;

subplot(2, 1, 2);
plot(t, Vout, 'r', 'LineWidth', 1.5);
title('Output DC Voltage of Bridge Rectifier');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;
