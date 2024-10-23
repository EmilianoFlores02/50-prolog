% ===============================================
% Autor: Emiliano Flores
% Fecha: 23 de octubre de 2024
% Descripción: Programa en Prolog que calcula 
%              el máximo común divisor (MCD) 
%              de dos números enteros usando 
%              el algoritmo de Euclides.
% ===============================================

% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).
