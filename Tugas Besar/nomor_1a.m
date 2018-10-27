addpath(genpath('Functions'))

f = @(x) sin(x) - 0.3.*exp(x);
f_aksen = @(x) cos(x) - 0.3.*exp(x);

hold on
fplot(f, [0, 1.5]);
fplot(@(x)0, [0, 1.5]);
hold off

akar1_bagiDua = BagiDua(f, 0.5, 0.6);
akar2_bagiDua = BagiDua(f, 1, 1.1);

akar1_newtonRaphson = NewtonRaphson(f, f_aksen, 0);
akar2_newtonRaphson = NewtonRaphson(f, f_aksen, 1);
