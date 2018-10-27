addpath(genpath('Functions'))

A = [
    8 1  3  2;
    2 9 -1 -2;
    1 3  2 -1;
    1 0  6  4
    ];

B = [1 2 3 4];

[AGauss, xGauss] = GaussJordan(A,B);

[L, U] = GaussLU(A);
y = ForwardSubstitution(L,B);
xLU = BackwardSubstitution(U,y);

xJacobi = Jacobi(A, B, [0 0 0 0]);