-----------------------------------------------------------------------------------------
--
-- main.lua
--
-------------------------------------------------------------------------------------------
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
menu.id = "menu"

local function onObjectTouch( self, event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. self.id )
    end
end

menu.touch = onObjectTouch
menu:addEventListener( "touch", menu )
