//a = input('Digite a:');
a = 1;
amplitude = 5;

numero = abs(amplitude)*sign(a);

x1 = -10:-6;
x2 = -5:-1;
x3 = 0:4;
x4 = 5:9;
y1 = numero*ones(1,5);
y2 = -numero*ones(1,5);
y3 = numero*ones(1,5);
y4 = -numero*ones(1,5);

plot(x1,y1,x2,y2,x3,y3,x4,y4); 


