addpath(genpath('Functions'))

f = @(x) (1 + x) / (1+2*x+3*x^2);

x = linspace(1,2.5,6);
y = zeros(1, 6);
for i = 1:5
    y(i) = f(x(i));
end

hold on
plot(x,y, '-x');

ynew = zeros(1, 6);
for i = 1:5
    ynew(i) = PolinomLagrange(x, y, x(i), 5);
end
plot(x, ynew, '-*');

ynew = zeros(1, 5);
for i = 1:6
    ynew(i) = PolinomNewton(x, y, x(i), 5);
end
plot(x, ynew, '-*');

y_sejati = f(1.7);
y_hampiran = PolinomNewton(x, y, 1.7, 5);
galat = abs(y_hampiran - y_sejati);
fprintf('%0.22f\n', galat);

legend('Sejati', 'Polinom Lagrange', 'Polinom Newton')
hold off