function [path]=setPathColor(path,value)

  global section

  for i=1:length(section.paths)
    if (isequal(section.paths(i).x,path.x)&&isequal(section.paths(i).y,path.y))
      path.color=value;
      section.paths(i).color=value;
    end
  end

end