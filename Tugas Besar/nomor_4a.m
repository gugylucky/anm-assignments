addpath(genpath('Functions'))

f = @(u) (-2 * exp(1-u^2)) / sqrt(2-u^2);
a = 1;
b = 0;

IT = IntegrasiTrapesium(f, a, b, 10);
ISimpson = SimpsonSepertiga(f, a, b, 10);