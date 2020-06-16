------------------------------------------------------------------------------------------
--gameSetup.lua     Manages main functionality of program
------------------------------------------------------------------------------------------
local gameSetup = {
    
    startButton = nil,
    startBackground = nil,
    currentTheme = 1,
    numberOfThemes = 3,
    objectSet = 1,
    numberOfObjectSets = 8,
    mainBackground = nil,
    newAttributeButton = nil,
    shapeSet1 = nil,
    walls = display.newGroup(),
    backgroundObjects = display.newGroup(),
    currentObjects = display.newGroup(),   
    tempObjects = display.newGroup(),
    buttons = display.newGroup()

}

    --Function to display start menu
    local lib =  "C:\\Users\\cjmar\\Documents\\SHARED\\Software Engineering\\Learning Modules\\AttributeBlocks\\lib\\"
    package.path = lib .. "?.lua;" .. package.path
    local useCircle = require "circle"
    local useSquare = require "square"
    local useTriangle = require "aidesTriangle"
    local useHexagon = require "hexagon"
    --Start Menu Functions
    function gameSetup.createStartBackground()
        --remove all background objects
        for i=1, gameSetup.backgroundObjects.numChildren do 
            display.remove( gameSetup.backgroundObjects[ 1 ])
        end
        background = display.newImageRect( ".\\lib\\images\\Uranus.jpg", 1.5 * display.contentHeight , display.contentHeight )
        background.x = display.contentCenterX
        background.y = display.contentCenterY
        title = display.newImageRect( ".\\lib\\images\\title.png", 0.8 * display.contentWidth , 0.38 * display.contentWidth )
        title.x = display.contentCenterX
        title.y = 0.3 * display.contentHeight
        gameSetup.backgroundObjects:insert( background )
        gameSetup.backgroundObjects:insert( title )

    end
    function gameSetup.createStartButton()
        local startButton = display.newImageRect( ".\\lib\\images\\PlayButton.png", 0.6 * display.contentWidth, 0.2 * display.contentWidth )
        startButton.x = display.contentCenterX
        startButton.y = 0.6 * display.contentHeight
        gameSetup.buttons:insert( startButton )
        startButton:addEventListener( "tap", gameSetup.startGame )
    end
    function gameSetup.startGame( event )
        button = event.target
        display.remove( button )
        gameSetup.createWalls()
        print("Number of objects : " .. gameSetup.currentObjects.numChildren )
        --clear background objects
        for i=1, gameSetup.backgroundObjects.numChildren do 
            display.remove( gameSetup.backgroundObjects[ 1 ])
        end
        --remove buttons
        for i=1, gameSetup.buttons.numChildren do 
            display.remove( gameSetup.buttons[ 1 ])
        end
        gameSetup.gameBackground1()
        gameSetup.menuButton()
        gameSetup.createObjectSet1()
    end
    --------------------------------------------------------
    -- Main Game Play Functions
    --------------------------------------------------------
    function gameSetup.createNewAttributeButton()
        local attributeButton = display.newImageRect( ".\\lib\\images\\newAttributeButton.png", 0.6 * display.contentWidth, 0.3 * display.contentWidth )
        attributeButton.x = display.contentCenterX
        attributeButton.y = 0.2 * display.contentHeight
        gameSetup.buttons:insert( attributeButton )
        attributeButton:addEventListener( "tap", gameSetup.newAttributes )

    end
    function gameSetup.menuButton()
        local menuButton = display.newImageRect( ".\\lib\\images\\menu.png", 0.35 * display.contentWidth, 0.1 * display.contentHeight)
        menuButton.x = 0.8 * display.contentWidth
        menuButton.y = 0.93 * display.contentHeight
        gameSetup.buttons:insert( menuButton )
        menuButton:addEventListener( "tap", gameSetup.openMenu )

    end
    function gameSetup.openMenu()
        menuBackground = display.newImageRect( ".\\lib\\images\\menuBackground.png", 1.5 * display.contentWidth , display.contentHeight )
        menuBackground.x = display.contentCenterX
        menuBackground.y = display.contentCenterY
        gameSetup.tempObjects:insert( menuBackground )
        --remove buttons
        for i=1, gameSetup.buttons.numChildren do 
            display.remove( gameSetup.buttons[ 1 ])
        end    
        gameSetup.createNewAttributeButton()
        gameSetup.changeThemeButton()
        gameSetup.returnButton()
    end
    function gameSetup.returnButton()
        local returnButton = display.newImageRect( ".\\lib\\images\\returnButton.png", 0.35 * display.contentWidth, 0.1 * display.contentHeight)
        returnButton.x = 0.8 * display.contentWidth
        returnButton.y = 0.93 * display.contentHeight
        gameSetup.buttons:insert( returnButton )
        returnButton:addEventListener( "tap", gameSetup.returnTo )
    end
    function gameSetup.returnTo()
        --remove all temporary objects
        for i=1, gameSetup.tempObjects.numChildren do 
            display.remove( gameSetup.tempObjects[ 1 ])
        end
         --remove buttons
         for i=1, gameSetup.buttons.numChildren do 
            display.remove( gameSetup.buttons[ 1 ])
        end
        gameSetup.menuButton()       
    end

    function gameSetup.changeThemeButton()
        local changeThemeButton = display.newImageRect( ".\\lib\\images\\changeThemeButton.png", 0.6 * display.contentWidth, 0.3 * display.contentWidth)
        changeThemeButton.x = display.contentCenterX
        changeThemeButton.y = 0.4 * display.contentHeight
        changeThemeButton:addEventListener( "tap", gameSetup.changeTheme )
        gameSetup.buttons:insert( changeThemeButton )
    end
    function gameSetup.changeTheme()
        --remove all temporary objects
        for i=1, gameSetup.tempObjects.numChildren do 
            display.remove( gameSetup.tempObjects[ 1 ])
        end
        --remove buttons
        for i=1, gameSetup.buttons.numChildren do 
            display.remove( gameSetup.buttons[ 1 ])
        end
        gameSetup.currentTheme = gameSetup.currentTheme + 1
        if gameSetup.currentTheme > gameSetup.numberOfThemes then
            gameSetup.currentTheme = 1
        end
        if gameSetup.currentTheme == 1 then
            gameSetup.gameBackground1()
        end
        if gameSetup.currentTheme == 2 then
            gameSetup.gameBackground2()
        end
        if gameSetup.currentTheme == 3 then
            gameSetup.gameBackground3()
        end
        gameSetup.menuButton()
    end
    function gameSetup.newAttributes()
        print("Number of objects : " .. gameSetup.currentObjects.numChildren )
        --remove all temporary objects
        for i=1, gameSetup.tempObjects.numChildren do 
            display.remove( gameSetup.tempObjects[ 1 ])
        end
        --remove objects
        for i=1, gameSetup.currentObjects.numChildren do 
            display.remove( gameSetup.currentObjects[ 1 ])
        end
        --remove buttons
        for i=1, gameSetup.buttons.numChildren do 
            display.remove( gameSetup.buttons[ 1 ])
        end
        gameSetup.objectSet = gameSetup.objectSet + 1
        if gameSetup.objectSet > gameSetup.numberOfObjectSets then
            gameSetup.objectSet = 1
        end
        if gameSetup.objectSet == 1 then
            gameSetup.createObjectSet1()
	        print( "Using ObjectSet1" )
        end
        if gameSetup.objectSet == 2 then
            gameSetup.createObjectSet2()
	        print( "Using ObjectSet2" )
        end
        if gameSetup.objectSet == 3 then 
            gameSetup.createObjectSet3()
            print( "Using ObjectSet3" )
        end
        if gameSetup.objectSet == 4 then
            gameSetup.createObjectSet4()
	        print( "Using ObjectSet4" )
        end
        if gameSetup.objectSet == 5 then
            gameSetup.createObjectSet5()
	        print( "Using ObjectSet5" )
        end
        if gameSetup.objectSet == 6 then 
            gameSetup.createObjectSet6()
            print( "Using ObjectSet6" )
        end
        if gameSetup.objectSet == 7 then
            gameSetup.createObjectSet7()
	        print( "Using ObjectSet7" )
        end
        if gameSetup.objectSet == 8 then 
            gameSetup.createObjectSet8()
            print( "Using ObjectSet8" )
        end
        gameSetup.menuButton()
    end
    function gameSetup.gameBackground1()
        --remove all background objects
        for i=1, gameSetup.backgroundObjects.numChildren do 
            display.remove( gameSetup.backgroundObjects[ 1 ])
        end
        local background = display.newImageRect( ".\\lib\\images\\spacebackground1.png", display.contentWidth , display.contentHeight )
        background.x = display.contentCenterX
        background.y = display.contentCenterY
        local center = display.newImageRect( ".\\lib\\images\\smallMoon.png", 0.9 * display.contentWidth, 0.9 * display.contentWidth ) 
        center.x = display.contentCenterX
        center.y = display.contentCenterY
        --insert objects in backgroundObjects group
        gameSetup.backgroundObjects:insert( background )
        gameSetup.backgroundObjects:insert( center )
    end 
    function gameSetup.gameBackground2()
        --remove all background objects
        for i=1, gameSetup.backgroundObjects.numChildren do 
            display.remove( gameSetup.backgroundObjects[ 1 ])
        end
        local background = display.newImageRect( ".\\lib\\images\\spacebackground2.png", display.contentWidth , display.contentHeight )
        background.x = display.contentCenterX
        background.y = display.contentCenterY
        local center = display.newImageRect( ".\\lib\\images\\Mars.png", 0.9 * display.contentWidth, 0.9 * display.contentWidth ) 
        center.x = display.contentCenterX
        center.y = display.contentCenterY
        --insert objects in backgroundObjects group
        gameSetup.backgroundObjects:insert( background )
        gameSetup.backgroundObjects:insert( center )
    end --end gameBackground2
    function gameSetup.gameBackground3()
        --remove all background objects
        for i=1, gameSetup.backgroundObjects.numChildren do 
            display.remove( gameSetup.backgroundObjects[ 1 ])
        end
        local background = display.newImageRect( ".\\lib\\images\\spacebackground3.png", display.contentWidth , display.contentHeight )
        background.x = display.contentCenterX
        background.y = display.contentCenterY
        local center = display.newImageRect( ".\\lib\\images\\Venus.png", 0.9 * display.contentWidth, 0.9 * display.contentWidth ) 
        center.x = display.contentCenterX
        center.y = display.contentCenterY
        --insert objects in backgroundObjects group
        gameSetup.backgroundObjects:insert( background )
        gameSetup.backgroundObjects:insert( center )
    end --end gameBackground3
    function gameSetup.createWalls()
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
        gameSetup.walls:insert( leftWall )
        gameSetup.walls:insert( rightWall ) 
        gameSetup.walls:insert( topWall )
        gameSetup.walls:insert( bottomWall ) 
    end --end createWalls



    -- Different Object Sets
    local leftX = 0.15 * display.contentWidth
    local centerX = 0.5 * display.contentWidth
    local rightX = 0.85 * display.contentWidth
    local topY = 0.10 * display.contentHeight
    local centerY = 0.5 * display.contentHeight
    local bottomY = 0.90 * display.contentHeight

    function gameSetup.createObjectSet1()
        local currentAttribute = "4 sides" 
        local topText = display.newText( {
            text = ("Place objects with attribute \n   \"" .. currentAttribute .. "\" on the center!\n(correct shapes turn green)"), --text
            x = 0.65 * display.contentWidth, --x
            y = 0.18 * display.contentHeight, --display.contentHeight / 30, --y 
            width = 0.8 * display.contentWidth, --width
            height = 0.25 * display.contentHeight, --height
            font = native.systemFont --font
            --fontsize = 0.8 * display.contentHeight --fontsize
            }
        )  
        local circle1 = useCircle.createCircle( leftX, 0.65 * display.contentHeight, 0.15 * display.contentWidth, currentAttribute )
        local circle2 = useCircle.createCircle( centerX, 0.75 * display.contentHeight, 0.12 * display.contentWidth, currentAttribute )
        local square1 = useSquare.createSquare( rightX, 0.45 * display.contentHeight, 0.25 * display.contentWidth, currentAttribute )
        local square2 = useSquare.createSquare( leftX, bottomY, 0.22 * display.contentWidth, currentAttribute )
        local triangle1 = useTriangle.createTriangle( middleX, bottomY, currentAttribute )     
	    --add "Physics" to all objects
        physics.addBody( circle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( circle2, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( square1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( square2, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( triangle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
    --insert objects in to currentObjects group
        gameSetup.currentObjects:insert( topText) 
        gameSetup.currentObjects:insert( circle1 ) 
        gameSetup.currentObjects:insert( circle2 )
        gameSetup.currentObjects:insert( square1 )
        gameSetup.currentObjects:insert( square2 )
        gameSetup.currentObjects:insert( triangle1 )
        print("Number of objects : " .. gameSetup.currentObjects.numChildren )
    end	--end createObjectSet1
    function gameSetup.createObjectSet2()
        local currentAttribute = "triangle" 
        local topText = display.newText( {
            text = ("Place objects with attribute \n   \"" .. currentAttribute .. "\" on the center!"), --text
            x = 0.65 * display.contentWidth, --x
            y = 0.18 * display.contentHeight, --display.contentHeight / 30, --y 
            width = 0.8 * display.contentWidth, --width
            height = 0.25 * display.contentHeight, --height
            font = native.systemFont --font
            --fontsize = 0.8 * display.contentHeight --fontsize
            }
        )  
        local circle1 = useCircle.createCircle( leftX, bottomY, 0.175 * display.contentWidth, currentAttribute )
        local circle2 = useCircle.createCircle( rightX, 0.25 * display.contentHeight, 0.12 * display.contentWidth, currentAttribute )
        local square1 = useSquare.createSquare( leftX, 0.75 * display.contentHeight, 0.24 * display.contentWidth, currentAttribute )
        local square2 = useSquare.createSquare( rightX, topY, 0.22 * display.contentWidth, currentAttribute )
        local triangle1 = useTriangle.createTriangle( rightX, topY, currentAttribute )     
	    --add "Physics" to all objects
        physics.addBody( circle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( circle2, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( square1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( square2, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( triangle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        --insert objects in to currentObjects group
        gameSetup.currentObjects:insert( topText) 
        gameSetup.currentObjects:insert( circle1 ) 
        gameSetup.currentObjects:insert( circle2 )
        gameSetup.currentObjects:insert( square1 )
        gameSetup.currentObjects:insert( square2 )
        gameSetup.currentObjects:insert( triangle1 )
        print("Number of objects : " .. gameSetup.currentObjects.numChildren )
    end	--end createObjectSet2
    function gameSetup.createObjectSet3()
        local currentAttribute = "6 sides" 
        local topText = display.newText( {
            text = ("Place objects with attribute \n   \"" .. currentAttribute .. "\" on the center!"), --text
            x = 0.65 * display.contentWidth, --x
            y = 0.18 * display.contentHeight, --display.contentHeight / 30, --y 
            width = 0.8 * display.contentWidth, --width
            height = 0.25 * display.contentHeight, --height
            font = native.systemFont --font
            --fontsize = 0.8 * display.contentHeight --fontsize
            }
        )  
        local circle1 = useCircle.createCircle( leftX, bottomY, 0.175 * display.contentWidth, currentAttribute )
        local hex1 = useHexagon.createHexagon( rightX, 0.6 * display.contentHeight, currentAttribute )
        local square1 = useSquare.createSquare( leftX, centerY, 0.3 * display.contentWidth, currentAttribute )
        local square2 = useSquare.createSquare( leftX, 0.6 * display.contentHeight, 0.22 * display.contentWidth, currentAttribute )
        local triangle1 = useTriangle.createTriangle(centerX, bottomY, currentAttribute )     
	    --add "Physics" to all objects
        physics.addBody( circle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( hex1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( square1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( square2, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( triangle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        --insert objects in to currentObjects group
        gameSetup.currentObjects:insert( topText) 
        gameSetup.currentObjects:insert( circle1 ) 
        gameSetup.currentObjects:insert( hex1 )
        gameSetup.currentObjects:insert( square1 )
        gameSetup.currentObjects:insert( square2 )
        gameSetup.currentObjects:insert( triangle1 )
        print("Number of objects : " .. gameSetup.currentObjects.numChildren )
    end	--end createObjectSet3
    function gameSetup.createObjectSet4()
        local currentAttribute = "square" 
        local topText = display.newText( {
            text = ("Place objects with attribute \n   \"" .. currentAttribute .. "\" on the center!"), --text
            x = 0.65 * display.contentWidth, --x
            y = 0.18 * display.contentHeight, --display.contentHeight / 30, --y 
            width = 0.8 * display.contentWidth, --width
            height = 0.25 * display.contentHeight, --height
            font = native.systemFont --font
            --fontsize = 0.8 * display.contentHeight --fontsize
            }
        )  
        local circle1 = useCircle.createCircle( leftX, bottomY, 0.175 * display.contentWidth, currentAttribute )
        local circle2 = useCircle.createCircle( rightX, 0.45 * display.contentHeight, 0.12 * display.contentWidth, currentAttribute )
        local square1 = useSquare.createSquare( leftX, 0.75 * display.contentHeight, 0.24 * display.contentWidth, currentAttribute )
        local square2 = useSquare.createSquare( rightX, topY, 0.22 * display.contentWidth, currentAttribute )
        local triangle1 = useTriangle.createTriangle( rightX, topY, currentAttribute )     
	    --add "Physics" to all objects
        physics.addBody( circle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( circle2, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( square1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( square2, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( triangle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        --insert objects in to currentObjects group
        gameSetup.currentObjects:insert( topText) 
        gameSetup.currentObjects:insert( circle1 ) 
        gameSetup.currentObjects:insert( circle2 )
        gameSetup.currentObjects:insert( square1 )
        gameSetup.currentObjects:insert( square2 )
        gameSetup.currentObjects:insert( triangle1 )
        print("Number of objects : " .. gameSetup.currentObjects.numChildren )
    end	--end createObjectSet4
    function gameSetup.createObjectSet5()
        local currentAttribute = "round" 
        local topText = display.newText( {
            text = ("Place objects with attribute \n   \"" .. currentAttribute .. "\" on the center!"), --text
            x = 0.65 * display.contentWidth, --x
            y = 0.18 * display.contentHeight, --display.contentHeight / 30, --y 
            width = 0.8 * display.contentWidth, --width
            height = 0.25 * display.contentHeight, --height
            font = native.systemFont --font
            --fontsize = 0.8 * display.contentHeight --fontsize
            }
        )  
        local circle1 = useCircle.createCircle( leftX, topY, 0.15 * display.contentWidth, currentAttribute )
        local circle2 = useCircle.createCircle( centerX, 0.75 * display.contentHeight, 0.12 * display.contentWidth, currentAttribute )
        local square1 = useSquare.createSquare( rightX, topY, 0.25 * display.contentWidth, currentAttribute )
        local square2 = useSquare.createSquare( leftX, bottomY, 0.22 * display.contentWidth, currentAttribute )
        local triangle1 = useTriangle.createTriangle( middleX, bottomY, currentAttribute )     
	    --add "Physics" to all objects
        physics.addBody( circle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( circle2, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( square1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( square2, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( triangle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
    --insert objects in to currentObjects group
        gameSetup.currentObjects:insert( topText) 
        gameSetup.currentObjects:insert( circle1 ) 
        gameSetup.currentObjects:insert( circle2 )
        gameSetup.currentObjects:insert( square1 )
        gameSetup.currentObjects:insert( square2 )
        gameSetup.currentObjects:insert( triangle1 )
        print("Number of objects : " .. gameSetup.currentObjects.numChildren )
    end	--end createObjectSet5
    function gameSetup.createObjectSet6()
        local currentAttribute = "polygon" 
        local topText = display.newText( {
            text = ("Place objects with attribute \n   \"" .. currentAttribute .. "\" on the center!"), --text
            x = 0.65 * display.contentWidth, --x
            y = 0.18 * display.contentHeight, --display.contentHeight / 30, --y 
            width = 0.8 * display.contentWidth, --width
            height = 0.25 * display.contentHeight, --height
            font = native.systemFont --font
            --fontsize = 0.8 * display.contentHeight --fontsize
            }
        )  
        local circle1 = useCircle.createCircle( rightX, topY, 0.175 * display.contentWidth, currentAttribute )
        local hex1 = useHexagon.createHexagon( rightX, 0.6 * display.contentHeight, currentAttribute )
        local hex2 = useHexagon.createHexagon( leftX, 0.9 * display.contentHeight, currentAttribute )
        local square1 = useSquare.createSquare( leftX, centerY, 0.3 * display.contentWidth, currentAttribute )
        local triangle1 = useTriangle.createTriangle(centerX, bottomY, currentAttribute )     
	    --add "Physics" to all objects
        physics.addBody( circle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( hex1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( hex2, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( square1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( triangle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        --insert objects in to currentObjects group
        gameSetup.currentObjects:insert( topText) 
        gameSetup.currentObjects:insert( circle1 ) 
        gameSetup.currentObjects:insert( hex1 )
        gameSetup.currentObjects:insert( hex2 )
        gameSetup.currentObjects:insert( square1 )
        gameSetup.currentObjects:insert( triangle1 )
        print("Number of objects : " .. gameSetup.currentObjects.numChildren )
    end	--end createObjectSet6
    function gameSetup.createObjectSet7()
        local currentAttribute = "hexagon" 
        local topText = display.newText( {
            text = ("Place objects with attribute \n   \"" .. currentAttribute .. "\" on the center!\n  (correct shapes turn green)"), --text
            x = 0.65 * display.contentWidth, --x
            y = 0.18 * display.contentHeight, --display.contentHeight / 30, --y 
            width = 0.8 * display.contentWidth, --width
            height = 0.25 * display.contentHeight, --height
            font = native.systemFont --font
            --fontsize = 0.8 * display.contentHeight --fontsize
            }
        )  
        local circle1 = useCircle.createCircle( rightX, topY, 0.175 * display.contentWidth, currentAttribute )
        local hex1 = useHexagon.createHexagon( rightX, 0.6 * display.contentHeight, currentAttribute )
        local hex2 = useHexagon.createHexagon( leftX, 0.9 * display.contentHeight, currentAttribute )
        local square1 = useSquare.createSquare( leftX, centerY, 0.3 * display.contentWidth, currentAttribute )
        local triangle1 = useTriangle.createTriangle(centerX, bottomY, currentAttribute )     
	    --add "Physics" to all objects
        physics.addBody( circle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( hex1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( hex2, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( square1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( triangle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        --insert objects in to currentObjects group
        gameSetup.currentObjects:insert( topText) 
        gameSetup.currentObjects:insert( circle1 ) 
        gameSetup.currentObjects:insert( hex1 )
        gameSetup.currentObjects:insert( hex2 )
        gameSetup.currentObjects:insert( square1 )
        gameSetup.currentObjects:insert( triangle1 )
        print("Number of objects : " .. gameSetup.currentObjects.numChildren )
    end	--end createObjectSet7
    function gameSetup.createObjectSet8()
        local currentAttribute = "3 sides" 
        local topText = display.newText( {
            text = ("Place objects with attribute \n   \"" .. currentAttribute .. "\" on the center!"), --text
            x = 0.6 * display.contentWidth, --x
            y = 0.18 * display.contentHeight, --display.contentHeight / 30, --y 
            width = 0.35 * display.contentWidth, --width
            height = 0.2 * display.contentHeight, --height
            font = native.systemFont --font
            --fontsize = 0.8 * display.contentHeight --fontsize
            }
	)
        local circle1 = useCircle.createCircle( leftX, bottomY, 0.175 * display.contentWidth, currentAttribute )
        local circle2 = useCircle.createCircle( rightX, 0.25 * display.contentHeight, 0.12 * display.contentWidth, currentAttribute )
        local square1 = useSquare.createSquare( leftX, 0.75 * display.contentHeight, 0.24 * display.contentWidth, currentAttribute )
        local square2 = useSquare.createSquare( rightX, topY, 0.22 * display.contentWidth, currentAttribute )
        local triangle1 = useTriangle.createTriangle( rightX, topY, currentAttribute )     
	    --add "Physics" to all objects
        physics.addBody( circle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( circle2, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( square1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( square2, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( triangle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        --insert objects in to currentObjects group
        gameSetup.currentObjects:insert( topText) 
        gameSetup.currentObjects:insert( circle1 ) 
        gameSetup.currentObjects:insert( circle2 )
        gameSetup.currentObjects:insert( square1 )
        gameSetup.currentObjects:insert( square2 )
        gameSetup.currentObjects:insert( triangle1 )
        print("Number of objects : " .. gameSetup.currentObjects.numChildren )
    end	--end createObjectSet8
return gameSetup --end gameSetup 
