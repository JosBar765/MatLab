clc; clear; close all;

% Definir f(x)
f = @(x) x.^3 - 6*x.^2 + 11*x - 6;

% Definir intervalo, tolerancia y paso de búsqueda
a = 0; 
b = 4;
A = a; % Intervalo
B = b; % Orginal
tolerancia = 1e-6;
h = 0.45;

% Formato de impresión
fprintf('Búsqueda por Incrementos:\n');
fprintf('     x     |    f(x)    \n');
fprintf('------------------------\n');

% Almacenar intervalos con raíces
raices_intervalos = [];
for x = a:h:b
    % Formato de impresión
    fprintf('%10.2f | %11.4f\n', x, f(x));
    
    % Verificar cambio de signo
    if x > a && (f(x) * f(x-h)) < 0
        % Insertamos el intervalo a una matriz
        raices_intervalos = [raices_intervalos; x - h, x];
    end
end

% Refinamiento con Falsa Posición
fprintf('\nRefinamiento con Falsa Posición:\n');
% Almacenar raíces
raices = [];
for i = 1:1:size(raices_intervalos, 1)
    % Definir intervalo y valor inicial
    a = raices_intervalos(i, 1);
    b = raices_intervalos(i, 2);
    c_prev = 0;
    
    % Formato de impresión
    fprintf('\nIntervalo [%.4f, %.4f]:\n', a, b);
    fprintf('Iteración |      a      |      b      |      c      |  f(a)*f(c)  | Error Relativo Aproximado\n');
    fprintf('---------------------------------------------------------------------------------------------\n');
    
    for iter = 1:100
        % Calcular el punto c usando el método de falsa posición
        c = (a * f(b) - b * f(a)) / (f(b) - f(a));
    
        % Calcular el error relativo aproximado
        if iter > 1
            error_rel = abs(c - c_prev) / abs(c);
        else
            error_rel = NaN; % No aplica en la primera iteración
        end
        
        % Formato de impresión
        fprintf('%9d | %11.4f | %11.4f | %11.4f | %11.4f | %24.6f\n', iter, a, b, c, f(a)*f(c), error_rel);
        
        % Verificar convergencia
        if iter > 1 && error_rel < tolerancia
            break;
        end
        
        % Actualizar el intervalo
        if f(a) * f(c) < 0
            b = c;
        else
            a = c;
        end
        
        % Guardar el valor actual de c para la próxima iteración
        c_prev = c;
    end
    
    % Impresión del resultado
    fprintf('---------------------------------------------------------------------------------------------\n');
    fprintf('Raíz aproximada: %.6f\n', c);
    raices = [raices, c];
end

% Impresión de todas las raíces encontradas en el intervalo original [a, b]
fprintf('\n\nRaices encontradas en el intervalo: [%d, %d]\n', A, B);
for i = 1:size(raices, 2)
    fprintf('%.6f\n', raices(i));
end
