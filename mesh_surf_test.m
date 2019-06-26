x = linspace(1,20,1000);
y = linspace(1,20,1000);
[X,Y] = meshgrid(x,y);
f=X.^2+Y.^2;


%subplot(221), mesh(f)
subplot(221), meshc(f)
%subplot(223), surf(f)
subplot(222), surfc(f)