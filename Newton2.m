function mainThing()
Newton(30,10)
Newton(1.4,0.3)
end
function x = Newton(a,b)
maxIter = 1000;
x = 1;
tol = 10^(-6);
for n=1:maxIter
    f = x*tanh(a*x)-b;
    f_dash = tanh(a*x);
    x_n = x - (f/f_dash);
    if(x_n-x>=tol)
        x=x_n;
    else
        x=x_n;
        fprintf('Number of iterations was %d\n',n);
        break
    end
end
end