addpath(genpath('Functions'))

ut = @(x, y) cos(pi * x) + y;

x = [20];
y = zeros(1, length(x));

figure(1);
hold on;
for i = 1:length(x)
    y(i) = RK3(ut, 0, 1, 2, 2/x(i));
end

title('Question 1')
legend('N=20')
hold off;

figure(2)
plot(x, y, '-o')
title('hasil');