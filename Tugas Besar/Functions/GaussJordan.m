function [ A, x ] = GaussJordan( A, b )
    n = size(A, 1);
    
    for k = 1:n
        tampung = A(k,k);
        for j = 1:n
            A(k,j) = A(k,j) / tampung;
        end
        b(k) = b(k) / tampung;
        for i = 1:n
            if i ~= k
                m = A(i,k);
                for j = 1:n
                    A(i,j) = A(i,j) - m * A(k,j);
                end
                b(i) = b(i) - m * b(k);
            end
        end
    end

    x = b;
end

