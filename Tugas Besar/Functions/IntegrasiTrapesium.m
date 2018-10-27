function [ I ] = IntegrasiTrapesium( f, a, b, n )
    h = (b - a) / n;
    x = a;
    I = f(a) + f(b);
    sigma = 0;
    for r = 1:n-1
        x = x + h;
        sigma = sigma + 2 * f(x);
    end
    I = (I + sigma) * h / 2;
end

