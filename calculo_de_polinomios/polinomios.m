clc; clear; close all;

% Definimos los polinomios
p = [1 -6 11 -6];  % Coeficientes de p(x) = x^3 - 6x^2 + 11x - 6
q = [1 -1];       % Coeficientes de q(x) = x - 1

% Procedimientos
[p_norm, q_norm] = normalizar(p,q);
x = 4;

disp('Polinomio p(x):');
disp(poly2sym(p));
disp('Polinomio q(x):');
disp(poly2sym(q));

suma(p_norm,q_norm);
producto(p_norm,q_norm);
division(p,q);
evalular_x_estandar(p, x);
evalular_x_anidado(p, x);

%-------------------------------------------------------------------------%


% Función para normalizar los polinomios
function [p_norm, q_norm] = normalizar(p,q)
    if isempty(p) || isempty(q)
        error('Error: Ambos polinomios deben contener coeficientes.');
    end

    longitud_max = max(length(p), length(q));
    p_norm = [zeros(1, longitud_max - length(p)), p]; 
    q_norm = [zeros(1, longitud_max - length(q)), q];
end


% Función para suma de polinomios
function resultado = suma(p, q)
    resultado = p + q;
    fprintf('Suma de polinomios: ');
    disp(vpa(poly2sym(resultado)));
end


% Función para multiplicación de polinomios
function resultado = producto(p, q)
    resultado = conv(p,q);
    fprintf('Producto de polinomios: ');
    disp(vpa(poly2sym(resultado)));
end


% Función para división de polinomios
function [cociente, residuo] = division(p, q)
    [cociente, residuo] = deconv(p, q);
    fprintf('Cociente de polinomios: ');
    disp(vpa(poly2sym(cociente)));
    fprintf('Residuo de polinomios: ');
    disp(vpa(poly2sym(residuo)));
end


% Función para evaluar x en un polinomio de manera estándar
function resultado = evalular_x_estandar(p, X)
    if numel(p) == 1
        % Si el polinomio tiene solo un coeficiente, retorna ese coeficiente
        resultado = p;
    else
        % Convertir el polinomio en una función simbólica y luego a una función de MATLAB
        syms x;
        f_simb = poly2sym(p, x);
        f = matlabFunction(f_simb);
        resultado = f(X);
    end

    % Imprimir el resultado
    fprintf('\nf(%.4f) = %s = %.4f ---> Método Estándar', X, polinomio2string(p, X), resultado);
end


% Función para el método anidado
function resultado = evalular_x_anidado(p, X)
    n_p = length(p);  % Número de coeficientes del polinomio p
    resultado = p(1); % Inicializa con el coeficiente de mayor grado
    
    for i = 2:n_p
        resultado = resultado * X + p(i); % Aplicación del método anidado
    end

    % Imprimir el resultado
    fprintf('\nf(%.4f) = %s = %.4f ---> Método Anidado', X, polinomio2string(p, X), resultado);
end


% Función para convertir un polinomio a string y mantener el orden de los exponentes
function pol_str = polinomio2string(p, X)
    n = length(p); % Número de términos en el polinomio
    pol_str = '';  % Iniciar cadena vacía para el polinomio
    
    % Función interna para convertir coeficiente a string con formato
    function coef_str = coef_to_str(coef)
        if fix(coef) == coef
            coef_str = sprintf('%d', abs(coef));   % No mostrar decimales
        else
            coef_str = sprintf('%.4f', abs(coef)); % Mostrar 4 decimales
        end
    end

    % Generar la cadena del polinomio
    for i = 1:n-1
        coef = p(i); % Coeficiente de cada término
        exp = n - i; % Exponente correspondiente
        
        if coef ~= 0
            % Convertir coeficiente a string
            coef_str = coef_to_str(coef);
            
            if i == 1
                % Para el primer término, no poner el signo '+'
                if coef > 0
                    pol_str = sprintf('%s%s*x^%d', pol_str, coef_str, exp);
                else
                    pol_str = sprintf('%s-%s*x^%d', pol_str, coef_str, exp);
                end
            else
                if coef > 0
                    pol_str = sprintf('%s + %s*x^%d', pol_str, coef_str, exp);
                else
                    pol_str = sprintf('%s - %s*x^%d', pol_str, coef_str, exp);
                end
            end
        end
    end
    
    % Último término sin exponente
    coef = p(n);
    coef_str = coef_to_str(coef); % Convertir coeficiente a string
    
    % Solo mostrar el último término si es diferente de 0
    if coef > 0
        pol_str = sprintf('%s + %s', pol_str, coef_str);
    elseif coef < 0
        pol_str = sprintf('%s - %s', pol_str, coef_str);
    end
    
    % Reemplazar 'x' por el valor de X
    x_str = strcat('(', num2str(X), ')');
    pol_str = strrep(pol_str, 'x', x_str);
end
