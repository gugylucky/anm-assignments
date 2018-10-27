addpath(genpath('Functions'))

A = zeros(10,10);
B = [1 0 0 0 0 0 0 0 0 0];

n = size(A, 1);

for i = 1:n
    for j = 1:n
        A(i,j) = 1/(i+j-1);
    end
end

[AGauss, xGauss] = GaussJordan(A,B);

[L, U] = GaussLU(A);
y = ForwardSubstitution(L,B);
xLU = BackwardSubstitution(U,y);

xJacobi = Jacobi(A, B, [0,0,0,0,0,0,0,0,0,0]);