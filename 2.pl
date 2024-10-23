% ===============================================
% Autor: Emiliano Rafael Flores Ramirez
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que agrupa 
%              duplicados consecutivos de una lista
%              en sublistas.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para agrupar duplicados consecutivos de una lista en sublistas en C#.
%     static List<List<T>> Pack<T>(List<T> list)
%     {
%         if (list == null || list.Count == 0)
%             return new List<List<T>>(); // Si la lista está vacía, devuelve una lista vacía.
%         
%         List<List<T>> result = new List<List<T>>();
%         List<T> currentSublist = new List<T> { list[0] };
%         
%         for (int i = 1; i < list.Count; i++)
%         {
%             if (list[i].Equals(list[i - 1]))
%             {
%                 currentSublist.Add(list[i]); // Si el elemento es igual al anterior, agrégalo a la sublista actual.
%             }
%             else
%             {
%                 result.Add(currentSublist); // Si es diferente, guarda la sublista actual y empieza una nueva.
%                 currentSublist = new List<T> { list[i] };
%             }
%         }
%         
%         result.Add(currentSublist); // Añadir la última sublista al resultado.
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'b', 'c', 'a', 'a' };
%         List<List<char>> listaAgrupada = Pack(lista);
% 
%         foreach (var sublista in listaAgrupada)
%         {
%             Console.WriteLine("[" + string.Join(", ", sublista) + "]");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado pack(List, Result) que agrupa duplicados consecutivos
% de la lista List en sublistas, almacenando el resultado en Result.

% Caso base: una lista vacía se agrupa como una lista vacía.
pack([], []).

% Caso recursivo: transfiere todos los elementos consecutivos iguales a una sublista.
pack([X|Xs], [[X|Ys]|Zs]) :- 
    transfer(X, Xs, Ys, Rest), 
    pack(Rest, Zs).

% Predicado auxiliar transfer(X, List, Sublist, Rest) que transfiere los elementos
% duplicados consecutivos a una sublista.

% Caso base: no hay más elementos que transferir.
transfer(_, [], [], []).

% Si el siguiente elemento es diferente, termina la transferencia.
transfer(X, [Y|Ys], [], [Y|Ys]) :- 
    X \= Y.

% Si el siguiente elemento es igual, agrégalo a la sublista.
transfer(X, [X|Xs], [X|Ys], Rest) :- 
    transfer(X, Xs, Ys, Rest).

% Ejemplo de uso:
% ?- pack([a, a, b, b, c, a, a], R).
% R = [[a, a], [b, b], [c], [a, a]].
% ----------------------------------------------
