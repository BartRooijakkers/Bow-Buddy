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

local ground = display.newImageRect("assets/images/biggrond.png", display.contentWidth, display.contentHeight *0.75)
ground.x =display.contentCenterX
ground.y =display.contentCenterY *2.3

local ballon = display.newImageRect("assets/images/Ballon.png",display.contentWidth * 0.1, display.contentHeight *0.3 )
ballon.x = display.contentCenterX *1.8
ballon.y = display.contentCenterY *1.47


function zweef()
transition.to( ballon,{x=display.contentCenterX *1.8,y=display.contentCenterY *1.48,time=1500, onComplete = zweef2} )
end
function zweef2()
transition.to( ballon,{x=display.contentCenterX *1.8,y=display.contentCenterY *1.40,time=1500, onComplete = zweef} )
end
zweef()
-- 4 - Functies



-- 5 - Eventlisteners / andere interactieve zaken
