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

fill (body.vertices(:,1), body.vertices(:,2), "r");
axis ([-0.5 1.5, -0.5 1.5])
axis equal
