n=80
h=1/n;
x=0:h:1; %0,0.25,0.5,0.75,1
A=zeros((n+1),(n+1));

A(1,1)=h^2;
A((n+1),(n+1))=h^2;
for i=2:n
    A(i,i-1)=1;
    A(i,i)=-2;
    A(i,i+1)=1;
end

A=A/h^2;

F=sin(x);
F(1)=2;
F(n+1)=5;
F=F';

u=A\F;

uexact=-sin(x)+x*(sin(1)+3)+2;
uexact=uexact';
e=abs(uexact-u);
max(e)