clc;
% Giai phuong trinh phi tuyen bang phuong phap lap Newton.
% Cac tham so nhap vao gom ham g(x), khoang cach ly nghiem, do chinh xac
% va gia tri khoi tao.
% Truoc tien, kiem tra su hoi tu cua ham. Neu hoi tu thi tiep tuc giai, con
% ko thi dung va thong bao ra man hinh.
syms x
f = input('Nhap ham so f(x) = ');
fx = inline(f);
disp('Nhap khoang cach ly nghiem [a,b]:');
a = input('a = ');
b = input('b = ');
accuracy = input('Nhap do chinh xac mong muon:');

% Tinh dao ham cap 1 va cap 2 cua f(x)
df = diff(f);
df2 = diff(df);

% Xay dung g(x)
g = x - f/df;    % g(x) = x - (f(x)/df(x))
dg = diff(g);
dg = inline(dg);
g = inline(g);

% Tinh he so co q
if dg((a+b)/2) < 0
    q = abs(dg(a));
else
    q = abs(dg(b));
end
fprintf('he so co q = %d\n', q);

df = inline(df);
df2 = inline(df2);

% Kiem tra tinh hoi tu
if q > 1
    disp('Ham g(x) khong hoi tu.');
else
    % Chon x0
    d = (a+b)/2;
    if df(d)*df2(d) > 0
        x0 = b;
    else
        x0 = a;
    end
    
    % Tinh m
    if abs(df(a)) < abs(df(b))
        m = abs(df(a));
    else
        m = abs(df(b));
    end
    
    % Lap
    x1 = g(x0);
    dx = abs(fx(x1))/m;
    x0 = x1;
    while dx > accuracy
       x1 = g(x0);
       dx = abs(fx(x1))/m;
       x0 = x1;
    end
    
    % Thong bao ra man hinh
    fprintf('Phuong trinh co nghiem trong khoang cach ly nghiem la: %d\n', x0);
end













