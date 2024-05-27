addpath('src');	% libs

close all
clear all
clc

global section
section=initSection(0,0,0,0);
%testAirfoil;
hollowWingSection(.01,.2,.4,.65);
drawSection;

%
%####body=struct;
%####body.vertices=[0 0
%####           1 0
%####           1 1
%####           0 1];
%####[A,Ixx,Iyy,Ixy]=shoelace(body);
%####A
%####Ixx
%####Iyy
%####Ixy
%##
%##naca_airfoil=struct('ID','2412','panels',100);
%##P=naca4(naca_airfoil);
%##
%##global section
%##
%##section=initSection(0,0,0,0);
%##Point1=createPointInSpace(2,2);
%##Point2=createPointInSpace(2,3);
%##Point3=createPointInSpace(3,3);
%##Point4=createPointInSpace(3,2);
%##
%##Point5=createPointInSpace(2.5,2.5);
%##Point6=createPointInSpace(4.5,2.4);
%##
%##Path1=createPathFromPoints([Point1 Point2]);
%##%Path10=offsetPath(Path1,-.1);
%##Path2=createPathFromPoints([Point2 Point3]);
%##Path3=createPathFromPoints([Point4 Point3]);
%##Path4=createPathFromPoints([Point4 Point1]);
%##Path5=createPathFromPoints([Point5 Point6]);
%##Path8=createPathFromPoints([Point4 Point1 Point2 Point3 Point4]);
%##Path9=offsetPath(Path8,.1);
%##Path7=splitPathWithPath(Path8,Path5,Point4);
%##Point7=intersectPathWithPath(Path8,Path5,Point4);
%##%Path1=setPathVisibility(Path1,false);
%##Path6=createPathFromArray(P);
%##%Point5=createPointOnPath(Path1,3,'distance');
%##%Face1=createFaceFromPaths([Path1 Path2 Path3 Path4]);
%##
%##drawSection();
%
%%fill (body.vertices(:,1), body.vertices(:,2), "r");
%%axis ([-0.5 1.5, -0.5 1.5])
%%axis equal
