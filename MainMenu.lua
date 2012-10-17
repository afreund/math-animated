module(..., package.seeall)
local director = require("director");
function new()
local utility = require("utility");

display.setStatusBar( display.HiddenStatusBar )
print "Hello MainMenu Page"
total = 0


local previousX = 0
local scrollVelocity = 0
local scrollDirection
local scrollFriction = 0.5  --5
local gorizont = 0
local xMove = 0
local vertical = 0

local newAngel = 0

	local localGroup = display.newGroup();
	
	  function changeScene(e)
		if(e.phase == "ended") then
		    Runtime:removeEventListener("touch", makeScroll)
			Runtime:removeEventListener("enterFrame", flickScroll)
		
			director:changeScene(e.target.scene);
		end
	end
	local bg           = utility.createImage("images/bg_a.png",          _W/2,   _H/2,       1);
    local grass        = utility.createImage("images/grass.png",         _W/2,   _H/1.35,  0.5);
	    utility.positionImageFromBottom(grass, 0 , 0)
	local pig          = utility.createImage("images/pig.png",           _W/4,   _H/1.25,  0.4);
	local settings     = utility.createImage("images/Settings.png",      _W/6,   _H/2.7,   0.6);
	local rating       = utility.createImage("images/Rating.png",        _W/6,   _H/2,     0.6);
	local more         = utility.createImage("images/More.png",          _W/6,   _H/1.6,   0.6);
	local star_yellow  = utility.createImage("images/star_yellow.png",   _W/4.8, _H/18,    0.4);

    local totalText = display.newText("Total ", 0, 0, native.systemFont, 24)
    totalText:setTextColor(255, 255, 255)
	
	local total_N_Text = display.newText(total,  totalText.width , 0, native.systemFont, 24)
    total_N_Text:setTextColor(255, 255, 255) 
	
	localGroup:insert(bg);
    --  ###########################################
    -- Group individual elements into larger units (levels and txt_levels should be groups into a single unit).
    local levelsGroup = display.newGroup();
    levelsGroup.x = 0;
	   local i	
	   local txt_level

          for i = 1, 6, 1 do
	       local level   = utility.createImage( "images/Level_" .. i  .. ".png" ,_W/2*i, _H/6,  0.8);
		   levelsGroup:insert(level);
      
	       local txt_level   = utility.createImage( "images/txt_Level" .. i  .. ".png" ,_W/2*i, _H/6,  0.8);
	       --txt_level.scene = "Level_" .. i;  
	       levelsGroup:insert(txt_level);
	      -- txt_level:addEventListener("tap", changeScene)
		   print (" Level = ", i ,"  ",txt_level.scene)
        end
     
	
    localGroup:insert(levelsGroup);
  
  
  -- Add a method to the foo object to handle the touch event
function pig :touch(e) -- e represents the event to be handled
	if(e.phase == "began") then
		--print("touch began");
	--elseif(e.phase == "moved") then
		--print("touch moving");
	--elseif(e.phase == "ended" or e.phase == "cancelled") then
		--print("touch ended");
		pig.scene = "Level_1"
		pig:addEventListener("touch", changeScene)
		--Runtime:removeEventListener("enterFrame",backAndForth);
	end
	
	return true; -- tell the system not to handle anymore touches
end

-- Add the event listener directly to an object
pig:addEventListener("touch", pig);
  
  
  
	--[[
	localGroup:insert(txt_level1);
	localGroup:insert(txt_level2);
	localGroup:insert(txt_level3);
	localGroup:insert(txt_level4);
	localGroup:insert(txt_level5);
	localGroup:insert(txt_level6);
	--]]
	--[[
	txt_level1.scene = "Level_1" 
	txt_level2.scene = "Level_2" 
	txt_level3.scene = "Level_3" 
	txt_level4.scene = "Level_4" 
	txt_level5.scene = "Level_5" 
	txt_level6.scene = "Level_6" 
	--]]

    --#############################
    local function flickScroll() 
        levelsGroup.x = levelsGroup.x + scrollVelocity;
	 if (levelsGroup.x >= 0) then
	    levelsGroup.x = 0;
	    elseif (levelsGroup.x <= -1200) then
	    levelsGroup.x = -1200;
     end

	-- moving left
	 if (scrollDirection=="left") then
	    scrollVelocity = scrollVelocity + scrollFriction
	    if (scrollVelocity > 0) then
		  scrollVelocity = 0
		  Runtime:removeEventListener("enterFrame", flickScroll)
	    end
	 end

	-- moving right
	 if (scrollDirection=="right") then
	    scrollVelocity = scrollVelocity - scrollFriction
	    if (scrollVelocity < 0) then
		  scrollVelocity = 0
		  Runtime:removeEventListener("enterFrame", flickScroll)
	    end
	 end
  end


    local function makeScroll(event)
	local target = event.target
	local phase = event.phase
	local time = event.time
	if (event.phase == "began") then
	    display.getCurrentStage():setFocus(event.target) -- lock the focus onto the scrolling
	    startTime = event.time -- record the start time of this drag
	    scrollVelocity = 0 
	end

	if (event.phase == "moved") then
	    if (previousX == 0) then
		 previousX = event.x
	    end
	      xMove = event.x - previousX;
	      previousX = event.x
	    if (xMove < 0) then
		  scrollDirection = "left"
	    else
		  scrollDirection = "right"
	    end 
		-- make the background move
	    levelsGroup.x = levelsGroup.x + xMove; 

	    if (levelsGroup.x >= 0) then
		   levelsGroup.x = 0;
	       elseif (levelsGroup.x <= -1200) then
		   levelsGroup.x = -1200;
	    end
	end

	if (event.phase == "ended") then
	    scrollVelocity = xMove
	    Runtime:addEventListener("enterFrame", flickScroll)
	    xMove = 0
	    previousX = 0
	end     
   end

    -- ###################################
    Runtime:addEventListener("touch", makeScroll)
    function changeScene(e)
		if(e.phase == "ended") then
		    Runtime:removeEventListener("touch", makeScroll)
			Runtime:removeEventListener("enterFrame", flickScroll)
		
			director:changeScene(e.target.scene);
		end
	end
		
	settings.scene = "page_settings";
	rating.scene = "page_rating";
	more.scene = "page_more";
		
	localGroup:insert(grass);
	localGroup:insert(pig);
	localGroup:insert(totalText);
	localGroup:insert(total_N_Text);
	localGroup:insert(star_yellow);
	localGroup:insert(settings);
    localGroup:insert(rating);
	localGroup:insert(more);
		
	settings:      addEventListener("touch", changeScene)
	rating:        addEventListener("touch", changeScene)
	more:          addEventListener("touch", changeScene)
	--txt_level1:    addEventListener("touch", changeScene)
   -- txt_level2:    addEventListener("touch", changeScene)
	--txt_level3:    addEventListener("touch", changeScene)
	--txt_level4:    addEventListener("touch", changeScene)
	--txt_level5:    addEventListener("touch", changeScene)
	--txt_level6:    addEventListener("touch", changeScene)
	--
	
	return localGroup;

end
 