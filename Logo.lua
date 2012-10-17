module(..., package.seeall)

local director = require("director");
local easing = require("easing")
function new()
    local localgroup = display.newGroup();
    local background = display.newImage("images/bg_a.png", 0, 0);
	
    local splash    =display.newImage("images/splash.png")
	splash.xScale = 0.5
	splash.yScale = 0.5
	splash.x = _W/2 -- - splash.width/0.5
	splash.y = _H/2 --- splash.height/0.4
	splash.alpha = 1
	transition.from(splash, {time = 3000, delay = 0, x = _W/2, y = -_H/2 ,transition=easing.easeInOutElastic})  --easeInOutBounce  easeOutElastic
	
	
	local function begin_of_splash()
    transition.to(splash, {time = 2000, delay = 500,  xScale = 2, yScale = 2})
	print ("Begin Splash")
	end
	
	local function end_of_splash()
	transition.to(splash, {time=2000, delay=0, rotation = 1440, xScale = 0.2, yScale = 0.2, alpha = 0}); 
	print ("END  Splash")
	end
  
    timer.performWithDelay(  4000,  begin_of_splash)  
	timer.performWithDelay(  8000, end_of_splash)
	
	
	local logo = display.newImage("images/logo.png", 0, 0);
	logo.xScale = 0.5;
	logo.yScale = 0.5;
	logo.x = _W/2 - logo.width/4; 
	logo.y = _H/2;
	logo.alpha = 0
	transition.to(logo, {time=4000,delay = 8000, alpha = 1});
	
	local play_btn = display.newImage("images/play_btn.png", 0, 0);
	play_btn.x = (3/4)*_W; 
	play_btn.y = _H/2 
	play_btn.alpha = 0
	transition.to(play_btn, {time=4000,delay = 8000, alpha = 1});
    play_btn.scene = "MainMenu";
	
	play_btn:addEventListener("touch", changeScene);
	
	localgroup:insert(background);
	localgroup:insert(splash);
	localgroup:insert(logo);
	localgroup:insert(play_btn);
	
	return localgroup;
end

function changeScene(e)
	if(e.phase == "ended") then
		director:changeScene(e.target.scene);
	end
end