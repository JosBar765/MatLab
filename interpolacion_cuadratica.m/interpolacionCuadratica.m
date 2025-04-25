clc; clear; close all;

% Puntos (x,y)
x = [1, 2, 3]; 
y = [log(1), log(2), log(3)];

% Punto en el que se quiere aproximar ln(x)
X = 2;

% Resultado
[fx, error] = interpolacion_cuadratica(x, y, X);
fprintf('Resultado de la Interpolación Cuadrática para ln(2):\n');
fprintf('x = %.2f, fx (ln(2)) = %.4f, Error = %.4f %%\n', X, fx, error);

%-------------------------------------------------------------------------%

% Función para interpolar cuadráticamente y encontrar el error
function [fx, error] = interpolacion_cuadratica(x, y, X)
    % Inicializar arrays
    fx = zeros(size(X));
    error = zeros(size(X));
    
    % Valor real = ln(2)
    real = log(X);

    % Evaluar cada punto solicitado
    for i = 1:length(X)
        % Seleccionar los tres puntos más cercanos al punto a interpolar
        [~, idx] = sort(abs(x - X(i))); % Ordenar del más cercano al más lejano
        x_usados = x(idx(1:3));
        y_usados = y(idx(1:3));
    
        % Cálculo de los polinomios base de Lagrange
        L0 = ((X(i) - x_usados(2)) * (X(i) - x_usados(3))) / ((x_usados(1) - x_usados(2)) * (x_usados(1) - x_usados(3)));
        L1 = ((X(i) - x_usados(1)) * (X(i) - x_usados(3))) / ((x_usados(2) - x_usados(1)) * (x_usados(2) - x_usados(3)));
        L2 = ((X(i) - x_usados(1)) * (X(i) - x_usados(2))) / ((x_usados(3) - x_usados(1)) * (x_usados(3) - x_usados(2)));
    
        % Sumar los términos del polinomio interpolante
        fx(i) = y_usados(1) * L0 + y_usados(2) * L1 + y_usados(3) * L2;
    
        % Determinar el error relativo porcentual
        error(i) = abs(((fx(i) - real(i)) / real(i)) * 100);
    end
end
