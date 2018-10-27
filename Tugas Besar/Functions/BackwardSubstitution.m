function [ x ] = BackwardSubstitution( U, b )
    n = size(U, 1);
    x(n) = b(n) / U(n,n);
    for i = n-1:-1:1
        sigma = 0;
        for j = i+1:n
            sigma = sigma + U(i,j) * x(j);
        end
        x(i) = (b(i) - sigma) / U(i,i);
    end

end

