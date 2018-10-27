addpath(genpath('Functions'))

f = @(x) 16.*x.^5 - 20.*x.^3 + x.^2 + 5.*x - 0.5;
f_aksen = @(x) 80.*x.^4 - 60.*x.^2 + 2.*x + 5;

hold on
fplot(f, [-1.1, 1.1]);
fplot(@(x)0, [-1.1, 1.1]);
hold off

akar1_bagiDua = BagiDua(f, -1.2, -0.8);
akar2_bagiDua = BagiDua(f, -0.8, -0.4);
akar3_bagiDua = BagiDua(f, 0, 0.3);
akar4_bagiDua = BagiDua(f, 0.3, 0.7);
akar5_bagiDua = BagiDua(f, 0.7, 1.0);

akar1_newtonRaphson = NewtonRaphson(f, f_aksen, -1);
akar2_newtonRaphson = NewtonRaphson(f, f_aksen, -0.5);
akar3_newtonRaphson = NewtonRaphson(f, f_aksen, 0);
akar4_newtonRaphson = NewtonRaphson(f, f_aksen, 0.5);
akar5_newtonRaphson = NewtonRaphson(f, f_aksen, 1);