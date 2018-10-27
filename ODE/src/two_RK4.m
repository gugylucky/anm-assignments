function [ x_RK4, y_RK4 ] = two_RK4( t0, x0, y0, b, h, f1, f2 )
% menghitung nilai x(b) dan y(b) pada PDB
% x'=f(t,x,y); x(t0)=x0
% y'=f(t,x,y); y(t0)=y0
% dengan metode Runge-Kutta orde 2
    n = (b-t0)/h;
    t = zeros(1, n);
    x = zeros(1, n);
    y = zeros(1, n);
    t(1) = t0;
    y(1) = y0;
    x(1) = x0;
    
    for r = 1:n
        k1 = h * f1(t(r),x(r),y(r));
        k2 = h * f1(t(r) + h/2, x(r) + k1/2, y(r) + k1/2);
        k3 = h * f1(t(r) + h/2, x(r) + k2/2, y(r) + k2/2);
        k4 = h * f1(t(r) + h, x(r) + k3, y(r) + k3);
        x(r+1) = x(r) + (k1 + 2*k2 + 2*k3 + k4) / 6;
        
        k1 = h * f2(t(r),x(r),y(r));
        k2 = h * f2(t(r) + h/2, x(r) + k1/2, y(r) + k1/2);
        k3 = h * f2(t(r) + h/2, x(r) + k2/2, y(r) + k2/2);
        k4 = h * f2(t(r) + h, x(r) + k3, y(r) + k3);
        y(r+1) = y(r) + (k1 + 2*k2 + 2*k3 + k4) / 6;
        
        t(r+1) = t(r) + h;
    end
    
    x_RK4 = x(n+1);
    y_RK4 = y(n+1);
    plot(t, x, '--*');
    plot(t, y, '--o');
end