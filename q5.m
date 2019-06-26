approx=0;
pi_squared = round((pi^2)*10^5)/(10^5)
for n = 1:2000
    approx=approx+12*((-1)^(n+1)/n^2);
    rounded=round(approx*10^5)/(10^5);
    if(rounded==pi_squared)
        fprintf('%d = %d, %d iterations',rounded,pi_squared,n);
        break
    end
end
        