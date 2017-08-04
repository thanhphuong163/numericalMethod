function [ L, U ] = LU(A)
% LU is a function that decomposites square matrix A into product of two
% triangle matrices L and U without exchange.

    % Get and check size of A
    sizeA = size(A);
    n = sizeA(1);
    m = sizeA(2);
    
    % Build L
    v = ones(1,n);
    L = diag(v);
    for j = 1:n-1
        % Create a diagonal matrix
        E = diag(v);
        for i = j+1:n
            E(i,j) = -A(i,j)/A(j,j);
        end
        L = L*inv(E);
        A = E*A;
    end

    %Build U
    U = A;
end

