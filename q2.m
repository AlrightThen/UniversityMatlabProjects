a(1)=1000;
for n = 1:1000
    if(rem(a(n),2)~=0)
        a(n+1)=3*a(n)+1;
    else
        a(n+1)=a(n)/2;
    end
    if(a(n)==1)
        break
    end
end

iterations = 1:1:length(a);
plot(iterations,a,'bd')

xlabel('Iteration')
ylabel('a_k')