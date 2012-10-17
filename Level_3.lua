module(..., package.seeall)

function new()
	local localGroup = display.newGroup();
	print "Hello Level 3 Page"
	local bg = display.newImageRect("images/bg_a.png", _W, _H);
	bg:setReferencePoint(display.CenterReferencePoint);
	bg.x = _W/2;
	bg.y = _H/2;
	bg.scene = "menu";
	
	local btn_back = display.newImage("images/btn_back.png", _W, 75);
	btn_back:setReferencePoint(display.CenterReferencePoint);
	btn_back.x = _W/2  - btn_back.width/1.5
	btn_back.y = _H/2   - btn_back.height/1.5;
	--btn_back.xScale = 0.3
	--btn_back.yScale = 0.4
     btn_back.scene  = "MainMenu";
	-- btn_back.scene  = "menu";
	 
	 
	local grass = display.newImage("images/grass.png", _W, _H);
	grass:setReferencePoint(display.CenterReferencePoint); 
    grass.x = _W/2  --+  grass.width/5;
	grass.y = _H/2  + grass.height/4.5;
	grass.xScale = 0.5
	grass.yScale = 0.5
	--[[
	local pig = display.newImage("images/pig.png", _W, _H);
	pig:setReferencePoint(display.CenterReferencePoint); 
    pig.x = _W/2 - pig.width/3.5;
	pig.y = _H/2  + pig.height/2;
	pig.xScale = 0.5
	pig.yScale = 0.5
	
    
	local txt_level6 = display.newImage("images/txt_Level6.png", _W, _H);
	txt_level6:setReferencePoint(display.CenterReferencePoint); 
    txt_level6.x = _W/2 - txt_level6.width/20;
	txt_level6.y = _H/2  - txt_level6.height/0.3;
	txt_level6.xScale = 0.5
	txt_level6.yScale = 0.5
	
	--]]
	--local cheetomoskeeto = display.newImageRect("images/cheetomoskeeto.png", _W, _H);
	----cheetomoskeeto:setReferencePoint(display.CenterReferencePoint);
	--cheetomoskeeto.x = _W/2; cheetomoskeeto.y = _H/2;
	--cheetomoskeeto.scene = "menu";
	 local Text = display.newText("Level 3 ", _W/2, _H/2, native.systemFont, 32)
     Text:setTextColor(0, 256, 255)
	
	
	localGroup:insert(bg);
	localGroup:insert(btn_back);
	--localGroup:insert(txt_level6);
	localGroup:insert(grass);
	--localGroup:insert(pig);
	localGroup:insert(Text);
	
	function changeScene(e)
		if(e.phase == "ended") then
			director:changeScene(e.target.scene);
		end
	end
	
	btn_back:addEventListener("touch", changeScene)
	--bg:addEventListener("touch", changeScene)
	return localGroup;
end