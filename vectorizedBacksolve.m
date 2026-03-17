%{ 
vectorizedBacksolve.m provides a vectorized standalone function for 
computing the solution to Ax = b, using the backward solve algorithm.
%}

function x = vectorizedBacksolve(A, b) 
% x = vectorBacksolve(A, b) Returns the solution to the matrix equation 
% Ax = b, ensuring vectorization is used for efficiency.
% Requires: A is a square upper-triangular matrix
%           A is non-zero along any diagonal elements
n = length(b);
x = b; % Matches shape on b(n) whether input is col or row-wise
for k = n:-1:1
    % Derived from the general expression for solving row x(k)
    % A(i,i) x(i) = b(i) - (\sum_{j=i+1}^{n} A(i,j) * x(j))
    x(k) = ( b(k) - dot(A(k,k+1:n), x(k+1:n)) ) / A(k,k);
end