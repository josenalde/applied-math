function enfezamento

% Variaveis usadas nas equações diferenciais

h = 0.1; % intervalo de simulação
t = 50; % tempo de simulação em dias
n = 0; % variável para contagem do tempo
tempo(1) = 0;

% ENFEZAMENTO PALIDO

%b_linha = ; % b_linha (b') é a taxa de visitas que a planta recebe por cigarrinha
p_linha = 0.835; % p_linha (p') é a probabilidade de transmissão de molicutes da cigarrinha para a planta
%b_estrela = ; % b_estrela (b*) é a taxa de visitas que a cigarrinha realiza por planta, logo b'=b*
p = 0.46; % é a probabilidade de aquisição de molicutes pela cigarrinha
t_estrela = 25; % é o período de latência (incubação) da infecção na cigarrinha (contribuição dos autores do artigo)
mi = 0.129; % é a taxa de mortalidade/natalidade da cigarrinha
N1 = 1; % é a população total de plantas
N2 = 1; % é a população total de cigarrinhas
% N2/N1 = 1; como N2/N1 = 1, N2=N1, estamos usando no exemplo, N2=N1=1;
b = 2;
%OBS: b' = b* = b/N1

% Equações Diferenciais

% M1 = é a proporção de plantas infectadas
%dM1/dt = (N2/N1)*b*p'*I2*(1-M1)

% I1 = é a proporção de cigarrinhas com infecção (molicutes) em período de latência
%dI1/dt = b*p*(1-I2-I1)*M1 - (1/t*)*I1 - mi*I1

% I2 = é a proporção de cigarrinhas infectadas
%dI2/dt = (1/t*)*I1 - mi*I2

% Inicialização (estágio inicial da doença)

M1(1) = 0; % Nenhuma planta infectada
I1(1) = 0; % Nenhuma cigarrinha com molicutes em período de latência
I2(1) = 0.01; % Proporção de cigarrinhas infectantes

k = 1;

% Para simular as equações diferenciais, vamos usar a aproximação de Euler
% para derivadas (aproximação para frente - forward)
% dx/dt = (x(k+1) - x(k)) / h, onde h é o intervalo de simulação, e pode
% ser escolhido tão pequeno quanto se queira. O detalhe é que, quanto
% menor o h, mais lento será o processamento.

while (n<=t)
    
    % Simulação das equações diferenciais
    
    M1(k+1) = M1(k) + h*((N2/N1)*b*p_linha*I2(k)*(1-M1(k)));
    I1(k+1) = I1(k) + h*(b*p*(1 - I2(k) - I1(k))*M1(k) - mi*I1(k));
    I1(k+1) = I1(k) + h*(b*p*(1 - I2(k) - I1(k))*M1(k) - (1/t_estrela)*I1(k) - mi*I1(k));
    I2(k+1) = I2(k) + h*(- mi*I2(k));
    I2(k+1) = I2(k) + h*((1/t_estrela)*I1(k) - mi*I2(k));
    
    tempo(k+1) = n; % armazena no vetor tempo os valores de n, para o eixo x
    
    
    % Atualizações
    n = n + h; % intervalo entre dois pontos é h
    M1(k) = M1(k+1);
    I1(k) = I1(k+1);
    I2(k) = I2(k+1);
    k = k + 1;
    
    
    
end

% Plotagem dos gráficos

% Desenhar o gráfico M1 x t

plot(tempo, M1); title('População das plantas infectadas - taxa inicial 1% - Enfezamento Pálido');
xlabel('t (dias)'); ylabel('Proporcao de individuos (%) valor*100');
pause;
plot(tempo, I1); title('Proporção de cigarrinhas com infecção em período de latência - Enfezamento Pálido');
xlabel('t (dias)'); ylabel('Proporcao de individuos (%) valor*100');
pause;
plot(tempo, I2); title('Proporção de cigarrinhas infectantes - Enfezamento Pálido');
xlabel('t (dias)'); ylabel('Proporcao de individuos (%) valor*100');

end

