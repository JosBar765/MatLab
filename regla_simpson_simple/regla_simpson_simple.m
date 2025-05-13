% Función original
f = @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;

% Puntos de evaluación
x0 = a;
x1 = a + h;
x2 = b;

% Regla de Simpson 1/3
I_aprox = (h/3) * (f(x0) + 4*f(x1) + f(x2));

% Cuarta derivada de f(x)
f4 = @(x) 12150 - 129600*x + 96000*x.^2;

% Media de la cuarta derivada en [a, b]
media_f4 = integral(f4, a, b) / (b - a);

% Estimación del error de truncamiento
error_trunc = -((b - a)^5 / (180 * n^4)) * media_f4;

% Valor real dado
I_real = 1.640533;

% Cálculo del error relativo porcentual
error_rel = abs((I_real - I_aprox) / I_real) * 100;

% Mostrar resultados
fprintf('Integral aproximada (Simpson 1/3): %.6f\n', I_aprox);
fprintf('Media de la cuarta derivada: %.6f\n', media_f4);
fprintf('Error de truncamiento estimado: %.6f\n', error_trunc);
fprintf('Error relativo porcentual: %.4f%%\n', error_rel);
