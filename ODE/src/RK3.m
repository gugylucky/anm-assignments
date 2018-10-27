function [ y_RK3 ] = RK3( x0, y0, b, h, f )
% menghitung nilai y(b) pada PDB
% y'=f(x,y); y(x0)=y0
% dengan metode Runge-Kutta orde 3

    n = (b-x0)/h;
    x = zeros(1, uint8(n));
    y = zeros(1, uint8(n));
    x(1) = x0;
    y(1) = y0;
    
    for r = 1:n
        k1 = h * f(x(r),y(r));
        k2 = h * f(x(r) + h/2, y(r) + k1/2);
        k3 = h * f(x(r) + h, y(r) - k1 + 2*k2);
        y(r+1) = y(r) + (k1+4*k2+k3)/6;
        x(r+1) = x(r) + h;
    end
    
    y_RK3 = y(n+1);
%     plot(x, y, '-*');
end