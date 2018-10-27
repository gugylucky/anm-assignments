function [ y_IRK ] = implicit_runge_kutta( x0, y0, b, h, f )
% menghitung nilai y(b) pada PDB 
% dengan menggunakan metode runge-kutta implicit
    n = (b-x0)/h;
    x = zeros(1, n);
    y = zeros(1, n);
    y(1) = y0;
    x(1) = x0;

    for r = 1:n
        k1 = f(x(r), y(r));
        y(r+1) = (y(r) + h*k1) / (1 + 200*h);
        x(r+1) = x(r) + h;
    end
    
    y_IRK = y(n+1);
    plot(x, y, '--*');
end