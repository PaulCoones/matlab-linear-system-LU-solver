%{ 
forwardSolve.m provides a standalone function for computing the solution
to Ax = b, using the forward solve algorithm.
%}

function x = forwardSolve(A, b) 
% x = forwardSolve(A, b) Returns the solution to the matrix equation Ax = b
% Requires: A is a square upper-triangular matrix
%           A is non-zero along any diagonal elements
% Runtime: O(n^2)
n = length(b);
x = b; % Why set x = b, we continually modify x to do the iteration          
for row = 1:1:n    
    for col = 1:1:row-1
        x(row) = x(row) - A(row,col)*x(col); 
    end
    x(row) = x(row) / A(row, row); % Avoids (n - row) unnecessary divisions
end
