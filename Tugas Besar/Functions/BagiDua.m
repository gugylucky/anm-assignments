function [ akar ] = BagiDua( f, a, b )
    epsilon1 = 0.000000001;
    while 1
        c = (a + b) / 2;
        if (f(a) * f(b) < 0)
            b = c;
        else
            a = c;
        end

        if (abs(a-b) < epsilon1)
            break
        end
    end
    akar = c;
end

