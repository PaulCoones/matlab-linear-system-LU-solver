%{ 
backSolve.m provides a standalone function for computing the solution
to Ax = b, using the backward solve algorithm.
Unnecessary to luGelim.m but provided for learning purposes.
%}

function x = backSolve(A, b) 
% x = backSolve(A, b) Returns the solution to the matrix equation Ax = b
% Requires: A is a square upper-triangular matrix
%           A is non-zero along any diagonal elements
% Runtime: O(n^2)
n = length(b);
x = b; % Why set x = b, we continually modify x to do the iteration                
for row = n:-1:1 % Recall we are solving backwards for a_nn x_n = b_n first!
    for col = row+1:1:n
        x(row) = x(row) - A(row,col)*x(col);
    end
    x(row) = x(row) / A(row, row); % Avoids (n - row) unnecessary divisions
end
