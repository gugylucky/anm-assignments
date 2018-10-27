function [ I ] = SimpsonSepertigaGanda( f, ax, bx, ay, by, n )
    h = (by - ay) / n;
    y = ay;
    I = SimpsonSepertiga(f, ay, ax, bx, n) + SimpsonSepertiga(f, by, ax, bx, n);
    sigma = 0;
    for r = 1:n-1
        y = y + h;
        if mod(r, 2) == 1
            sigma = sigma + 4 * SimpsonSepertiga(f, y, ax, bx, n);
        else
            sigma = sigma + 2 * SimpsonSepertiga(f, y, ax, bx, n);
        end
    end
    I = (I + sigma) * h / 3;
end

function [ I ] = SimpsonSepertiga( f, y, a, b, n )
    h = (b - a) / n;
    x = a;
    I = f(a, y) + f(b, y);
    sigma = 0;
    for r = 1:n-1
        x = x + h;
        if mod(r, 2) == 1
            sigma = sigma + 4 * f(x, y);
        else
            sigma = sigma + 2 * f(x, y);
        end
    end
    I = (I + sigma) * h / 3;
end