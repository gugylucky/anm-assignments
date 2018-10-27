function [ I ] = SimpsonSepertiga( f, a, b, n )
    h = (b - a) / n;
    x = a;
    I = f(a) + f(b);
    sigma = 0;
    for r = 1:n-1
        x = x + h;
        if mod(r, 2) == 1
            sigma = sigma + 4 * f(x);
        else
            sigma = sigma + 2 * f(x);
        end
    end
    I = (I + sigma) * h / 3;
end

