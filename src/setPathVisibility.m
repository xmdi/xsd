function [path]=setPathVisibility(path,value)

  global section

  for i=1:length(section.paths)
    if (isequal(section.paths(i).x,path.x)&&isequal(section.paths(i).y,path.y))
      path.visibility=value;
      section.paths(i).visibility=value;
    end
  end

end
