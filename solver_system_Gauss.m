clc;

% Giai he phuong trinh tuyen tinh dang Ax=b bang phuong phap khu Gauss
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

G = [A b];
shapeG = size(G);

% Qua trinh khu Gauss
for pivot = 1 : shapeG(1)
    for row = pivot+1 : shapeG(1)
        G(row,:) = G(row,:)*G(pivot,pivot) - G(pivot,:)*G(row,pivot);
    end
end

% Giai nghiem
if (G(shapeA(1),shapeA(2)) == 0) && (G(shapeG(1),shapeG(2)) ~= 0) 
    disp('He phuong trinh vo nghiem.');
else
    pivot = shapeA(1);
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
end
















