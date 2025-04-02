clc; clear; close all;

% Definir la función
f = @(x) x.^3 - 13*x - 12;

% Valores iniciales
x0 = 4.5;
x1 = 5.5;
x2 = 5;

% Tolerancia y número máximo de iteraciones
tol = 1e-6;
max_iter = 100;

% Llamar al método de Müller
raiz = muller(f, x0, x1, x2, tol, max_iter);
fprintf('Raíz encontrada: %.6f\n', raiz);

%-------------------------------------------------------------------------%

% Función que realiza el método de müller
function raiz = muller(f, x0, x1, x2, tol, max_iter)
    fprintf('Iter\t x0\t\t x1\t\t x2\t\t h0\t\t h1\t\t d0\t\t d1\t\t e\n');

    % Bucle para el método de muller
    for i = 1:max_iter

        h0 = x1 - x0;
        h1 = x2 - x1;

        d0 = (f(x1) - f(x0)) / h0;
        d1 = (f(x2) - f(x1)) / h1;

        % Coeficientes de la parábola
        a = (d1 - d0) / (h1 + h0);
        b = a * h1 + d1;
        c = f(x2);

        discriminante = sqrt(b^2 - 4*a*c);
        % Si es verdadero, usar (+) en el denominador. De lo contrario, (-)
        if abs(b + discriminante) > abs(b - discriminante)
            denominador = b + discriminante;
        else
            denominador = b - discriminante;
        end

        numerador = -2 * c / denominador;
        x3 = x2 + numerador;
        error = abs(1-x2/x3) * 100;
        
        % Formato de impresión
        fprintf('%d\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\n', i, x0, x1, x2, h0, h1, d0, d1, error);

        if abs(numerador) < tol
            raiz = x3;
            return;
        end

        % Intercambiar los valores
        x0 = x1;
        x1 = x2;
        x2 = x3;
    end

    % Impresión del resultado
    raiz = x2;
    fprintf('Máximo de iteraciones alcanzado.\n');
end
