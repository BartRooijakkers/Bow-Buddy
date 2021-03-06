local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

local function changeScenes ()
  composer.removeScene("menu")
  composer.gotoScene("levelcom")
end

local function naarcredits ()
  composer.removeScene("menu")
  composer.gotoScene("credits")
  print("oke")
end
  audio.play(muziek)
-- create()
function scene:create( event )
    display.setStatusBar( display.HiddenStatusBar)
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    local background = display.newImageRect( "assets/images/background.png",display.contentWidth, display.contentHeight )
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    local grass = display.newImageRect("assets/images/grass.png", display.contentWidth*2.4 , display.contentHeight*0.25)
    grass.x = display.contentCenterX * 0.18
    grass.y = display.contentCenterY * 1.83

    local avatar = display.newImageRect("assets/images/stickstatic.png", display.contentWidth* 0.3, display.contentHeight*0.3)
    avatar.x = display.contentCenterX * 0.15
    avatar.y = display.contentCenterY * 1.5


    --level knop
    local button = display.newImageRect( "assets/images/buttons/levels.png", display.contentWidth*0.15, display.contentHeight*0.15 )
    button.x = display.contentCenterX * 0.98
    button.y = display.contentCenterY * 1

    button:addEventListener("tap", changeScenes)

    --opties knop
    local opties = display.newImageRect( "assets/images/buttons/opties.png", display.contentWidth*0.15 , display.contentHeight*0.15 )
    opties.x = display.contentCenterX / 1.02
    opties.y = display.contentCenterY / 0.75

    --credits knop
    local credits = display.newImageRect( "assets/images/buttons/credits.png", display.contentWidth*0.15 , display.contentHeight*0.15 )
    credits.x = display.contentCenterX / 1.02
    credits.y = display.contentCenterY / 0.6

    credits:addEventListener("tap", naarcredits)


    sceneGroup:insert( background )
    sceneGroup:insert( grass )
    sceneGroup:insert( avatar  )
    sceneGroup:insert( button )
    sceneGroup:insert( opties )
    sceneGroup:insert( credits )

end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
