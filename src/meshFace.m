function []=meshFace(section,face,d)

% create boundary mesh

sMax=getPathLength(face);
s=0;
while (s<=sMax)
  XYOnpath(face,s)
  s=s+d;
end




end