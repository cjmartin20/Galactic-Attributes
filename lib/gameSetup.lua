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
    --currentObjectTable holds return value of objectSet which are tables that hold the display objects
    --and their attributes. The display objects are inserted into the display group currentObjects, so their
    --appearence on the screen can be controlled. currentObjectsTable is for accessing the attributes, such as
    -- hasAttribute and inPosition
    currentObjectsTable = {},
    numObjects = 0,


    backgroundObjects = display.newGroup(), 
    currentObjects = display.newGroup(),  
    tempObjects = display.newGroup(),
    buttons = display.newGroup()
}
    local scaler = (display.contentWidth / 480 + display.contentHeight / 800 ) / 2 --resolution of smallest device in corona simulator

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
        local startButton = display.newImageRect( ".\\lib\\images\\startButton.png", 0.6 * display.contentWidth, 0.2 * display.contentWidth )
        startButton.x = display.contentCenterX
        startButton.y = 0.6 * display.contentHeight
        gameSetup.buttons:insert( startButton )
        startButton:addEventListener( "tap", gameSetup.startGame )
    end
    function gameSetup.congratulations()
        local text = display.newText( {
            text = ("Congratulations!\nThat's correct!"),
            x = display.contentCenterX,
            y = 0.33 * display.contentHeight,
            width = 0.8 * display.contentWidth,
            height = 0.25 * display.contentHeight,
            font = native.systemFont,
            fontSize = 35 * scaler,
            align = "center"
            }
        )
        gameSetup.tempObjects:insert( text )
        gameSetup.newAttributeButtonCentered()
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
        gameSetup.checkButton()
        gameSetup.currentObjectsTable = useObjectSets.createObjectSet1()
        for uselessVar in pairs( gameSetup.currentObjectsTable ) do 
            gameSetup.numObjects = gameSetup.numObjects + 1 
        end
        for i=1, gameSetup.numObjects do
            gameSetup.currentObjects:insert( gameSetup.currentObjectsTable[ i].object )
        end
    end
    function gameSetup.startChecking( )
        --#! /usr/bin/env lua
        local M = require 'posix.unistd'
        local r,w = M.pipe()
        local childpid = M.fork()
        if childpid == 0 then
            -- child reads from pipe
            M.close(w)  -- close unused write end

            local b = M.read(r, 1)
            while #b == 1 do
                -- got a byte from the pipe, write it to stdout
                io.write(b)
                b = M.read(r, 1)
            end
            M.close(r)
            M._exit(0)

        else
            -- parent writes to pipe
            M.close(r) -- close unused read end

            -- write the bytes for the child process to the pipe
            M.write(w,'hello dolly\n')
            M.close(w)
            -- wait for child to finish
            require 'posix.sys.wait'.wait(childpid)
        end

        
    
        local clock = os.clock

        function sleep(n)  -- seconds
            local t0 = clock()
            while clock() - t0 <= n do
                print( clock() - t0 )
            end
        end
    end
    --------------------------------------------------------
    -- Buttons
    --------------------------------------------------------
    function gameSetup.aboutButton()
        local aButton = display.newImageRect( ".\\lib\\images\\aboutButton.png", 0.6 * display.contentWidth, 0.3 * display.contentWidth)
        aButton.x = display.contentCenterX
        aButton.y = 0.8 * display.contentHeight
        aButton:addEventListener( "tap", gameSetup.about )
        gameSetup.buttons:insert( aButton )
    end
    function gameSetup.about()
        local aboutText = display.newText( {
            text = ("Galactic Attributes is a small game that is designed for young learners to explore the idea of attributes and familiarize themselves with different numbers and shapes. It was developed for Dr. Emma Bullock, a math professor at Sam Houston State University, in order to get a grant that would allow similar games to be made at a professional level. Galactic Attributes is a remake of a game called 'Attribute Blocks', that was found in The National Library of Virtual Manipulatives. The NLVM is the focus of games to be improved and recreated to have a much more significant learning impact on young students. Galactic was developed as a group project for Software Engineering (COSC 4319) taught by Dr. ABM Islam at Sam Houston State University."),
            x = 0.54 * display.contentWidth,
            y = 0.26 * display.contentHeight,
            width = 0.65 * display.contentWidth,
            height = 0.45 * display.contentHeight,
            font = native.systemFont,
            fontSize = 16 * scaler,
            align = "right"
            }
        )
        gameSetup.tempObjects:insert( aboutText )
        --remove buttons
        for i=1, gameSetup.buttons.numChildren do 
            display.remove( gameSetup.buttons[ 1 ])
        end
        gameSetup.returnButton()
    end
    function gameSetup.checkButton()
        local checkButton = display.newImageRect( ".\\lib\\images\\checkButton.png", 0.35 * display.contentWidth, 0.1 * display.contentHeight)
        checkButton.x = 0.2 * display.contentWidth
        checkButton.y = 0.93 * display.contentHeight
        gameSetup.buttons:insert( checkButton )
        checkButton:addEventListener( "tap", gameSetup.checkObjects )
    end
    function gameSetup.checkObjects() --returns true if all objects with attribute are in position and no incorrect objects are in position
        local correctInPosition = 0
        local incorrectInPosition = 0
        local totalWithAttribute = 0
        for i = 1, gameSetup.numObjects do
            if gameSetup.currentObjectsTable[ i ].inPosition and gameSetup.currentObjectsTable[ i ].hasAttribute then
                correctInPosition = correctInPosition + 1
            end
            if gameSetup.currentObjectsTable[ i ].inPosition and gameSetup.currentObjectsTable[ i ].hasAttribute == false then
                incorrectInPosition = incorrectInPosition + 1
            end
            if gameSetup.currentObjectsTable[ i ].hasAttribute then
                totalWithAttribute = totalWithAttribute + 1
            end
        end
        print( "Correct In position ", correctInPosition )
        print( "Incorrect In posistion ", incorrectInPosition )
        print( "total with attribute ", totalWithAttribute )
        if correctInPosition == totalWithAttribute and incorrectInPosition == 0 then
            gameSetup.congratulations()
	    else
            for i=1, gameSetup.buttons.numChildren do 
                display.remove( gameSetup.buttons[ 1 ])
            end
            gameSetup.checkButton()
            gameSetup.hintButton()
            gameSetup.returnButton()
        end
    end
    function gameSetup.directionsButton()
        local dButton = display.newImageRect( ".\\lib\\images\\directionsButton.png", 0.6 * display.contentWidth, 0.3 * display.contentWidth)
        dButton.x = display.contentCenterX
        dButton.y = 0.6 * display.contentHeight
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
        gameSetup.returnButton()
    end --directions function
    function gameSetup.hintButton()
        local hintButton = display.newImageRect( ".\\lib\\images\\hintButton.png", 0.35 * display.contentWidth, 0.1 * display.contentHeight)
        hintButton.x = 0.2 * display.contentWidth
        hintButton.y = 0.07 * display.contentHeight
        gameSetup.buttons:insert( hintButton )
        hintButton:addEventListener( "tap", gameSetup.hint )
    end --hintButton
    function gameSetup.hint()
        local hintText = display.newText( {
            text = ( gameSetup.currentObjectsTable[ 1 ].hint ), --textObject is located at index 1
            x = display.contentCenterX, --x
            y = display.contentHeight * 0.5, --display.contentHeight / 30, --y 
            width = 0.8 * display.contentWidth, --width
            height = 0.5 * display.contentHeight, --height
            font = native.systemFont, --font
            fontSize = 20 * scaler,--0.8 * display.contentHeight --fontsize
            align = "center"
            }
        )
        gameSetup.tempObjects:insert( hintText )
        --remove buttons
        for i=1, gameSetup.buttons.numChildren do 
            display.remove( gameSetup.buttons[ 1 ])
        end
        gameSetup.returnButton()
    end
    function gameSetup.menuButton()
        local menuButton = display.newImageRect( ".\\lib\\images\\menuButton.png", 0.35 * display.contentWidth, 0.1 * display.contentHeight)
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
        gameSetup.aboutButton()
        gameSetup.changeThemeButton()
        gameSetup.directionsButton()
        gameSetup.newAttributeButton()
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
        gameSetup.checkButton()       
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
    function gameSetup.newAttributeButtonCentered()
        local attributeButton = display.newImageRect( ".\\lib\\images\\newAttributeButton.png", 0.6 * display.contentWidth, 0.3 * display.contentWidth )
        attributeButton.x = display.contentCenterX
        attributeButton.y = 0.5 * display.contentHeight
        gameSetup.buttons:insert( attributeButton )
        attributeButton:addEventListener( "tap", gameSetup.newAttribute )
    end
    function gameSetup.newAttribute()
        local newObjects
        print("Number of objects                      : " .. gameSetup.currentObjects.numChildren )
        knt = 0
        for uselessVar in pairs( gameSetup.currentObjectsTable ) do 
            knt = knt + 1 
        end
        print("Number of items in currentObjectsTable :" .. knt )

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
            newObjects = useObjectSets.createObjectSet1()
            print( "Using ObjectSet1" )
        end
        if gameSetup.objectSet == 2 then
            newObjects = useObjectSets.createObjectSet2()
            print( "Using ObjectSet2" )
        end
        if gameSetup.objectSet == 3 then 
            newObjects = useObjectSets.createObjectSet3()
            print( "Using ObjectSet3" )
        end
        if gameSetup.objectSet == 4 then
            newObjects = useObjectSets.createObjectSet4()
	        print( "Using ObjectSet4" )
        end
        if gameSetup.objectSet == 5 then
            newObjects = useObjectSets.createObjectSet5()
	        print( "Using ObjectSet5" )
        end
        if gameSetup.objectSet == 6 then 
            newObjects = useObjectSets.createObjectSet6()
            print( "Using ObjectSet6" )
        end
        if gameSetup.objectSet == 7 then
            newObjects = useObjectSets.createObjectSet7()
	        print( "Using ObjectSet7" )
        end
        if gameSetup.objectSet == 8 then 
            newObjects = useObjectSets.createObjectSet8()
            print( "Using ObjectSet8" )
        end
        gameSetup.menuButton()
        gameSetup.checkButton()
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
