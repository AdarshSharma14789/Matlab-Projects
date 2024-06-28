%Active low pass filter

% Parameters
R1 = 1e3; % Resistor 1 (Ohms)
R2 = 1e3; % Resistor 2 (Ohms)
C1 = 100e-9; % Capacitor 1 (Farads)
C2 = 100e-9; % Capacitor 2 (Farads)
f = logspace(1, 6, 1000); % Frequency range (Hz)
omega = 2*pi*f;

% Transfer function H(jω)
H = @(omega) 1 ./ (1 + 1j*omega*R1*C1 + (omega*R1*C1).^2);

% Calculate magnitude and phase
H_mag = abs(H(omega));
H_phase = angle(H(omega));

% Plot magnitude response
figure;
subplot(2,1,1);
semilogx(f, 20*log10(H_mag), 'LineWidth', 1.5);
title('Magnitude Response of Low-Pass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;

% Plot phase response
subplot(2,1,2);
semilogx(f, rad2deg(H_phase), 'LineWidth', 1.5);
title('Phase Response of Low-Pass Filter');
xlabel('Frequency (Hz)');
ylabel('Phase (degrees)');
grid on;
