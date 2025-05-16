% Definir los límites de integración
a = 0;
b = 1;

% Definir la función
f = @(x) 1 + 2*x - 3*x.^2 + 4*x.^3 - 5*x.^4 + 6*x.^5;

% Valor exacto de la integral
I_exacta = integral(f, a, b);

% ----------------------------
% Simpson 1/3 (múltiple)
% Usar n múltiplo de 2 (por ejemplo, n = 2)
n1 = 2;
h1 = (b - a) / n1;
x1 = a:h1:b;
y1 = f(x1);
I_13 = (h1/3) * (y1(1) + 4*y1(2) + y1(3));

% ----------------------------
% Simpson 3/8 (múltiple)
% Usar n múltiplo de 3 (por ejemplo, n = 3)
n2 = 3;
h2 = (b - a) / n2;
x2 = a:h2:b;
y2 = f(x2);
I_38 = (3*h2/8) * (y2(1) + 3*y2(2) + 3*y2(3) + y2(4));

% ----------------------------
% Integral total (promedio de ambas aproximaciones)
I_total = (I_13 + I_38) / 2;

% ----------------------------
% Cuarta derivada de f(x)
% f4(x) = -120 + 720x
f4 = @(x) -120 + 720*x;

% Valor medio de la cuarta derivada
media_f4 = integral(f4, a, b) / (b - a);

% Estimación del error de truncamiento (Simpson 1/3):
E_13 = -((b - a)^5 / (180 * n1^4)) * media_f4;

% Error relativo porcentual (basado en I_total)
error_relativo = abs((I_exacta - I_total) / I_exacta) * 100;

% ----------------------------
% Mostrar resultados
fprintf('Integral aproximada (Simpson 1/3): %.6f\n', I_13);
fprintf('Integral aproximada (Simpson 3/8): %.6f\n', I_38);
fprintf('Integral aproximada total: %.6f\n', I_total);
fprintf('Valor medio de la cuarta derivada: %.6f\n', media_f4);
fprintf('Error de truncamiento estimado: %.6f\n', E_13);
fprintf('Error relativo porcentual: %.4f%%\n', error_relativo);
