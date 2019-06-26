clear all
close all
clc

a=-2;
b=2;
c=-2;
d=2;
n=20;
h=(b-a)/n;
k=0.02;

x=a:h:b;
y=c:h:d;

for i=1:n+1
    for j=1:n+1
        u0(i,j)=22+10*exp(-100*((x(i)-1)^2+(y(j)^2))); %initial condition
        f(i,j)=exp(-(x(i)^2+y(j)^2));
        alpha(i,j)=0.2+0.1*sin(x(i))*sin(y(j));
        cx(i,j)=-y(j)/(1e-2+sqrt(x(i)^2+y(j)^2));
        cy(i,j)=x(i)/(1e-2+sqrt(x(i)^2+y(j)^2));
    end
end
u=u0;
unew=u0;
for m=1:(30/k)
    for i=2:n
        for j=2:n
            alphaL=(alpha(i-1,j)+alpha(i,j))/2;
            alphaR=(alpha(i+1,j)+alpha(i,j))/2;
            alphaB=(alpha(i,j-1)+alpha(i,j))/2;
            alphaT=(alpha(i,j+1)+alpha(i,j))/2;
            unew(i,j)=u(i,j)+k/h^2*(alphaR*u(i+1,j)+alphaL*u(i-1,j)+alphaB*u(i,j-1)...
                +alphaT*u(i,j+1)-(alphaL+alphaR+alphaB+alphaT)*u(i,j))+f(i,j)*k...
                -cx(i,j)*k*(u(i+1,j)-u(i-1,j))/(2*h)-cy(i,j)*k*(u(i,j+1)-u(i,j-1))/(2*h);
        end
    end
    for j=2:n
        unew(1,j)=22;
        unew(n+1,j)=22;
    end
    for i=2:n
        unew(i,1)=22;
        unew(i,n+1)=22;
    end
    surf(x,y,unew);
    title(["time: ",num2str(m*k)," seconds"])
    shading interp;
    zlim([21,40])
    drawnow
    pause(0.0005)
    u=unew;
end