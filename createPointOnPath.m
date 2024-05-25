function [point]=createPointOnPath(path,d,mode)
%in progress

  global section

  D=diff(path.x' path.y');
  L=sum(sqrt(sum(D.^2,2)));

  if strcmp(mode,'ratio')
    if d<0
      error("Ratio cannot be negative");
    elseif d>1
      error("Ratio exceeds 1.");
    end
      r=d*L;
      while r>0


      end
      createPointInSpace(x,y)


  elseif strcmp(mode,'distance')
    if d<0
      error("Distance cannot be negative");
    elseif d>1
      error("Distance exceeds path length.");
    end

  endif

  section.points=[section.points point];

end
