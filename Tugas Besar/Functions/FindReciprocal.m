function [ c, n ] = FindReciprocal( a, x )
% mencari reciprocal dari a dengan menggunakan metode Newton-Raphson,
% dengan x merupakan tebakan awal

    % toleransi galat yang diinginkan
    epsilon1 = 0.1;
    epsilon2 = 0.000000001;
    nmax = 50;
    
    n = 0;
    berhenti = false;
    x_prev = 0;
    while 1
        if (abs(1/x^2) < epsilon2)
            berhenti = true;
        else
            x_prev = x;
            x = x * (2 - x * a);
            n = n + 1;
        end

        if (abs(x-x_prev) < epsilon1 || berhenti || n > nmax)
            break
        end
    end
    
    if (berhenti)
        c = Inf;
    elseif n > nmax
        c = Inf;
    else
        c = x;
    end
end

