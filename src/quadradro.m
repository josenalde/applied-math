% Derivadas na prática: simulação de fenômeno descrito por equação dif.
% Autor: Josenalde Oliveira - Matemática Aplicada II


% A velocidade do corpo no tempo é associada à taxa de variação do espaço
% percorrido em função do tempo, ou seja, v(t) = ds/dt
% Problema: tem-se disponível a relação desta taxa de variação, mas não
% sabemos como a partícula se desloca no tempo
% Solução: resolver a equação diferencial


clear all;
% intervalo de simulação (integração)

h = 0.01; % segundos

% amostra inici%al - instante discreto:t = k


k = 2;

tMax = 10;

t = 0;

% condicao inicial

f(1) = 10;

while (t <= tMax)
  
  % taxa de variação
  dfdt = 2*t;% taxa de variação do espaço percorrido no tempo 
    
  f(k) = f(k - 1) + h*(dfdt);
   
   % atualizacoes
   
   f(k - 1) = f(k);
   k = k + 1;
   t = t + h;
   
end

% Plotar grafico

% vetor do tempo (eixo X)

t = 0:h:tMax+h;

% Função analítica que descreve o movimento da partícula
freal = t.^2;

plot(t, f, 'b', t, freal, 'r');legend('Estimado', 'Analítico');

title('Exemplo de simulacao');
xlabel('tempo (s)');
ylabel('unidades');


