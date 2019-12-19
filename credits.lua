local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
local function main ()
  composer.removeScene( "credits" )
  composer.gotoScene( "menu" )
  print("logging")
end
-- create()
function scene:create( event )

        local sceneGroup = self.view
        local w,h = display.contentWidth, display.contentHeight
        local int = -1000

        Credits = [[Design
        level design Wesley van de Slikke  Bart Rooijakkers
        Animaties Dane Schuijt
        Textures Bart Rooijakkers
        Characters Dane Schuijt

        Game
        Levels Dane Schuijt/ Bart Rooijakkers
        Schieten Dane Schuijt
        Menu Daan Borst
        ]]


        local options = {
           text = Credits,
           x = display.contentCenterX,
           fontSize = 50,
           width = display.contentWidth,
           height = 0,
           align = "center"
        }

        local myText = display.newText(options)
        myText:setFillColor( 0, 255, 50 )
        transition.to( myText, { time=5000, y=(h-int)} )

        local menu = display.newImageRect("assets/images/buttons/menu.png", display.contentWidth* 0.15, display.contentHeight *0.15)
        menu.x = display.contentCenterX * 0.25
        menu.y = display.contentCenterY * 0.25

        menu:addEventListener("tap", main)

        sceneGroup:insert( myText )
        sceneGroup:insert( menu )
end
--
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
