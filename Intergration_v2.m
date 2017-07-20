function [ I, n ] = Intergration_v2( f, err, a, b )
% INTERGRATION_V2 la ham tinh gan dung tich phan cua mot ham lien tuc tren
% [a,b]
% Cac tham so dau vao cua ham gom:
%    f : Ham duoi dau tich phan
%    err : Sai so cho truoc de tinh n
%    a : Can duoi
%    b : Can tren
% Ket qua tra ve gom:
%    I : Gia tri gan dung cua tich phan
%    n : So khoang duoc chia ra de tinh
    % Kiem tra tham so dau vao
    if nargin < 4
        disp('Khong du so luong tham so.')
        return
    end

    % Tinh M4
    d4f = diff(f,4);
    D4f = inline(d4f);
    
    d = (b-a)/1000; % Chia khoang [a,b] nho ra de tinh cuc tri
    v = [];
    v = [v a];
    for i = 1:1000
        v = [v i*d];
    end
    % Tim max cua tri tuyet doi cua dao ham cap 4 cua f(x)
    M4 = abs(D4f(v(1)));
    for i = 2:1001
        if M4 < abs(D4f(v(i)))
            M4 = abs(D4f(v(i)));
        end
    end
    
    % Tinh n dua vao err va M4
    n4 = (M4*(b-a)^5)/(180*err);
    % Ham floor de lam tron xuong
    n = floor(nthroot(n4, 4));
    
     % Tinh h
    h = (b-a)/n;
    
    % Xay dung x
    x = [];
    x = [x a];
    for i = 1:n
        xbar = a + i*h;
        x = [x xbar];
    end
    
    % Xay dung x'
    x_ = [];
    for i = 1:n
        x_bar = (2*i-1)*(h/2);
        x_ = [x_ x_bar];
    end
    
    % Tinh y voi x tuong ung
    F = inline(f);
    y = [];
    for i = 1:n+1
        ybar = F(x(i));
        y = [y ybar];
    end
    % Tinh y' voi x' tuong ung
    y_ = [];
    for i = 1:n
        y_bar = F(x_(i));
        y_ = [y_ y_bar];
    end
    
    % Tinh tich phan I
    I = 0;
    for i = 1:n
        I = I + (h/6)*(y(i) + 4*y_(i) + y(i+1));
    end


end

