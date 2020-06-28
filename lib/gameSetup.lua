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
    walls = nil,
    backgroundObjects = display.newGroup(), 
    currentObjects = display.newGroup(),  
    tempObjects = display.newGroup(),
    buttons = display.newGroup()


}
    local scaler = display.contentWidth * display.contentHeight / ( 480 * 800 ) --resolution of smallest device in corona simulator

    local curDir =  'C:\\Users\\cjmar\\Documents\\SHARED\\x_Github\\Galactic-Attributes\\'
    package.path = curDir .. 'lib\\?.lua;' .. package.path
    package.path = curDir .. 'lib\\numbers\\?.lua;' .. package.path
    package.path = curDir .. 'lib\\shapes\\?.lua;' .. package.path

    local useObjectSets = require "objectSets"

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
        walls = useObjectSets.createWalls()
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
        useObjectSets.createObjectSet1( gameSetup.currentObjects )
    end
    --------------------------------------------------------
    -- Buttons
    --------------------------------------------------------
    function gameSetup.directionsButton()
        local dButton = display.newImageRect( ".\\lib\\images\\directionsButton.png", 0.6 * display.contentWidth, 0.3 * display.contentWidth)
        dButton.x = display.contentCenterX
        dButton.y = 0.8 * display.contentHeight
        dButton:addEventListener( "tap", gameSetup.directions )
        gameSetup.buttons:insert( dButton )
    end --directionsButton function
    function gameSetup.directions()

        local topText = display.newText( {
            text = ("Galactic Attributes is a small “game” that is designed for young learners to explore the idea of attributes and familiarize themselves with different numbers and shapes. An attribute will be displayed at the top of the screen, and the user moves the objects onto the center of the screen to check if they match the attribute. Objects that have the given attribute will turn green, and objects that do not will turn red."), --text
            x = display.contentCenterX, --x
            y = display.contentHeight * 0.5, --display.contentHeight / 30, --y 
            width = 0.8 * display.contentWidth, --width
            height = 0.5 * display.contentHeight, --height
            font = native.systemFont, --font
            fontSize = 20 * scaler,--0.8 * display.contentHeight --fontsize
            align = "center"
            }
        )
        gameSetup.tempObjects:insert( topText )
        --remove buttons
        for i=1, gameSetup.buttons.numChildren do 
            display.remove( gameSetup.buttons[ 1 ])
        end
        --remove objects
        gameSetup.returnButton()
    end --directions function
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
        gameSetup.newAttributeButton()
        gameSetup.changeThemeButton()
        gameSetup.directionsButton()
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
    function gameSetup.newAttributeButton()
        local attributeButton = display.newImageRect( ".\\lib\\images\\newAttributeButton.png", 0.6 * display.contentWidth, 0.3 * display.contentWidth )
        attributeButton.x = display.contentCenterX
        attributeButton.y = 0.2 * display.contentHeight
        gameSetup.buttons:insert( attributeButton )
        attributeButton:addEventListener( "tap", gameSetup.newAttribute )
    end
    function gameSetup.newAttribute()
        local newObjects
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
            useObjectSets.createObjectSet1( gameSetup.currentObjects )
            --[[
            for i=1, newObjects.numChildren do
                gameSetup.currentObjects:insert( newObjects[ i ])
            end
            for i=1, gameSetup.newObjects.numChildren do 
                display.remove( gameSetup.newObjects[ 1 ])
            end
            --]]
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
return gameSetup --end gameSetup 
