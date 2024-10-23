% ===============================================
% Autor: Emiliano Rafael Flores ramirez
% Fecha: 21 de octubre de 2024 
% Descripción: Programa en Prolog que genera una permutación 
%              aleatoria de los elementos de una lista.
%              Utiliza selección aleatoria para construir la permutación.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     static Random rand = new Random();
% 
%     // Función para generar una permutación aleatoria de una lista.
%     static List<T> RndPermu<T>(List<T> list)
%     {
%         return RndSelect(list, list.Count);  // Selecciona aleatoriamente todos los elementos de la lista.
%     }
% 
%     // Función para seleccionar N elementos aleatorios de una lista (misma que en ejemplos anteriores).
%     static List<T> RndSelect<T>(List<T> list, int n)
%     {
%         if (n <= 0 || list.Count == 0)
%             return new List<T>();
% 
%         List<T> result = new List<T>();
%         List<T> tempList = new List<T>(list);  // Copia de la lista original.
% 
%         for (int i = 0; i < n; i++)
%         {
%             int index = rand.Next(0, tempList.Count);  // Índice aleatorio.
%             result.Add(tempList[index]);               // Agrega el elemento seleccionado.
%             tempList.RemoveAt(index);                  // Elimina el elemento seleccionado.
%         }
% 
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
%         List<char> permutacion = RndPermu(lista);
% 
%         Console.WriteLine("Permutación aleatoria: " + string.Join(", ", permutacion));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado rnd_permu(L, P) que genera una permutación 
% aleatoria de los elementos de la lista L.

% Utiliza rnd_select para seleccionar todos los elementos de la lista
% de forma aleatoria, generando así una permutación.
rnd_permu(L, P) :- 
    length(L, Len),          % Obtiene la longitud de la lista.
    rnd_select(L, Len, P).   % Selecciona todos los elementos de forma aleatoria.

% Ejemplo de uso:
% ?- rnd_permu([a, b, c, d, e], P).
% P = [b, e, a, d, c].
% ----------------------------------------------
