module(..., package.seeall)
  local director = require("director");
  local easing    = require("easing")
  local factory  = require("factory")
function new()
    print ("Hello YR I am in Level _1  R _1  ")
    local i
	local j
	local localGroup = display.newGroup();
	
	local pos_1_x = _W/10    -_W/20
	local pos_2_x = _W/10*2  -_W/20
	local pos_3_x = _W/10*3  -_W/20
	local pos_4_x = _W/10*4  -_W/20
	local pos_5_x = _W/10*5  -_W/20
	local pos_6_x = _W/10*6  -_W/20
	local pos_7_x = _W/10*7  -_W/20
	local pos_8_x = _W/10*8  -_W/20
	local pos_9_x = _W/10*9  -_W/20
	local pos_10_x =_W/10*10  -_W/20
	
	local pos_1_y =_H/6*6 - _H/12;
	 
	local btn_rightAnswer_Visible = false
	local pos_rightAnswer_x
	
	
	local Add_Number_Visible = false
	local Hand_Help_Visible  = false
	
	local bg = display.newImage("images/bg_a.png", _W, _H);
	bg:setReferencePoint(display.CenterReferencePoint);
	bg.x = _W/2;
	bg.y = _H/2;
    localGroup:insert(bg);
	
	
	local btn_back = display.newImage("images/btn_back.png", _W, 75);
	btn_back:setReferencePoint(display.CenterReferencePoint);
	btn_back.x = _W/2   - btn_back.width/0.95
	btn_back.y = _H/2   - btn_back.height/0.9;
	btn_back.xScale = 0.6;
	btn_back.yScale = 0.6;
	btn_back.alpha = 1
	transition.to(btn_back, {time = 3000, delay = 1000, alpha = 1})
    btn_back.scene  = "Level_1";
	localGroup:insert(btn_back);
	
	
	
	
	

	local grass = display.newImage("images/grass.png", _W, _H);
	grass:setReferencePoint(display.CenterReferencePoint); 
    grass.x = _W/2  --+  grass.width/5;
	grass.y = _H/2  + grass.height/5;
	grass.xScale = 0.5;
	grass.yScale = 0.5;
	transition.to(grass, {time = 1000,delay = 200, y = _H/2 + grass.height/15 })
	localGroup:insert(grass);
	
	local thoughtBubble_plus = display.newImage("images/thoughtBubble_plus.png", _W, _H);
	thoughtBubble_plus.x = _W/2    - thoughtBubble_plus.width/0.4;
	thoughtBubble_plus.y = _H/2    + thoughtBubble_plus.height/1;
	thoughtBubble_plus.xScale = 0.1;
	thoughtBubble_plus.yScale = 0.1;
	thoughtBubble_plus.alpha = 1
	thoughtBubble_plus.isVisible = true
	transition.to(thoughtBubble_plus, {time = 2000,delay = 9000, xScale = 1, yScale = 1, alpha = 1, x =  thoughtBubble_plus.width/1,  y =  thoughtBubble_plus.height/0.6})
	localGroup:insert(thoughtBubble_plus);
	
	
	local pig = display.newImage("images/pig.png",_W,_H);
    pig.x = _W/2 - pig.width/2;
	pig.y = _H/2  + pig.height/4;
	pig.xScale = 0.4;
	pig.yScale = 0.4;
	transition.to(pig, {time = 1000, delay = 200, y = _H/2  + pig.height/8 })
	localGroup:insert(pig)
	
	
	for i = 1, 10 do
	print (" Level_Enable",i)
	local level_enabled = display.newImage("images/level_enabled.png", _W, _H);
	level_enabled.xScale = 0.5;
    level_enabled.yScale = 0.5;
	level_enabled.x = _W/10*i -_W/20
	level_enabled.y   = _H/2  +  level_enabled.height*1.38;
	transition.from(level_enabled,{time = 1000,delay = 200, y = 340})
	localGroup:insert(level_enabled);
	end
	
   
	
	local function btn_add1_blue() 
	local btn_add1 = display.newImage("images/btn_add1.png", _W, _H);
	btn_add1:setReferencePoint(display.CenterReferencePoint);
	btn_add1.x = _W/2   - btn_add1.width*1.8
	btn_add1.y = _H/2   + btn_add1.height*1.44;
	btn_add1.xScale = 0.45;
	btn_add1.yScale = 0.45;
	btn_add1.alpha = 1
	transition.from(btn_add1,{time = 1000,delay = 7000, y = -300, transition=easing.easeInOutElastic})
    localGroup:insert(btn_add1);
	end
	btn_add1_blue() 
	
	local function btn_add2_orng()
	local btn_add2 = display.newImage("images/btn_add2.png", _W, _H);
	print ("TEST BTN_ADD2")
	btn_add2:setReferencePoint(display.CenterReferencePoint);
	btn_add2.x =  _W/2   - btn_add2.width*1.3
	btn_add2.y = _H/2   + btn_add2.height*1.44;
	btn_add2.xScale = 0.45;
	btn_add2.yScale = 0.45;
	btn_add2.alpha = 1
	transition.from(btn_add2,{time = 1000,delay = 9000, y = -300,transition=easing.easeInOutElastic})
   -- btn_add2.scene  = "";
	localGroup:insert(btn_add2);
	end
	btn_add2_orng()
	
	--****  btn_rightAnswer
	 local function rightAnswer()
	 local btn_rightAnswer = display.newImage("images/btn_rightAnswer.png", _W, _H);
	 print ("btn_rightAnswer")
	 btn_rightAnswer:setReferencePoint(display.CenterReferencePoint);
	 btn_rightAnswer.x = pos_rightAnswer_x  --               _W/2  - btn_rightAnswer.width*0.235
	 btn_rightAnswer.y = _H/2  +  btn_rightAnswer.height*1.38;
	 btn_rightAnswer.xScale = 0.45;
	 btn_rightAnswer.yScale = 0.45;
	 btn_rightAnswer.alpha = 1;
	-- btn_rightAnswer.isVisible =  btn_rightAnswer_Visible
	 --transition.to( btn_rightAnswer,{time = 1000,delay = 20000, y = -300, alpha = 0,transition=easing.easeInOutElastic})
     -- btn_add2.scene  = "";
	 localGroup:insert( btn_rightAnswer);
	end 
	
     local function go_to_rightAnswer()
	 btn_rightAnswer_Visible = true
	 --timer.performWithDelay( 1000, rightAnswer, 1 )
	 rightAnswer()
	 end
  
	 
        local N_1  = display.newImage ("images/N_1.png");
		print (" N_ =  1");
		N_1.xScale = 0.8;
	    N_1.yScale = 0.8;
	    N_1.x =  pos_1_x; 
		N_1.y =  pos_1_y;      
		transition.from(N_1,{time = 2000, delay = 1000,y = 500,transition=easing.easeInOutElastic})
		N_1:addEventListener("tap",N_1 )
        localGroup:insert(N_1);
		
		
		
        local N_2  = display.newImage ("images/N_2.png");
		print (" N_ =  1");
		N_2.xScale = 0.8;
	    N_2.yScale = 0.8;
	    N_2.x =  pos_2_x;
		N_2.y =  pos_1_y;
		transition.from(N_2,{time = 2000,delay = 1250, y = 500,transition=easing.easeInOutElastic})
		N_2:addEventListener("tap",N_2 )
        localGroup:insert(N_2);
		
		 local N_3  = display.newImage ("images/N_3.png");
		print (" N_ =  3");
		N_3.xScale = 0.8;
	    N_3.yScale = 0.8;
	    N_3.x =  pos_3_x;
		N_3.y =  pos_1_y;
		transition.from(N_3,{time = 2000, delay = 1500,y = 500,transition=easing.easeInOutElastic})
		N_3:addEventListener("tap",N_3 )
        localGroup:insert(N_3);
		
        local N_4  = display.newImage ("images/N_4.png");
		print (" N_ =  4");
		N_4.xScale = 0.8;
	    N_4.yScale = 0.8;
	    N_4.x =  pos_4_x;
		N_4.y =  pos_1_y;
		transition.from(N_4,{time = 2000,delay = 1750, y = 500,transition=easing.easeInOutElastic})
		N_4:addEventListener("tap",N_4 )
        localGroup:insert(N_4);
		
	
		local N_5  = display.newImage ("images/N_5.png");
		print (" N_ =  5");
		N_5.xScale = 0.8;
	    N_5.yScale = 0.8;
	    N_5.x =  pos_5_x;
		N_5.y =  pos_1_y;
		transition.from(N_5,{time = 2000, delay = 2000,y = 500,transition=easing.easeInOutElastic})
		N_5:addEventListener("tap",N_5 )
        localGroup:insert(N_5);
	
		
        local N_6  = display.newImage ("images/N_6.png");
		print (" N_ =  6");
		N_6.xScale = 0.8;
	    N_6.yScale = 0.8;
	    N_6.x =  pos_6_x;
		N_6.y =  pos_1_y;
		transition.from(N_6,{time = 2000,delay = 2250, y = 500,transition=easing.easeInOutElastic})
		N_6:addEventListener("tap",N_6 )
        localGroup:insert(N_6);
		
		 local N_7  = display.newImage ("images/N_7.png");
		print (" N_ =  1");
		N_7.xScale = 0.8;
	    N_7.yScale = 0.8;
	    N_7.x =  pos_7_x;
		N_7.y =  pos_1_y;
		transition.from(N_7,{time = 2000, delay = 2500,y = 500,transition=easing.easeInOutElastic})
		N_7:addEventListener("tap",N_7 )
        localGroup:insert(N_7);
		
        local N_8  = display.newImage ("images/N_8.png");
		print (" N_ =  8");
		N_8.xScale = 0.8;
	    N_8.yScale = 0.8;
	    N_8.x =  pos_8_x;
		N_8.y =  pos_1_y;
		transition.from(N_8,{time = 2000,delay = 2750, y = 500,transition=easing.easeInOutElastic})
		N_8:addEventListener("tap",N_8 )
        localGroup:insert(N_8);
		
		
		 local N_9  = display.newImage ("images/N_9.png");
		print (" N_ =  9");
		N_9.xScale = 0.8;
	    N_9.yScale = 0.8;
	    N_9.x = pos_9_x;
		N_9.y =  pos_1_y;
		transition.from(N_9,{time = 2000, delay = 3000,y = 500,transition=easing.easeInOutElastic})
		N_9:addEventListener("tap",N_9 )
        localGroup:insert(N_9);
		
        local N_10  = display.newImage ("images/N_10.png");
		print (" N_ =  10");
		N_10.xScale = 0.8;
	    N_10.yScale = 0.8;
	    N_10.x =  pos_10_x;
		N_10.y =  pos_1_y;
		transition.from(N_10,{time = 2000,delay = 3250, y = 500,transition=easing.easeInOutElastic})
		N_10:addEventListener("tap",N_10 )
        localGroup:insert(N_10);
		
       function N_1:tap(event)
	     print ("GO_N_1")
	   end
	
	  function N_2:tap(event)
	   print ("GO_N_2")
	  end
	
	  function N_3:tap(event)
	     print ("GO_N_3")
	   end
	
	  function N_4:tap(event)
	   print ("GO_N_4")
	  end
	
	  function N_5:tap(event)
	     print ("GO_N_5")
	   end
	
	  function N_6:tap(event)
	   print ("GO_N_6")
	  end
	
	  function N_7:tap(event)
	     print ("GO_N_7")
	   end
	
	  function N_8:tap(event)
	   print ("GO_N_8")
	  end
	
	  function N_9:tap(event)
	     print ("GO_N_9")
	   end
	
	  function N_10:tap(event)
	   print ("GO_N_10")
	  end
	 
	    local hintPanel_small = display.newImage("images/hintPanel_small.png", _W, _H); 
        hintPanel_small.x = _W/2  -- +  hintPanel_small.width/1
	    hintPanel_small.y = _H/2   - hintPanel_small.height/1.5
	    hintPanel_small.xScale = 0.5;
        hintPanel_small.yScale = 0.5
	   -- transition.from(hintPanel_small,{time = 1000, delay = 5000,y = -300,transition=easing.easeInOutElastic})
	    localGroup:insert(hintPanel_small);
	

	
	--[[
    local function hint_1()
	 for i = 1 ,3 do
	local hintSquare_1 = display.newImage("images/hintSquare_1.png", _W, _H);
	hintSquare_1.x = (_W/2  +  ( i * 32) - 2*hintSquare_1.width + hintSquare_1.width/2.5)
	hintSquare_1.y = _H/2  - hintSquare_1.height/0.58;
	hintSquare_1.xScale = 0.5;
	hintSquare_1.yScale = 0.5;
	transition.from(hintSquare_1,{time = 1000,delay = 9000,y = -300,transition=easing.easeInOutElastic})
	transition.to(hintSquare_1,{time = 1000,delay = 19000,alpha = 0})
	localGroup:insert(hintSquare_1);
	 end
	end
	hint_1()
	
	function hint_2()
	 for i = 1, 2 do
	local hintSquare_2 = display.newImage("images/hintSquare_2.png", _W, _H);
	hintSquare_2.x = (_W/2  +  ( i * 32) - 2*hintSquare_2.width + hintSquare_2.width/2.5)
	hintSquare_2.y = _H/2     - hintSquare_2.height/0.44;
	hintSquare_2.xScale = 0.5;
	hintSquare_2.yScale = 0.5;
	   transition.from(hintSquare_2,{time = 1000, delay = 7000, y = -300,transition=easing.easeInOutElastic})
	   --transition.to(hintSquare_2,{time = 1000, delay = 19000,alpha = 0})
	localGroup:insert(hintSquare_2);
	 end
	end
	hint_2()
	--]]
	
	--   Add_Number
	local function Hand_Help ()
	local Add_Number = display.newImage("images/Add_Number.png", _W, _H);
    Add_Number.x = _W/2  - Add_Number .width/5;
	Add_Number.y = _H/2 + Add_Number.height/20;
	Add_Number.xScale = 0.5;
	Add_Number.yScale = 0.5;
	Add_Number.alpha = 0
	Add_Number.isVisible = Add_Number_Visible
	transition.to(Add_Number, {time = 1000,delay = 14000, alpha = 1 })
	localGroup:insert(Add_Number);
	
	pos_rightAnswer_x = pos_5_x
	--transition.to( btn_rightAnswer,{time = 1000,delay = 4000, alpha = 1})
	--btn_rightAnswer_Visible = true
	timer.performWithDelay( 17000,go_to_rightAnswer ,1 )
	
	
	local Hand_Help = display.newImage("images/Hand_Help.png", _W, _H);
    Hand_Help.x = _W/2 -  Hand_Help.width/5;
	Hand_Help.y = _H/2 - Hand_Help.height/5;
	Hand_Help.xScale = 0.5;
	Hand_Help.yScale = 0.5;
	Hand_Help.alpha = 0
	Hand_Help.isVisible = Hand_Help_Visible
	transition.to(Hand_Help,{time = 1000,delay = 15000, alpha = 0.5 })
	transition.to(Hand_Help,{time = 1000,delay = 16000, y = _H/2 + Hand_Help.height/1.2; alpha = 1 })
	transition.to(Hand_Help,{time = 1000,delay = 17500, y = _H/2 - Hand_Help.height/5; alpha = 0.5 })
	localGroup:insert(Hand_Help);
	end
    
	 local function go_to_Hand_Help ()
     Add_Number_Visible = true;
     Hand_Help_Visible = true
     Hand_Help ()
	 end
	 
	 go_to_Hand_Help ()
	--transition.to(Hand_Help,{time = 1000, y = _H/2 + Hand_Help.height/1.4;  delay = 15000, alpha = 1 })
	--transition.to(Hand_Help,{time = 1000, y = _H/2 - Hand_Help.height/4;  delay = 17000, alpha = 1 })
	--transition.to(Hand_Help,{time = 1000,  delay = 18000, alpha = 0 })
	--transition.to(Add_Number, {time = 1000,delay = 19000, alpha = 0 })
	--transition.to(Add_Number, {time = 1000,delay = 19000, alpha = 0 })
	--transition.to(btn_add1, {time = 1000,delay = 19000, alpha = 0 })
	--transition.to(btn_add2, {time = 1000,delay = 19000, alpha = 0 })
	--transition.from( btn_rightAnswer,{time = 1000,x = _W/2  - btn_rightAnswer.width*0.235,y = _H/2  +  btn_rightAnswer.height*3  ,delay = 16000, alpha = 0,transition=easing.easeInOutElastic})
	--transition.to(hintSquare_1,{time = 1000,delay = 19000,alpha = 0})
	
	
	--timer.performWithDelay( 18000, CLR_Help(),1 )
	
	--[[
	local  = display.newImage("images/.png", _W, _H);
    .x = _W/2  -  .width/5;
	.y = _H/2 + .height/20;
	.xScale = 0.5;
	.yScale = 0.5;
	.alpha = 0
	transition.to(, {time = 1000,delay = 11000, alpha = 1 })
	localGroup:insert();
	--]]
	
	--[[
	local hintSquare_3 = display.newImage("images/hintSquare_3.png", _W, _H);
	hintSquare_3.x = _W/2    - hintSquare_3.width/2
	hintSquare_3.y = _H/2     - hintSquare_3.height/1.5;
	hintSquare_3.xScale = 0.5;
	hintSquare_3.yScale = 0.5;
	localGroup:insert(hintSquare_3);
	--]]
	--[[
	for i = 1, 2 do
	local hintSquare_3 = display.newImage("images/hintSquare_3.png", _W, _H);
	hintSquare_3.x = (_W/2  +  ( i * 32) - 2*hintSquare_3.width + hintSquare_3.width/2.5)
	hintSquare_3.y = _H/2     - hintSquare_3.height/0.44;
	hintSquare_3.xScale = 0.5;
	hintSquare_3.yScale = 0.5;
	hintSquare_3.alpha = 0
	transition.from(hintSquare_3,{time = 1000, delay = 7000, y = -300,transition=easing.easeInOutElastic})
	--transition.from(hintSquare_3,{time = 1000, delay = 19000,alpha = 1,y = -300,transition=easing.easeInOutElastic})
	localGroup:insert(hintSquare_3);
	end
	--]]
	
	
	function changeScene(e)
		if(e.phase == "ended") then
			director:changeScene(e.target.scene);
		end
	end
	
	btn_back:addEventListener("touch", changeScene)
	--localGroup[grass]:removeSelf();
	return localGroup;
end