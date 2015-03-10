local composer = require("composer")
local scene = composer.newScene()
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

		-- Called when the scene is still off screen (but is about to come on screen).
	elseif ( phase == "did" ) then
		local startbutton = display.newRect(sceneGroup, display.contentWidth/2, display.contentHeight/2, 450, 150 )
		local starttext = display.newText( sceneGroup, "Start", display.contentWidth/2, display.contentHeight/2, system.NativeFont, 100 )
		starttext:setFillColor( 0,0,0 )
		local function startlevelone ()
			composer.gotoScene("Scenes.levelone")
		end
		startbutton:addEventListener("tap", startlevelone)
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