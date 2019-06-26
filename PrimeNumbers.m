function prime = PrimeNumbers(N)
prime=[];
if(floor(N)~=N || N <= 0)
    disp('Error, N is not a positive integer')
else
    for n=1:N
        isPrime=0;
        for m=2:n
            if(rem(n,m)==0&&m~=n)
                isPrime=1;
                break
            end
        end
        if(isPrime==0)
            prime = [prime, n];
        end
    end
end