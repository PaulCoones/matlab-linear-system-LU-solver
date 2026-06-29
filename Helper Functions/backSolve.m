%{ 
backSolve.m provides a standalone function for computing the solution
to Ux = b provided a upper triangular matrix U, through the backward solve 
algorithm.
%}

function x = backSolve(U, b) 
% x = backSolve(U, b) Returns the solution to the matrix equation Ux = b
% Requires: U is a square upper-triangular matrix
%           U is non-zero along any diagonal elements
% Runtime: O(n^2)
n = length(b);
x = b; % Why set x = b, we continually modify x to do the iteration                
for row = n:-1:1 % Recall we are solving backwards for u_nn x_n = b_n first!
    for col = row+1:1:n
        x(row) = x(row) - U(row,col)*x(col);
    end
    x(row) = x(row) / U(row, row); % Avoids (n - row) unnecessary divisions
end
