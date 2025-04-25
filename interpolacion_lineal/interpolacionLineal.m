clc; clear; close all;

%
%
% Inciso 1
x = [7, 10, 13, 16, 19];
f = [14, 21, 28, 30, 28];

% Parámetros
n = 3;      % Índice
X = 14;     % Valor a evaluar
real = NaN; % Valor real (en este caso no lo hay)

x0 = x(n);
x1 = x(n+1);
fx0 = f(n);
fx1 = f(n+1);

% Resultado
fprintf('La temperatura a las %.2f horas es: ', X);
interpolacion_lineal(x0, x1, X, fx0, fx1, real);

%
%
% Inciso 2
x = [1, 4];
f = [log(1), log(4)];

% Parámetros
n = 1;         % Índice
X = 2;         % Valor a evaluar
real = log(X); % Valor real (en este caso no lo hay)

x0 = x(n);
x1 = x(n+1);
fx0 = f(n);
fx1 = f(n+1);

% Resultado
fprintf('\nPara f(x) = ln(x) y x = %.2f el resultado es: ', X);
interpolacion_lineal(x0, x1, X, fx0, fx1, real);

%-------------------------------------------------------------------------%

% Función para interpolación lineal y cálculo de error (si se puede)
function [fx, error] = interpolacion_lineal(x0, x1, x, fx0, fx1, real)
    fx = fx0 + ((fx1-fx0)/(x1-x0))*(x-x0);
    
    if ~isnan(real)
        error = abs(100*(fx - real)/fx);
        fprintf('f(%.2f) = %.6f con un error del %.6f%%', x, fx, error);
    else
        fprintf('f(%.2f) = %.6f', x, fx);
        error = NaN;
    end
end
