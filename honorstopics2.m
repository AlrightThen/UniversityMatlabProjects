b = [1,2,3,4;2,2,3,4;3,3,5,6;4,5,6,7]

c=linspace(0,8,6)

A=[5 35 43; 4 76 81; 21 32 40];

size(A)

B=[7 2 76 33 8
1 98 6 25 6
5 54 68 9 0]

C=[1:2:11;0:5:25;linspace(10,60,6);67 2 43 68 4 13] 

D=C'

A(:,1)
A(1,:)
C(1:2,:)
C(:,1:2)
C(1:2,1:2)

I3=eye(3,3)

Y=zeros(3,5)

Z=ones(2)

F=rand(6)

G=randn(1,5)

inv(F)

ans*F

F(2,:)

clear all

A=[1 4 3; 2 6 1; 5 2 8] 

B=[5 4; 1 3; 2 6]

C=A*B

clear all

A = [4 -2 6; 2 8 2; 6 10 3]

B = [8; 4; 0]

X = linsolve(A,B)

disp(['Solution for x is ',num2str(X(1))])
disp(['Solution for y is ',num2str(X(2))])
disp(['Solution for z is ',num2str(X(3))])

clear all

X = [1,2;3,4]
Y = [1,1;1,1]
p=2

X-Y
X+Y
X+p
p-Y
X*Y
X\Y
Y./X
p*X
p.*X
X/p
p./X
X.\p
p.\X
X.^X
X^p
X.^p
p.^X

clear all

A= [6,43,2,11,87;12,6,34,0,5;34,18,7,41,9]

va = A(2,:)
vb = A(:,4)
vc = A(1:2,:)
vd = [A(:,2),A(:,5)]

C = [linspace(2,10,5);linspace(3,15,5);linspace(7,35,5)]

ua = C(:,3)
ub = C(2,:)
uc = [C(:,1),C(:,3),C(:,5)]
ud = [C(1,:)';C(2,:)']

clear all

A = [linspace(1,7,7);linspace(2,14,7);linspace(21,3,7);linspace(5,35,7);]

wa = A([1,3,4],[1,3,5,7])

eye(7,7)