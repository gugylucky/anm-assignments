function [ x_RK3, y_RK3 ] = twoRK3( f1, f2, t0, x0, y0, b, h )
% menghitung nilai x(b) dan y(b) pada PDB
% x'=f(t,x,y); x(t0)=x0
% y'=f(t,x,y); y(t0)=y0
% dengan metode Runge-Kutta orde 3

    n = (b-t0)/h;
    t = zeros(1, uint8(n));
    x = zeros(1, uint8(n));
    y = zeros(1, uint8(n));
    t(1) = t0;
    x(1) = x0;
    y(1) = y0;
    
    for r = 1:n
        k1 = h * f1(t(r), x(r), y(r));
        l1 = h * f2(t(r), x(r), y(r));
        k2 = h * f1(t(r) + h/2, x(r) + k1/2, y(r) + k1/2);
        l2 = h * f2(t(r) + h/2, x(r) + l1/2, y(r) + l1/2);
        k3 = h * f1(t(r) + h, x(r) - k1 + 2*k2, y(r) - k1 + 2*k2);
        l3 = h * f2(t(r) + h, x(r) - l1 + 2*l2, y(r) - l1 + 2*l2);
        
        x(r+1) = x(r) + (k1+4*k2+k3)/6;
        y(r+1) = y(r) + (l1+4*l2+l3)/6;
        
        t(r+1) = t(r) + h;
    end
    
    x_RK3 = x(n+1);
    y_RK3 = y(n+1);
    plot(t, x, '--*');
end