clc; clear; close all;

% Función de interpolación de tercer grado de Newton
function [y_interp, error] = newton_interp_3rd_degree(x_points, y_points, x, valor_real)
    n = length(x_points); % Número de puntos
    F = zeros(n, n);      % Se inicializa una matriz nxn (llena de ceros)
    F(:,1) = y_points;    % La primer columna se llena con los puntos y = f(x)
    
    % Crea las diferencias dividas para el resto de columnas
    for j = 2:n
        for i = 1:n-j+1
            F(i,j) = (F(i+1,j-1) - F(i,j-1)) / (x_points(i+j-1) - x_points(i));
        end
    end
    
    % Cálculo del polinomio interpolante de Newton
    y_interp = F(1,1); % Se inicia con el primer término de la matriz
    for k = 2:n % Recorremos los demás términos de la fila, a partir del segundo
        term = F(1,k); % Se asigna el valor de la diferencia dividida (columna k de la matriz F)
        for m = 1:k-1 % Productorio de los factores (x - x0), (x - x1), ..., (x - x(k-1))
            term = term * (x - x_points(m));
        end
        y_interp = y_interp + term; % Sumatorio del término calculado
    end
    
    % Cálculo del error (%)
    error = abs((y_interp - valor_real) / valor_real) * 100;
end

x_points = [1, 1.5, 2.5, 4];                  % Puntos de
y_points = [0, 0.405465, 0.916291, 1.386294]; % una función
x = 2;                  % Evaluar en: x
valor_real = 0.6931472; % Valor real de f(x)

% Llamado a la función
[y_est, error] = newton_interp_3rd_degree(x_points, y_points, x, valor_real);

% Resultado
fprintf('Estimation: ln(2) ≈ %.6f, Error = %.2f%%\n', y_est, error);
