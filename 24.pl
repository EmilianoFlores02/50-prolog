% ===============================================
% Autor: Emiliano Rafael Flores Ramirez
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que calcula 
%              el número de elementos de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para calcular el número de elementos de una lista en C#.
%     static int ListLength<T>(List<T> list)
%     {
%         if (list == null)
%             throw new ArgumentException("La lista no puede ser nula.");
%         
%         return list.Count; // Devuelve el número de elementos de la lista.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         int longitud = ListLength(lista);
% 
%         Console.WriteLine("La longitud de la lista es: " + longitud);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado list_length(List, N) que calcula la longitud
% de la lista List, almacenando el resultado en N.

% Caso base: una lista vacía tiene longitud 0.
list_length([], 0).

% Caso recursivo: la longitud es 1 más que la longitud de la cola.
list_length([_|Tail], N) :- 
    list_length(Tail, N1), 
    N is N1 + 1.

% Ejemplo de uso:
% ?- list_length([a, b, c, d], N).
% N = 4.
% ----------------------------------------------
