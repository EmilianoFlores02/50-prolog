% ===============================================
% Autor: Emiliano Rafael Flores Ramirez
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que duplica 
%              los elementos de una lista un número
%              dado de veces.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para duplicar los elementos de una lista un número dado de veces.
%     static List<T> Dupli<T>(List<T> list, int n)
%     {
%         List<T> result = new List<T>();
%         
%         foreach (var item in list)
%         {
%             for (int i = 0; i < n; i++)
%             {
%                 result.Add(item); // Agrega el elemento N veces.
%             }
%         }
%         
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         int n = 3; // Número de duplicaciones.
%         var listaDuplicada = Dupli(lista, n);
% 
%         Console.WriteLine("Lista duplicada: " + string.Join(", ", listaDuplicada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado dupli(List, N, Result) que duplica los elementos
% de una lista un número dado de veces, almacenando el
% resultado en Result.

% Caso base: una lista vacía se mantiene vacía.
dupli([], _, []).

% Caso recursivo: duplica el primer elemento N veces
% y continúa con el resto de la lista.
dupli([H|T], N, R) :- 
    duplicate(H, N, D),         % Duplica el elemento H N veces.
    dupli(T, N, R1),           % Duplica el resto de la lista.
    append(D, R1, R).           % Combina la lista duplicada con el resto.

% Predicado auxiliar duplicate(Elemento, N, Repeticiones) que
% crea una lista con N repeticiones del elemento X.

% Caso base: N es 0, la lista es vacía.
duplicate(_, 0, []).

% Caso recursivo: agrega X a la lista y decrementa N.
duplicate(X, N, [X|R]) :- 
    N > 0, 
    N1 is N - 1, 
    duplicate(X, N1, R).        % Llama recursivamente.

% Ejemplo de uso:
% ?- dupli([a, b, c, d], 3, R).
% R = [a, a, a, b, b, b, c, c, c, d, d, d].
% ----------------------------------------------
