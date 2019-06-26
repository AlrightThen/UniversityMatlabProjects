clear all
close all
clc

a=-2;
b=2;
n=200;
h=(b-a)/n; %spatial step
k=0.00005; %time step
x=(a:h:b)';
f=10*exp(-x.^2);
alpha=2.5;
u0=22*ones(n+1,1);
maxT=2/k;

%Initialise old solution u and new solution unew
u=zeros(n+1,1);
unew=zeros(n+1,1);

u=u0; %Initial condition
for m=1:maxT
    for i=2:n
        unew(i)=u(i)+alpha*k/h^2*(u(i-1)-2*u(i)+u(i+1))+f(i)*k;
    end
    unew(1)=22; %Dirichlet boundary condition
    unew(n+1)=unew(n); %Neumann boundary condition
    plot(x,unew);
    xlim([-2 2]);
    ylim([0 100]);
    title(['time: ',num2str(m*k),' seconds'])
    drawnow;
    u=unew;
end
