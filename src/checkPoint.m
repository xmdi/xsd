function []=checkPoint(point)

if ~isnumeric(point.x)
error("Invalid x position.");
elseif ~isnumeric(point.y)
error("Invalid y position.");
elseif ~islogical(point.visibility)
error("Invalid visibility.");
end





end