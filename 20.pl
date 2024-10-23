% ===============================================
% Autor: Emiliano Rafael Flores ramirez
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que determina 
%              el k-ésimo elemento de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para encontrar el k-ésimo elemento de una lista en C#.
%     static T ElementAt<T>(List<T> list, int k)
%     {
%         if (list == null || k <= 0 || k > list.Count)
%             throw new ArgumentException("Índice fuera de rango.");
%         
%         return list[k - 1]; // Devuelve el k-ésimo elemento.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         int k = 3;
%         char kEsimoElemento = ElementAt(lista, k);
% 
%         Console.WriteLine("El " + k + "-ésimo elemento es: " + kEsimoElemento);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado element_at(X, List, K) que determina el k-ésimo
% elemento X de la lista List.

% Caso base: el k-ésimo elemento es el primero cuando K es 1.
element_at(X, [X|_], 1).

% Caso recursivo: ignora el primer elemento de la lista y decrementa K.
element_at(X, [_|Tail], K) :- 
    K > 1, 
    K1 is K - 1, 
    element_at(X, Tail, K1).

% Ejemplo de uso:
% ?- element_at(X, [a, b, c, d], 3).
% X = c.
% ----------------------------------------------
