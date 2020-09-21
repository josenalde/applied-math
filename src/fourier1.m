clc;
n = 8; dt = 0.02; fs = 1/dt; T = 0.16;

t_intervalo = (0:n-1) / fs;

y = 5 + cos(2*pi*12.5.*t_intervalo) + sin(2*pi*18.75.*t_intervalo);

subplot(3,1,1);
plot(t_intervalo, y, '-ok', 'LineWidth', 2, 'MarkerFaceColor', 'red');grid;
title('(a) f(t) versus tempo(s)');

Y = fft(y) / n; % Primeiro coeficiente é a média das amostras

Y'

nyquist = fs/2;

fmin = 1 / T;

f = linspace(fmin, nyquist, n/2);

f

Y'
Y(1) = []; YP = Y(1:n/2)

subplot(3,1,2);

stem(f, real(YP), 'ok', 'LineWidth', 2, 'MarkerFaceColor', 'blue'); grid;

title('real versus freq');

subplot(3,1,3);

stem(f, imag(YP), 'ok', 'LineWidth', 2, 'MarkerFaceColor', 'blue'); grid;

title('imaginário versus freq');
