function [path]=createPathfromPoints(points)

  global section

  path=struct('x',[],'y',[],'visibility',true,'color','g');

  for i=1:length(points)
    path.x=[path.x points(i).x];
    path.y=[path.y points(i).y];
  end

  section.paths=[section.paths path];

end
