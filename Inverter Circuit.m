% Inverter Circuit


% Parameters
Vdc = 12; % DC input voltage (V)
R_load = 10; % Load resistance (Ohms)
L = 1e-3; % Inductor (H)
C = 100e-6; % Capacitor (F)
f_sw = 50; % Output frequency (Hz)
t = 0:1e-6:0.1; % Time vector

% Generate PWM signal
f_pwm = 20e3; % PWM frequency (Hz)
D = 0.5 * (1 + sin(2*pi*f_sw*t)); % Duty cycle
PWM = square(2*pi*f_pwm*t, D*100);

% Initialize variables
Vout = zeros(size(t));
IL = zeros(size(t)); % Inductor current
VL = zeros(size(t)); % Inductor voltage

for k = 2:length(t)
    if PWM(k) > 0
        VL(k) = Vdc;
    else
        VL(k) = -Vout(k-1);
    end
    
    IL(k) = IL(k-1) + (VL(k)/L) * (t(k)-t(k-1));
    Vout(k) = Vout(k-1) + (IL(k)/C - Vout(k-1)/R_load) * (t(k)-t(k-1));
end

% Plot results
figure;
subplot(3,1,1);
plot(t, PWM);
title('PWM Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(t, Vout);
title('Output Voltage');
xlabel('Time (s)');
ylabel('Voltage (V)');

subplot(3,1,3);
plot(t, IL);
title('Inductor Current');
xlabel('Time (s)');
ylabel('Current (A)');
