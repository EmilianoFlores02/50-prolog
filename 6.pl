% ===============================================
% Autor: Emiliano Rafael Flores Ramirez 
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que genera todas las combinaciones 
%              de K elementos seleccionados de una lista dada.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función recursiva para generar todas las combinaciones de K elementos de una lista.
%     static List<List<T>> Combination<T>(int K, List<T> list)
%     {
%         if (K == 0)
%             return new List<List<T>> { new List<T>() };  // Caso base: una combinación vacía.
%         
%         if (list.Count == 0)
%             return new List<List<T>>();  // Si la lista está vacía, no hay combinaciones.
%         
%         T head = list[0];
%         List<T> tail = list.GetRange(1, list.Count - 1);
% 
%         // Genera combinaciones que incluyen el primer elemento.
%         List<List<T>> withHead = Combination(K - 1, tail);
%         foreach (var comb in withHead)
%         {
%             comb.Insert(0, head);  // Agrega el primer elemento a cada combinación.
%         }
% 
%         // Genera combinaciones que no incluyen el primer elemento.
%         List<List<T>> withoutHead = Combination(K, tail);
% 
%         // Une ambas listas de combinaciones.
%         withHead.AddRange(withoutHead);
%         return withHead;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
%         int K = 3;
%         List<List<char>> combinaciones = Combination(K, lista);
% 
%         Console.WriteLine("Combinaciones:");
%         foreach (var comb in combinaciones)
%         {
%             Console.WriteLine(string.Join(", ", comb));
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado combination(K, L, Comb) que genera todas las combinaciones 
% de K elementos seleccionados de la lista L.

% Caso base: si K es 0, la única combinación es la lista vacía.
combination(0, _, []).

% Caso recursivo: si K es mayor que 0, selecciona el primer elemento de la lista
% y genera combinaciones con él.
combination(K, [H|T], [H|Comb]) :- 
    K > 0, 
    K1 is K - 1, 
    combination(K1, T, Comb).

% Caso recursivo: si K es mayor que 0, genera combinaciones sin el primer elemento.
combination(K, [_|T], Comb) :- 
    K > 0, 
    combination(K, T, Comb).

% Ejemplo de uso:
% ?- combination(3, [a, b, c, d, e], Comb).
% Comb = [a, b, c] ;
% Comb = [a, b, d] ;
% Comb = [a, b, e] ;
% Comb = [a, c, d] ;
% Comb = [a, c, e] ;
% Comb = [a, d, e] ;
% Comb = [b, c, d] ;
% Comb = [b, c, e] ;
% Comb = [b, d, e] ;
% Comb = [c, d, e].
% ----------------------------------------------
