% ===============================================
% Autor: Emiliano Rafael Flores Ramirez 
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que extrae una
%              porción de una lista dado un rango
%              de índices (I, K), donde ambos
%              índices deben ser mayores que 0.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para extraer una porción de una lista dado un rango.
%     static List<T> Slice<T>(List<T> list, int i, int k)
%     {
%         if (i <= 0 || k <= 0 || i > k || i > list.Count)
%             throw new ArgumentException("Índices inválidos.");

%         List<T> result = new List<T>();
%         
%         for (int index = i - 1; index < k && index < list.Count; index++)
%         {
%             result.Add(list[index]); // Agrega los elementos dentro del rango.
%         }
%         
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f' };
%         int i = 2; // Índice inicial.
%         int k = 4; // Índice final.
%         var sublista = Slice(lista, i, k);
% 
%         Console.WriteLine("Sublista: " + string.Join(", ", sublista));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado slice(List, I, K, Result) que extrae una
% porción de la lista entre los índices I y K.

% Caso base: cuando I y K son ambos 1, el primer elemento
% es el resultado.
slice([H|_], 1, 1, [H]).

% Caso recursivo: extrae desde el primer índice I=1 hasta K,
% decrementando K en cada paso.
slice([H|T], 1, K, [H|R]) :- 
    K > 1, 
    K1 is K - 1, 
    slice(T, 1, K1, R).

% Caso recursivo: ignora los elementos hasta llegar al índice I.
slice([_|T], I, K, R) :- 
    I > 1, 
    I1 is I - 1, 
    K1 is K - 1, 
    slice(T, I1, K1, R).

% Ejemplo de uso:
% ?- slice([a, b, c, d, e, f], 2, 4, R).
% R = [b, c, d].
% ----------------------------------------------
