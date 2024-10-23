% ===============================================
% Autor: Emiliano Rafael Flores Ramirez
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que aplana una
%              lista anidada en una lista simple.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para aplanar una lista anidada en una lista simple en C#.
%     static List<T> MyFlatten<T>(List<object> list)
%     {
%         List<T> flatList = new List<T>();
%         
%         foreach (var item in list)
%         {
%             if (item is List<object> nestedList) // Si el item es una lista, aplanarla.
%             {
%                 flatList.AddRange(MyFlatten<T>(nestedList));
%             }
%             else
%             {
%                 flatList.Add((T)item); // Si no es una lista, agregarlo al resultado.
%             }
%         }
%         return flatList;
%     }
% 
%     static void Main()
%     {
%         List<object> lista = new List<object> { 'a', new List<object> { 'b', 'c' }, 'd' };
%         List<char> listaAplanada = MyFlatten<char>(lista);
% 
%         Console.WriteLine("Lista aplanada: " + string.Join(", ", listaAplanada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado my_flatten(List, Flat) que aplana una lista anidada
% en una lista simple.

% Caso base: la lista vacía se aplana a una lista vacía.
my_flatten([], []).

% Caso recursivo: si la cabeza es una lista, aplana la cabeza y la cola recursivamente.
my_flatten([H|T], Flat) :- 
    my_flatten(H, FH), 
    my_flatten(T, FT), 
    append(FH, FT, Flat).

% Si la cabeza no es una lista, simplemente agrégala al resultado.
my_flatten(X, [X]) :- 
    X \= [], 
    \+ is_list(X).

% Ejemplo de uso:
% ?- my_flatten([a, [b, c], d], Flat).
% Flat = [a, b, c, d].
% ----------------------------------------------
