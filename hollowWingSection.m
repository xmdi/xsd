function []=hollowWingSection(chord,skinThickness,sparPos1,sparPos2,sparPos3)

sparPos1=sparPos1*chord-chord/4;
sparPos2=sparPos2*chord-chord/4;
sparPos3=sparPos3*chord-chord/4;

naca_airfoil=struct('ID','4428','panels',100);
P=naca4(naca_airfoil);

P=P*chord;
P(:,1)=P(:,1)-chord/4;

airfoilSurface=createPathFromArray(P);

skin_IML=offsetPath(airfoilSurface,skinThickness);

TE_UAF=createPointOnPath(airfoilSurface,0,'ratio');
TE_LAF=createPointOnPath(airfoilSurface,1,'ratio');
TE_Flat=createPathFromPoints([TE_UAF,TE_LAF]);

TE_Middle=createPointOnPath(TE_Flat,.5,'ratio');
TE_Flat_upper=createPathFromPoints([TE_UAF,TE_Middle]);
TE_Flat_lower=createPathFromPoints([TE_LAF,TE_Middle]);

TE_Fwd_Extension=pointRelativeTo(-.05*chord,0,TE_Middle);
TE_Midplane=createPathFromPoints([TE_Middle,TE_Fwd_Extension]);

PointAbove=createPointInSpace(.5*chord-chord/4,.2*chord);
PointBelow=createPointInSpace(.5*chord-chord/4,-.2*chord);
PointAhead=createPointInSpace(.5-chord/4,0);
PointLessAhead=createPointInSpace(-.5-chord/4,0);
LE_Midplane=createPathFromPoints([PointAhead,PointLessAhead]);

UAF_skin_IML=splitPathWithPath(skin_IML,LE_Midplane,PointAbove);
LAF_skin_IML=splitPathWithPath(skin_IML,LE_Midplane,PointBelow);

UAF_skin_IML2=splitPathWithPath(UAF_skin_IML,TE_Midplane,PointAbove);
LAF_skin_IML2=splitPathWithPath(LAF_skin_IML,TE_Midplane,PointBelow);

UAF_IML_TE=getNearestPoint(UAF_skin_IML2,TE_Middle);
LAF_IML_TE=getNearestPoint(LAF_skin_IML2,TE_Middle);
UAF_TE_Midplane=createPathFromPoints([UAF_IML_TE,TE_Middle]);
LAF_TE_Midplane=createPathFromPoints([LAF_IML_TE,TE_Middle]);

setVisibilities([skin_IML,UAF_skin_IML,LAF_skin_IML,TE_UAF,TE_LAF,TE_Middle,TE_Flat,TE_Fwd_Extension,TE_Midplane,UAF_IML_TE,LAF_IML_TE,LE_Midplane,PointAbove,PointBelow,PointLessAhead,PointAhead],false);

spar1_center_above=createPointInSpace(sparPos1,.5*chord);
spar1_center_below=createPointInSpace(sparPos1,-.5*chord);
spar1_centerline=createPathFromPoints([spar1_center_above,spar1_center_below]);
spar1_offset1=offsetPath(spar1_centerline,skinThickness/2);
spar1_offset2=offsetPath(spar1_centerline,-skinThickness/2);

spar1_upper_intersect1=intersectPathWithPath(spar1_offset1,UAF_skin_IML2,PointAbove);
spar1_upper_intersect2=intersectPathWithPath(spar1_offset2,UAF_skin_IML2,PointAbove);
spar1_upper=createPathFromPoints([spar1_upper_intersect1,spar1_upper_intersect2]);

spar1_lower_intersect1=intersectPathWithPath(spar1_offset1,LAF_skin_IML2,PointBelow);
spar1_lower_intersect2=intersectPathWithPath(spar1_offset2,LAF_skin_IML2,PointBelow);
spar1_lower=createPathFromPoints([spar1_lower_intersect1,spar1_lower_intersect2]);
spar1_side1=createPathFromPoints([spar1_upper_intersect1,spar1_lower_intersect1]);
spar1_side2=createPathFromPoints([spar1_upper_intersect2,spar1_lower_intersect2]);

