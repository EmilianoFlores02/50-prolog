% ===============================================
% Autor: Emiliano Flores
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que ordena una lista de listas
%              según la frecuencia de la longitud de las sublistas.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función para ordenar una lista de listas de acuerdo
%     // con la frecuencia de la longitud de las sublistas.
%     static List<List<T>> LengthFrequencySort<T>(List<List<T>> lists)
%     {
%         // Genera un diccionario que cuenta la frecuencia de las longitudes.
%         var lengthFreq = lists.GroupBy(subList => subList.Count)
%                               .ToDictionary(g => g.Key, g => g.Count());
% 
%         // Ordena las listas primero por la frecuencia de su longitud y luego por su longitud.
%         return lists.OrderBy(subList => lengthFreq[subList.Count])
%                     .ThenBy(subList => subList.Count)
%                     .ToList();
%     }
% 
%     static void Main()
%     {
%         List<List<int>> listas = new List<List<int>>
%         {
%             new List<int> {1, 2, 3},
%             new List<int> {4, 5},
%             new List<int> {6},
%             new List<int> {7, 8, 9, 10},
%             new List<int> {11, 12}
%         };
% 
%         List<List<int>> listasOrdenadas = LengthFrequencySort(listas);
% 
%         Console.WriteLine("Listas ordenadas por frecuencia de longitud:");
%         foreach (var subList in listasOrdenadas)
%         {
%             Console.WriteLine(string.Join(", ", subList));
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado length_frequency(L, F) que ordena una lista de listas
% de acuerdo con la frecuencia de la longitud de las sublistas.

% Utiliza map_list_to_pairs/3 para convertir cada sublista en un par (Longitud, Sublista).
% Luego, msort/2 para ordenar los pares por longitud.
% Usa encode/2 para contar la frecuencia de cada longitud.
% Ordena finalmente según la frecuencia de las longitudes.
length_frequency(L, F) :-
    map_list_to_pairs(length, L, P),  % Crea pares (Longitud, Sublista).
    msort(P, SP),                     % Ordena las sublistas por longitud.
    encode(SP, Enc),                  % Codifica la lista en función de la frecuencia.
    map_list_to_pairs(reverse_pair, Enc, F).  % Genera la lista ordenada por frecuencia.

% Predicado encode/2, que agrupa elementos consecutivos similares y los transforma en (N, X).
encode(L, Enc) :- pack(L, P), transform(P, Enc).

% Reversa el par (X, N) para (N, X) en map_list_to_pairs.
reverse_pair((X, Y), (Y, X)).

% Ejemplo de uso:
% ?- length_frequency([[a,b,c], [d,e], [f], [g,h,i,j], [k,l]], F).
% F = [[f], [d, e], [k, l], [a, b, c], [g, h, i, j]].
% ----------------------------------------------
