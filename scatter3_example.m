t=-5:.005:5;
x=sin(20*t);
y=cos(20*t);
z=t;
scatter3(x,y,z,'filled')
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');
title('\it{scatter3 example}','FontSize',14)