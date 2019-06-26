t=-5:.005:5;
x=sin(20*t);
y=cos(20*t);
z=t;
plot3(x,y,z)
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');
title('\it{plot3 example}','FontSize',14)