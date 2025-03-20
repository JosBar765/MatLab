clc; clear; close all;

% Definir f(x)
f = @(x) exp(-x) - x;

% Transformar a la forma: x = g(x)
g = @(x) exp(-x);

% Definir g'(x)
syms x;
g_sym = sym(g(x));
derivada_sym = diff(g_sym, x);
g_prima = matlabFunction(derivada_sym);

% Definir tolerancia, valor inicial (xi), iteración y error relativo
tolerancia = 1e-6;
xi = 0.1; % Cambiamos el valor inicial, porque |g'(0)| = 1
iter = 1;

% Formato de impresión
fprintf('Iteración |      xi      |     xi+1     | Error Relativo Aproximado\n');
fprintf('-------------------------------------------------------------------\n');

% Mientras cumpla el criterio de convergencia |g'(xi)| < 1
while abs(g_prima(xi)) < 1
    % Calcular xi+1
    xi_sig = g(xi);

    % Calcular el error relativo aproximado
    if iter > 1
        error_rel = abs(xi_sig - xi) / abs(xi_sig);
    else
        error_rel = NaN; % No aplica en la primera iteración
    end

    % Formato de impresión
    fprintf('%9d | %12.6f | %12.6f | %24.6f\n', iter, xi, xi_sig, error_rel);

    % Verificar convergencia
    if iter > 1 && error_rel < tolerancia
        break;
    end

    % Actualiza no. iteración y el valor actual
    iter = iter + 1;
    xi = xi_sig;
end

% Impresión del resultado
fprintf('-------------------------------------------------------------------\n');
fprintf('Raíz aproximada: %.6f\n', xi_sig);
