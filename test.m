addpath('src');	% libs

body=struct;
body.vertices=[0 0
           1 0
           1 1
           0 1];
[A,Ixx,Iyy,Ixy]=shoelace(body);
A
Ixx
Iyy
Ixy

naca_airfoil=struct;
naca_airfoil.ID='2412';
naca_airfoil.panels=100;
P=naca4(naca_airfoil);
plot(P(:,1),P(:,2));axis equal


%fill (body.vertices(:,1), body.vertices(:,2), "r");
%axis ([-0.5 1.5, -0.5 1.5])
%axis equal
