clc;
n = 8; dt = 0.02; fs = 1/dt; T = 0.16;

t_intervalo = (0:n-1) / fs;

y = 5 + cos(2*pi*12.5.*t_intervalo) + sin(2*pi*18.75.*t_intervalo);

Y = fft(y) / n; % Primeiro coeficiente é a média das amostras

f = (0:n-1)*fs/n;

nyquist = fs/2;

Y(1) = []; f(1) = [];

f = (1:n/2) / (n/2)*nyquist;

Pyy = abs(Y(1:n/2)).^2;

stem(f, Pyy, 'LineWidth', 2, 'MarkerFaceColor', 'blue'); grid;

title('Espectro de Frequência');

xlabel('Frequencia (Hz)'); ylim([0 0.3]);