% ===============================================
% Autor: Emiliano Rafael Flores Ramirez 
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que divide 
%              una lista en dos partes.
%              La longitud de la primera parte está 
%              dada por el segundo argumento.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para dividir una lista en dos partes.
%     static Tuple<List<T>, List<T>> Split<T>(List<T> list, int n)
%     {
%         List<T> part1 = new List<T>();
%         List<T> part2 = new List<T>();
%         
%         for (int i = 0; i < list.Count; i++)
%         {
%             if (i < n)
%             {
%                 part1.Add(list[i]); // Agrega a la primera parte.
%             }
%             else
%             {
%                 part2.Add(list[i]); // Agrega a la segunda parte.
%             }
%         }
%         
%         return Tuple.Create(part1, part2); // Devuelve ambas partes.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f' };
%         int n = 3; // Longitud de la primera parte.
%         var (parte1, parte2) = Split(lista, n);
% 
%         Console.WriteLine("Primera parte: " + string.Join(", ", parte1));
%         Console.WriteLine("Segunda parte: " + string.Join(", ", parte2));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado split(List, N, Part1, Part2) que divide una lista
% en dos partes, donde la longitud de la primera parte es N.

% Caso base: si N es 0, la primera parte es vacía y la segunda
% parte es la lista completa.
split(L, 0, [], L).

% Caso recursivo: agrega el primer elemento a la primera parte
% y continúa dividiendo el resto de la lista.
split([H|T], N, [H|L1], L2) :- 
    N > 0, 
    N1 is N - 1, 
    split(T, N1, L1, L2).

% Ejemplo de uso:
% ?- split([a, b, c, d, e, f], 3, P1, P2).
% P1 = [a, b, c], P2 = [d, e, f].
% ----------------------------------------------
