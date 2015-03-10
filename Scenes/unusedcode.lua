		local function CreateBlueBlock()
			local bluebox = display.newRect( sceneGroup, xposition, yposition,115, 50)
			bluebox:setFillColor( 0, 0 ,1 )
			bluebox.blueHP = 2
			physics.addBody(bluebox, "static" );
			bluebox.flip = 0

			local function blueboxcollision(event)
				if bluebox.blueHP == 0 then 
					bluebox:removeSelf()
				else
					bluebox.blueHP = bluebox.blueHP - 1
				end
			end 
			bluebox:addEventListener( "collision", blueboxcollision )
			return bluebox
		end
		local function CreateYellowBlock()
			local yellowbox = display.newRect( sceneGroup, xposition, yposition,115, 50)
			yellowbox:setFillColor(1, 1, 0)
			physics.addBody( yellowbox, "static" );
			local function yellowboxcollision(event)
				while rows > 0 do 
					while j > 0 do
					--print(grid[rows][j])
						if grid[rows][j] == redbox then
							grid[rows][j] = Createbluebox
						end
					end
				end
			end
			yellowbox:addEventListener( "collision", yellowboxcollision )
		end
			local function redboxcollision(event)
				print("hit")
				RedBox:Hit()
			end 