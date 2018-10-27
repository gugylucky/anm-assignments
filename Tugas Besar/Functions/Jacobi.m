function [ x ] = Jacobi( A, b, x )
    n = size(A, 1);
    epsilon = 0.0000001;
    galat_relatif = zeros(1, n);
    
    if ~diagonallyDominant(A)
        x = ones(1, n) .* Inf;
        return
    end

    while 1
        xlama = x;
        for i = 1:n
            sigma = 0;
            for j = 1:n
                if i ~= j
                    sigma = sigma + A(i,j) * xlama(j);
                end
            end
            x(i) = (b(i) - sigma) / A(i,i);
            galat_relatif(i) = (x(i) - xlama(i)) / x(i);
        end
        
        if (sum(abs(galat_relatif) < epsilon) == n)
            return
        end
    end
end

function [ is_it ] = diagonallyDominant( A )
    is_it = false;
    n = size(A, 1);
    
    for i = 1:n
        sigma = 0;
        for j = 1:n
            if i ~= j
                sigma = sigma + abs(A(i,j));
            end
        end
        if abs(A(i,i)) < sigma
            return
        end
    end
    is_it = true;
end

