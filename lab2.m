%METODA SPADKU WZGLĘDEM WSPÓŁRZĘDNYCH
clc
clear

z = @(x,y) 2*x.^2+y.^2+x.*y-6.*x-5.*y+8;

x(1) = 4.4;
y(1) = 4.4;
a = 0.2;
i = 1;
MIN = z(x(i),y(i));

while true
    coordinates = [x(i) y(i)-a; x(i) y(i)+a; x(i)-a y(i); x(i)+a y(i)];
    point = [z(coordinates(1),coordinates(5)) z(coordinates(2),coordinates(6)) z(coordinates(3),coordinates(7))...
          z(coordinates(4),coordinates(8))];
    minid = min(find(point==min(point)));
    i=i+1;
    x(i) = coordinates(minid);
    y(i) = coordinates(minid+4);
    m = MIN;
    MIN = point(minid);
    
    if (m < MIN)
        break
    end
end

[X Y] = meshgrid(-5:a:5,-5:a:5);
subplot(221);
plot(x,y);
title('METODA SPADKU WZGLĘDEM WSPÓŁRZĘDNYCH');
hold on;
Z = z(X,Y);
contour(X,Y,Z,20);

%METODA GAUSSA-SEIDLE'A

z = @(x,y) 2*x.^2+y.^2+x.*y-6.*x-5.*y+8;

e = 0.01;
x0 = 4.4;
y0 = 4.4;
x = x0;
y = y0;

[X, Y] = meshgrid(-5:a:5,-5:a:5);
subplot(222);
title('METODA GAUSSA-SEIDLEA');
hold on;
Z = z(X,Y);
contour(X,Y,Z,20);

while true
    point_x = x;
    point_y = y;

    x = p(y);
    
    line([point_x x] , [y y]);
    
    y = p(x);
    
    line([x x] , [point_y y]);

    if (sqrt((x - point_x).^2 + (y - point_y).^2) < e)
        break;
    end
end

%METODA GRADIENTU PROSTEGO
clc
clear

f=@(x,y) 2*x.^2+y.^2+x.*y-6.*x-5.*y+8;

a=0.2;
h=0.01;
e=0.01;

x=4.4;
y=4.4;

k=0;

matrix=[];

subplot(313);
title('METODA GRADIENTU PROSTEGO');
hold on;

while true
    k=k+1;
    
    xk=x;
    yk=y;
    zk=f(x,y);

    derivative_point_x=(f(x+h,y)-f(x-h,y))/(2*h);
    derivative_point_y=(f(x,y+h)-f(x,y-h))/(2*h);
    lenght=sqrt(derivative_point_x^2+derivative_point_y^2);

    x=x-a*(f(x+h,y)-f(x-h,y))/(2*h)/lenght;
    y=y-a*(f(x,y+h)-f(x,y-h))/(2*h)/lenght;
    z=f(x,y);
    
    if (z>zk)
        a=a/2;
    end

    arg1=[xk;yk];
    arg0=[x;y];

    if (a<h) || ((abs(x-xk) <h) && (abs(y-yk) <h) && (abs(z-zk) < h)) || (k>100)
        break;
    else
        matrix=[matrix;[x y]];
        plot(x,y,'.');
    end;
end;

plot(matrix(:,1),matrix(:,2),'-');

[X,Y]=meshgrid(-5:.1:5, -5:.1:5);
Z=f(X,Y);
contour(X,Y,Z,20);