function [ L, U ] = PLU(A)
% PLU is a function that decomposites square matrix A into product of two
% triangle matrices L and U

    % Get and check size of A
    m = size(A);
    if m(1) ~= m(2)
        disp('Matrix A must be a square matrix.');
        return;
    end
    n = m(1);
    
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

