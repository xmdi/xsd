function [point]=setPointVisibility(point,value)

  global section

  for i=1:length(section.points)
    if ((section.points(i).x==point.x)&&(section.points(i).y==point.y))
      point.visibility=value;
      section.points(i).visibility=value;
    end
  end

end
