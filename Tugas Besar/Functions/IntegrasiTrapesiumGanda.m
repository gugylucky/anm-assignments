function [ I ] = IntegrasiTrapesiumGanda( f, ax, bx, ay, by, n )
    h = (by - ay) / n;
    y = ay;
    I = IntegrasiTrapesium(f, ay, ax, bx, n) + IntegrasiTrapesium(f, by, ax, bx, n);
    sigma = 0;
    for r = 1:n-1
        y = y + h;
        sigma = sigma + 2 * IntegrasiTrapesium(f, y, ax, bx, n);
    end
    I = (I + sigma) * h / 2;
end

function [ I ] = IntegrasiTrapesium( f, y, a, b, n )
    h = (b - a) / n;
    x = a;
    I = f(a, y) + f(b, y);
    sigma = 0;
    for r = 1:n-1
        x = x + h;
        sigma = sigma + 2 * f(x, y);
    end
    I = (I + sigma) * h / 2;
end