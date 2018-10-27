addpath(genpath('Functions'))

yt = @(x, y, z) z;
zt = @(x, y, z) 0.05*z - 0.15*y;

exact = @(x) exp(x ./ 40) .* (cos((sqrt(239) .* x) ./ 40) - ((1 ./ sqrt(239)) .* sin((sqrt(239) .* x) ./ 40)));
y_exact = exact(2);

t = [20];
y = zeros(1, length(t));
z = zeros(1, length(t));
galat_y = zeros(1, length(t));

figure(1)
hold on;
for i = 1:length(t)
    [y(i), z(i)] = twoRK3(yt, zt, 0, 1, 0, 2, 2/t(i));
    galat_y(i) = y_exact - y(i);
end

fplot(exact, [-0.5, 2.5]);
legend('N=20', 'Sejati')
hold off;

figure(2)
plot(t, galat_y, '-o')
title('galat');