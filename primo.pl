% ===============================================
% Autor: Emiliano Flores
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que verifica si un número es primo.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% 
% class Program
% {
%     // Función que verifica si un número es primo.
%     static bool IsPrime(int n)
%     {
%         if (n <= 1) return false;
%         if (n == 2 || n == 3) return true;
%         if (n % 2 == 0) return false;
% 
%         for (int i = 3; i * i <= n; i += 2)
%         {
%             if (n % i == 0) return false;
%         }
% 
%         return true;
%     }
% 
%     static void Main()
%     {
%         int number = 29;
%         bool result = IsPrime(number);
%         Console.WriteLine($"{number} es primo: {result}");
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado is_prime/1 que verifica si un número es primo.

% Caso base: los números 2 y 3 son primos.
is_prime(2).
is_prime(3).

% Caso general: un número P mayor que 3 es primo si no es divisible por 2
% y no tiene factores desde 3 en adelante.
is_prime(P) :-
    P > 3,
    P mod 2 =\= 0,
    \+ has_factor(P, 3).

% Predicado has_factor/2 que verifica si un número tiene algún factor.
% Caso base: si N es divisible por L, entonces L es un factor.
has_factor(N, L) :-
    N mod L =:= 0.

% Caso recursivo: si L no es un factor y L^2 es menor que N,
% incrementa L en 2 para probar el siguiente número impar.
has_factor(N, L) :-
    L * L < N,
    L2 is L + 2,
    has_factor(N, L2).

% Ejemplo de uso:
% ?- is_prime(29).
% true.
% ?- is_prime(30).
% false.
% ----------------------------------------------
