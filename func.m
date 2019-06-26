function actualThing()
    X = meshgrid(-2:2);
    Y = meshgrid(-2:2);
    mesh(X,Y,workout(X,Y))
    surf(X,Y,workout(X,Y))
end
function f = workout(x,y)
    f = (exp(-(x^2+y^2)))*(4*cos(x+y) - 3*sin(x-y))
end