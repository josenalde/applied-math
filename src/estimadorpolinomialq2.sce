// questao 2, lista 5
// Prof. Josenalde Oliveira - TADS MA II - Out/2015

x = 10:10:100;
fx = [380.43 397.5 412.01 423.96 433.35 440.18 444.45 446.16 445.31 441.90];

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

// Como a segunda diferenca finita é constante: -0.0256,  o coeficiente a do polinomio fica:

// a = d2x / 2

a = d2x(1) / 2;

// como o polinomio é quadratico, tomar dois pares aleatórios dos conjuntos x e fx para montar a matriz A e o vetor f, de modo a resolver o sistema Az = f e encontrar o vetor z = [ b c] com os coeficientes

// tomando o terceiro e quinto par

f = [fx(3) - a*x(3)^2; fx(5) - a*x(5)^2];

A = [x(3) 1; x(5) 1];

z = inv(A)*f;

b = z(1); c = z(2);

printf("a = %.2f, b = %.2f, c = %.2f\n", a, b, c)

printf("f(x) aproximada pelos pontos experimentais: %.2fx3 + %.2fx2 - %.2fx\n", a, b, c)

p = poly(0, 'p');

derivada1 = derivat(a*p^2 + b*p + c);

t = roots(derivada1); // encontrar pontos críticos - raízes da primeira derivada

printf("Pontos Críticos:\n %.2f - Coordenada x Ponto de Máximo\n", t(1))

// coordenada y do ponto t(1)
yt1 = a*t(1)^2 + b*t(1) + c;

// plotar grafico

fxplot = a.*x.^2 + b.*x + c;

plot(x, fxplot, t(1), yt1, 'r*'); xgrid; xtitle("Polinomio aproximado para f(x) - q2 Lista 5 - Prof. Josenalde Oliveira MA II TADS");
xlabel('x'); ylabel('f(x)');