setVisibilities([spar1_center_above,spar1_center_below,spar1_centerline,spar1_offset1,spar1_offset2,spar1_upper_intersect1,spar1_upper_intersect2,spar1_lower_intersect1,spar1_lower_intersect2],false);

spar2_center_above=createPointInSpace(sparPos2,.5*chord);
spar2_center_below=createPointInSpace(sparPos2,-.5*chord);
spar2_centerline=createPathFromPoints([spar2_center_above,spar2_center_below]);
spar2_offset1=offsetPath(spar2_centerline,skinThickness/2);
spar2_offset2=offsetPath(spar2_centerline,-skinThickness/2);

spar2_upper_intersect1=intersectPathWithPath(spar2_offset1,UAF_skin_IML2,PointAbove);
spar2_upper_intersect2=intersectPathWithPath(spar2_offset2,UAF_skin_IML2,PointAbove);
spar2_upper=createPathFromPoints([spar2_upper_intersect1,spar2_upper_intersect2]);
spar2_lower_intersect1=intersectPathWithPath(spar2_offset1,LAF_skin_IML2,PointBelow);
spar2_lower_intersect2=intersectPathWithPath(spar2_offset2,LAF_skin_IML2,PointBelow);
spar2_lower=createPathFromPoints([spar2_lower_intersect1,spar2_lower_intersect2]);
spar2_side1=createPathFromPoints([spar2_upper_intersect1,spar2_lower_intersect1]);
spar2_side2=createPathFromPoints([spar2_upper_intersect2,spar2_lower_intersect2]);

setVisibilities([spar2_center_above,spar2_center_below,spar2_centerline,spar2_offset1,spar2_offset2,spar2_upper_intersect1,spar2_upper_intersect2,spar2_lower_intersect1,spar2_lower_intersect2],false);

spar3_center_above=createPointInSpace(sparPos3,.5*chord);
spar3_center_below=createPointInSpace(sparPos3,-.5*chord);
spar3_centerline=createPathFromPoints([spar3_center_above,spar3_center_below]);
spar3_offset1=offsetPath(spar3_centerline,skinThickness/2);
spar3_offset2=offsetPath(spar3_centerline,-skinThickness/2);

spar3_upper_intersect1=intersectPathWithPath(spar3_offset1,UAF_skin_IML2,PointAbove);
spar3_upper_intersect2=intersectPathWithPath(spar3_offset2,UAF_skin_IML2,PointAbove);
spar3_upper=createPathFromPoints([spar3_upper_intersect1,spar3_upper_intersect2]);
spar3_lower_intersect1=intersectPathWithPath(spar3_offset1,LAF_skin_IML2,PointBelow);
spar3_lower_intersect2=intersectPathWithPath(spar3_offset2,LAF_skin_IML2,PointBelow);
spar3_lower=createPathFromPoints([spar3_lower_intersect1,spar3_lower_intersect2]);
spar3_side1=createPathFromPoints([spar3_upper_intersect1,spar3_lower_intersect1]);
spar3_side2=createPathFromPoints([spar3_upper_intersect2,spar3_lower_intersect2]);

setVisibilities([spar3_center_above,spar3_center_below,spar3_centerline,spar3_offset1,spar3_offset2,spar3_upper_intersect1,spar3_upper_intersect2,spar3_lower_intersect1,spar3_lower_intersect2],false);

skin_face=createFaceFromPaths([airfoilSurface,TE_Flat_lower,LAF_TE_Midplane,LAF_skin_IML2,UAF_skin_IML2,UAF_TE_Midplane,TE_Flat_upper]);
spar1_face=createFaceFromPaths([spar1_upper,spar1_side2,spar1_lower,spar1_side1]);
spar2_face=createFaceFromPaths([spar2_upper,spar2_side2,spar2_lower,spar2_side1]);
spar3_face=createFaceFromPaths([spar3_upper,spar3_side2,spar3_lower,spar3_side1]);

setFaceProperties(skin_face,"ABS");
setFaceProperties(spar1_face,"Aluminum");
setFaceProperties(spar2_face,"Aluminum");
setFaceProperties(spar3_face,"Aluminum");

end








