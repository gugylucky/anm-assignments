addpath(genpath('Functions'))

x = [0.5 1 1.5 2 2.5 3];
y = [1.143 1 0.828 0.667 0.533 0.428];

hold on
plot(x,y, '-x');

ynew = zeros(1, 6);
for i = 1:6
    ynew(i) = PolinomLagrange(x, y, x(i), 5);
end
plot(x, ynew, '-*');

ynew = zeros(1, 6);
for i = 1:6
    ynew(i) = PolinomNewton(x, y, x(i), 5);
end
plot(x, ynew, '-*');

legend('Sejati', 'Polinom Lagrange', 'Polinom Newton')
hold off