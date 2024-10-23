% ===============================================
% Autor: Emiliano Rafael Flores Ramirez 
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que verifica 
%              si una lista es un palíndromo.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para verificar si una lista es un palíndromo en C#.
%     static bool IsPalindrome<T>(List<T> list)
%     {
%         if (list == null)
%             throw new ArgumentException("La lista no puede ser nula.");
%         
%         List<T> reversedList = new List<T>(list);
%         reversedList.Reverse(); // Invierte la lista.
%         
%         // Verifica si la lista original es igual a la lista invertida.
%         return list.SequenceEqual(reversedList);
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'b', 'a' };
%         bool esPalindromo = IsPalindrome(lista);
% 
%         Console.WriteLine("¿Es un palíndromo?: " + esPalindromo);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado palindrome(List) que verifica si la lista
% es un palíndromo.

% Una lista es un palíndromo si es igual a su inversa.
palindrome(L) :- reverse_list(L, L).

% Predicado auxiliar reverse_list para invertir la lista.
reverse_list(L, R) :- reverse_list(L, [], R).
reverse_list([], Acc, Acc).
reverse_list([H|T], Acc, R) :- reverse_list(T, [H|Acc], R).

% Ejemplo de uso:
% ?- palindrome([a, b, c, b, a]).
% true.
% ----------------------------------------------
