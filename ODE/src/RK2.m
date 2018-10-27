function [ y_RK2 ] = RK2( x0, y0, b, h, f )
% menghitung nilai y(b) pada PDB
% y'=f(x,y); y(x0)=y0
% dengan metode Runge-Kutta orde 2

    n = (b-x0)/h;
    x = zeros(1, n);
    y = zeros(1, n);
    x(1) = x0;
    y(1) = y0;
    
    for r = 1:n
        k1 = h * f(x(r),y(r));
        k2 = h * f(x(r) + h, y(r) + k1);
        y(r+1) = y(r) + (k1+k2)/2;
        x(r+1) = x(r) + h;
    end
    
    y_RK2 = y(n+1);
    plot(x, y, '-*');
end