%{ 
luDecomp.m provides a standalone function for transforming a system Ax = b
into an upper triangular form.
%}

function [L, U, y] = luDecomp(A, b)
% [L, U, y] = luDecomp(A, b) Returns the lower L and upper U triangular matrix
% factorization of A alongside the vector y corresponding to the Ux = y.
% Requires: Diagonal elements of A are non-zero
% Runtime: O(n^3)
n = length(A);
L = eye(n, n);
U = A;
y = b;
for lock=1:n-1
    for row = lock+1:n
        mult = U(row, lock)/U(lock, lock); % Common row factor
        U(row,lock) = 0;
        for col=lock+1:n
            U(row, col) = U(row, col) - mult*U(lock, col);
        end
        L(row,lock) = mult;            
        y(row) = y(row) - mult*y(lock); 
    end
end