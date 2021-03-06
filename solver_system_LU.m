clc;

% Giai he phuong trinh tuyen tinh dang Ax=b bang phuong phap nhan tu LU
% Cac tham so nhap vao gom ma tran he so A va vector b
% Gia tri tra ve la nghiem cua he chinh la vector x

A = input('Nhap ma tran he so A = ');
shapeA = size(A);
while shapeA(1) ~= shapeA(2)
    disp('Ma tran he so A phai la ma tran vuong.');
    A = input('Nhap ma tran he so A = ');
    shapeA = size(A);
end

b = input('Nhap vector b = ');
shape_b = size(b);
while shape_b(1) ~= shapeA(1)
    disp('Vector b phai cung so hang voi ma tran A.');
    b = input('Nhap vector b = ');
    shape_b = size(b);
end

% Xay dung L va U
L = zeros(shapeA(1));
U = zeros(shapeA(1));

for i = 1:shapeA(1)
    L(i,i) = 1;
end

U(1,:) = A(1,:);
L(2:end, 1) = A(2:end,1) / U(1,1);

indexU = 2;
while indexU <= shapeA(1)
    % Tinh U(indexU,j)
    for j = indexU:shapeA(1)
        sum = 0;
        for k = 1:indexU-1
            sum = sum + L(indexU,k)*U(k,j);
        end
        U(indexU,j) = A(indexU,j) - sum;
    end
    indexU = indexU + 1;
    
    if indexU > shapeA(1)
        break;
    end
    
    % Tinh L(indexU,j)
    for j = 2:indexU-1
        sum = 0;
        for k = 1:j-1
            sum = sum + L(indexU,k)*U(k,j);
        end
        L(indexU,j) = (A(indexU,j) - sum) / U(indexU-1,indexU-1);
    end
end

% Giai Ly=b
G = [L b];
shapeG = size(G);
% Qua trinh khu Gauss
for pivot = 1 : shapeG(1)
    for row = pivot+1 : shapeG(1)
        G(row,:) = G(row,:)*G(pivot,pivot) - G(pivot,:)*G(row,pivot);
    end
end
% Giai y
y = [];
for i = 1:shapeA(1)
    y0 = G(i,shapeG(2)) / G(i,i);
    y = [y y0];
end
y = y';
%Giai Ux=y
G = [U y];
shapeG = size(G);
% Qua trinh khu Jordan
while pivot >= 1
    row = pivot-1;
    while row >= 1
        G(row,:) = G(row,:)*G(pivot,pivot) - G(pivot,:)*G(row,pivot);
        row = row-1;
    end
    pivot = pivot-1;
end
    
x = [];
for i = 1:shapeA(1)
    x0 = G(i,shapeG(2)) / G(i,i);
    x = [x x0];
end

fprintf('He co nghiem x =\n');
fprintf('%f\n', x);














