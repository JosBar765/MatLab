clc; clear; close all;

% Función que realiza la interpolación de lagrange
function [y_interp, error] = lagrange_interp(x_points, y_points, x, valor_real)
    n = length(x_points) - 1; % Grado del polinomio
    y_interp = 0;             % Igualamos a cero, ya que se estará sumando todo y almacenando en esta variable

    % Polinomio de Lagrange
    for i = 0:n
        L = 1; % Se inicializa en 1, ya que se estará multiplicando todo y almacenando en esta variable

        % Funciones cardinales de Lagrange (productorio)
        for j = 0:n
            if j ~= i
                % Realizar productorio de j hasta n cuando j es diferente de i
                L = L * (x - x_points(j+1)) / (x_points(i+1) - x_points(j+1));
            end
        end

        % Parte i del polinomio de Lagrange: f(xi)Li(x)
        y_interp = y_interp + y_points(i+1) * L;
    end

    % Calculo del error (%)
    error = abs((y_interp - valor_real) / valor_real) * 100;
end

% Example 1: Original points
x_points = [1, 4, 6];               % Puntos de
y_points = [0, 1.386294, 1.791759]; % una función
[y1, error1] = lagrange_interp(x_points, y_points, 2, 0.6931472); % Le pasamos los pares ordenados a la función de interpolación
fprintf('Ejemplo 1: ln(2) ≈ %.4f, Error = %.1f%%\n', y1, error1); % Mostramos resultados

% Example 2: Close points
x_points = [1, 2, 3];                % Puntos de
y_points = [0, 0.6931472, 1.098612]; % una función
[y2, error2] = lagrange_interp(x_points, y_points, 2, 0.6931472); % Le pasamos los pares ordenados a la función de interpolación
fprintf('Ejemplo 2: ln(2) ≈ %.4f, Error = %.1f%%\n', y2, error2); % Mostramos resultados
