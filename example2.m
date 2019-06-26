% DATA
v0=input('Please insert the muzzle speed: ');
theta=input('Please insert the muzzle angles: ');
g=9.81; %m/s^2

%%%%%%%%%%%%%%%%%%%%%%%%%
theta=theta/180*pi; %converted to radians
v0x=v0*cos(theta); %x velocity
v0y=v0*sin(theta); %y velocity
thmax=v0y/g;
hmax=v0y.^2/(2*g);
tf=2*thmax;
d=v0x.*tf;
[theta' round(d)']