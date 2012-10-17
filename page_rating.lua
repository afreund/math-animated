module(..., package.seeall)

function new()
	local localGroup = display.newGroup();
	print "Hello Reting Page"
	local rating_page  = display.newImageRect("images/rating_page.png", _W, _H);
	rating_page:setReferencePoint(display.CenterReferencePoint);
	rating_page.x = _W/2; 
	rating_page.y = _H/2;
	
	local btn_back = display.newImage("images/btn_back.png", _W, 75);
	btn_back:setReferencePoint(display.CenterReferencePoint);
	btn_back.x = _W/2      - btn_back.width/1.5
	btn_back.y = _H/2      - btn_back.height/1.5;
    btn_back.scene  = "MainMenu";
	
	localGroup:insert(rating_page);
	localGroup:insert(btn_back);
	
	
	function changeScene(e)
		if(e.phase == "ended") then
			director:changeScene(e.target.scene);
		end
	end
	
	btn_back:addEventListener("touch", changeScene)
	
	return localGroup;
end