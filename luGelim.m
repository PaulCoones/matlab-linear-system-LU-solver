%{ 
luGelim.m provides a function for solving the linear system 
of equations Ax=b using LU decomposition without pivoting.
%}

function x = luGelim(A, b)
% x = luDecomp(A, b) Returns the solution to the linear system of equations
% Ax = b by LU decomposition.
% Requires: Diagonal elements of A are non-zero
% Runtime: O(n^3)
[~, U, y] = luDecomp(A, b);
x = backSolve(U, y);
end