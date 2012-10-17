module(..., package.seeall)

function new()
	local localGroup = display.newGroup();
	print "Hello More Page"
	local more_page = display.newImageRect("images/settings_page.png", _W, _H);
	more_page:setReferencePoint(display.CenterReferencePoint);
	more_page.x = _W/2; 
	more_page.y = _H/2;
	--more_page.scene = "menu";
	
	
	local btn_back = display.newImage("images/btn_back.png", _W, 75);
	btn_back:setReferencePoint(display.CenterReferencePoint);
	btn_back.x = _W/2      - btn_back.width/1.5
	btn_back.y = _H/2      - btn_back.height/1.5;
    btn_back.scene  = "MainMenu";
	
	localGroup:insert(more_page);
	localGroup:insert(btn_back);
	
	function changeScene(e)
		if(e.phase == "ended") then
			director:changeScene(e.target.scene);
		end
	end
	
    btn_back:addEventListener("touch", changeScene)
	
	return localGroup;
end