%METODA POŁOWIENIA
a = 0;
b = 6;
e = 0.00001;
L = b - a;

f = @(x) x.^3+x.^2-20*x;
i = 0;

while abs (L) > e
    i = i + 1;

    xm = (a + b) / 2;
    x1 = a + 0.25 * L;
    x2 = b - 0.25 * L;

    ym = f(xm);
    y1 = f(x1);
    y2 = f(x2);

    if ym > y1
        b = xm;
    elseif ym > y2
        a = xm;
    else
        a = x1;
        b = x2;
    end
    L = b - a;
end

disp (['Metoda połowienia minimum(',num2str(i),'): ', num2str( (a + b) /2 )]);

clear

%METODA ZŁOTEGO PODZIAŁU
a = 0;
b = 6;
e = 0.00001;
L = b - a;

f = @(x) x.^3+x.^2-20*x;
i = 0;

while abs (L) > e
    i = i + 1;

    x1= a + 0.382 * L;
    x2= a + 0.618 * L;

    y1=f(x1);
    y2=f(x2);

    if y1 > y2
        a = x1;
    else
        b = x2;
    end
    L = b - a;
end

disp (['Metoda złotego podziału(',num2str(i),'): ', num2str( (a + b) /2 )]);

clear

%METODA NEWTONA
a = 0;
b = 6;
e = 0.0001;
L = b - a;

f = @(x) x.^3+x.^2-20*x;
i = 0;

h = 0.005;
xn = 0;
x = a;

while true
    i = i + 1;
    x1 = x + h;
    x2 = x - h;
    fx1 = f(x1);
    fx2 = f(x2);
    fx=f(x);

    xn = x - ( ((fx1- fx2) / ( 2 * h )) / (( fx1 - 2 * fx + fx2 ) / h^2 ));

    if abs(xn - x) < e
       break
    end

    x = xn;
end

disp (['Metoda Newtona(',num2str(i),'): ', num2str(xn)]);
