% ===============================================
% Autor: Emiliano Rafael Flores Ramirez
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que codifica 
%              una lista usando codificación 
%              Run-Length.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función para agrupar duplicados consecutivos y codificar una lista usando Run-Length.
%     static List<Tuple<int, T>> Encode<T>(List<T> list)
%     {
%         List<List<T>> packedList = Pack(list); // Usa la función de agrupamiento anterior.
%         List<Tuple<int, T>> encodedList = new List<Tuple<int, T>>();
% 
%         foreach (var sublist in packedList)
%         {
%             encodedList.Add(new Tuple<int, T>(sublist.Count, sublist[0])); // Agrega el tamaño y el elemento.
%         }
% 
%         return encodedList;
%     }
% 
%     // Función auxiliar que agrupa duplicados consecutivos (usada en Pack).
%     static List<List<T>> Pack<T>(List<T> list)
%     {
%         if (list == null || list.Count == 0)
%             return new List<List<T>>();
%         
%         List<List<T>> result = new List<List<T>>();
%         List<T> currentSublist = new List<T> { list[0] };
%         
%         for (int i = 1; i < list.Count; i++)
%         {
%             if (list[i].Equals(list[i - 1]))
%             {
%                 currentSublist.Add(list[i]);
%             }
%             else
%             {
%                 result.Add(currentSublist);
%                 currentSublist = new List<T> { list[i] };
%             }
%         }
%         
%         result.Add(currentSublist);
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'b', 'c', 'a', 'a' };
%         List<Tuple<int, char>> listaCodificada = Encode(lista);
% 
%         foreach (var item in listaCodificada)
%         {
%             Console.WriteLine($"({item.Item1}, {item.Item2})");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado encode(List, Result) que codifica una lista
% usando Run-Length Encoding, almacenando el resultado en Result.

% Primero agrupa los duplicados y luego transforma las sublistas en parejas (N, X).
encode(L, R) :- 
    pack(L, P),   % Agrupa duplicados con el predicado 'pack'.
    transform(P, R).

% Predicado auxiliar transform(Sublist, Encoded) que transforma
% sublistas en parejas (N, X), donde N es la cantidad de elementos.

% Caso base: una lista vacía se codifica como vacía.
transform([], []).

% Caso recursivo: transforma la sublista en la pareja (N, X) y continúa con el resto.
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- 
    length([X|Xs], N),  % Calcula la longitud de la sublista.
    transform(Ys, Zs).  % Procesa el resto de las sublistas.

% Ejemplo de uso:
% ?- encode([a, a, b, b, c, a, a], R).
% R = [[2, a], [2, b], [1, c], [2, a]].
% ----------------------------------------------
