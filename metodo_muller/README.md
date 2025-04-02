**Fecha de entrega: 2 de abril de 2025**

Realizar el código en matlab para solucionar el ejemplo f(x) = x3 – 13x – 12, con valores iniciales x0, x1 y x2 = 4.5, 5.5 y 5 utilizando el método de müller, 
imprimiendo una tabla con las iteraciones y sus valores. Puede usar los siguientes valores en su código.
- f = @(x) x^3 - 13*x - 12;
- x0 = 4.5; x1 = 5.5; x2 = 5;
- tol = 1e-6; max_iter = 100;
- raiz = muller(f, x0, x1, x2, tol, max_iter);
