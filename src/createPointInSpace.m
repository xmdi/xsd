function [point]=createPointInSpace(x,y)

  global section

  point=struct('x',x,'y',y,'visibility',true,'color','k','tag',1);
  section.points=[section.points point];

end
