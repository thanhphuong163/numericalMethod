clc;
% Giai phuong trinh phi tuyen bang phuong phap lap don
% Cac tham so nhap vao gom ham f(x), khoang cach ly nghiem va do chinh xac
syms x
func = input('Nhap ham so f(x) = ');
f = inline(func);
disp('Nhap khoang cach ly nghiem [a,b]:');
a = input('a = ');
b = input('b = ');
accuracy = input('Nhap do chinh xac mong muon:');














