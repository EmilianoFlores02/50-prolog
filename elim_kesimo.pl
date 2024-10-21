% ===============================================
% Autor: Emiliano Rafael Flores Ramirez 
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que elimina el
%              k-ésimo elemento de una lista.
%              El índice K debe ser mayor que 0.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para eliminar el k-ésimo elemento de una lista.
%     static Tuple<T, List<T>> RemoveAt<T>(List<T> list, int k)
%     {
%         if (k <= 0 || k > list.Count)
%             throw new ArgumentException("Índice fuera de rango.");

%         T removedElement = list[k - 1]; // El elemento a eliminar.
%         List<T> result = new List<T>(list);
%         result.RemoveAt(k - 1); // Elimina el k-ésimo elemento.
%         
%         return Tuple.Create(removedElement, result); // Devuelve el elemento y la lista modificada.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
%         int k = 3; // Índice del elemento a eliminar.
%         var (eliminado, listaModificada) = RemoveAt(lista, k);
% 
%         Console.WriteLine("Elemento eliminado: " + eliminado);
%         Console.WriteLine("Lista modificada: " + string.Join(", ", listaModificada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado remove_at(X, List, K, Result) que elimina el
% k-ésimo elemento de una lista.

% Caso base: si K es 1, elimina el primer elemento de la lista.
remove_at(X, [X|T], 1, T).

% Caso recursivo: sigue buscando el k-ésimo elemento, decrementando K.
remove_at(X, [H|T], K, [H|R]) :- 
    K > 1, 
    K1 is K - 1, 
    remove_at(X, T, K1, R).

% Ejemplo de uso:
% ?- remove_at(X, [a, b, c, d, e], 3, R).
% X = c, R = [a, b, d, e].
% ----------------------------------------------
