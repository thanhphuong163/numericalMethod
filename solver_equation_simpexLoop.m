clc;
% Giai phuong trinh phi tuyen bang phuong phap lap don.
% Cac tham so nhap vao gom ham g(x), khoang cach ly nghiem, do chinh xac
% va gia tri khoi tao.
% Truoc tien, kiem tra su hoi tu cua ham. Neu hoi tu thi tiep tuc giai, con
% ko thi dung va thong bao ra man hinh.
syms x
func = input('Nhap ham so g(x) = ');
g = inline(func);
disp('Nhap khoang cach ly nghiem [a,b]:');
a = input('a = ');
b = input('b = ');
accuracy = input('Nhap do chinh xac mong muon:');

dg = diff(func);
dg = inline(dg);
if dg((a+b)/2) < 0
    q = dg(a);
else
    q = dg(b);
end

if abs(q) >= 1
    disp('Ham g(x) khong hoi tu.');
else
    x0 = input('Nhap gia tri khoi dau x0 = ');
    dx = abs(g(x0) - x0);
    while dx > accuracy
        x1 = g(x0);
        dx = abs(g(x0) - x1);
        x0 = x1;
    end
    fprintf('Phuong trinh co nghiem trong khoang cach ly nghiem: x = %d\n',x0);
end












