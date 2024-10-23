% ===============================================
% Autor: Emiliano Rafael Flores Ramirez 
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que invierte 
%              una lista usando un acumulador.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para invertir una lista en C#.
%     static List<T> ReverseList<T>(List<T> list)
%     {
%         if (list == null)
%             throw new ArgumentException("La lista no puede ser nula.");
%         
%         List<T> reversedList = new List<T>();
%         for (int i = list.Count - 1; i >= 0; i--)
%         {
%             reversedList.Add(list[i]); // Añade los elementos en orden inverso.
%         }
%         return reversedList;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         List<char> listaInvertida = ReverseList(lista);
% 
%         Console.WriteLine("La lista invertida es: " + string.Join(", ", listaInvertida));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado reverse_list(List, Reversed) que invierte
% la lista List y almacena el resultado en Reversed.

% Llama al predicado con un acumulador vacío.
reverse_list(L, R) :- reverse_list(L, [], R).

% Caso base: cuando la lista original está vacía, el acumulador contiene la lista invertida.
reverse_list([], Acc, Acc).

% Caso recursivo: mueve el elemento de la cabeza al acumulador.
reverse_list([Head|Tail], Acc, R) :- 
    reverse_list(Tail, [Head|Acc], R).

% Ejemplo de uso:
% ?- reverse_list([a, b, c, d], R).
% R = [d, c, b, a].
% ----------------------------------------------
