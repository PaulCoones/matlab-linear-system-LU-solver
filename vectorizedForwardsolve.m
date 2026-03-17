%{ 
vectorizedForwardsolve.m provides a vertorized standalone function for 
computing the solution to Ax = b, using the forward solve algorithm.
%}

function x = vectorizedForwardsolve(A, b) 
% x = vectorForwardSolve(A, b) Returns the solution to the matrix equation 
% Ax = b, ensuring vectorization is used for efficiency.
% Requires: A is a square lower-triangular matrix
%           A is non-zero along any diagonal elements
n = length(b);
x = b; % Matches shape on b(n) whether input is col or row-wise
for k = 1:1:n
    % Derived from the general expression for solving row x(k)
    % A(i,i) x(i) = b(i) - (\sum_{j=i}^{i-1} A(i,j) * x(j))
    x(k) = ( b(k) - dot(A(k,1:k-1), x(1:k-1)) ) / A(k,k);
end