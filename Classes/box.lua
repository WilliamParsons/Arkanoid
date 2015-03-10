local RedBox = { HP=1, xPos=0, yPos=0};
function RedBox:new (o) --constructor
 o = o or {};
 setmetatable(o, self);
 self.__index = self;
 return o;
end
function RedBox:spawn()
self.shape=display.newRect(self.xPos, self.yPos,15);
self.shape.pp = self; -- parent object
self.shape.tag = self.tag; -- “enemy”
self.shape:setFillColor (1,0,0);
physics.addBody(self.shape, "static");
end

function Enemy:hit ()
	self.HP = self.HP - 1;
	if (self.HP == 0) then
	-- die
	self.shape:removeSelf();
	self.shape=nil;
	self = nil;
	end
end

-- local grid = {}
-- local numberyellow = 2
-- local numbergrey = 6
-- local rows = 4
-- local columns = 6
-- local gridentry = 0
-- local donewithyellow = 1
-- local donewithgrey = 1
-- local randomrow = 0
-- local randomcolumn = 0

-- for k = 1, rows do	
-- 	grid[k] = {}	
-- 	grid[k][1] = 0
-- 	grid[k][2] = 0
-- 	grid[k][3] = 0
-- 	grid[k][4] = 0
-- 	grid[k][5] = 0
-- 	grid[k][6] = 0
-- end
-- 	for k = 1, rows do		
-- 		for j = 1, columns do
-- 			if grid[k][j] == 0 then
-- 				grid[k][j] = math.random(1,2)
-- 			end
-- 		end
-- 	end

-- 	while numberyellow > 0 do
-- 			randomrow = math.random(1,4)
-- 			randomcolumn = math.random(1,6)
-- 			if grid[randomrow][randomcolumn] == 3 then
-- 				numberyellow = numberyellow + 1
-- 			else
-- 				print(grid[randomrow][randomcolumn], randomcolumn, randomrow)
-- 				grid[randomrow][randomcolumn] = 3
-- 				numberyellow = numberyellow - 1
-- 			end
-- 	end
-- 	while numbergrey > 0 do
-- 		randomrow = math.random(1,2)
-- 		randomcolumn = math.random(1,6)
-- 		if randomrow == 1 then
-- 			if grid[randomrow][randomcolumn] == 1 or grid[randomrow][randomcolumn]== 2 then 
-- 				--print(grid[randomrow][randomcolumn])
-- 				grid[2][randomcolumn] = 4
-- 				print(grid[2][randomcolumn], randomcolumn, randomrow)
-- 				numbergrey = numbergrey - 1
-- 			end
-- 			elseif randomrow == 2 then
-- 			if grid[randomrow][randomcolumn] == 1 or grid[randomrow][randomcolumn]== 2 then
-- 		 	--print(grid[randomrow][randomcolumn])
-- 				grid[4][randomcolumn] = 4
-- 		 		print(grid[4][randomcolumn], randomcolumn, randomrow)
-- 		 		numbergrey = numbergrey - 1
-- 		 	end
-- 		end
-- 	end

-- 	for k = 1, rows do		
-- 		for j = 1, columns do
-- 			--print(grid[k][j])
-- 		end
-- 	end







		-- local function CreateRedBlock()
		-- 	local redbox = display.newRect( sceneGroup, xposition, yposition, 115, 50)
		-- 	redbox:setFillColor(1,0 ,0)
		-- 	redbox.redHP = 1
		-- 	physics.addBody( redbox, "static" );
		-- 	redbox.flip = 0
		-- 	local function redboxcollision(event)
		-- 		if redbox.redHP == 0 then 
		-- 			redbox:removeSelf()
		-- 		else
		-- 			redbox.redHP = redbox.redHP - 1
		-- 		end
		-- 	end 
		-- 	redbox:addEventListener( "collision", redboxcollision )
		-- 	return redbox
		-- end
		-- local function CreateBlueBlock()
		-- 	local bluebox = display.newRect( sceneGroup, xposition, yposition,115, 50)
		-- 	bluebox:setFillColor( 0, 0 ,1 )
		-- 	bluebox.blueHP = 2
		-- 	physics.addBody(bluebox, "static" );
		-- 	bluebox.flip = 0

		-- 	local function blueboxcollision(event)
		-- 		if bluebox.blueHP == 0 then 
		-- 			bluebox:removeSelf()
		-- 		else
		-- 			bluebox.blueHP = bluebox.blueHP - 1
		-- 		end
		-- 	end 
		-- 	bluebox:addEventListener( "collision", blueboxcollision )
		-- 	return bluebox
		-- end
		-- local function CreateYellowBlock()
		-- 	local yellowbox = display.newRect( sceneGroup, xposition, yposition,115, 50)
		-- 	yellowbox:setFillColor(1, 1, 0)
		-- 	physics.addBody( yellowbox, "static" );
		-- 	local function yellowboxcollision(event)
		-- 		while rows > 0 do 
		-- 			while j > 0 do
		-- 			--print(grid[rows][j])
		-- 				if grid[rows][j] == redbox then
		-- 					grid[rows][j] = Createbluebox
		-- 				end
		-- 			end
		-- 		end
		-- 	end
		-- 	yellowbox:addEventListener( "collision", yellowboxcollision )
		-- end
		-- local function CreateGreyBlock()
		-- 	local greybox = display.newRect( sceneGroup, xposition, yposition, 115, 50)
		-- 	greybox:setFillColor( .5,.5,.5 )
		-- 	physics.addBody( greybox, "static" );
		-- end
		-- local function CreateGrid()
		-- 	while rows > 0 do 
		-- 		while j > 0 do
		-- 			--print(grid[rows][j])
		-- 			if grid[rows][j] == 1 then
		-- 				grid[rows][j] = CreateRedBlock()
		-- 			elseif grid[rows][j] == 2 then 
		-- 				grid[rows][j] = CreateBlueBlock()
		-- 			elseif grid[rows][j] == 3 then
		-- 				grid[rows][j] = CreateYellowBlock()
		-- 			else
		-- 				grid[rows][j] = CreateGreyBlock()
		-- 			end
		-- 			j = j - 1
		-- 			xposition = xposition + 112
		-- 		end 
		-- 		j = columns
		-- 		rows = rows - 1
		-- 		xposition = 80
		-- 		yposition = yposition + 50
		-- 	end
		-- end
		return RedBox