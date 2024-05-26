function [point]=createPointOnPath(path,d,mode)
%in progress

  global section

  D=diff([path.x' path.y']);
  L=sum(sqrt(sum(D.^2,2)));

  if strcmp(mode,'ratio')
    if d<0
      error("Ratio cannot be negative.");
    elseif d>1
      error("Ratio exceeds 1.");
    elseif d==0
      point=createPointInSpace(path.x(1),path.y(1));
      section.points=[section.points point];
      return
    elseif d==1
      point=createPointInSpace(path.x(end),path.y(end));
      section.points=[section.points point];
      return
    end
    d=d*L;
    L0=0;
    for i=1:(length(path.x)-1)
      dL=sqrt((path.x(i+1)-path.x(i))^2+(path.y(i+1)-path.y(i))^2);
      if (L0+dL)>d
        pt=(d-L0)/dL*[(path.x(i+1)-path.x(i)) (path.y(i+1)-path.y(i))]+[path.x(i) path.y(i)];
        point=createPointInSpace(pt(1),pt(2));
        break
      end
      L0=L0+dL;
    end

  elseif strcmp(mode,'distance')
    if d<0
      error("Distance cannot be negative.");
    elseif d>L
      error("Distance exceeds path length.");
    end
    L0=0;
    for i=1:(length(path.x)-1)
      dL=sqrt((path.x(i+1)-path.x(i))^2+(path.y(i+1)-path.y(i))^2);
      if (L0+dL)>d
        pt=(d-L0)/dL*[(path.x(i+1)-path.x(i)) (path.y(i+1)-path.y(i))]+[path.x(i) path.y(i)];
        point=createPointInSpace(pt(1),pt(2));
        break
      end
      L0=L0+dL;
    end
  endif

  section.points=[section.points point];

end
