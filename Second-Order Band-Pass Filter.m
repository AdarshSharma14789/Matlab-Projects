% Parameters
R = 1e3;    % 1 kOhm
L = 10e-3;  % 10 mH
C = 100e-9; % 100 nF

% Frequency range
f = logspace(2, 6, 1000);  % 100 Hz to 1 MHz
omega = 2 * pi * f;

% Transfer function H(jω) = Vout(jω) / Vin(jω)
H = @(omega) (1j * omega * L) ./ (R + 1j * omega * L + 1 ./ (1j * omega * C));

% Calculate magnitude and phase
H_mag = abs(H(omega));
H_phase = angle(H(omega));

% Plot magnitude response
figure;
subplot(2, 1, 1);
semilogx(f, 20 * log10(H_mag), 'LineWidth', 1.5);
title('Magnitude Response of Band-Pass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;

% Plot phase response
subplot(2, 1, 2);
semilogx(f, rad2deg(H_phase), 'LineWidth', 1.5);
title('Phase Response of Band-Pass Filter');
xlabel('Frequency (Hz)');
ylabel('Phase (degrees)');
grid on;
