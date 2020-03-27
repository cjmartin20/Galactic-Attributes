------------------------------------------------------------------------------------------
--gameSetup.lua Creates messeges and feedback for user
------------------------------------------------------------------------------------------

local gameSetup = {}

--Function to display start menu


--function to display game background and setup boundaries
function gameSetup.gameBackground()
    
    --Display background as picture of space
    local background = display.newImageRect( ".\\lib\\images\\newbackground_copy.jpg", 600 , 890 )
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    --Display Moon in middle of screen
    local border = display.newImage( ".\\lib\\images\\newshapebank.png", 5, 5  ) 
    border:scale(.115, .20)
    border.x = 173
    border.y = 450
    border.alpha = 1 --make moon transparent

    
    local letterboxWidth = math.abs(display.screenOriginX)
    local letterboxHeight = math.abs(display.screenOriginY)
    local physics = require( "physics" )

    local leftWall = display.newRect( display.contentCenterX - display.contentWidth / 2 , display.contentCenterY, 10, display.contentHeight )
    leftWall.anchorX = 1
    physics.addBody( leftWall, "static", { bounce=1, friction=0.1 } )
    --Right Wall
    local rightWall = display.newRect( display.contentCenterX + display.contentWidth / 2, display.contentCenterY, 20, display.contentHeight )
    rightWall.anchorX = 0
    physics.addBody( rightWall, "static", { bounce=1, friction=0.1 } )
    --Top Wall
    local topWall = display.newRect( display.contentCenterX, -10, display.contentWidth, 20 )
    topWall.alpha = 0
    topWall.anchorY = 1
    physics.addBody( topWall, "static", { bounce=0, friction=0 } )
    --Bottom Wall
    local wallBottom = display.newRect( display.contentCenterX, 360, display.contentWidth, 20 )
    wallBottom.anchorY = 0
    wallBottom.alpha = 0
    physics.addBody( wallBottom, "static", { bounce=0.4, friction=0.1 } )

    --display text (need to figure out how to turn sideways)
    local makeText = display.newText( "Fill in the Tree", display.contentCenterX, 10, "comics", 20 )
    
    return true
end 






--Displays start menu and directs input to function
function gameSetup.startMenu()
    local widget = require( "widget" )

    _W = display.contentWidth;
    _H = display.contentHeight;
    

    local useShapes = require "shapes"


    
    local background = display.newImageRect( ".\\lib\\images\\newgrassbackground.jpg", 800 , 690 )
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    
    local options = {
        text = "Placeholder Game!",
        x = 164,
        y = 20,
        font = native.systemFontBold, 
        fontsize = 200
    }

    local myText = display.newText( "Tangrams!", 160, 35, "comics", 35 );
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
        left = 110,
        top = 80,
        width = 100,
        height = 50,
        defaultFile = ".\\lib\\images\\start.png",
        overFile = ".\\lib\\images\\start.png",
        onEvent = handleButtonEvent
    }

end

return gameSetup




