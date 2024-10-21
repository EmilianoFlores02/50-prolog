% ===============================================
% Autor: Emiliano Rafael Flores Ramirez
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que elimina 
%              cada n-ésimo elemento de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para eliminar cada n-ésimo elemento de una lista.
%     static List<T> Drop<T>(List<T> list, int n)
%     {
%         List<T> result = new List<T>();
%         
%         for (int i = 0; i < list.Count; i++)
%         {
%             if ((i + 1) % n != 0) // Si no es el n-ésimo elemento, agrégalo.
%             {
%                 result.Add(list[i]);
%             }
%         }
%         
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f', 'g' };
%         int n = 3; // Eliminar cada 3er elemento.
%         var listaModificada = Drop(lista, n);
% 
%         Console.WriteLine("Lista después de eliminar cada n-ésimo elemento: " + string.Join(", ", listaModificada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado drop(List, N, Result) que elimina cada n-ésimo
% elemento de una lista, almacenando el resultado en Result.

% Inicializa el contador en N.
drop(L, N, R) :- drop(L, N, N, R).

% Caso base: cuando la lista está vacía, el resultado es vacío.
drop([], _, _, []).

% Si el contador llega a 1, omite el primer elemento y reinicia el contador.
drop([_|T], 1, N, R) :- 
    drop(T, N, N, R).

% Caso recursivo: disminuye el contador y conserva el elemento.
drop([H|T], K, N, [H|R]) :- 
    K > 1, 
    K1 is K - 1, 
    drop(T, K1, N, R).

% Ejemplo de uso:
% ?- drop([a, b, c, d, e, f, g], 3, R).
% R = [a, b, d, e, g].
% ----------------------------------------------
