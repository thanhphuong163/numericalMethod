function [ L, U, P] = PLU( A )
% PLU is a function that decomposites square matrix A into product of two
% triangle matrices L and U with exchange. PA = LU

    % Get and check size of A
    m = size(A);
    if m(1) ~= m(2)
        disp('Matrix A must be a square matrix.');
        return;
    end
    n = m(1);
    
    % Doublicate A
    A_ = A;
    
    % Build P
    v = ones(1,n);
    P = diag(v);
    for j = 1:n-1
        % Create diagonal matrices
        E = diag(v);
        P_ = diag(v);
        % Find max in jth col to pick pivot
        max = j;
        for i = j+1:n
            if abs(A(i,j)) > abs(A(max,j))
                max = i;
            end
        end
        % Swap jth row and maxth row
        temp = P_(j,:);
        P_(j,:) = P_(max,:);
        P_(max,:) = temp;
        A = P_*A;
        P = P_*P;
        for i = j+1:n
            E(i,j) = -A(i,j)/A(j,j);
        end
        A = E*A;
    end

    % Build U
    U = A;
    
    % Build L
    A = P*A_;
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
end

