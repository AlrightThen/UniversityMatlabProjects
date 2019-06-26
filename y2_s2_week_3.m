clear all
close all
clc

clear all
close all
clc

a=-2;
b=2;
c=-2;
d=2;
n=40;
h=(b-a)/n; %spatial step
k=0.005; %time step
alpha=0.25; %thermal conductivity
maxT=30/k;

x=a:h:b;
y=c:h:d;

for i=1:n+1
    for j=1:n+1
        u0(i,j)=22; %initial condition
        f(i,j)=exp(-x(i)^2-y(j)^2); %source term
    end
end
u=u0;
unew=u0;
for m=1:maxT
for i=2:n
    for j=2:n
        unew(i,j)=u(i,j)+alpha*k/h^2*(u(i+1,j)+u(i-1,j)+u(i,j-1)+u(i,j+1)-4*u(i,j))+f(i,j)*k;
    end
end
for j=2:n
    unew(1,j)=unew(2,j);      %left boundary
    unew(n+1,j)=22;    %right boundary
end
for i=2:n
    unew(i,1)=22;      %bottom boundary
    unew(i,n+1)=unew(i,n);    %top boundary 
end
surf(x,y,unew);
title(['time: ',num2str(m*k),' seconds'])
shading interp;
zlim([21 40])
drawnow
pause(0.005)
u=unew;
end


        
        
        