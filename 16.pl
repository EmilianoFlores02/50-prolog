% ===============================================
% Autor: Emiliano Rafael Flores Ramirez 
% Fecha: 23 de octubre de 2024 
% Descripción: Programa en Prolog que extrae un 
%              número dado de elementos aleatorios de una lista.
%              Utiliza un generador de números aleatorios.
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
%     // Función para seleccionar N elementos aleatorios de una lista.
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
%             int index = rand.Next(0, tempList.Count); // Índice aleatorio.
%             result.Add(tempList[index]);  // Agrega el elemento seleccionado.
%             tempList.RemoveAt(index);     // Elimina el elemento para evitar repetición.
%         }
% 
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
%         int n = 3; // Número de elementos aleatorios a seleccionar.
%         List<char> seleccionados = RndSelect(lista, n);
% 
%         Console.WriteLine("Elementos seleccionados: " + string.Join(", ", seleccionados));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado rnd_select(L, N, R) que extrae N elementos 
% aleatorios de la lista L.

% Caso base: cuando N es 0, no se selecciona ningún elemento.
rnd_select(_, 0, []).

% Caso recursivo: selecciona un elemento aleatorio, lo elimina de la lista y sigue seleccionando.
rnd_select(L, N, [X|R]) :- 
    length(L, Len),             % Obtiene la longitud de la lista.
    random(1, Len, I),          % Genera un índice aleatorio entre 1 y Len.
    element_at(X, L, I),        % Obtiene el elemento en la posición I.
    delete(L, X, L1),           % Elimina el elemento seleccionado de la lista original.
    N1 is N - 1,                % Decrementa N.
    rnd_select(L1, N1, R).      % Llama recursivamente para seleccionar el siguiente elemento.

% Ejemplo de uso:
% ?- rnd_select([a, b, c, d, e], 3, R).
% R = [d, a, c].
% ----------------------------------------------
