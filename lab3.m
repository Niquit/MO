%METODA GRADIENTU PROSTEGO
clc
clear

f=@(x,y) 2*x.^2+y.^2+x.*y-6.*x-5.*y+8;

a=0.2;
h=0.01;
e=0.01;

x=-4.4;
y=-4.4;

k=0;

matrix=[];

hold on;
title('METODA GRADIENTU PROSTEGO');

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
        break
    else
        matrix=[matrix;[x y]];
        plot(x,y,'.');
    end;
end;

plot(matrix(:,1),matrix(:,2),'-');

[X,Y]=meshgrid(-5:.1:5, -5:.1:5);
Z=f(X,Y);
contour(X,Y,Z,20);
