n=1;
while(isequaln(~mod(n,4),0) || n <= 100000)
    n=n+1;
end
isequaln(mod(n,4),0) || n < 100000
fprintf('The required number is %d',n);