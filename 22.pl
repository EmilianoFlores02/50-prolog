% ===============================================
% Autor: Emiliano Rafael Flores Ramirez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que ordena una lista de listas
%              de acuerdo con la longitud de las sublistas.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función para ordenar una lista de listas según la longitud de cada sublista.
%     static List<List<T>> LSort<T>(List<List<T>> lists)
%     {
%         // Ordena las listas usando la longitud de las sublistas como criterio.
%         return lists.OrderBy(subList => subList.Count).ToList();
%     }
% 
%     static void Main()
%     {
%         List<List<int>> listas = new List<List<int>>
%         {
%             new List<int> {1, 2, 3},
%             new List<int> {4, 5},
%             new List<int> {6},
%             new List<int> {7, 8, 9, 10}
%         };
% 
%         List<List<int>> listasOrdenadas = LSort(listas);
% 
%         Console.WriteLine("Listas ordenadas por longitud:");
%         foreach (var subList in listasOrdenadas)
%         {
%             Console.WriteLine(string.Join(", ", subList));
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado lsort(L, S) que ordena una lista de listas L de acuerdo
% con la longitud de sus sublistas, resultando en S.

% Utiliza map_list_to_pairs/3 para convertir cada sublista en un par (Longitud, Sublista).
% Luego, keysort/2 para ordenar los pares de acuerdo a las longitudes.
% Finalmente, pairs_values/2 para recuperar las sublistas ya ordenadas.
lsort(L, S) :-
    map_list_to_pairs(length, L, P),  % Crea pares (Longitud, Sublista).
    keysort(P, SP),                   % Ordena los pares por longitud.
    pairs_values(SP, S).              % Extrae las sublistas ordenadas.

% Ejemplo de uso:
% ?- lsort([[a,b,c], [d,e], [f], [g,h,i,j]], S).
% S = [[f], [d, e], [a, b, c], [g, h, i, j]].
% ----------------------------------------------
