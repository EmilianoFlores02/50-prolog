% ===============================================
% Autor: Emiliano Rafael Flores Ramirez
% Fecha: 23 de octubre de 2024 
% Descripción: Programa en Prolog que extrae N números 
%              aleatorios de un rango dado utilizando la 
%              función range para generar la lista de números.
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
%     // Función que genera una lista con los números en un rango dado.
%     static List<int> Range(int start, int end)
%     {
%         List<int> result = new List<int>();
%         for (int i = start; i <= end; i++)
%         {
%             result.Add(i);
%         }
%         return result;
%     }
% 
%     // Función para seleccionar N números aleatorios de un rango.
%     static List<int> Lotto(int N, int M)
%     {
%         List<int> rangeList = Range(1, M);  // Genera la lista de números.
%         return RndSelect(rangeList, N);     // Selecciona N números aleatorios.
%     }
% 
%     // Función para seleccionar N elementos aleatorios de una lista (misma que en el ejemplo anterior).
%     static List<T> RndSelect<T>(List<T> list, int n)
%     {
%         if (n <= 0 || list.Count == 0)
%             return new List<T>();
% 
%         List<T> result = new List<T>();
%         List<T> tempList = new List<T>(list);
% 
%         for (int i = 0; i < n; i++)
%         {
%             int index = rand.Next(0, tempList.Count);
%             result.Add(tempList[index]);
%             tempList.RemoveAt(index);
%         }
% 
%         return result;
%     }
% 
%     static void Main()
%     {
%         int N = 6; // Número de elementos a seleccionar.
%         int M = 49; // Rango de números (1 a M).
% 
%         List<int> seleccionados = Lotto(N, M);
%         Console.WriteLine("Números seleccionados: " + string.Join(", ", seleccionados));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado lotto(N, M, L) que extrae N números aleatorios 
% del rango 1 a M, utilizando la función range para generar la lista de números.

% Utiliza la función range para generar una lista con los números del 1 al M
% y luego selecciona N elementos aleatorios usando rnd_select.
lotto(N, M, L) :- 
    range(1, M, R),     % Genera la lista de números del 1 al M.
    rnd_select(R, N, L). % Selecciona N elementos aleatorios de la lista.

% Ejemplo de uso:
% ?- lotto(6, 49, L).
% L = [23, 17, 1, 42, 5, 36].
% ----------------------------------------------
