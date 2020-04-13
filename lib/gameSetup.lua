--[[**************************************************************************************
--gameSetup.lua     Creates messeges and feedback for user
**************************************************************************************--]]

local gameSetup = {
    
    startButton = nil,
    startBackground = nil,

    mainBackground = nil,
    newAttributeButton = nil,
    shapeSet1 = nil,
    startMenuObjects = display.newGroup(),
    backgroundObjects = display.newGroup(),
    currentObjects = display.newGroup()   

}

    --Function to display start menu
    local lib =  "C:\\Users\\cjmar\\Documents\\SHARED\\Software Engineering\\Learning Modules\\AttributeBlocks\\lib\\"
    --local lib =  ".\\lib" --trying to get this to work
    package.path = lib .. "?.lua;" .. package.path
    local useAttributes = require "attributes"
    local useCircle = require "circle"
    local useSquare = require "square"
    local useTriangle = require "aidesTriangle"


    local leftX = 0.15 * display.contentWidth
    local centerX = 0.5 * display.contentWidth
    local rightX = 0.85 * display.contentWidth
    local topY = 0.10 * display.contentHeight
    local centerY = 0.5 * display.contentHeight
    local bottomY = 0.90 * display.contentHeight
    ------------------------------------------------------
    --Start Menu Functions
    function gameSetup.createStartBackground()
        background = display.newImageRect( ".\\lib\\images\\Uranus.jpg", display.contentWidth , display.contentHeight )
        background.x = display.contentCenterX
        background.y = display.contentCenterY
        gameSetup.currentObjects:insert( background )

    end
    function gameSetup.createStartButton()
        local button = display.newImageRect( ".\\lib\\images\\PlayButton.png", 0.5 * display.contentWidth, 0.5 * display.contentWidth )
        button.x = display.contentCenterX
        button.y = display.contentCenterY
        gameSetup.currentObjects:insert( button )
        button:addEventListener( "tap", gameSetup.startGame )
    end
    function gameSetup.startGame( event )
        button = event.target
        display.remove( button )
        print("Number of objects : " .. gameSetup.currentObjects.numChildren )
        for i=1, gameSetup.currentObjects.numChildren do 
            display.remove( gameSetup.currentObjects[ i ])
        end
        gameSetup.gameBackground()
        gameSetup.createNewAttributeButton()
    end

    --------------------------------------------------------
    -- Main Game Play Functions
    --------------------------------------------------------
    function gameSetup.newAttributes ( )
        print("Number of objects : " .. gameSetup.currentObjects.numChildren )
        for i=1, gameSetup.currentObjects.numChildren do 
            display.remove( gameSetup.currentObjects[ 1 ])
        end
        local num = math.random( 1, 2 )
        if num == 1 then 
            gameSetup.createObjectSet1()
	    print( "Using ObjectSet1" )
        end
        if num == 2 then
            gameSetup.createObjectSet2()
	    print( "Using ObjectSet2" )
        end
    end
    function gameSetup.createNewAttributeButton()
        local attributeButton = display.newImageRect( ".\\lib\\images\\newAttributeRocket.png", 0.3 * display.contentWidth, 0.2 * display.contentWidth )
        attributeButton.x = 0.85 * display.contentWidth
        attributeButton.y = 0.9 * display.contentHeight
        gameSetup.backgroundObjects:insert( attributeButton )
        attributeButton:addEventListener( "tap", gameSetup.newAttributes )
        
    end    
    function gameSetup.gameBackground( )
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
        local bottomWall = display.newRect( display.contentCenterX, display.contentCenterY + display.contentHeight / 2, display.contentWidth, 20 )
        bottomWall.anchorY = 0
        physics.addBody( bottomWall, "static", { bounce=1, friction=1 } )
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
        --insert objects in backgroundObjects group
        gameSetup.backgroundObjects:insert( leftWall )
        gameSetup.backgroundObjects:insert( rightWall ) 
        gameSetup.backgroundObjects:insert( topWall )
        gameSetup.backgroundObjects:insert( bottomWall ) 
        gameSetup.backgroundObjects:insert( topText) 
        gameSetup.backgroundObjects:insert( bottomText )
        gameSetup.backgroundObjects:insert( background )
        gameSetup.backgroundObjects:insert( moon )

        --[[
        local group1 = {}
        useAttributes.start()
        circle1 = useCircle.createCircle()
        square1 = useSquare.createSquare()
        triangle1 = useTriangle.createTriangle()
        --group1:insert(circle1)
        --group1:insert(square1)
        --group1:insert(triangle1)

        return group1
        --]]
        
    end 


    --------------------------------------------------------
    -- Different Object Sets
    --------------------------------------------------------
    --[[
    local leftX = 0.15 * display.contentWidth
    local centerX = 0.5 * display.contentWidth
    local rightX = 0.85 * display.contentWidth
    local topY = 0.10 * display.contentHeight
    local centerY = 0.5 * display.contentHeight
    local bottomY = 0.90 * display.contentHeight
    --]]
    function gameSetup.createObjectSet1()   
        local circle1 = useCircle.createCircle( leftX, topY, 0.175 * display.contentWidth )
        local circle2 = useCircle.createCircle( centerX, topY, 0.25 * display.contentWidth )
        local square1 = useSquare.createSquare( rightX, topY, 0.3 * display.contentWidth )
        local square2 = useSquare.createSquare( leftX, bottomY, 0.22 * display.contentWidth )
        local triangle1 = useTriangle.createTriangle( middleX, bottomY )     
	    --add "Physics" to all objects
        physics.addBody( circle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( circle2, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( square1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( square2, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( triangle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
	--insert objects in to currentObjects group
        gameSetup.currentObjects:insert( circle1 ) 
        gameSetup.currentObjects:insert( circle2 )
        gameSetup.currentObjects:insert( square1 )
        gameSetup.currentObjects:insert( square2 )
        gameSetup.currentObjects:insert( triangle1 )
        print("Number of objects : " .. gameSetup.currentObjects.numChildren )
    end	

    function gameSetup.createObjectSet2()
        local circle1 = useCircle.createCircle( leftX, bottomY, 0.175 * display.contentWidth )
        local circle2 = useCircle.createCircle( rightX, centerY, 0.25 * display.contentWidth )
        local square1 = useSquare.createSquare( leftX, centerY, 0.3 * display.contentWidth )
        local square2 = useSquare.createSquare( rightX, topY, 0.22 * display.contentWidth )
        local triangle1 = useTriangle.createTriangle( )     
	    --add "Physics" to all objects
        physics.addBody( circle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( circle2, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( square1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( square2, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( triangle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
	--insert objects in to currentObjects group
        gameSetup.currentObjects:insert( circle1 ) 
        gameSetup.currentObjects:insert( circle2 )
        gameSetup.currentObjects:insert( square1 )
        gameSetup.currentObjects:insert( square2 )
        gameSetup.currentObjects:insert( triangle1 )
        print("Number of objects : " .. gameSetup.currentObjects.numChildren )
    end	

return gameSetup --end gameSetup 
