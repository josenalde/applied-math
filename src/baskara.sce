// a first script in scilab - roots 2nd function

a = input('a:');
b = input('b:');
c = input('c:');

delta = b^2 - 4*a*c;

x1 = (-b + sqrt(delta)) / (2*a);

x2 = (-b - sqrt(delta)) / (2*a);

disp(x1)
disp(x2)
