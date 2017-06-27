clc;
% Giai phuong trinh phi tuyen bang phuong phap chia doi
% Cac tham so nhap vao gom ham f(x), khoang cach ly nghiem va do chinh xac
syms x
func = input('Nhap ham so f(x) = ');
f = inline(func);
disp('Nhap khoang cach ly nghiem [a,b]:');
a = input('a = ');
b = input('b = ');
accuracy = input('Nhap do chinh xac mong muon:');

if f(a)*f(b) > 0
    disp('Phuong trinh co the khong co nghiem trong khoang cach ly nghiem.')
else
    dx = b-a;
    while dx > accuracy
        x = (a+b)/2;
        dx = dx/2;
        if f(x) ~= 0
            if f(a)*f(x) < 0
                b = x;
            else
                a = x;
            end
        else
            break;
        end
    end
    fprintf('Phuong trinh co nghiem trong khoang cach ly nghiem la: %d\n', x);
end












