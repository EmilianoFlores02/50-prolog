% ===============================================
% Autor: Emiliano Rafael Flores Ramirez 
% Fecha: 23 de octubre de 2024 
% Descripción: Programa en Prolog que crea una lista 
%              con todos los enteros dentro de un rango dado.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función que genera una lista de enteros dentro de un rango.
%     static List<int> Range(int start, int end)
%     {
%         List<int> result = new List<int>();
%         
%         for (int i = start; i <= end; i++) 
%         {
%             result.Add(i);  // Agrega cada número dentro del rango a la lista.
%         }
%         
%         return result;
%     }
% 
%     static void Main()
%     {
%         int inicio = 3;
%         int fin = 8;
%         List<int> rango = Range(inicio, fin);
% 
%         Console.WriteLine("Lista del rango: " + string.Join(", ", rango));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado range(I, K, R) que crea una lista con
% todos los enteros entre I y K (inclusive).

% Caso base: cuando el inicio y el final son iguales, la lista contiene un solo elemento.
range(I, I, [I]).

% Caso recursivo: agrega el inicio a la lista y continúa con el siguiente número.
range(I, K, [I|R]) :- 
    I < K,                   % Asegura que el inicio sea menor que el final.
    I1 is I + 1,             % Incrementa el inicio.
    range(I1, K, R).         % Llama recursivamente con el siguiente número.

% Ejemplo de uso:
% ?- range(3, 8, R).
% R = [3, 4, 5, 6, 7, 8].
% ----------------------------------------------
