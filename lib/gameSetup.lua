------------------------------------------------------------------------------------------
--gameSetup.lua	Creates messeges and feedback for user
------------------------------------------------------------------------------------------

local gameSetup = {}

--Function to display start menu
local lib =  "C:\\Users\\cjmar\\Documents\\SHARED\\Software Engineering\\Learning Modules\\AttributeBlocks\\lib\\"
--local lib =  ".\\lib" --trying to get this to work
package.path = lib .. "?.lua;" .. package.path
local useAttributes = require "attributes"

--function to display game background and setup boundaries
function gameSetup.gameBackground()
    
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
    physics.addBody( leftWall, "static", { bounce=1, friction=0.1 } )
    --Right Wall
    local rightWall = display.newRect( display.contentCenterX + display.contentWidth / 2, display.contentCenterY, 20, display.contentHeight )
    rightWall.anchorX = 0
    physics.addBody( rightWall, "static", { bounce=1, friction=0.1 } )
    --Top Wall
    local topWall = display.newRect( display.contentCenterX, display.contentCenterY - display.contentHeight / 2, display.contentWidth, 20 )
    topWall.anchorY = 1
    physics.addBody( topWall, "static", { bounce=0, friction=0 } )
    --Bottom Wall
    local wallBottom = display.newRect( display.contentCenterX, display.contentCenterY + display.contentHeight / 2, display.contentWidth, 20 )
    wallBottom.anchorY = 0
    physics.addBody( wallBottom, "static", { bounce=0.4, friction=0.6 } )

    --display text (need to figure out how to turn sideways)
    local topText = display.newText( {
        text = "place quadrilaterals on moon\n                 (4 sides)", --text
        x = display.contentCenterX, --x
        y = 0.12 * display.contentHeight, --display.contentHeight / 30, --y 
        width = 0.65 * display.contentWidth, --width
        height = 0.15 * display.contentHeight, --height
        font = native.systemFont, --font
        fontsize = 0.20 * display.contentHeight --fontsize
        }
    )
    local bottomText = display.newText( {
        text = "      green shapes are correct", --text
        x = display.contentCenterX , --x
        y = display.contentHeight, --display.contentHeight / 30, --y 
        width = 0.65 * display.contentWidth, --width
        height = 0.15 * display.contentHeight, --height
        font = native.systemFont, --font
        fontsize = 0.20 * display.contentHeight --fontsize
        }
    )

    return true
end 

--Displays start menu and directs input to function
function gameSetup.startMenu()
    local widget = require( "widget" )

    _W = display.contentWidth;
    _H = display.contentHeight;
    

    local background = display.newImageRect( ".\\lib\\images\\Uranus.jpg", display.contentWidth , display.contentHeight )
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    
    local options = {
        text = "Placeholder Game!",
        x = 164,
        y = 20,
        font = native.systemFontBold, 
        fontsize = 200
    }

    local myText = display.newText( "Attribute Blocks!", 160, 35, "Space Awaits", 35 );
    --myText = _W * 0.5; myText.y = _H * 0.5;
    
    local function handleButtonEvent( event )
        local phase = event.phase
    
        if "ended" == phase then
            --local btn = event.target 

            gameSetup.gameBackground()
            useShapes.start()
       
        end
    end
    
    local myButton = widget.newButton {
        left = display.contentCenterX - 250,
        top = display.contentCenterY - 250,
        width = 500,
        height = 500,
        defaultFile = ".\\lib\\images\\PlayButton.png",
        overFile = ".\\lib\\images\\PlayButton.png",
        onEvent = handleButtonEvent
    }

end

return gameSetup