f(1)=600;
m(1)=600;
birth=0.6;
death=0.1;
k1=300;
k2=250;
k=k1+k2;
for n = 2:1000
    f(n) = f(n-1) + (birth)*(k1/(k1+f(n-1)))*f(n-1)-death*f(n-1);
    m(n) = m(n-1) + (birth)*(1-(k1/(k1+f(n-1))))*f(n-1)-death*m(n-1);
end
plot(f)
%ylim([3000 6000])
hold on
plot(m)
xlim([0 1000])
legend('Female population','Male population')