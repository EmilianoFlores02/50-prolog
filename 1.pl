% ===============================================
% Autor: Emiliano rafael Flores Ramirez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que agrupa los elementos de un conjunto
%              en subconjuntos disjuntos dados los tamaños de los subgrupos.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función para obtener todas las combinaciones de N elementos de una lista.
%     static List<List<T>> Combination<T>(int N, List<T> list)
%     {
%         if (N == 0)
%             return new List<List<T>> { new List<T>() };  // Caso base: una combinación vacía.
%         
%         if (list.Count == 0)
%             return new List<List<T>>();  // Si la lista está vacía, no hay combinaciones.
%         
%         T head = list[0];
%         List<T> tail = list.GetRange(1, list.Count - 1);
% 
%         // Genera combinaciones que incluyen el primer elemento.
%         List<List<T>> withHead = Combination(N - 1, tail);
%         foreach (var comb in withHead)
%         {
%             comb.Insert(0, head);  // Agrega el primer elemento a cada combinación.
%         }
% 
%         // Genera combinaciones que no incluyen el primer elemento.
%         List<List<T>> withoutHead = Combination(N, tail);
% 
%         // Une ambas listas de combinaciones.
%         withHead.AddRange(withoutHead);
%         return withHead;
%     }
% 
%     // Función para agrupar los elementos en subgrupos dados los tamaños de cada subgrupo.
%     static List<List<List<T>>> Group<T>(List<int> groupSizes, List<T> elements)
%     {
%         if (groupSizes.Count == 0)
%             return new List<List<List<T>>> { new List<List<T>>() };  // Caso base: no hay grupos.
% 
%         int currentGroupSize = groupSizes[0];
%         List<int> remainingGroupSizes = groupSizes.GetRange(1, groupSizes.Count - 1);
% 
%         List<List<List<T>>> result = new List<List<List<T>>>();
% 
%         // Para cada combinación del tamaño actual, crea un subgrupo.
%         foreach (var comb in Combination(currentGroupSize, elements))
%         {
%             List<T> remainingElements = elements.Except(comb).ToList();
%             foreach (var group in Group(remainingGroupSizes, remainingElements))
%             {
%                 group.Insert(0, comb);  // Agrega el subgrupo actual al grupo final.
%                 result.Add(group);
%             }
%         }
% 
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> elements = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f' };
%         List<int> groupSizes = new List<int> { 2, 2, 2 };
% 
%         List<List<List<char>>> groups = Group(groupSizes, elements);
% 
%         Console.WriteLine("Grupos:");
%         foreach (var group in groups)
%         {
%             foreach (var subGroup in group)
%             {
%                 Console.WriteLine(string.Join(", ", subGroup));
%             }
%             Console.WriteLine("---");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado group(Ns, Es, Gs) que agrupa los elementos de la lista Es en
% subconjuntos disjuntos cuyos tamaños están dados por Ns.

% Caso base: cuando no hay más tamaños de subgrupos que procesar, el resultado es vacío.
group([], [], []).

% Caso recursivo: selecciona una combinación de N elementos de Es, elimina estos elementos
% del conjunto original y repite el proceso con el resto de los elementos.
group([N|Ns], Es, [G|Gs]) :-
    combination(N, Es, G),  % Obtén una combinación de N elementos.
    subtract(Es, G, Rest),  % Elimina los elementos seleccionados de Es.
    group(Ns, Rest, Gs).    % Agrupa el resto de los elementos.

% Ejemplo de uso:
% ?- group([2,2,2], [a, b, c, d, e, f], Gs).
% Gs = [[a, b], [c, d], [e, f]] ;
% Gs = [[a, b], [c, e], [d, f]] ;
% Gs = [[a, b], [c, f], [d, e]] ;
% ...
% ----------------------------------------------
