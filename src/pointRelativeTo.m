function [point]=pointRelativeTo(x,y,referencePoint)

  global section

  point=struct('x',x+referencePoint.x,'y',y+referencePoint.y,'visibility',true,'color','k','tag',1);
  section.points=[section.points point];

end
