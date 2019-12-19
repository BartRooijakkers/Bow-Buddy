local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    -- Your code here

    display.setStatusBar( display.HiddenStatusBar)
    local physics = require("physics")
    local composer = require( "composer" )

    local scene = composer.newScene()
    physics.setDrawMode( "normal" )

    -- 1 - Corona Engine Bibliotheken aanspreken

    -- 2 - Vaste variablen aanmaken

    -- 3 - Objecten aanmaken

    local background = display.newImageRect( "assets/images/background.png",display.contentWidth, display.contentHeight )
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    physics.start()
    physics.setGravity( 0,9.8 )
    score = 0
    pijlen = 5
    local berekendPad = display.newGroup()


    local getTrajectoryPoint
    local pijlvuren




    local borderLinks = display.newRect( display.contentCenterX*-0.1, display.contentCenterY * 1, display.contentWidth*0.1, display.contentHeight*1.1 )
    borderLinks.isVisible = false
    physics.addBody( borderLinks, "static")
    borderLinks.myname = "borderLinks"

    local borderRechts = display.newRect( display.contentCenterX*2.5, display.contentCenterY *1, display.contentWidth*0.1, display.contentHeight*1.1 )
    borderRechts.isVisible = false
    physics.addBody( borderRechts, "static")
    borderRechts.myname = "borderRechts"

    local grass = display.newImageRect("assets/images/grass.png", display.contentWidth*2.4 , display.contentHeight*0.16)
    grass.x = display.contentCenterX * 0.18
    grass.y = display.contentCenterY * 1.86
    grass.myname = "grass"

    physics.addBody( grass, "static", { friction=0.3, density=0.8 } )

    local wall = display.newImageRect("assets/images/bricks.png", display.contentWidth* 0.09, display.contentHeight *0.6)
    wall.x = display.contentCenterX
    wall.y = display.contentCenterY *1.1
    physics.addBody( wall, "static", { friction=0.0, density=0.5 } )
    wall.myname = "Wall"


    local ballon = display.newImageRect("assets/images/Ballon.png",display.contentWidth*0.06 ,display.contentHeight*0.3 )
    ballon.x = display.contentCenterX*1.8
    ballon.y = display.contentCenterY *1.40
    physics.addBody( ballon, "static", { friction=0.0, density=0.5 } )
    ballon.myname = "ballon"


    local avatar = display.newImageRect("assets/images/stickstatic.png", display.contentWidth* 0.3, display.contentHeight*0.3)
    avatar.x = display.contentCenterX * 0.15
    avatar.y = display.contentCenterY * 1.5

    local function screenTouch( event )

        if ( event.phase == "moved" ) then


            display.remove( berekendPad )
            berekendPad = display.newGroup()

            local beginSnelheid = { x=event.x-event.xStart, y=event.y-event.yStart }

            for i = 1,240,2 do
                local s = { x=display.contentCenterX * 0.22, y=display.contentCenterY * 1.5 }
                local baanPos = getTrajectoryPoint( s, beginSnelheid, i )
                local dot = display.newCircle( berekendPad, baanPos.x, baanPos.y, 3 )
                dot:setFillColor(244, 164, 96 )
                if(dot.x > display.contentCenterX *0.85) then
                  dot.isVisible = false
                end
            end

        elseif ( event.phase == "ended") then
    if (pijlen >0) then
            pijlvuren( event )

          else
            print("game over")
        end
      end
        return true
    end
    Runtime:addEventListener( "touch", screenTouch )

    getTrajectoryPoint = function( beginPos, beginSnelheid, n )


        local t = 1/display.fps
        local snelheidStap = { x=t*beginSnelheid.x, y=t*beginSnelheid.y }
        local gx, gy = physics.getGravity()
        local zwaarteKracht = { x=t*gx, y=t*gy }


        return {
            x = beginPos.x + n * snelheidStap.x + 0.25 * (n*n+n) * zwaarteKracht.x,
            y = beginPos.y + n * snelheidStap.y + 0.25 * (n*n+n) * zwaarteKracht.y
        }
    end

    pijlvuren = function( event )

      -- Aanmaken van "Projectiel"
        local pijl = display.newImageRect("assets/images/pijl.png",display.contentWidth*0.12, display.contentHeight*0.03 )
        pijl.x = display.contentCenterX * 0.22
        pijl.y = display.contentCenterY * 1.5
        pijl.myname = "pijl"


        physics.addBody( pijl, { bounce=0.2, density=1.0, radius=24 } )


        local vx, vy = event.x-event.xStart, event.y-event.yStart

        pijl:setLinearVelocity( vx, vy )

        pijlen = pijlen - 1


    end




    function zweef()
    transition.to( ballon,{x=display.contentCenterX *1.8,y=display.contentCenterY *1.48,time=1500, onComplete = zweef2} )
    end
    function zweef2()
    transition.to( ballon,{x=display.contentCenterX *1.8,y=display.contentCenterY *1.40,time=1500, onComplete = zweef} )
    end



    zweef()

    local ammo =display.newText( pijlen, display.contentWidth * 0.12, display.contentHeight*0.12 )
    ammo.x = display.contentCenterX
    ammo.Y = display.contentCenterY
    ammo.text = pijlen


    local function onLocalCollision( self, event )
      function scorebereken()
      print(score)
      end


      function tellen()

        ammo.text = pijlen
      end

        if ( event.phase == "ended" and self.myname == "ballon" and event.other.myname == "pijl") then
          score = score + 1
          display.remove(self)
          display.remove(event.other)
          scorebereken()
          tellen()

    elseif ( event.phase == "began" and self.myname == "Wall" and event.other.myname == "pijl") then
        display.remove(event.other)
          tellen()
      elseif ( event.phase == "began" and self.myname == "borderRechts" and event.other.myname == "pijl") then
            display.remove(event.other)
              tellen()
          elseif ( event.phase == "began" and self.myname == "grass" and event.other.myname == "pijl") then
                display.remove(event.other)
                  tellen()
        end
    end







    ballon.collision = onLocalCollision
    ballon:addEventListener( "collision" )
    grass.collision = onLocalCollision
    grass:addEventListener( "collision" )
    wall.collision = onLocalCollision
    wall:addEventListener( "collision" )
    wall.collision = onLocalCollision
    wall:addEventListener( "collision" )
    borderRechts.collision = onLocalCollision
    borderRechts:addEventListener( "collision" )
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
