addpath(genpath('Functions'))

f1 = @(x) exp(x);
luasT = IntegrasiTrapesium(f1, 1.8, 3.4, 8);

f2 = @(x) exp(-x^2);
luasS = SimpsonSepertiga(f2, 0, 1, 10);