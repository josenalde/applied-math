% Função Ponto Critico v 1.0 - Encontrar pontos criticos
% Autor: Josenalde Barbosa de Oliveira 12.05.2014
% No Command Window criar função simbólica f(x,y)
% syms x y
% fxy = ....
% OBS NAO ESTA GENERICA

function pontocritico(fxy)
    syms x y;
    fx = diff(fxy,x);
    fy = diff(fxy,y);
    
    fxpol = coeffs(fx);
    fypol = coeffs(fy);
    
    % Esta parte tem que alterar para ficar generica
    
    b = [-fxpol(1); -fypol(1)];
    A(1,:) = fxpol(end:-1:2);
    A(2,:) = fypol(end:-1:2);
    
    pc = inv(A)*b;
  
    discriminante(fxy, sym2int(pc(1)), sym2int(pc(2)));