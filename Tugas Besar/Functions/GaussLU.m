function [ L, U ] = GaussLU( A )
    n = size(A, 1);
    I = eye(n);
    
    for k = 1:n-1
        for i = k+1:n
            m = A(i,k) / A(k,k);
            I(i,k) = m;
            for j = k:n
                A(i,j) = A(i,j) - m * A(k,j);
            end
        end
    end
    L = I;
    U = A;
end

