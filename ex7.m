x=[2 4 6 8 10]
y=[3 6,9 12 15]

for i = 1:5;
    z(i) = (x(i)*y(i)+(y(i)/x(i))/(x(i)+y(i))^(y(i)-x(i)))+12^(y(i)-x(i));
end;

z