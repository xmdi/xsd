addpath('src');	% libs

close all

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

global section

section=initSection(0,0,0,0);
[Point1]=createPointInSpace(2,3);
[Point2]=createPointInSpace(4,5);
[Point3]=createPointInSpace(2,5);
[Path1]=createPathfromPoints([Point1 Point2 Point3]);
drawSection();

%fill (body.vertices(:,1), body.vertices(:,2), "r");
%axis ([-0.5 1.5, -0.5 1.5])
%axis equal
