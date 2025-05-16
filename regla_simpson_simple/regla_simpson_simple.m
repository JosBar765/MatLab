% Datos
a = 0;
b = 0.8;
n = 2; % número de segmentos
h = (b - a) / n;

% Definir la función f(x)
f = @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;

% Puntos
x0 = a;
x1 = a + h;
x2 = b;

% Aplicar regla de Simpson 1/3 compuesta (dos segmentos)
I_simpson = (h/3) * (f(x0) + 4*f(x1) + f(x2));

% Calcular la cuarta derivada de f(x)
f4 = @(x) -21600 + 48000*x;

% Valor medio de la cuarta derivada en [a, b]
media_f4 = integral(f4, a, b) / (b - a);

% Estimación del error de truncamiento:
% E = -((b - a)^5 / (180 * n^4)) * media_f4
E = -((b - a)^5 / (180 * n^4)) * media_f4;

% Valor exacto de la integral
I_exacta = 1.640533;

% Error relativo porcentual
error_relativo = abs((I_exacta - I_simpson) / I_exacta) * 100;

% Mostrar resultados
fprintf('Integral aproximada (Simpson 1/3): %.6f\n', I_simpson);
fprintf('Valor medio de la cuarta derivada: %.6f\n', media_f4);
fprintf('Error de truncamiento estimado: %.6f\n', E);
fprintf('Error relativo porcentual: %.4f%%\n', error_relativo);
