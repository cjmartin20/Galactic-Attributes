------------------------------------------------------------------------------------------
--gameSetup.lua	Creates messeges and feedback for user
------------------------------------------------------------------------------------------

local gameSetup = {}

--Function to display start menu
local lib =  "C:\\Users\\cjmar\\Documents\\SHARED\\Software Engineering\\Learning Modules\\AttributeBlocks\\lib\\"
--local lib =  ".\\lib" --trying to get this to work
package.path = lib .. "?.lua;" .. package.path
local useAttributes = require "attributes"
local useCircle = require "circle"
local useSquare = require "square"
local useTriangle = require "aideTriangle"

--function to display game background and setup boundaries
function gameSetup.gameBackground( toRemove )



    --Display background as picture of space
    local background = display.newImageRect( ".\\lib\\images\\spacebackground1.jpg", display.contentWidth , display.contentHeight )
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    --Display Moon in middle of screen
    local moon = display.newImageRect( ".\\lib\\images\\smallMoon.png", 0.85 * display.contentWidth, 0.85 * display.contentWidth ) 
    moon.x = display.contentCenterX
    moon.y = display.contentCenterY
    --moon.alpha = 0.8 --make moon transparent

    --Creates walls
    local letterboxWidth = math.abs(display.screenOriginX)
    local letterboxHeight = math.abs(display.screenOriginY)
    local physics = require( "physics" )
    physics.start()
    physics.setGravity( 0, 0 ) --( gravityX, gravityY )

    local leftWall = display.newRect( display.contentCenterX - display.contentWidth / 2 , display.contentCenterY, 10, display.contentHeight )
    leftWall.anchorX = 1
    physics.addBody( leftWall, "static", { bounce=1, friction=1 } )
    --Right Wall
    local rightWall = display.newRect( display.contentCenterX + display.contentWidth / 2, display.contentCenterY, 20, display.contentHeight )
    rightWall.anchorX = 0
    physics.addBody( rightWall, "static", { bounce=1, friction=1 } )
    --Top Wall
    local topWall = display.newRect( display.contentCenterX, display.contentCenterY - display.contentHeight / 2, display.contentWidth, 20 )
    topWall.anchorY = 1
    physics.addBody( topWall, "static", { bounce=1, friction=1 } )
    --Bottom Wall
    local wallBottom = display.newRect( display.contentCenterX, display.contentCenterY + display.contentHeight / 2, display.contentWidth, 20 )
    wallBottom.anchorY = 0
    physics.addBody( wallBottom, "static", { bounce=1, friction=0.6 } )

    --display text (need to figure out how to turn sideways)
    local topText = display.newText( {
        text = "place " .. useAttributes.currentAttribute .. " \n                 ()", --text
        x = display.contentCenterX, --x
        y = 0.40 * display.contentHeight, --display.contentHeight / 30, --y 
        width = 0.85 * display.contentWidth, --width
        height = 0.25 * display.contentHeight, --height
        font = native.systemFont, --font
        fontsize = 0.35 * display.contentHeight --fontsize
        }
    )
    local bottomText = display.newText( {
        text = "      green shapes are correct", --text
        x = display.contentCenterX , --x
        y = display.contentHeight, --display.contentHeight / 30, --y 
        width = 0.65 * display.contentWidth, --width
        height = 0.15 * display.contentHeight, --height
        font = native.systemFont, --font
        fontsize = 0.5 * display.contentHeight --fontsize
        }
    )

    
    local group1 = {}
    useAttributes.start()
    circle1 = useCircle.createCircle()
    square1 = useSquare.createSquare()
    triangle1 = useTriangle.createTriangle()
    --group1:insert(circle1)
    --group1:insert(square1)
    --group1:insert(triangle1)

    return group1
    
end 

--Displays start menu and directs input to function
function gameSetup.createStartBackground()
    local background = display.newImageRect( ".\\lib\\images\\Uranus.jpg", display.contentWidth , display.contentHeight )
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    return background
end

function gameSetup.createStartButton()
    local startButton = display.newImageRect( ".\\lib\\images\\PlayButton.png", 0.5 * display.contentWidth, 0.5 * display.contentHeight )
    startButton.x = display.contentCenterX
    startButton.y = display.contentCenterY
    return startButton
end

return gameSetup