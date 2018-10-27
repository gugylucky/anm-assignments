function [ ynew ] = PolinomNewton( x, y, xnew, n )
    ST = zeros(n+1);
    % bikin ST dulu
    for k = 1:n+1
        ST(k,1) = y(k);
    end
    for k = 2:n+1
        for i = 1:n+2-k
            ST(i,k) = (ST(i+1,k-1) - ST(i,k-1)) / (x(i+k-1)-x(i));
        end
    end
    
    ynew = ST(1,1);
    for i = 2:n+1
        suku = ST(1,i);
        for k = 1:i-1
            suku = suku * (xnew - x(k));
        end
        ynew = ynew + suku;
    end
        
end

