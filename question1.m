function [sum] = question1
N = input('Input N: ')
sum=0;
for k = 1:N
    sum=sum+((k^2)*(3^k))/factorial(k)
end