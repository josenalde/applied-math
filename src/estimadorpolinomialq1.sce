// questao 1, lista 5
// Prof. Josenalde Oliveira - TADS MA II - Out/2015

x = 0:0.05:0.5;
fx = [1.1400 1.2592 1.3127 1.3198 1.2998 1.2720 1.2557 1.2702 1.3348 1.4688 1.6913];

for i = 1:length(x)-1
    dx(i) = (fx(i+1) - fx(i)) / (x(i+1) - x(i));
end

printf("Primeira Diferença:\n")
disp(x')
disp(dx)

for i = 1:length(dx)-1
    d2x(i) = (dx(i+1) - dx(i)) / (x(i+1) - x(i));
end

printf("Segunda Diferença:\n")
disp(x')
disp(d2x)

for i = 1:length(d2x)-1
    d3x(i) = (d2x(i+1) - d2x(i)) / (x(i+1) - x(i));
end

printf("Terceira Diferença:\n")
disp(x')
disp(d3x)

// Como a terceira diferenca finita é constante: 154.4 (o último ponto pode ser desprezado pois é fora da curva - outlier), o coeficiente a do polinomio fica:

// a = d3x / 6

a = d3x(1) / 6;

// como o polinomio é cúbico, tomar três pares aleatórios dos conjuntos x e fx para montar a matriz A e o vetor f, de modo a resolver o sistema Az = f e encontrar o vetor z = [ b c d] com os coeficientes

// tomando o segundo, quarto e setimo par

f = [fx(2) - a*x(2)^3; fx(4) - a*x(4)^3; fx(7) - a*x(7)^3];

A = [x(2)^2 x(2) 1; x(4)^2 x(4) 1; x(7)^2 x(7) 1];

z = inv(A)*f;

b = z(1); c = z(2); d = z(3);

printf("a = %.2f, b = %.2f, c = %.2f, d = %.2f\n", a, b, c, d)

printf("f(x) aproximada pelos pontos experimentais: %.2fx3 + %.2fx2 - %.2fx + %.2f\n", a, b, c, d)

p = poly(0, 'p');

derivada1 = derivat(a*p^3 + b*p^2 + c*p + d);

t = roots(derivada1); // encontrar pontos críticos - raízes da primeira derivada

printf("Pontos Críticos:\n %.2f - Coordenada x Ponto de Mínimo;\n %.2f - Coordenada x Ponto de Máximo\n", t(1), t(2))

// coordenada y do ponto t(1)
yt1 = a*t(1)^3 + b*t(1)^2 + c*t(1) + d;

// coordenada y do ponto t(2)
yt2 = a*t(2)^3 + b*t(2)^2 + c*t(2) + d;

derivada2 = derivat(derivada1);

s = roots(derivada2); // encontrar pontos de inflexao - raízes da segunda derivada

printf("Pontos Críticos:\n %.2f - Coordenada x Ponto de Inflexão", s(1))

// coordenada y do ponto s(1) - inflexao

ys1 = a*s(1)^3 + b*s(1)^2 + c*s(1) + d;

// plotar grafico

fxplot = a.*x.^3 + b.*x.^2 + c.*x + d;

plot(x, fxplot, t(1), yt1, 'r*', t(2), yt2, 'r*', s(1), ys1, 'r*'); xgrid; xtitle("Polinomio aproximado para f(x) - q1 Lista 5 - Prof. Josenalde Oliveira MA II TADS"); legend('f(x)', 'pontos criticos');
xlabel('x'); ylabel('f(x)');
