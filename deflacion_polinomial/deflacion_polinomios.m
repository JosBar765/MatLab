clc; clear; close all;

% Definimos el polinomio y la raíz
coeficientes = [1, 2, -24];  % Coeficientes de p(x) = x² + 2x - 24
raiz = 4;

%Procedimientos
disp('Deflación polinomial usando ciclo FOR');
[Q, residuo] = deflacion_polinomial_for(coeficientes, raiz);
disp('Polinomio deflacionado Q(x):'); 
disp(poly2sym(Q));
disp('Residuo:'); 
disp(residuo);

disp('Deflación polinomial usando ciclo WHILE');
[Q, residuo] = deflacion_polinomial_while(coeficientes, raiz);
disp('Polinomio deflacionado Q(x):'); 
disp(poly2sym(Q));
disp('Residuo:'); 
disp(residuo);

%-------------------------------------------------------------------------%


% Función de deflación polinomial usando ciclo for
function [Q, residuo] = deflacion_polinomial_for(coeficientes, raiz)
    n = length(coeficientes) - 1; % Grado
    Q = zeros(1, n);              % Inicializar el array deflacionado
    Q(1) = coeficientes(1);       % Copiar el primer coeficiente
    
    % Division sintética (ciclo for)
    for i = 2:n
        Q(i) = Q(i-1) * raiz + coeficientes(i);
    end

    residuo = Q(end) * raiz + coeficientes(end);
end


% Función de deflación polinomial usando ciclo while
function [Q, residuo] = deflacion_polinomial_while(coeficientes, raiz)
    n = length(coeficientes) - 1; % Grado
    Q = zeros(1, n);              % Inicializar el array deflacionado
    Q(1) = coeficientes(1);       % Copiar el primer coeficiente

    % Division sintética (ciclo while)
    i = 2;  % Empezamos desde el segundo coeficiente
    while i <= n
        Q(i) = Q(i-1) * raiz + coeficientes(i);
        i = i + 1;
    end

    residuo = Q(end) * raiz + coeficientes(end);
end
