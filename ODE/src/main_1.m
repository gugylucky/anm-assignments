ut = @(x, y) cos(pi * x) + y;
exact = @(x) (-exp(-x) .* (cos(pi .* x) - pi .* sin(pi .* x)) + 2 .* (pi.^2 + 1) + 1) ./ ((pi.^2 + 1) .* exp(-x));
y_exact = exact(2);

x = [10, 20, 40, 80, 160, 320, 640];
y = zeros(1, length(x));
galat = zeros(1, length(x));

figure(1);
hold on;
for i = 1:length(x)
%     y(i) = euler(0, 2, 2, 2/x(i), ut);
%     y(i) = RK2(0, 2, 2, 2/x(i), ut);
%     y(i) = RK4(0, 2, 2, 2/x(i), ut);
    y(i) = ABM(0, 2, 2, 2/x(i), ut);
    galat(i) = y_exact - y(i);
end

fplot(exact, [-0.2,2.2], '-x');
title('Question 1')
legend('N=10', 'N=20','N=40', 'N=80', 'N=160', 'N=320', 'N=640', 'Solusi sejati')
hold off;

figure(2)
% subplot(1, 2, 1)
% plot(x, y, '-o')
% title('hasil');

% subplot(1, 2, 2)
plot(x, galat, '-o')
title('galat');