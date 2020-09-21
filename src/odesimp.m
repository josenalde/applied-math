% Forma generica de resolver equacoes diferenciais de primeira ordem
% Funcao anonima
% Chapra, S. C. Métodos Numéricos Aplicados com MATLAB, 3. ed. Bookman
% Para chamar, definir taxa de variacao, Exemplo = dydt = -0.1y
% dt = intervalo, ti - instante inicial, tf - instante final, yi cond
% inicial
% odesimp(@(y) -0.1*y, 0.005, 0, 5, 10)

function y_fim = odesimp(dydt, dt, ti, tf, yi)
    t = ti; y = yi; h = dt;
    while(1)
        if t + dt > tf, h = tf - t; end
        y = y + dydt(y)*h;
        t = t + h;
        if t >= tf, break, end
    end
    y_fim = y;