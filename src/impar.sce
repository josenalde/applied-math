n = input('Qual o limite que deseja?');

if modulo(n, 2) == 0 then
   ni = n / 2; // numero de impares é metade do total
else
   ni = (n / 2) + 1; 
end

x = ones(1, ni);

for i = 2:ni
    x(i) = x(i-1) + 2;
end

disp(x)
