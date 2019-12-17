-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local background = display.newImageRect( "assets/images/background.png",display.contentWidth, display.contentHeight )
background.x = display.contentCenterX
background.y = display.contentCenterY

display.setStatusBar( display.HiddenStatusBar )

local ballon = display.newImageRect("assets/images/Ballon.png",display.contentWidth*0.06 ,display.contentHeight*0.2 )
ballon.x = display.contentCenterX*1.9
ballon.y = display.contentCenterY *1.40

local avatar = display.newImageRect("assets/images/stickstatic.png", display.contentWidth* 0.3, display.contentHeight*0.3)
avatar.x = display.contentCenterX * 0.22
avatar.y = display.contentCenterY * 1.5

local pijl = display.newImageRect("assets/images/pijl.png",display.contentWidth*0.1 ,display.contentHeight*0.1)
pijl.x = display.contentCenterX * 0.22
pijl.y = display.contentCenterY * 1.5

local box = display.newImageRect("assets/images/box.png", display.contentWidth*0.25 ,display.contentHeight*0.25)
box.x = display.contentCenterX * 1.7
box.y = display.contentCenterY * 1.55

local box1 = display.newImageRect("assets/images/box.png", display.contentWidth*0.25 , display.contentHeight*0.25)
box1.x = display.contentCenterX * 1.7
box1.y = display.contentCenterY * 1.31

local buis = display.newImageRect("assets/images/buis.png", display.contentWidth *0.2, display.contentHeight*1.5)
buis.x = display.contentCenterX
buis.y= display.contentCenterY*-0.5

local buis = display.newImageRect("assets/images/onderstebuis.png", display.contentWidth *0.2, display.contentHeight*1.5)
buis.x = display.contentCenterX
buis.y= display.contentCenterY*1.3

local grass = display.newImageRect("assets/images/grass.png", display.contentWidth*2.4 , display.contentHeight*0.25)
grass.x = display.contentCenterX * 0.18
grass.y = display.contentCenterY * 1.83

function zweef()
transition.to( ballon,{x=display.contentCenterX *1.9,y=display.contentCenterY *1.48,time=1500, onComplete = zweef2} )
end
function zweef2()
transition.to( ballon,{x=display.contentCenterX *1.9,y=display.contentCenterY *1.40,time=1500, onComplete = zweef} )
end
zweef()



-- 1 - Corona Engine Bibliotheken aanspreken

-- 2 - Vaste variablen aanmaken

-- 3 - Objecten aanmaken

-- 4 - Functies

-- 5 - Eventlisteners / andere interactieve zaken
