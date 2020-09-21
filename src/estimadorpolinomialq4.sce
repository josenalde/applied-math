// questao 4, lista 5
// Prof. Josenalde Oliveira - TADS MA II - Out/2015

clear all;

x =  [0 4 8 12 16 20 24 28];
fx = [0.5 0.564 0.756 1.076 1.524 2.1 2.804 3.636];

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

// Como a segunda diferenca finita é constante: 0.008 , o coeficiente a do polinomio fica:

// a = d2x / 2

a = d2x(1) / 2;

// como o polinomio é quadratico, tomar dois pares aleatórios dos conjuntos x e fx para montar a matriz A e o vetor f, de modo a resolver o sistema Az = f e encontrar o vetor z = [ b c] com os coeficientes

// tomando o segundo e o quarto par

f = [fx(2) - a*x(2)^2; fx(4) - a*x(4)^2];

A = [x(2) 1; x(4) 1];

z = inv(A)*f;

b = z(1); c = z(2);

printf("a = %.3f, b = %.3f, c = %.3f\n", a, b, c)

printf("f(x) aproximada pelos pontos experimentais: %.3fx2 + %.3fx - %.3f\n", a, b, c)

p = poly(0, 'p');

derivada1 = derivat(a*p^2 + b*p + c);

t = roots(derivada1); // encontrar pontos críticos - raízes da primeira derivada

printf("Pontos Críticos:\n %.3f - Coordenada x Ponto de Mínimo\n", t(1));

// coordenada y do ponto t(1)
yt1 = a*t(1)^2 + b*t(1) + c;

// plotar grafico

fxplot = a.*x.^2 + b.*x + c;

plot(x, fxplot, t(1), yt1, 'r*'); xgrid; xtitle("Polinomio aproximado para f(x) - q4 Lista 5 - Prof. Josenalde Oliveira MA II TADS");
xlabel('x'); ylabel('f(x)');

