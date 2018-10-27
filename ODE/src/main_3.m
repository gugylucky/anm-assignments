xt = @(t, x, y) y;
yt = @(t, x, y) -6*x + 5*y;

exact_x = @(t) 2*exp(2*t) - exp(3*t);
x_exact = exact_x(2);
exact_y = @(t) 4*exp(2*t) - 3*exp(3*t);
y_exact = exact_y(2);

t = [10, 20, 40, 80, 160, 320, 640];
x = zeros(1, length(t));
y = zeros(1, length(t));
galat_x = zeros(1, length(t));
galat_y = zeros(1, length(t));

figure(1)
hold on;
for i = 1:length(t)
    [x(i), y(i)] = two_euler(0, 1, 1, 2, 2/t(i), xt, yt);
%     [x(i), y(i)] = two_RK2(0, 1, 1, 2, 2/t(i), xt, yt);
%     [x(i), y(i)] = two_RK4(0, 1, 1, 2, 2/t(i), xt, yt);
    galat_x(i) = x_exact - x(i);
    galat_y(i) = y_exact - y(i);
end

fplot(exact_x, [-0.2,2.2]);
fplot(exact_y, [-0.2,2.2]);

title('Question 2')
legend('x N=10', 'y N=10',...
    'x N=20', 'y N=20',...
    'x N=40', 'y N=40',...
    'x N=80', 'y N=80',...
    'x N=160', 'y N=160',...
    'x N=320', 'y N=320',...
    'x N=640', 'y N=640',...
    'x sejati', 'y sejati')

hold off;

figure(2)
subplot(1, 2, 1)
plot(t, galat_x, '-o')
title('galat x');

subplot(1, 2, 2)
plot(t, galat_y, '-o')
title('galat y');
