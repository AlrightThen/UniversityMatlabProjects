k(1)=0.95;
b(1)=0.2;
r1=0.1;
r2=0.001;
ni=0.33;
f1=0;
f2=0;
for n = 2:5000
    k(n) = k(n-1) + (r1*k(n-1))*(1-k(n-1))-(ni*b(n-1)*k(n-1))-(f1*r2*k(n-1));
    b(n) = b(n-1) + (r2*b(n-1))*(1-(b(n-1)/k(n-1)))-(f2*r2*b(n-1));
end
plot(k)
hold on
plot(b)
xlim([0 2000])
ylim([0 1])
legend('Krill population','Whale population')