%PROGRAMOWANIE LINIOWE ZADANIE 1
clc
clear all

f = [2 1.5 3];
A = [4 6 15; 2 2 0; 5 3 4; 7 3 12];
b = [250; 60; 100; 220];

Aeq = [];
beq = [];
lb = [0 0 0];
ub = [];

[x, fval] = linprog(f, -A, -b, Aeq, beq, lb, ub);

A=A * ceil(x);
f=f * ceil(x);

fprintf('===============================\n');
fprintf('PROGRAMOWANIE LINIOWE ZADANIE 1\n');
fprintf('===============================\n');
fprintf('kanapki %i\n', ceil(x(1)));
fprintf('pierogi %i\n', ceil(x(2)));
fprintf('słodycze %i\n', ceil(x(2)));
fprintf('===============================\n');
fprintf('białko %i\n', A(1));
fprintf('tłuszcz %i\n', A(2));
fprintf('witaminy %i\n', A(2));
fprintf('węglowodany %i\n', A(2));
fprintf('===============================\n');
fprintf('Cena: %.4g PLN\n', f);
fprintf('===============================\n');

%PROGRAMOWANIE LINIOWE ZADANIE 2

clear all

f = [100 200];

A = [5 25; 0.5 0; 100 250; 10 10];

b = [500; 15; 7500; 400];

Aeq = [];
beq = [];

lb = [0 0];
ub = [];

[x, fval] = linprog(-f, A, b, Aeq, beq, lb, ub);

A=A * ceil(x);
f=f * ceil(x);

fprintf('===============================\n');
fprintf('PROGRAMOWANIE LINIOWE ZADANIE 2\n');
fprintf('===============================\n');
fprintf('krzesło %i\n', ceil(x(1)));
fprintf('stół %i\n', ceil(x(2)));
fprintf('===============================\n');
fprintf('drewno %.3g\n', A(1));
fprintf('skóra %.3g\n', A(2));
fprintf('klej %.3g\n', A(2));
fprintf('nakład pracy %.3g\n', A(2));
fprintf('===============================\n');
fprintf('Zysk: %.4g PLN\n', f);
fprintf('===============================\n');