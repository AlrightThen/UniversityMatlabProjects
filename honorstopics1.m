z = cos(5*pi/6)^2 * sin((7*pi/8)^2) + (tan(pi*log(8)/6)/(sqrt(7)*(5/2)));

z;

temp0 = 48;
temps = 2;
k = 0.45

%for t = 0:3
%end

t=[0:1:3];
temp = temps + (temp0 - temps)*exp(-k*t);

%plot(t,temp);

a = 15.62;
b = -7.08;
c = 62.5;
d = 0.5*(a*b - c);

a+(a*b/c)*(a+d)^2/sqrt(abs(a*b))

alpha = 5*pi/9;
beta = pi/7;

cos(alpha) - cos(beta)
2*sin((alpha+beta)/2)*sin((beta-alpha)/2)

aang = 18;
bang = 35;
cang = 50;

gamma = acos((aang^2+bang^2-cang^2)/(2*aang*bang))

abs(3*2 + 5*(-3) - 6)/sqrt(3^2 + 5^2)

ceil(751/12)

lcm(6,38)

lcm(147,61)



