for i=1:50
    for j=1:50
        A0(i,j)=10;
    end
end
n=49;
alpha(i,j)=0.01*i+0.01*j;
delta2=0.3;
gamma(i,j)=0.1*i+0.2*j; 
k=5;
h=1; 

A=A0;
Anew=A0;
S(i,j)=65%4*i+3*j; %temporary constant value until I have inputs
R(i,j)=10%5*i+2*j; %temporary constant value until I have inputs

for t=1:100
    for i=2:n
        for j=2:n
            Anew(i,j)=A(i,j)+k*(alpha(i,j)*S(i,j)*A(i,j) ...
                +delta2*((A(i-1,j)-2*A(i,j)+A(i+1,j))+A(i,j-1)-2*A(i,j)+A(i,j+1))/h^2 ...
                +gamma(i,j)*R(i,j)*A(i,j));
        end
    end
    A=Anew;
end
