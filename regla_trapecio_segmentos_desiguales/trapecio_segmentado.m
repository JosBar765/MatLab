% Función a integrar
f = @(x) 5*x.^3 - 3*x.^2 + 2*x + 1;

% Puntos desiguales (puedes ajustar o agregar más)
x = [0 0.2 0.5 0.7 1]; 
y = f(x);

% Integral aproximada con regla del trapecio para segmentos desiguales
I_aprox = 0;
for i = 1:length(x)-1
    h = x(i+1) - x(i);
    I_aprox = I_aprox + (h/2)*(y(i) + y(i+1));
end

% Valor exacto dado
I_exacto = 2.25;

% Error relativo porcentual
error_rel = abs((I_exacto - I_aprox)/I_exacto)*100;

% Mostrar resultados
fprintf('Integral aproximada: %.4f\n', I_aprox);
fprintf('Error relativo porcentual: %.2f%%\n', error_rel);
