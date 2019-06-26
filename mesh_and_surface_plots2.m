[X,Y]=meshgrid(-2:.2:2);
Z=X.*exp(-X.^2-Y.^2)
subplot(221),surf(X,Y,Z), colormap cool, colorbar
subplot(222),pcolor(X,Y,Z), colormap cool, colorbar,shading interp
subplot(223),contour(X,Y,Z)
subplot(224)
[C,h]=contour(X,Y,Z);
clabel(C,h)