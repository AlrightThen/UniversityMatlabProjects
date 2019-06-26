t=-5:.005:5;
x=sin(20*t);
y=cos(20*t);
z=t;
stem3(x,y,z,'fill')
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');
title('\it{stem3 example}','FontSize',14)