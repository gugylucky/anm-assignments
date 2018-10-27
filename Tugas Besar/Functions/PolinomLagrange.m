function [ ynew ] = PolinomLagrange( x, y, xnew, n )
    ynew = 0;
    for i = 1:n
        pi = 1;
        for j = 1:n
            if i ~= j
                pi = pi * (xnew - x(j)) / (x(i) - x(j));
            end
        end
        ynew = ynew + y(i) * pi;
    end
end

