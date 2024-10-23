% ===============================================
% Autor: Emiliano Rafael Flores Ramirez 
% Fecha: 23 de octubre de 2024 
% Descripción: Programa en Prolog que inserta un 
%              elemento en una lista en la posición dada.
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
%     // Función para insertar un elemento en una lista en la posición dada.
%     static List<T> InsertAt<T>(List<T> list, T element, int k)
%     {
%         if (k <= 0 || k > list.Count + 1)
%             throw new ArgumentException("Índice fuera de rango.");

%         List<T> result = new List<T>(list);
%         result.Insert(k - 1, element); // Inserta el elemento en la posición k.
%         
%         return result; // Devuelve la lista modificada.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         char elemento = 'x'; // Elemento a insertar.
%         int k = 3; // Posición donde insertar el elemento.
%         var listaModificada = InsertAt(lista, elemento, k);
% 
%         Console.WriteLine("Lista modificada: " + string.Join(", ", listaModificada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado insert_at(X, List, K, Result) que inserta
% el elemento X en la posición K de la lista.

% Caso base: si K es 1, inserta el elemento al principio de la lista.
insert_at(X, L, 1, [X|L]).

% Caso recursivo: sigue avanzando hasta llegar a la posición K.
insert_at(X, [H|T], K, [H|R]) :- 
    K > 1, 
    K1 is K - 1, 
    insert_at(X, T, K1, R).

% Ejemplo de uso:
% ?- insert_at(x, [a, b, c, d], 3, R).
% R = [a, b, x, c, d].
% ----------------------------------------------
