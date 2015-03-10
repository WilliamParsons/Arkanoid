local physics = require("physics");
local composer = require("composer");
local RedBox = require("RedBox");
local BlueBox = require("BlueBox");
local YellowBox = require("YellowBox");
-- local lvl1 = require 'Gridlvl1'
-- physics.setDrawMode("hybrid");
physics.start();
physics.setGravity(0,0);



local life = 2;
local droplets=0;
local bounces=0;
local boxToCreate = 0
local rows = 4
local columns = 6
local xx = display.contentWidth / columns
local yy = display.contentHeight / rows
local xposition = 80
local yposition = 300
local composer = require("composer")
local scene = composer.newScene()
local j
j = columns
local totalgrey = 6
local totalyellow = 2

----------------------------------------------------------------------------------------------------
local grid = {}
local numberyellow = 2
local numbergrey = 6
local rows = 4
local columns = 6
local gridentry = 0
local donewithyellow = 1
local donewithgrey = 1
local randomrow = 0
local randomcolumn = 0

for k = 1, rows do	
	grid[k] = {}	
	grid[k][1] = 0
	grid[k][2] = 0
	grid[k][3] = 0
	grid[k][4] = 0
	grid[k][5] = 0
	grid[k][6] = 0
end
	for k = 1, rows do		
		for j = 1, columns do
			if grid[k][j] == 0 then
				grid[k][j] = math.random(1,2)
			end
		end
	end

	while numberyellow > 0 do
			randomrow = math.random(1,4)
			randomcolumn = math.random(1,6)
			if grid[randomrow][randomcolumn] == 3 then
				numberyellow = numberyellow + 1
			else
				--print(grid[randomrow][randomcolumn], randomcolumn, randomrow)
				grid[randomrow][randomcolumn] = 3
				numberyellow = numberyellow - 1
			end
	end
	while numbergrey > 0 do
		randomrow = math.random(1,2)
		randomcolumn = math.random(1,6)
		if randomrow == 1 then
			if grid[randomrow][randomcolumn] == 1 or grid[randomrow][randomcolumn]== 2 then 
				--print(grid[randomrow][randomcolumn])
				grid[2][randomcolumn] = 4
				--print(grid[2][randomcolumn], randomcolumn, randomrow)
				numbergrey = numbergrey - 1
			end
			elseif randomrow == 2 then
			if grid[randomrow][randomcolumn] == 1 or grid[randomrow][randomcolumn]== 2 then
		 	--print(grid[randomrow][randomcolumn])
				grid[4][randomcolumn] = 4
		 		--print(grid[4][randomcolumn], randomcolumn, randomrow)
		 		numbergrey = numbergrey - 1
		 	end
		end
	end
	grid[1][1] = 3

	for k = 1, rows do		
		for j = 1, columns do
			--print(grid[k][j])
		end
	end
------------------------------------------------------------------------------------------------------------------------------

-- "scene:create()"
function scene:create(event)

	local sceneGroup = self.view
		
	-- Initialize the scene here.
	-- Example: add display objects to "sceneGroup", add touch listeners, etc.
end


