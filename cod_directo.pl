% ===============================================
% Autor: Emiliano Rafael Flores Ramirez
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que codifica 
%              directamente una lista usando 
%              codificación Run-Length.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para codificar directamente una lista usando Run-Length.
%     static List<Tuple<int, T>> EncodeDirect<T>(List<T> list)
%     {
%         List<Tuple<int, T>> encodedList = new List<Tuple<int, T>>();
%         int count = 0;
% 
%         for (int i = 0; i < list.Count; i++)
%         {
%             count = 1; // Inicializa el contador.
%             while (i + 1 < list.Count && list[i].Equals(list[i + 1]))
%             {
%                 count++; // Incrementa el contador si el siguiente elemento es igual.
%                 i++; // Avanza el índice.
%             }
%             encodedList.Add(new Tuple<int, T>(count, list[i])); // Agrega la pareja (N, X).
%         }
%         
%         return encodedList;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'b', 'c', 'a', 'a' };
%         var listaCodificada = EncodeDirect(lista);
% 
%         foreach (var item in listaCodificada)
%         {
%             Console.WriteLine($"({item.Item1}, {item.Item2})");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado encode_direct(List, Result) que codifica
% directamente una lista usando Run-Length, almacenando
% el resultado en Result.

% Caso base: una lista vacía se codifica como una lista vacía.
encode_direct([], []).

% Caso recursivo: cuenta cuántos elementos consecutivos son iguales.
encode_direct([X|Xs], [[N,X]|R]) :- 
    count(X, [X|Xs], N, Rest), % Cuenta elementos consecutivos y obtiene el resto de la lista.
    encode_direct(Rest, R).    % Codifica el resto de la lista.

% Predicado auxiliar count(Elemento, Lista, Contador, Resto) que cuenta cuántos elementos
% consecutivos son iguales.

% Caso base: si la lista está vacía, el contador es 0 y el resto también.
count(_, [], 0, []).

% Caso recursivo: si el siguiente elemento es igual, incrementa el contador.
count(X, [X|Xs], N, Rest) :- 
    count(X, Xs, N1, Rest), 
    N is N1 + 1.

% Caso cuando el siguiente elemento es diferente: el contador es 0 y devuelve el resto.
count(X, [Y|Ys], 0, [Y|Ys]) :- 
    X \= Y.

% Ejemplo de uso:
% ?- encode_direct([a, a, b, b, c, a, a], R).
% R = [[2, a], [2, b], [1, c], [2, a]].
% ----------------------------------------------
