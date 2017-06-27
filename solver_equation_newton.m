clc;
% Giai phuong trinh phi tuyen bang phuong phap lap Newton.
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
