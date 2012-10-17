

_W = display.contentWidth;
_H = display.contentHeight;

local director = require("director")

local mainGroup = display.newGroup()
display.setStatusBar(display.HiddenStatusBar)
local function main()

	mainGroup:insert(director.directorView)
      --director:changeScene("MainMenu")
	--director:changeScene("Logo")
	director:changeScene("Level_1")
	--director:changeScene("Level_1_R_1")
	--director:changeScene("Help_Hand")
	return true
end

main()
