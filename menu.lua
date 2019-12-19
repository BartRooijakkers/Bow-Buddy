-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------
local composer = require( "composer" )
-- Your code here

display.setStatusBar( display.HiddenStatusBar)

-- 1 - Corona Engine Bibliotheken aanspreken

-- 2 - Vaste variablen aanmaken

-- 3 - Objecten aanmaken


local background = display.newImageRect( "assets/images/background.png",display.contentWidth, display.contentHeight )
background.x = display.contentCenterX
background.y = display.contentCenterY

local grass = display.newImageRect("assets/images/grass.png", display.contentWidth*2.4 , display.contentHeight*0.25)
grass.x = display.contentCenterX * 0.18
grass.y = display.contentCenterY * 1.83

local avatar = display.newImageRect("assets/images/stickstatic.png", display.contentWidth* 0.3, display.contentHeight*0.3)
avatar.x = display.contentCenterX * 0.15
avatar.y = display.contentCenterY * 1.5

-- Create button

--level knop
local button = display.newImageRect( "assets/images/buttons/levels.png", display.contentWidth*0.15, display.contentHeight*0.15 )
button.x = display.contentCenterX * 0.98
button.y = display.contentCenterY * 1.20
button.id = "levels"

local function onObjectTouch( self, event )


    composer.gotoScene("level")
    composer.removeScene("main")    
end
--returnmenu true


button.touch = onObjectTouch
button:addEventListener( "touch", button )


--opties knop
local opties = display.newImageRect( "assets/images/buttons/opties.png", display.contentWidth*0.15 , display.contentHeight*0.15 )
opties.x = display.contentCenterX / 1.02
opties.y = display.contentCenterY / 0.65
opties.id = "opties"

local function onObjectTouch( self, event )
  if ( event.phase == "began" ) then
    print( "Touch event began on: " .. self.id )
  end
--returnmenu true
end

opties.touch = onObjectTouch
opties:addEventListener( "touch", opties )

-- 4 - Functies

-- 5 - Eventlisteners / andere interactieve zaken
