module(..., package.seeall)
  local director = require("director");
  local easing    = require("easing")
  local factory  = require("factory")
function new()
    print ("Hello YR Help_Hand   ")
   
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
	local pos_rightAnswer_x
	
	
	local rnd1
	local rnd2
	local rnd_sum
	--local Alpha = 1
	
	local i
	local j
	local h
	local k
	--local m
	--local n
	local  hintSquare_1_N = 3
	local  hintSquare_2_N = 2
	local  hintSquare_3 = 3
	local  hintSquare_4 = 2
	--[[
	local btn_rightAnswer_Visible = false
	local Add_Number_Visible      = false
	local Hand_Help_Visible       = false
	local Bubble_plus_Visible     = false
	local hintPanel_small_Visible = false
	local hintSquare_1_Visible    = false
	local hintSquare_2_Visible    = false
	local btn_add1_Visible        = false
    local btn_add2_Visible        = false
	local wrong_answ_Visible       = true
   -- local starsGame_0_Visible     = true
	--]]
	
	--Prepare sounds to be played or accessed
	local soundtrack = audio.loadStream("media/soundtrack.caf");
	local pop_sound = audio.loadSound("media/pop.caf");
	local win_sound = audio.loadSound("media/win.caf");
	local fail_sound = audio.loadSound("media/fail.caf");
	
	
	
	
