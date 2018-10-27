function [ y_euler ] = euler( x0, y0, b, h, f )
% menghitung nilai y(b) pada PDB
% y'=f(x,y); y(x0)=y0
% dengan metode Euler
    n = (b-x0)/h;
    x = zeros(1, n);
    y = zeros(1, n);
    y(1) = y0;
    x(1) = x0;
    
    for r = 1:n
        y(r+1) = y(r) + h * f(x(r),y(r));
        x(r+1) = x(r) + h;
    end
    
    y_euler = y(n+1);
    plot(x, y, '--*');
end