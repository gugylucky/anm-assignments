function [ y_implicit_euler ] = implicit_euler( x0, y0, b, h, f )
% menghitung nilai y(b) pada PDB
% y'=f(x,y); y(x0)=y0
% dengan metode backward euler

    n = (b-x0)/h;
    x = zeros(1, n);
    y = zeros(1, n);
    x(1) = x0;
    y(1) = y0;
    
    for r = 1:n
        x(r+1) = x(r) + h;
        % ini mah backward
        % y_temp = y(i) + h * f(x(i), y(i)); % harusnya pake newton rhapson
        % y(i+1) = y(i) + h * f(x(i+1), y_temp);
        
        % ini baru implicit
        y(r+1) = y(r) / (1 + (400*h));
    end
    
    y_implicit_euler = y(n+1);
    plot(x, y, '-*');
end

