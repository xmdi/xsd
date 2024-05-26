function [point]=setPointColor(point,value)

  global section

  for i=1:length(section.points)
    if ((section.points(i).x==point.x)&&(section.points(i).y==point.y))
      point.color=value;
      section.points(i).color=value;
    end
  end

end
