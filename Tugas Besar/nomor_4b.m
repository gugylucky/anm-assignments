addpath(genpath('Functions'))

f = @(x, y) sqrt(x + y);
ax = 1;
bx = 2;
ay = 0;
by = 1.5;

IT = IntegrasiTrapesiumGanda(f, ax, bx, ay, by, 10);
ISimpson = SimpsonSepertigaGanda(f, ax, bx, ay, by, 10);