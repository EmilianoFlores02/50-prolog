% ===============================================
% Autor: Emiliano Rafael Flores Ramirez 
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que decodifica 
%              una lista codificada mediante 
%              Run-Length.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para decodificar una lista codificada mediante Run-Length.
%     static List<T> Decode<T>(List<Tuple<int, T>> encodedList)
%     {
%         List<T> decodedList = new List<T>();
%         
%         foreach (var pair in encodedList)
%         {
%             int count = pair.Item1;
%             T element = pair.Item2;
%             
%             for (int i = 0; i < count; i++)
%             {
%                 decodedList.Add(element); // Agrega el elemento 'count' veces.
%             }
%         }
%         
%         return decodedList;
%     }
% 
%     static void Main()
%     {
%         var listaCodificada = new List<Tuple<int, char>> 
%         {
%             new Tuple<int, char>(2, 'a'),
%             new Tuple<int, char>(2, 'b'),
%             new Tuple<int, char>(1, 'c'),
%             new Tuple<int, char>(2, 'a')
%         };
%         
%         var listaDecodificada = Decode(listaCodificada);
% 
%         Console.WriteLine("Lista decodificada: " + string.Join(", ", listaDecodificada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado decode(List, Result) que decodifica
% una lista codificada mediante Run-Length, almacenando
% el resultado en Result.

% Caso base: una lista vacía se decodifica como una lista vacía.
decode([], []).

% Caso recursivo: expande cada par (N, X) en una lista con N elementos X.
decode([[N,X]|T], R) :- 
    decode(T, R1),         % Decodifica el resto de la lista.
    expand(X, N, E),       % Expande el par (N, X).
    append(E, R1, R).      % Combina la lista expandida con el resto.

% Expande un elemento X en una lista de longitud N.
expand(_, 0, []).                     % Caso base: longitud 0 se convierte en lista vacía.
expand(X, N, [X|T]) :- 
    N > 0, 
    N1 is N - 1, 
    expand(X, N1, T).                % Agrega X y reduce la longitud.

% Ejemplo de uso:
% ?- decode([[2,a],[2,b],[1,c],[2,a]], R).
% R = [a, a, b, b, c, a, a].
% ----------------------------------------------
