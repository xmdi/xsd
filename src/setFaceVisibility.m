function [face]=setFaceVisibility(face,value)

  global section

  for i=1:length(section.faces)
    if (isequal(section.faces(i).x,face.x)&&isequal(section.faces(i).y,face.y))
      face.visibility=value;
      section.faces(i).visibility=value;
    end
  end

end
