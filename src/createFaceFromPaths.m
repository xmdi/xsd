function [face]=createFaceFromPaths(paths)

  global section

  x=[paths(1).x];
  y=[paths(1).y];

  for i=2:length(paths)
    if (x(end)==paths(i).x(1))&&(y(end)==paths(i).y(1))
      x=[x paths(i).x(2:end)];
      y=[y paths(i).y(2:end)];
    elseif (x(end)==paths(i).x(end))&&(y(end)==paths(i).y(end))
      x=[x fliplr(paths(i).x(1:end-1))];
      y=[y fliplr(paths(i).y(1:end-1))];
    else
      error('Path %d and Path %d disconnected.',i-1,i);
    endif
  end

  if ((x(end)~=x(1))||(y(end)~=y(1)))
    error('Face boundary start and stop disconnected.');
  endif

  face=struct('x',x,'y',y,'visibility',true,'color','y','E',NaN,'G',NaN,'v',NaN,'tag',3);
  section.faces=[section.faces face];

end
