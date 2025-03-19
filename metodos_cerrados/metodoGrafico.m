clc; clear; close all;

% Definir f(x)
f = @(x) x.^3 - 6*x.^2 + 11*x - 6;

% Intervalo a graficar
x = linspace(0, 4, 1000);

% Gráfica de f(x)
figure;
plot(x, f(x));
grid on;
xlabel('x');
ylabel('f(x)');

% Convertir la función en una cadena de texto
f_str = func2str(f);
f_str = erase(f_str, '@(x)'); % Eliminar la parte @(x)
f_str = strrep(f_str, '.^', '^'); % Eliminar los puntos
f_str = strrep(f_str, '*x', 'x'); % Eliminar los asteriscos
title(['Método Gráfico: f(x) = ', f_str]);

% Gráfica del eje x
hold on;
plot(x, zeros(size(x)), 'k--');
hold off;
