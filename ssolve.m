function x = ssolve(a,b,c,d,n)
A = zeros(n,n);
for i = 1:n
    for j = 1:n
        if(rem((i+j),2)==0)
            A(i,j)=a;
        else
            A(i,j)=b;
        end
    end
end
A=A;
B=zeros(n,1);
for i = 1:n
    if(rem(i,2)==0)
        B(i,1)=d;
    else
        B(i,1)=c;
    end
end
B=B;
inv(A);
x=inv(A)*B;
