% ===============================================
% Autor: Emiliano Rafael Flores Ramirez 
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que elimina 
%              duplicados consecutivos de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función para eliminar duplicados consecutivos de una lista en C#.
%     static List<T> Compress<T>(List<T> list)
%     {
%         if (list == null || list.Count == 0)
%             return new List<T>(); // Si la lista está vacía, devuelve una lista vacía.
%         
%         List<T> result = new List<T> { list[0] }; // Inicia con el primer elemento.
%         
%         for (int i = 1; i < list.Count; i++)
%         {
%             if (!list[i].Equals(list[i - 1])) // Si el elemento es diferente al anterior, lo agrega.
%                 result.Add(list[i]);
%         }
%         
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'b', 'c', 'a', 'a' };
%         List<char> listaSinDuplicados = Compress(lista);
% 
%         Console.WriteLine("Lista sin duplicados consecutivos: " + string.Join(", ", listaSinDuplicados));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado compress(List, Result) que elimina los duplicados consecutivos
% de la lista List y almacena el resultado en Result.

% Caso base: una lista vacía se mantiene vacía.
compress([], []).

% Si queda un solo elemento, no hay duplicados.
compress([X], [X]).

% Caso recursivo: si el primer y segundo elemento son iguales, ignora el primero.
compress([X,X|T], R) :- 
    compress([X|T], R).

% Caso recursivo: si el primer y segundo elemento son distintos, conserva el primero.
compress([X,Y|T], [X|R]) :- 
    X \= Y, 
    compress([Y|T], R).

% Ejemplo de uso:
% ?- compress([a,a,b,b,c,a,a], R).
% R = [a, b, c, a].
% ----------------------------------------------
