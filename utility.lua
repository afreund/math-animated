 module(..., package.seeall)	
    function createImage(imageName,x,y,scale) 
      local image = display.newImage(imageName);
      image:setReferencePoint(display.CenterReferencePoint);
      image.x = x;
      image.y = y;
	  image.xScale = scale
	  image.yScale = scale
      image.alpha = 1
	  return image
    end
	
	function positionImageFromBottom(image, left, distanceFromBottom)
	image:setReferencePoint(display.BottomLeftReferencePoint);
	image.x = left;
	image.y = _H - distanceFromBottom;
    end

     function positionImageFromTop(image, left, distanceFromTop)
	 image:setReferencePoint(display.TopLeftReferencePoint);
	 image.x = left;
	 image.y = _H - distanceFromTop;
     end
	 
	 