function [ y_ABM ] = ABM( x0, y0, b, h, f )
% menghitung nilai y(b) pada PDB 
% dengan menggunakan metode Adams-Bashforth-Moulton

    n = (b-x0)/h;
    x = zeros(1, n);
    y = zeros(1, n);
    
    x(1) = x0;
    y(1) = y0;
    
    x(2) = x0 + h;
    y(2) = RK3(x0, y0, x(2), h, f);
    
    x(3) = x0 + 2*h;
    y(3) = RK3(x0, y0, x(3), h, f);
    
    x(4) = x0 + 3*h;
    y(4) = RK3(x0, y0, x(4), h, f);
    
    for r = 4:n
        % predictor
        y(r+1) = y(r) + h/24*(-9*f(x(r)-3*h, y(r-3)) +...
            37*f(x(r)-2*h, y(r-2)) - 59*f(x(r)-h, y(r-1)) +...
            55*f(x(r), y(r)));
        
        % corrector
        y(r+1) = y(r) + h/24*(f(x(r)-2*h, y(r-2)) - 5*f(x(r)-h, y(r-1)) +...
            19*f(x(r), y(r)) + 9*f(x(r)+h, y(r+1)));
        
        x(r+1) = x(r) + h;
    end
    
    y_ABM = y(n+1);
    plot(x, y, '--*');
end

