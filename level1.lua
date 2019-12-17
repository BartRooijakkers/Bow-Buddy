-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

display.setStatusBar( display.HiddenStatusBar)


-- 1 - Corona Engine Bibliotheken aanspreken

-- 2 - Vaste variablen aanmaken

-- 3 - Objecten aanmaken



local background = display.newImageRect( "assets/images/background.png",display.contentWidth, display.contentHeight )
background.x = display.contentCenterX
background.y = display.contentCenterY

local wall = display.newImageRect("assets/images/bricks.png", display.contentWidth* 0.09, display.contentHeight *0.6)
wall.x = display.contentCenterX
wall.y = display.contentCenterY *1.1

local grass = display.newImageRect("assets/images/grass.png", display.contentWidth*2.4 , display.contentHeight*0.25)
grass.x = display.contentCenterX * 0.18
grass.y = display.contentCenterY * 1.83

local ballon = display.newImageRect("assets/images/Ballon.png",display.contentWidth * 0.1, display.contentHeight *0.3 )
ballon.x = display.contentCenterX *1.8
ballon.y = display.contentCenterY *1.47

local avatar = display.newImageRect("assets/images/stickstatic.png", display.contentWidth* 0.3, display.contentHeight*0.3)
avatar.x = display.contentCenterX * 0.15
avatar.y = display.contentCenterY * 1.5


function zweef()
transition.to( ballon,{x=display.contentCenterX *1.8,y=display.contentCenterY *1.48,time=1500, onComplete = zweef2} )
end
function zweef2()
transition.to( ballon,{x=display.contentCenterX *1.8,y=display.contentCenterY *1.40,time=1500, onComplete = zweef} )
end
zweef()

-- 4 - Functies



-- 5 - Eventlisteners / andere interactieve zaken