function start_game()
timer.performWithDelay( 22000, game )
end

    function game()
	  
      RND()
	  print ("RND 1",rnd1)
	  print ("RND 2",rnd2)
	  btn_add1.x =( _W/10)*rnd1 - (_W/20)
	  btn_add2.x =( _W/10)*rnd2 - (_W/20)
	  btn_add1.alpha = 1
      btn_add2.alpha = 1
    end
	
   function RND()
     print ("Start Game")
	   rnd1 = math.random( 1, 10 )
	   rnd_temp = 10 - rnd1
       rnd2 = math.random( 1, rnd_temp ) 
	   rnd_sum = rnd1 + rnd2
    end


	-- **************   bg
	local bg = display.newImage("images/bg_a.png", _W, _H);
	bg:setReferencePoint(display.CenterReferencePoint);
	bg.x = _W/2;
	bg.y = _H/2;
	localGroup:insert(bg);
   
	-- ***********  btn_back
	local btn_back = display.newImage("images/btn_back.png", _W, 75);
	btn_back:setReferencePoint(display.CenterReferencePoint);
	btn_back.x = _W/2   - btn_back.width/0.95
	btn_back.y = _H/2   - btn_back.height/0.9;
	btn_back.xScale = 0.6;
	btn_back.yScale = 0.6;
	btn_back.alpha = 0
    btn_back.scene  = "Level_1";
    localGroup:insert(btn_back);
	
	-- ***** grass
	local grass = display.newImage("images/grass.png", _W, _H);
	grass:setReferencePoint(display.CenterReferencePoint); 
    grass.x = _W/2  --+  grass.width/5;
	grass.y = _H/2  + grass.height/5;
	grass.xScale = 0.5;
	grass.yScale = 0.5;
    localGroup:insert(grass);
	
	 -- ************  Bubble_plus

	local thoughtBubble_plus = display.newImage("images/thoughtBubble_plus.png", _W, _H);
	thoughtBubble_plus.x = _W/2    - thoughtBubble_plus.width/0.4;
	thoughtBubble_plus.y = _H/2    + thoughtBubble_plus.height/1;
	thoughtBubble_plus.xScale = 0.1;
	thoughtBubble_plus.yScale = 0.1;
	thoughtBubble_plus.alpha = 1
	--thoughtBubble_plus.isVisible = false
	localGroup:insert(thoughtBubble_plus);
	

	-- *********** Pig
	local pig = display.newImage("images/pig.png",_W,_H);
    pig.x = _W/2 - pig.width/2;
	pig.y = _H/2  + pig.height/4;
	pig.xScale = 0.4;
	pig.yScale = 0.4;
	transition.to(pig, {time = 1000, delay = 200, y = _H/2  + pig.height/8 })
	localGroup:insert(pig);  --5
		
	-- ***********  Level_Enable
	for i = 1, 10 do
	print (" Level_Enable",i)
	local level_enabled = display.newImage("images/level_enabled.png", _W, _H);
	level_enabled.xScale = 0.5;
    level_enabled.yScale = 0.5;
	level_enabled.x = _W/10*i -_W/20
	level_enabled.y   = _H/2  +  level_enabled.height*1.38;
	localGroup:insert(level_enabled);
	end
	
	
	-- **** Stars_0 3
	local starsGame_0 = display.newImage("images/starsGame_0.png", _W, _H);
	starsGame_0:setReferencePoint(display.CenterReferencePoint);
	starsGame_0.x = _W/2   +  starsGame_0.width*1.6
	starsGame_0.y = _H/2   - starsGame_0.height*1.1;
	starsGame_0.xScale = 0.5;
	starsGame_0.yScale = 0.5;
	starsGame_0.alpha = 0
	--starsGame_0.isVisible = false
	localGroup:insert(starsGame_0);
	
	local starsGame_1 = display.newImage("images/starsGame_1.png", _W, _H);
	starsGame_1:setReferencePoint(display.CenterReferencePoint);
	starsGame_1.x = _W/2   +  starsGame_1.width*1.6
	starsGame_1.y = _H/2   - starsGame_0.height*1.1;
	starsGame_1.xScale = 0.5;
	starsGame_1.yScale = 0.5;
	starsGame_1.alpha = 0
	--starsGame_1.isVisible = false
	localGroup:insert(starsGame_1);  --8
	
	local starsGame_2 = display.newImage("images/starsGame_2.png", _W, _H);
	starsGame_2:setReferencePoint(display.CenterReferencePoint);
	starsGame_2.x = _W/2   +  starsGame_2.width*1.6
	starsGame_2.y = _H/2   - starsGame_2.height*1.1;
	starsGame_2.xScale = 0.5;
	starsGame_2.yScale = 0.5;
	starsGame_2.alpha = 0
	--starsGame_2.isVisible = false
	localGroup:insert(starsGame_2);
	
	local starsGame_3 = display.newImage("images/starsGame_3.png", _W, _H);
	starsGame_3:setReferencePoint(display.CenterReferencePoint);
	starsGame_3.x = _W/2   +  starsGame_3.width*1.6
	starsGame_3.y = _H/2   - starsGame_3.height*1.1;
	starsGame_3.xScale = 0.5;
	starsGame_3.yScale = 0.5;
	starsGame_3.alpha = 0
	--starsGame_3.isVisible = false
	localGroup:insert(starsGame_3);
	
	
	--****************  btn_add1 
    btn_add1 = display.newImage("images/btn_add1.png", _W, _H);
	btn_add1:setReferencePoint(display.CenterReferencePoint);
	btn_add1.x = _W/2   - btn_add1.width*1.8
	btn_add1.y = _H/2   + btn_add1.height*1.44;
	btn_add1.xScale = 0.45;
	btn_add1.yScale = 0.45;
	btn_add1.alpha = 1
	--btn_add1.isVisible = btn_add1_Visible
	localGroup:insert(btn_add1);   --11
	
	
	--*************  btn_add2
    btn_add2 = display.newImage("images/btn_add2.png", _W, _H);
	print ("TEST BTN_ADD2")
	btn_add2:setReferencePoint(display.CenterReferencePoint);
	btn_add2.x =  _W/2   - btn_add2.width*1.3
	btn_add2.y = _H/2   + btn_add2.height*1.44;
	btn_add2.xScale = 0.45;
	btn_add2.yScale = 0.45;
	btn_add2.alpha = 1
	--btn_add2.isVisible = btn_add2_Visible
    localGroup:insert(btn_add2);
	 -- btn_add2.scene  = "";

	  
	   btn_rightAnswer = display.newImage("images/btn_rightAnswer.png", _W, _H);
	 print ("btn_rightAnswer")
	 btn_rightAnswer:setReferencePoint(display.CenterReferencePoint);
	 btn_rightAnswer.x = _W/2  - btn_rightAnswer.width*0.235
	 btn_rightAnswer.y = _H/2  +  btn_rightAnswer.height*1.38;
	 btn_rightAnswer.xScale = 0.45;
	 btn_rightAnswer.yScale = 0.45;
	 btn_rightAnswer.alpha = 0;
	 localGroup:insert( btn_rightAnswer);    -- 13
	 
	 
	 
	 
	 -- ***********  N 1 - 10
        local N_1  = display.newImage ("images/N_1.png");
		print (" N_ =  1");
		N_1.xScale = 0.8;
	    N_1.yScale = 0.8;
	    N_1.x =  pos_1_x; 
		N_1.y =  pos_1_y;      
		transition.from(N_1,{time = 2000, delay = 1000,y = 500,transition=easing.easeInOutElastic})
		N_1:addEventListener("tap",N_1 )
        localGroup:insert(N_1);   --14
		
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
        localGroup:insert(N_7);     --20
		
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
        localGroup:insert(N_10); -- 23
		--
        function N_1:tap(event)
	     if rnd_sum == 1 then    
			rightAnsw()
		 end
			print ("GO_N_1")
	   end
	  
	
	   function N_2:tap(event)
	    if rnd_sum == 2 then
		rightAnsw()
		end
			print ("GO_N_2")
	  end
	  
	
	   function N_3:tap(event)
	    if rnd_sum == 3 then
		 rightAnsw()   
		end
	        print ("GO_N_3")
	   end
	   
	 
	
	
	   function N_4:tap(event)
	    if rnd_sum == 4 then
		   rightAnsw()
		end
	       print ("GO_N_4")
	  end
	  
      
	
	   function N_5:tap(event)
	    if rnd_sum == 5 then
		   rightAnsw()
		end
	       print ("GO_N_5")
	   end
	   
	    
	   
	
	   function N_6:tap(event)
	    if rnd_sum == 6 then
		   rightAnsw()
		end
	   print ("GO_N_6")
	  end
	  
	 
	
	   function N_7:tap(event)
	    if rnd_sum == 7 then
		 rightAnsw()
		end
	     print ("GO_N_7")
	   end
	    
	
	   function N_8:tap(event)
	    if rnd_sum == 8 then
		 rightAnsw()
		end
	   print ("GO_N_8")
	  end  
	  
	   function N_9:tap(event)
	    if rnd_sum == 9 then
		rightAnsw()
	    end
	    print ("GO_N_9")
	   end
	   
	
	  function N_10:tap(event)
	    if rnd_sum == 10 then
		rightAnsw()
	    end
	   print ("GO_N_10")
	  end
	   
	
	--****  btn_rightAnswer
	 function rightAnsw()
	 btn_rightAnswer1 = display.newImage("images/btn_rightAnswer.png", _W, _H);
	 print ("btn_rightAnswer")
	 btn_rightAnswer1:setReferencePoint(display.CenterReferencePoint);
	 btn_rightAnswer1.x = ( _W/10)*rnd_sum - (_W/20)
	 btn_rightAnswer1.y = _H/2 +  btn_rightAnswer.height*1.38;
	 btn_rightAnswer1.xScale = 0.45;
	 btn_rightAnswer1.yScale = 0.45;
	 btn_rightAnswer1.alpha = 0.5;
	 localGroup:insert( btn_rightAnswer1);    -- 13
	 end
	-- btn_rightAnswer.isVisible =  btn_rightAnswer_Visible
	-- btn_add2.scene  = "";
	 
	  
	  
	  
	    -- *********** hintPanel_small
	    local hintPanel_small = display.newImage("images/hintPanel_small.png", _W, _H); 
        hintPanel_small.x = _W/2  -- +  hintPanel_small.width/1
	    hintPanel_small.y = _H/2   - hintPanel_small.height/1.5
	    hintPanel_small.xScale = 0.5;
        hintPanel_small.yScale = 0.5;
		hintPanel_small.alpha = 1;
		--hintPanel_small.isVisible = hintPanel_small_Visible;
		localGroup:insert(hintPanel_small);  --24
		
	--******* hintSquare_1
	for i = 1, hintSquare_1_N do
	local hintSquare_1 = display.newImage("images/hintSquare_1.png", _W, _H);
	hintSquare_1.x = _W/2   +  ( i * 32) - 2*hintSquare_1.width + hintSquare_1.width/2.5
	hintSquare_1.y = _H/2   - hintSquare_1.height/0.58;
	hintSquare_1.xScale = 0.5;
	hintSquare_1.yScale = 0.5;
	hintSquare_1.alpha = 1;
	--hintSquare_1.isVisible = hintSquare_1_Visible;
	 transition.from(hintSquare_1,{time = 1000,delay = 8000, y = -300,transition=easing.easeInOutElastic}); -- 700
	 transition.from(hintSquare_1,{time = 10,delay = 17000,y = -300,transition=easing.easeInOutElastic}); -- 700
	localGroup:insert(hintSquare_1);
    end
	
	--******* hintSquare_2
    for j = 1, hintSquare_2_N do
	local hintSquare_2 = display.newImage("images/hintSquare_2.png", _W, _H);
	hintSquare_2.x = _W/2  +  ( j * 32) - 2*hintSquare_2.width + hintSquare_2.width/2.5
	hintSquare_2.y = _H/2  - hintSquare_2.height/0.44;
	hintSquare_2.xScale = 0.5;
	hintSquare_2.yScale = 0.5;
	hintSquare_2.alpha = 1;
	--hintSquare_2.isVisible = hintSquare_2_Visible;
	 transition.from(hintSquare_2,{time = 1000, delay = 7000,  y = -300, transition=easing.easeInOutElastic});
	 transition.to(hintSquare_2,  {time = 10, delay = 17000, y = -300, transition=easing.easeInOutElastic});
	 localGroup:insert(hintSquare_2);
	end

	for h = 1, hintSquare_3 do
	local hintSquare_3 = display.newImage("images/hintSquare_3.png", _W, _H);
	hintSquare_3.x = _W/2   +  ( h * 32) - 2*hintSquare_3.width + hintSquare_3.width/2.5
	hintSquare_3.y = _H/2   - hintSquare_3.height/0.58;
	hintSquare_3.xScale = 0.5;
	hintSquare_3.yScale = 0.5;
	hintSquare_3.alpha = 1;
	--hintSquare_1.isVisible = hintSquare_1_Visible;
	 transition.from(hintSquare_3,{time = 1000,delay = 17000, y = -300,transition=easing.easeInOutElastic});
	 transition.to(hintSquare_3,  {time = 10,delay = 20000, y = -300,transition=easing.easeInOutElastic});
	localGroup:insert(hintSquare_3);
    end
	
	for k = 1, hintSquare_4 do
	local hintSquare_4 = display.newImage("images/hintSquare_3.png", _W, _H);
	hintSquare_4.x = _W/2   +  ( k * 32) - 2*hintSquare_4.width + hintSquare_4.width/2.5
	hintSquare_4.y = _H/2   - hintSquare_4.height/0.44;
	hintSquare_4.xScale = 0.5;
	hintSquare_4.yScale = 0.5;
	hintSquare_4.alpha = 1;
	--hintSquare_1.isVisible = hintSquare_1_Visible;
	transition.from(hintSquare_4,{time = 1000,delay = 17000, y = -300, transition=easing.easeInOutElastic});
	transition.to  (hintSquare_4,{time = 10,delay = 20000, y = -300, transition=easing.easeInOutElastic});
	localGroup:insert(hintSquare_4);
    end
	
	
	local Add_Number = display.newImage("images/Add_Number.png", _W, _H);
    Add_Number.x = _W/2  - Add_Number .width/5;
	Add_Number.y = _H/2 + Add_Number.height/20;
	Add_Number.xScale = 0.5;
	Add_Number.yScale = 0.5;
	Add_Number.alpha = 0;
	--Add_Number.isVisible = Add_Number_Visible;
    localGroup:insert(Add_Number);
	
	
	local Hand_Help = display.newImage("images/Hand_Help.png", _W, _H);
    Hand_Help.x = _W/2 -  Hand_Help.width/5;
	Hand_Help.y = _H/2 - Hand_Help.height/5;
	Hand_Help.xScale = 0.5;
	Hand_Help.yScale = 0.5;
	Hand_Help.alpha = 0;
	--Hand_Help.isVisible = Hand_Help_Visible;
	localGroup:insert(Hand_Help);
	
	
	local Help_N_5 = display.newImage("images/Help_N_5.png", _W, _H);
	Help_N_5:setReferencePoint(display.CenterReferencePoint);
	Help_N_5.x = _W/2   - Help_N_5.width*1.8
	Help_N_5.y = _H/2   + Help_N_5.height*2.1;
	Help_N_5.xScale = 0.5;
	Help_N_5.yScale = 0.5;
	Help_N_5.alpha = 0
	--Help_N_5.isVisible = Help_N_5_Visible
	localGroup:insert(Help_N_5);
	
	--******   wrong_answ
	 local wrong_answ = display.newImage("images/wrong_answ.png", _W, _H);
	--wrong_answ:setReferencePoint(display.CenterReferencePoint);
	 wrong_answ.x =  pos_8_x   ---_W/2   -  wrong_answ.width*1;
	 wrong_answ.y =  pos_1_y   --_H/2   + wrong_answ.height*1.44;
	 wrong_answ.xScale = 0.45;
	 wrong_answ.yScale = 0.45;
	 wrong_answ.alpha = 0;
	 --wrong_answ.isVisible =  wrong_answ_Visible;
	 localGroup:insert( wrong_answ);
	
	 
	--play_btn
	local play_btn = display.newImage("images/play_btn.png", _W, _H);
	play_btn:setReferencePoint(display.CenterReferencePoint);
	play_btn.x = pos_1_x    --_W/2   -  play_btn.width*2;
	play_btn.y = _H/2        -- +  play_btn.height*1;
	play_btn.xScale = 0.1;
	play_btn.yScale = 0.1;
	play_btn.alpha = 0
	--play_btn.isVisible = play_btn_Visible
	play_btn:addEventListener("tap",play_btn )
	localGroup:insert(play_btn);
    
	--[[
	local  = display.newImage("images/.png", _W, _H);
	:setReferencePoint(display.CenterReferencePoint);
	.x = _W/2   - .width*1;
	.y = _H/2   +.height*1;
	.xScale = 0.45;
	.yScale = 0.45;
	.alpha = 1
	.isVisible = _Visible
	localGroup:insert();
	
	--]] 
	
	 
	 
	 
	
	
	
	-- *************transition
		 transition.to(btn_back, {time = 3000, delay = 1000, alpha = 1})
	     transition.to(grass, {time = 1000,delay = 200, y = _H/2 + grass.height/15 })
	   
	     transition.to(pig,                 {time = 1000, delay = 200, y = _H/2  + pig.height/8 })
	     transition.from(level_enabled,     {time = 1000,delay = 200, y = 340})
	     transition.to(starsGame_0,         {time = 3000, delay = 1000, alpha = 1,})
	     transition.from(btn_add1,          {time = 1000, delay = 7000, y = -300, transition=easing.easeInOutElastic})
		 transition.from(btn_add2,          {time = 1000, delay = 8000, y = -300,transition=easing.easeInOutElastic})
		 transition.from(hintPanel_small,   {time = 1000, delay = 6000,y = -300,transition=easing.easeInOutElastic});
	     transition.to(thoughtBubble_plus,  {time = 2000, delay = 8000, xScale = 1, yScale = 1, alpha = 1, x =  thoughtBubble_plus.width/1,  y =  thoughtBubble_plus.height/0.6})
	     transition.to(Add_Number,          {time = 1000, delay = 9000, alpha = 1 });
		 transition.to(Hand_Help,           {time = 1000, delay = 10000, alpha = 0.5 })
		 transition.to(Hand_Help,           {time = 1000, delay = 11000, x = pos_8_x; alpha = 1 })
		 transition.to(Hand_Help,           {time = 1000, delay = 12000, y = _H/2 + Hand_Help.height/1.2; alpha = 1 })
		 transition.to(wrong_answ,          {time = 100,  delay = 13000, alpha = 1 });
		 transition.to(Hand_Help,           {time = 1000, delay = 14000, y = _H/2 - Hand_Help.height/3; alpha = 1 })         
		 transition.to(Hand_Help,           {time = 1000, delay = 15000, x = pos_5_x; alpha = 1 })     
		 transition.to(Hand_Help,           {time = 1000, delay = 16000, y = _H/2 + Hand_Help.height/1.2; alpha = 1 })  
		 transition.to(Hand_Help,           {time = 1000, delay = 17000, y = _H/2 - Hand_Help.height/3;   alpha = 0 })  
		 transition.to(wrong_answ,          {time = 100,  delay = 17000, alpha = 0 });  
		 transition.to(Help_N_5,            {time = 1000, delay = 17000, alpha = 1 });
		 transition.to( btn_rightAnswer,    {time = 100,  delay = 17000,  alpha = 1});
		 transition.to(btn_add1,            {time = 1000, delay = 17000,  alpha = 0});  -- 
		 transition.to(btn_add2,            {time = 1000, delay = 17000,  alpha = 0});  -- 
		 transition.to(Add_Number,          {time = 1000, delay = 20000,  alpha = 0});
		 transition.to(Hand_Help,           {time = 1000, delay = 17000,  alpha = 0});
		 transition.to(Help_N_5,            {time = 2000, delay = 17000,  alpha = 0});
         transition.to(thoughtBubble_plus,  {time = 1000, delay = 10000,  alpha = 0});
		 transition.to(pig,                 {time = 1000, delay = 20000,  x = pos_2_x })
		  transition.to( btn_rightAnswer,    {time = 100,  delay = 20000,  alpha = 0});
		 
		  transition.to(hintPanel_small,   {time = 1000, delay = 19000,alpha = 0});
		 -- transition.to(hintPanel_small,   {time = 1000, delay = 20000,alpha = 1});
		 --transition.to(play_btn,            {time = 1000, delay = 20000, rotation = 360, xScale = 0.7, yScale = 0.7, x = pos_6_x, alpha = 1})
	
--timer.performWithDelay( 20000, go_main )

  function play_btn:tap(event) 
 print (" Yr I am in MMAIN")
 end

  function start()
 print ("Start Game")
 end
	
	function changeScene(e)
		if(e.phase == "ended") then
			director:changeScene(e.target.scene);
		end
	end
	
	btn_back:addEventListener("touch", changeScene)
	--localGroup[grass]:removeSelf();
start_game()
	return localGroup;
	
end
	
