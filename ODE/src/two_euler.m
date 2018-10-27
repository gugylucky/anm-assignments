function [ x_euler, y_euler ] = two_euler( t0, x0, y0, b, h, f1, f2 )
% menghitung nilai x(b) dan y(b) pada PDB
% x'=f(t,x,y); x(t0)=x0
% y'=f(t,x,y); y(t0)=y0
% dengan metode Euler
    n = (b-t0)/h;
    t = zeros(1, n);
    x = zeros(1, n);
    y = zeros(1, n);
    t(1) = t0;
    y(1) = y0;
    x(1) = x0;
    
    for r = 1:n
        x(r+1) = x(r) + h * f1(t(r), x(r), y(r));
        y(r+1) = y(r) + h * f2(t(r), x(r), y(r));
        t(r+1) = t(r) + h;
    end
    
    x_euler = x(n+1);
    y_euler = y(n+1);
    plot(t, x, '--*');
    plot(t, y, '--o');
end