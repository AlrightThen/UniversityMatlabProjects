xo=0.5
while xo > 0.00005
    xn = xo-(xo^3-4*xo^2-xo+3)/(3*xo^2-8*xo-1);
    xo = xn;
    disp(xo)
end
xo