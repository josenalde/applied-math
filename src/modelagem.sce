y = [1.14 1.2592 1.3127 1.3198 1.2998 1.272 1.2557 1.2702 1.3348 1.4688 1.6913];
x = 0:0.05:0.5;

for i = 1:(length(y)-1)
    dydx(i) = (y(i+1) - y(i)) / (x(i+1) - x(i));
end

for i = 1:(length(dydx)-1)
    d2ydx2(i) = (dydx(i+1) - dydx(i)) / (x(i+1) - x(i));
end

for i = 1:(length(d2ydx2)-1)
    d3ydx3(i) = (d2ydx2(i+1) - d2ydx2(i)) / (x(i+1) - x(i));
end

printf("Primeira Difereça:\n")
printf("%.3f\n", dydx)
printf("Segunda Diferença:\n")
printf("%.3f\n", d2ydx2)
printf("Terceira Diferença:\n")
printf("%.3f\n", d3ydx3)


