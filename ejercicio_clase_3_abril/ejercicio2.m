clc; clear; close all;

%% Ejercicio 2: f(x) = x^3 - 2x - 5



f = @(x) x.^3 - 2*x - 5;

df = @(x) 3*x.^2 - 2; % Derivada de f(x)



% a) Método de Newton-Raphson con x0 = 2 (3 iteraciones)

x = 2;

for i = 1:3

    x = x - f(x) / df(x);

    fprintf('Newton-Raphson Iter %d: x = %.6f\n', i, x);

end



% b) Método de la Secante con x0 = 1, x1 = 2 (3 iteraciones)

x0 = 1; x1 = 2;

for i = 1:3

    x2 = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));

    fprintf('Secante Iter %d: x = %.6f\n', i, x2);

    x0 = x1;

    x1 = x2;

end
