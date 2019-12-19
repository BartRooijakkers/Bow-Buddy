local composer = require( "composer" )

local scene = composer.newScene()

local prevScene = composer.getSceneName( "previous" )

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------


    local function main ()
      composer.gotoScene( "menu" )
      print("logging")
    end

    local function changeSceneslevel1 ()
      composer.gotoScene("level11")
    end

    local function changeSceneslevel2 ()
      composer.gotoScene("level22")
    end
-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    local background = display.newImageRect( "assets/images/background.png",display.contentWidth, display.contentHeight )
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    --menu knop
    local menu = display.newImageRect("assets/images/buttons/menu.png", display.contentWidth* 0.15, display.contentHeight *0.15)
    menu.x = display.contentCenterX * 0.25
    menu.y = display.contentCenterY * 0.25

    menu:addEventListener("tap", main)

    --level 1
    local level1 = display.newImageRect("assets/images/buttons/level1.png", display.contentWidth* 0.3, display.contentHeight *0.3)
    level1.x = display.contentCenterX * 0.66
    level1.y = display.contentCenterY * 1

    level1:addEventListener("tap", changeSceneslevel1)

    --level 2
    local level2 = display.newImageRect("assets/images/buttons/level2.png", display.contentWidth* 0.3, display.contentHeight *0.3)
    level2.x = display.contentCenterX * 1.33
    level2.y = display.contentCenterY * 1

    level2:addEventListener("tap", changeSceneslevel2)

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
