

module(..., package.seeall)

function new()
display.setStatusBar( display.HiddenStatusBar )
print "Hello Menu Page"


	local localGroup = display.newGroup();
	local bg = display.newImageRect("images/bg_a.png", _W, _H);
	bg:setReferencePoint(display.CenterReferencePoint);
	bg.x = _W/2;
	bg.y = _H/2;
	
	

	
	local splash = display.newImageRect("images/splash.png", _W, 132);
	splash:setReferencePoint(display.CenterReferencePoint);
	splash.x = _W/2
	splash.y = _H/2
	splash.xScale = 0.5
	splash.yScale = 0.5
	transition.to(splash, {time=1000, alpha = 0})
	
	
	
	local logo = display.newImageRect("images/logo.png", _W, _H);
	logo:setReferencePoint(display.CenterReferencePoint);
	logo.x = _W/2 - logo.width/4;
	logo.y = _H/2;
	logo.xScale = 0.4
	logo.yScale = 0.6
	logo.alpha = 0
	transition.to(logo, {time=5000, alpha = 1})
	
	
	
	local play_btn = display.newImageRect("images/play_btn.png", _W, 75);
	play_btn:setReferencePoint(display.CenterReferencePoint);
	play_btn.x = _W/2 + play_btn.width/4
	play_btn.y = _H/2  --  - play_btn.height;
	play_btn.xScale = 0.3
	play_btn.yScale = 0.4
	play_btn.alpha = 0
    play_btn.scene = "Level_Menu";
	--play_btn.scene = "credits_page";
	transition.to(play_btn, {time=10000, alpha = 1})
	
	
	
	
	localGroup:insert(bg);
	localGroup:insert(splash);
	localGroup:insert(logo);
	localGroup:insert(play_btn);
	
	
	function changeScene(e)
		if(e.phase == "ended") then
			director:changeScene(e.target.scene);
		end
	end
	
	play_btn:addEventListener("touch", changeScene);
	
		
	return localGroup;
end