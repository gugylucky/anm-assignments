function [ x ] = ForwardSubstitution( L, b )
    n = size(L, 1);
    x(1) = b(1) / L(1,1);
    for i = 2:n
        sigma = 0;
        for j = 1:i-1
            sigma = sigma + L(i,j) * x(j);
        end
        x(i) = (b(i) - sigma) / L(i,i);
    end

end

