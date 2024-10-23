% ===============================================
% Autor: Emiliano Rafael Flores Ramirez 
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que rota una lista 
%              N lugares a la izquierda.
%              Se maneja la rotación cuando N es mayor 
%              que la longitud de la lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para rotar una lista N lugares a la izquierda.
%     static List<T> Rotate<T>(List<T> list, int n)
%     {
%         int len = list.Count;
%         if (len == 0) return new List<T>(list); // Maneja lista vacía.

%         n = n % len; // Ajusta N cuando es mayor que la longitud de la lista.

%         List<T> part1 = list.GetRange(0, n);     // Primera parte: los primeros N elementos.
%         List<T> part2 = list.GetRange(n, len - n); // Segunda parte: el resto.

%         part2.AddRange(part1); // Junta las dos partes.
%         return part2;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f' };
%         int n = 2; // Número de posiciones a rotar.
%         var listaRotada = Rotate(lista, n);
% 
%         Console.WriteLine("Lista rotada: " + string.Join(", ", listaRotada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado rotate(List, N, Result) que rota una lista 
% N lugares a la izquierda.

% Utiliza la longitud de la lista para manejar rotaciones
% mayores que la longitud de la lista.
rotate(L, N, R) :- 
    length(L, Len),           % Calcula la longitud de la lista.
    N1 is N mod Len,          % Ajusta N para que sea menor que la longitud.
    split(L, N1, L1, L2),     % Divide la lista en dos partes.
    append(L2, L1, R).        % Junta la segunda parte seguida de la primera.

% Ejemplo de uso:
% ?- rotate([a, b, c, d, e, f], 2, R).
% R = [c, d, e, f, a, b].
% ----------------------------------------------