-- "scene:show()"
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		local top = display.newRect(sceneGroup,0,100,display.contentWidth, 20);
		local left = display.newRect(sceneGroup,0,0,20, display.contentHeight);
		local right = display.newRect(sceneGroup,display.contentWidth-20,0,20,display.contentHeight);
		local bottom = display.newRect(sceneGroup,0,display.contentHeight-20, display.contentWidth, 20);
		top.anchorX = 0;top.anchorY = 0;
		left.anchorX = 0;left.anchorY = 0;
		right.anchorX = 0;right.anchorY = 0;
		bottom.anchorX = 0;bottom.anchorY = 0;
		local show = display.newText (
       {text="Life: 2 Bounces:0",        
        x=display.contentCenterX, y=50,
        fontSize=30});

		physics.addBody( bottom, "static" );
		physics.addBody( top, "static" );
		physics.addBody( left, "static" );
		physics.addBody( right, "static" );

		local ball = display.newCircle (display.contentCenterX,
										display.contentCenterY-50, 20);

		physics.addBody (ball, "dynamic", {bounce=1, radius=20} );

		ball:applyForce(math.random(1,4),10,ball.x,ball.y);
		-----------Paddle

		local paddle = display.newRect (display.contentCenterX, display.contentHeight-100, 200, 20);
		physics.addBody( paddle, "kinematic");


		local function move ( event )
		  if event.phase == "began" then		
		    paddle.markX = paddle.x 
		  elseif event.phase == "moved" then	 	
		    local x = (event.x-event.xStart) + paddle.markX;
		    paddle.x = x;		
		  end
		end

		Runtime:addEventListener("touch", move);




			local function CreateGreyBlock()
			local greybox = display.newRect( sceneGroup, xposition, yposition, 115, 50)
			greybox:setFillColor( .5,.5,.5 )
			physics.addBody( greybox, "static" );
		end

		local function CreateGrid()
			while rows > 0 do 
				while j > 0 do
					--print(grid[rows][j])
					if grid[rows][j] == 1 then
						grid[rows][j] = RedBox:new({HP = 1, xPos = xposition, yPos = yposition, row = rows, column = j})
						grid[rows][j]:spawn()
					elseif grid[rows][j] == 2 then 
						grid[rows][j] = BlueBox:new({HP = 2, xPos = xposition, yPos = yposition})
						grid[rows][j]:spawn()
					elseif grid[rows][j] == 3 then
						grid[rows][j] = YellowBox:new({HP = 1, xPos = xposition, yPos = yposition})
						grid[rows][j]:spawn()
					else
						grid[rows][j] = CreateGreyBlock()
					end
					j = j - 1
					xposition = xposition + 112
				end 
				j = columns
				rows = rows - 1
				xposition = 80
				yposition = yposition + 50
			end
		end

		CreateGrid()

		-------------------------------------------
		-- Handle collision:  ball vs paddle


		local function ballCollision (event)
			-- print(event.other)
		  if (event.phase == "began") then		
		    if (event.other == paddle) then
				bounces=bounces+1;
				show.text = "Life:"..life.." Bounces:"..bounces;
			elseif (event.other == bottom) then
				
				life = life - 1;
				show.text = "Life:"..life.."Bounces:"..bounces;
				if (life==0) then
					show.text = "You are dead:Bounces:"..bounces;
					ball:removeSelf();
					ball=nil; 
				end
			elseif(event.other.tag == "red") then
					event.other:removeSelf()
			end 
			elseif(event.other.tag == 'blue') then 
				-- print(event.other.pp.HP)
				event.other.pp:hit()
				if event.other.pp.HP == 0 then
					event.other:removeSelf()
				end
			end
			if(event.phase == "ended") then
				if(event.other.tag == 'yellow') then 
				-- print(event.other.pp.HP)
				event.other.pp:hit()
				if event.other.pp.HP == 0 then
					event.other:removeSelf()
				end
				local i = 4
				local j = 6
				while i > 0 do 
					while j > 0 do
						--if grid[i][j] ~= nil then
							if grid[i][j] == 'red' then
								grid[i][j]:flip()
							elseif grid[i][j] == 'blue' then 
								grid[i][j].pp:flip( 1,0,0 )
							end
						--end	
						j = j - 1
					end 
					i = i - 1
		 		end	
		 	end
		end
	end

		ball:addEventListener("collision", ballCollision);
------------------------------------------------------------------------

		-- Called when the scene is still off screen (but is about to come on screen).
	elseif ( phase == "did" ) then
		-- Called when the scene is now on screen.
		-- Insert code here to make the scene come alive.
		-- Example: start timers, begin animation, play audio, etc.
	end
end

-- "scene:hide()"
function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Called when the scene is on screen (but is about to go off screen).
		-- Insert code here to "pause" the scene.
		-- Example: stop timers, stop animation, stop audio, etc.
	elseif ( phase == "did" ) then
		-- Called immediately after scene goes off screen.
	end
end
-- "scene:destroy()"
function scene:destroy( event )



end

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )



return scene