% ===============================================
% Autor: [Tu Nombre] 
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que duplica 
%              los elementos de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para duplicar los elementos de una lista.
%     static List<T> Dupli<T>(List<T> list)
%     {
%         List<T> result = new List<T>();
%         
%         foreach (var item in list)
%         {
%             result.Add(item); // Agrega el elemento original.
%             result.Add(item); // Agrega el elemento duplicado.
%         }
%         
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         var listaDuplicada = Dupli(lista);
% 
%         Console.WriteLine("Lista duplicada: " + string.Join(", ", listaDuplicada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado dupli(List, Result) que duplica los elementos
% de una lista, almacenando el resultado en Result.

% Caso base: una lista vacía se mantiene vacía.
dupli([], []).

% Caso recursivo: duplica el primer elemento y continúa
% con el resto de la lista.
dupli([H|T], [H,H|R]) :- 
    dupli(T, R).  % Llama recursivamente a 'dupli' con el resto.

% Ejemplo de uso:
% ?- dupli([a, b, c, d], R).
% R = [a, a, b, b, c, c, d, d].
% ----------------------------------------------
