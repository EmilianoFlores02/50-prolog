% ===============================================
% Autor: Emiliano Rafael Flores Ramirez
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que modifica 
%              la codificación Run-Length de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para modificar la codificación Run-Length de una lista.
%     static List<object> EncodeModified<T>(List<T> list)
%     {
%         var encoded = Encode(list); // Usa la función de codificación Run-Length anterior.
%         List<object> modifiedList = new List<object>();
%         
%         foreach (var pair in encoded)
%         {
%             if (pair.Item1 == 1) // Si el número de duplicados es 1, agrega solo el elemento.
%             {
%                 modifiedList.Add(pair.Item2);
%             }
%             else // Si hay duplicados, mantiene la codificación (N, X).
%             {
%                 modifiedList.Add(pair);
%             }
%         }
%         
%         return modifiedList;
%     }
% 
%     // Función auxiliar para codificar (usada en EncodeModified).
%     static List<Tuple<int, T>> Encode<T>(List<T> list)
%     {
%         // ... Implementación de Encode como en el ejemplo anterior ...
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'b', 'c', 'a', 'a' };
%         var listaCodificadaModificada = EncodeModified(lista);
% 
%         foreach (var item in listaCodificadaModificada)
%         {
%             Console.WriteLine(item is Tuple<int, char> tuple 
%                 ? $"({tuple.Item1}, {tuple.Item2})" 
%                 : item.ToString());
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado encode_modified(List, Result) que modifica
% la codificación Run-Length de una lista, almacenando el resultado en Result.

encode_modified(L, R) :- 
    encode(L, Enc),      % Codifica la lista usando Run-Length.
    modify(Enc, R).      % Modifica la codificación.

% Caso base: lista vacía se mantiene vacía.
modify([], []).

% Si hay solo un elemento, agrégalo directamente al resultado.
modify([[1,X]|T], [X|R]) :- 
    modify(T, R).

% Si hay más de un elemento, mantén el formato (N, X).
modify([[N,X]|T], [[N,X]|R]) :- 
    N > 1, 
    modify(T, R).

% Ejemplo de uso:
% ?- encode_modified([a, a, b, b, c, a, a], R).
% R = [[2, a], [2, b], c].
% ----------------------------------------------
