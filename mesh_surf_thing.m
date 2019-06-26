x = linspace (-2,1,100)
y = linspace (-2,2,100)
[X,Y]=meshgrid(x,y)
f=exp(-(X.^2+Y.^2)).*(4*cos(X+Y)-3*sin(X-Y))
subplot(211), surf(X,Y,f),