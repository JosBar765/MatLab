clc; clear; close all;



%% Ejercicio 1: f(x) = x^3 - 6x^2 + 11x - 6



% Definir la función

f = @(x) x.^3 - 6*x.^2 + 11*x - 6;



% a) Comprobar que hay una raíz en [1.5, 2.5] usando el teorema de signos

a = 1.5; 

b = 2.5;

fa = f(a);

fb = f(b);



fprintf('\nEjercicio 1:\n');

fprintf('f(1.5) = %.4f, f(2.5) = %.4f\n', fa, fb);

if fa * fb < 0

    fprintf('Existe al menos una raíz en el intervalo [1.5, 2.5].\n\n');

else

    fprintf('No se puede garantizar una raíz en el intervalo.\n\n');

end



% b) Método de Bisección (3 iteraciones)

fprintf('Método de Bisección:\n');

a = 1.5; 

b = 2.5;

for i = 1:3

    c = (a + b) / 2;

    fc = f(c);

    fprintf('Iteración %d: c = %.6f, f(c) = %.6f\n', i, c, fc);

    if fa * fc < 0

        b = c;

        fb = fc;

    else

        a = c;

        fa = fc;

    end

end

fprintf('\n');



% c) Método de la Regla Falsa (3 iteraciones)

fprintf('Método de la Regla Falsa:\n');

a = 1.5; 

b = 2.5;

for i = 1:3

    c = (a * f(b) - b * f(a)) / (f(b) - f(a));

    

    fprintf('Iteración %d: c = %.6f, f(c) = %.6f\n', i, c, f(c));

    if f(a) * f(c) < 0

        b = c;

    else

        a = c;

    end

end

fprintf('\n');
