x = linspace(-3,3,1000);
y = linspace(-3,3,1000);

[X,Y] = meshgrid(x,y);

f = (exp(X.^2-Y.^2)-2.*X.*Y)./(2*(1+Y.^2));

subplot(211), surf(X,Y,f)
subplot(212),meshc(X,Y,f)