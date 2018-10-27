function [ y_RK4 ] = RK4( x0, y0, b, h, f )
% menghitung nilai y(b) pada PDB
% y'=f(x,y); y(x0)=y0
% dengan metode Runge-Kutta orde 4

    n = (b-x0)/h;
    x = zeros(1, n);
    y = zeros(1, n);
    x(1) = x0;
    y(1) = y0;
    
    for r = 1:n
        k1 = h * f(x(r),y(r));
        k2 = h * f(x(r) + h/2, y(r) + k1/2);
        k3 = h * f(x(r) + h/2, y(r) + k2/2);
        k4 = h * f(x(r) + h, y(r) + k3);
        y(r+1) = y(r) + (k1 + 2*k2 + 2*k3 + k4) / 6;
        x(r+1) = x(r) + h;
    end
    
    y_RK4 = y(n+1);
    plot(x, y, '-*');
end