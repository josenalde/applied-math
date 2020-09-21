% Derivadas na prática: simulação de fenômeno descrito por equação dif.
% Autor: Josenalde Oliveira - Matemática Aplicada II


% A velocidade do corpo no tempo é associada à taxa de variação do espaço
% percorrido em função do tempo, ou seja, v(t) = ds/dt
% Problema: tem-se disponível a relação desta taxa de variação, mas não
% sabemos como a partícula se desloca no tempo
% Solução: resolver a equação diferencial



% intervalo de simulação (integração)

h = 0.01; % segundos

% amostra inicial - instante discreto: t = k

k = 2;

tMax = 10;

t = 0;

% condicao inicial (cm)

s(1) = 10;

while (t <= tMax)
  
  % taxa de variação do espaço percorrido no tempo
  dsdt = 6*(t^2) -10*t + 3;% taxa de variação do espaço percorrido no tempo 
    
  s(k) = s(k - 1) + h*(dsdt);
   
   % atualizacoes
   
   s(k - 1) = s(k);
   k = k + 1;
   t = t + h;
   
end

% Plotar grafico

% vetor do tempo (eixo X)

t = 0:h:tMax+h;

% Função analítica que descreve o movimento da partícula
sreal = 2.*t.^3 - 5.*t.^2 + 3.*t + 4;

%plot(t, s);
plot(t,s, 'b', t, sreal, 'r'); legend('Estimado', 'Analítico');
title('Movimento de uma partícula');
xlabel('tempo (s)');
ylabel('cm');


