clear all;

Li = 1;
Ls = 5;

n = input('');

deltaX = (Ls - Li) / n;

X(1) = Li;

for i = 2:n+1
    X(i) = X(i-1) + deltaX;
end

syms dfdx;

dfdx = '1/t';

for i = 1:n+1
    t = X(i);
    Flinha(i) = eval(dfdx);
end

% exibir tabela
disp(X)
disp(Flinha)

% Loop soma inferior
sI = 0;
for i = 1:n
    sI = Flinha(i)*deltaX + sI;
end

% Loop soma superior
sS = 0;
for i = 2:n+1
    sS = Flinha(i)*deltaX + sS;
end
disp('Erro aproximado')
disp(abs(sI-sS))
disp('A integral estara entre:')
disp(sI)
disp(sS)
disp('A integral analitica é:')
disp(log(5)-log(1))

