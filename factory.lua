module(..., package.seeall)

function grass()
print(" Hello I am in Factory 1 ")
   --local localGroup = display.newGroup();

    grass = display.newImage("images/grass.png", _W, _H);
	grass:setReferencePoint(display.CenterReferencePoint); 
    grass.x = _W/2  --+  grass.width/5;
	grass.y = _H/2  
	grass.xScale = 2;
	grass.yScale = 2;
	--localGroup:insert(grass)

end

    function starsGame_0()
    
	local starsGame_0 = display.newImage("images/starsGame_0.png", _W, _H);
	starsGame_0:setReferencePoint(display.CenterReferencePoint);
	starsGame_0.x = _W/2   +  starsGame_0.width*1.6
	starsGame_0.y = _H/2   - starsGame_0.height*1.1;
	starsGame_0.xScale = 0.5;
	starsGame_0.yScale = 0.5;
	starsGame_0.alpha = 0
	transition.to(starsGame_0, {time = 3000, delay = 1000, alpha = 1})
	--starsGame_0.isVisible = false
	--localGroup:insert(starsGame_0);
	end


function newLetterButton(letter, isLowerCase, color)
	local background = display.newImage("images/buttons/"..color..".png")
	local letterGraphic
	if isLowerCase then
		letterGraphic = display.newImage("images/letters/lc/"..letter..".png")
	else
		letterGraphic = display.newImage("images/letters/uc/"..letter..".png")
	end
	local letterButton = {}
	letterButton.graphics = display.newGroup()
	letterButton.graphics:insert(background)
	letterButton.graphics:insert(letterGraphic)
	letterButton.letter = letter
	return letterButton	
end

function getRandomOrder(amount)
	local order ={}
	local i
	local temp
	local temp1
	for n = 1,amount do
		order[n] = n
	end
	for i=0,9 do
		for temp = 1,amount do
			n = math.random(1, amount)
			temp1 = order[temp]
			order[temp] = order[n]
			order[n] = temp1
		end
	end
	return order
end 

function getRandomLetters(numLetters, excludeLetter)
	local alphabet = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
	
	-- remove excluded letter
	local excludeIndex
	for i=1,#alphabet do
		if alphabet[i] == excludeLetter then
			excludeIndex = i
			alphabet[i] = nil
		end
	end
	table.remove(alphabet, excludeIndex)
	
	-- shuffle alphabet
	local randomLetterOrder = getRandomOrder(#alphabet)
	
	-- put selected letters into array
	local letters = {}
	for i=0,numLetters do
		letters[i] = alphabet[randomLetterOrder[i]]
	end
	
	return letters
end

function getRandomColors(numColors)
	local colors = {"blue","green","orange","purple","red","yellow"}
	local randomColorOrder = getRandomOrder(#colors)
	local randomColors = {}
	for i=1,numColors do
		randomColors[i] = colors[randomColorOrder[i]]
	end
	return randomColors
end