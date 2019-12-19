
local composer = require( "composer" )

local scene = composer.newScene("level")

local background = display.newImageRect( "assets/images/background.png",display.contentWidth, display.contentHeight )
background.x = display.contentCenterX
background.y = display.contentCenterY



--Menu knop

local menu = display.newImageRect("assets/images/buttons/menu.png", display.contentWidth* 0.15, display.contentHeight *0.15)
menu.x = display.contentCenterX * 0.25
menu.y = display.contentCenterY * 0.25
menu.id = "menu"

local function onObjectTouch( self, event )
    composer.gotoScene("main")
end

menu.touch = onObjectTouch
menu:addEventListener( "touch", menu )

--eerste level knop
local level1 = display.newImageRect("assets/images/buttons/level1.png", display.contentWidth* 0.3, display.contentHeight *0.3)
level1.x = display.contentCenterX * 0.66
level1.y = display.contentCenterY * 1
level1.id = "level 1"

local function level1Touch( self, event )
    composer.gotoScene("level1")
end

level1.touch = level1Touch
level1:addEventListener( "touch", level1 )


--tweede level knop
local level2 = display.newImageRect("assets/images/buttons/level2.png", display.contentWidth* 0.3, display.contentHeight *0.3)
level2.x = display.contentCenterX * 1.33
level2.y = display.contentCenterY * 1
level2.id = "level 2"

local function onObjectTouch( self, event )
    composer.gotoScene("level2")
end

level2.touch = onObjectTouch
level2:addEventListener( "touch", level2 )




----scene composer
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
