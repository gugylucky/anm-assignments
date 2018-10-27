function [ akar ] = NewtonRaphson( f, f_aksen, x )
    epsilon1 = 0.000000001;
    epsilon2 = 0.000000001;
    nmax = 30;
    
    n = 0;
    berhenti = false;
    x_prev = 0;
    while 1
        if (abs(f_aksen(x)) < epsilon2)
            berhenti = true;
        else
            x_prev = x;
            x = x - f(x)/f_aksen(x);
            n = n + 1;
        end

        if (abs(x-x_prev) < epsilon1 || berhenti || n > nmax)
            break
        end
    end
    
    if (berhenti)
        akar = Inf;
    elseif n > nmax
        akar = Inf;
    else
        akar = x;
    end
end

