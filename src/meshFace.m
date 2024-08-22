function []=meshFace(section,face,d)

% create boundary mesh

% sMax=getPathLength(face);

x_bounds=[]; % need to eventually init this to a proper size for speed
y_bounds=[]; % need to eventually init this to a proper size for speed

% "equally" space nodes around the boundary about every 'd' units
for i=1:(length(face.x)-1)
	L=sqrt((face.x(i+1)-face.x(i))^2+(face.y(i+1)-face.y(i))^2);
	n_els=round(L/d);
	x_bounds=[x_bounds linspace(face.x(i),face.x(i+1),n_els+1)];
	y_bounds=[y_bounds linspace(face.y(i),face.y(i+1),n_els+1)];
end


end
