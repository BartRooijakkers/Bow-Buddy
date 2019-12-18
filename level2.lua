-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
display.setStatusBar( display.HiddenStatusBar )
local physics = require("physics")
physics.setDrawMode( "hybrid" )
local background = display.newImageRect( "assets/images/background.png",display.contentWidth, display.contentHeight )
background.x = display.contentCenterX
background.y = display.contentCenterY
physics.start()
physics.setGravity( 0,9.8 )

local borderLinks = display.newRect( display.contentCenterX*-0.1, display.contentCenterY * 1, display.contentWidth*0.1, display.contentHeight*1.1 )
borderLinks.isVisible = false
physics.addBody( borderLinks, "static")

local borderRechts = display.newRect( display.contentCenterX*2.5, display.contentCenterY *1, display.contentWidth*0.1, display.contentHeight*1.1 )
borderRechts.isVisible = false
physics.addBody( borderRechts, "static")

local borderTop = display.newRect( display.contentCenterX, display.contentCenterY*-0.1, display.contentWidth*1.1, display.contentHeight*0.1 )
borderTop.isVisible = false
physics.addBody( borderTop, "static")


local grass = display.newImageRect("assets/images/grass.png", display.contentWidth*2.4 , display.contentHeight*0.16)
grass.x = display.contentCenterX * 0.18
grass.y = display.contentCenterY * 1.86

physics.addBody( grass, "static", { friction=0.3, density=0.8 } )

local ballon = display.newImageRect("assets/images/Ballon.png",display.contentWidth*0.06 ,display.contentHeight*0.3 )
ballon.x = display.contentCenterX*1.9
ballon.y = display.contentCenterY *1.40
physics.addBody( ballon, "static", { friction=0.0, density=0.5 } )

local avatar = display.newImageRect("assets/images/stickstatic.png", display.contentWidth* 0.3, display.contentHeight*0.3)
avatar.x = display.contentCenterX * 0.22
avatar.y = display.contentCenterY * 1.5

local pijl = display.newImageRect("assets/images/pijl.png",display.contentWidth*0.1 ,display.contentHeight*0.1)
pijl.x = display.contentCenterX * 0.22
pijl.y = display.contentCenterY * 1.5



local buis = display.newImageRect("assets/images/buis.png", display.contentWidth *0.1, display.contentHeight*0.4)
buis.x = display.contentCenterX
buis.y= display.contentCenterY*0.3

physics.addBody(buis, "static", { friction=0.3, density=0.5 } )

local onderstebuis = display.newImageRect("assets/images/onderstebuis.png", display.contentWidth *0.1, display.contentHeight*0.3)
onderstebuis.x = display.contentCenterX
onderstebuis.y= display.contentCenterY*1.4

physics.addBody( onderstebuis, "static", { friction=0.3, density=0.5 } )



local buddy = display.newImageRect( "assets/images/buddy.png",display.contentWidth*0.05 ,display.contentHeight*0.12)
buddy.x = display.contentCenterX * 0.1
buddy.y = display.contentCenterY * 1.2




function zweef()
transition.to( ballon,{x=display.contentCenterX *1.9,y=display.contentCenterY *1.48,time=1500, onComplete = zweef2} )
end
function zweef2()
transition.to( ballon,{x=display.contentCenterX *1.9,y=display.contentCenterY *1.40,time=1500, onComplete = zweef} )
end
zweef()

function buddyup()
  transition.to( buddy,{x=display.contentCenterX *0.1,y=display.contentCenterY *1.23,time=750, onComplete = buddydown} )
end
function buddydown()
  transition.to( buddy,{x=display.contentCenterX *0.1,y=display.contentCenterY *1.21,time=750, onComplete = buddyup} )
end
buddyup()

-- 1 - Corona Engine Bibliotheken aanspreken

-- 2 - Vaste variablen aanmaken

-- 3 - Objecten aanmaken

-- 4 - Functies

-- 5 - Eventlisteners / andere interactieve zaken
