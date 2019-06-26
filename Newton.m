function mainfunc()
Newtonn(20,54)
end
function [x] = Newtonn(a,b)
k = 1;
nmax=10000
tol=10^(-6)
x=1;
x(1)=x-(f(a,b,x)/df(a,x))
if(f(a,b,x)~=0)
    dist(1)=abs(x(1)-x)
    k=2;
    while(dist(k-1)>tol)
        x(k)=x(k-1) - (f(a,b,x(k-1))/df(a,x))
        dist(k)=abs(x(k)-x(k-1))
        k=k+1
    end
    fprintf("The number of iterations was %d for a value of %d",k,x(k-1));
else
    fprintf("No iterations needed, with an x value of %d",x);
end
end
function [f] = f(a,b,x)
f= x*tanh(a*x)-b;
end
function [df] = df(a,x)
df= tanh(a*x) + a*x*sech(a*x)^2;
end