% Límites de integración

a = 0;

b = 0.8;



% Número de segmentos (debe ser par)

n = 6;



% Tamaño del paso

h = (b - a) / n;



% Función original

f = @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;



% Puntos de evaluación

x = a:h:b;  % vector de x0 a xn con paso h



% Aplicación de Simpson 1/3 compuesta

% f(x0) + 4*f(x1) + 2*f(x2) + 4*f(x3) + ... + f(xn)

I_aprox = f(x(1)) + f(x(end));

for i = 2:n

    if mod(i, 2) == 0  % índices impares (x1, x3,... en MATLAB 1-based)

        I_aprox = I_aprox + 4 * f(x(i));

    else

        I_aprox = I_aprox + 2 * f(x(i));

    end

end

I_aprox = I_aprox * (h / 3);



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

fprintf('Integral aproximada (Simpson 1/3 compuesta): %.6f\n', I_aprox);

fprintf('Media de la cuarta derivada: %.6f\n', media_f4);

fprintf('Error de truncamiento estimado: %.6f\n', error_trunc);

fprintf('Error relativo porcentual: %.4f%%\n', error_rel);
