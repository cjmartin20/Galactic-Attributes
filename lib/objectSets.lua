
    local objectSets = {
    }
    
    local lib =  "C:\\Users\\cjmar\\Documents\\SHARED\\Software Engineering\\Learning Modules\\AttributeBlocks\\lib\\"
    package.path = lib .. "?.lua;" .. package.path
    local useCircle = require "circle"
    local useHexagon = require "hexagon"
    local usePentagon = require "pentagon"
    local useSquare = require "square"
    local useTriangle = require "aidesTriangle"

    local useOne = require "one"
    local useTwo = require "two"
    local useThree = require "three"
    local useFour = require "four"
    local useFive = require "five"
    local useSix = require "six"
    local useSeven = require "seven"
    local useEight = require "eight"
    local useNine = require "nine"

    local leftX = 0.15 * display.contentWidth
    local centerX = 0.5 * display.contentWidth
    local rightX = 0.85 * display.contentWidth
    local topY = 0.10 * display.contentHeight
    local centerY = 0.5 * display.contentHeight
    local bottomY = 0.90 * display.contentHeight

    local scaler = (display.contentWidth / 480 + display.contentHeight / 800 ) / 2 --resolution of smallest device in corona simulator

    function objectSets.createWalls()

        walls = display.newGroup()

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
        walls:insert( leftWall )
        walls:insert( rightWall ) 
        walls:insert( topWall )
        walls:insert( bottomWall )
        
        return walls
    end --end createWalls

    function objectSets.createObjectSet1( currentObjects )

        --currentObjects = display.newGroup()

        local currentAttribute = "prime" 
        local topText = display.newText( {
            text = ("Objects with attribute \"" .. currentAttribute .. "\""), --text
            x = 0.65 * display.contentWidth, --x
            y = 0.18 * display.contentHeight, --display.contentHeight / 30, --y 
            width = 0.8 * display.contentWidth, --width
            height = 0.25 * display.contentHeight, --height
            font = native.systemFont, --font
            fontSize = 23 * scaler--0.8 * display.contentHeight --fontsize
            --align = "center"
            }
        )
        local one1 = useOne.createOne( centerX, centerY, scaler, currentAttribute )
        --[[
        local two1 = useTwo.createTwo( centerX, bottomY, 20, currentAttribute )
        local three1 = useThree.createThree( 200, 700, 20, currentAttribute )
        local four1 = useFour.createFour( 800, 1000, 20, currentAttribute )
        local five1 = useFive.createFive( bottomX, rightX, 20, currentAttribute )
        local six1 = useSix.createSix( 700, 700, 20, currentAttribute )
        local seven1 = useSeven.createSeven( 550, 900, 20, currentAttribute )
        local eight1 = useEight.createEight( centerX, 1000, 20, currentAttribute )
        local nine1 = useNine.createNine( 400, 200, 20, currentAttribute )
        --]]
        local pentagon1 = usePentagon.createPentagon( centerX, topY, scaler, currentAttribute )
        local circle1 = useCircle.createCircle( leftX, 0.65 * display.contentHeight, scaler, currentAttribute )
        --local circle2 = useCircle.createCircle( centerX, 0.75 * display.contentHeight, 0.12 * display.contentWidth, currentAttribute )
        local square1 = useSquare.createSquare( rightX, 0.45 * display.contentHeight, scaler, currentAttribute )
        --local square2 = useSquare.createSquare( leftX, bottomY, 0.22 * display.contentWidth, currentAttribute )
        local triangle1 = useTriangle.createTriangle( middleX, bottomY, scaler, currentAttribute )     
        --add "Physics" to all objects
        physics.addBody( pentagon1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( circle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        --physics.addBody( circle2, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( square1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        --physics.addBody( square2, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
        physics.addBody( triangle1, { bounce=1, friction=1, radius = 0.175 * display.contentWidth } )
    --insert objects in to currentObjects group
        currentObjects:insert( pentagon1 )
        currentObjects:insert( topText ) 
        currentObjects:insert( circle1 ) 
        --currentObjects:insert( circle2 )
        currentObjects:insert( square1 )
        --currentObjects:insert( square2 )
        currentObjects:insert( triangle1 )
        print("Number of objects : " .. currentObjects.numChildren )

        --return currentObjects
    end	--end createObjectSet1
    function createObjectSet2()
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
        currentObjects:insert( topText) 
        currentObjects:insert( circle1 ) 
        currentObjects:insert( circle2 )
        currentObjects:insert( square1 )
        currentObjects:insert( square2 )
        currentObjects:insert( triangle1 )
        print("Number of objects : " .. currentObjects.numChildren )
    end	--end createObjectSet2
    function createObjectSet3( currentObjects )
        local currentAttribute = "6 sides" 
        local topText = display.newText( {
            text = ("Place objects with attribute \n   \"" .. currentAttribute .. "\" on the center!"), --text
            x = 0.65 * display.contentWidth, --x
            y = 0.18 * display.contentHeight, --display.contentHeight / 30, --y 
            width = 0.8 * display.contentWidth, --width
            height = 0.25 * display.contentHeight, --height
            font = native.systemFont --font
            --fontsize = 0.8 * display.contentHeight --fontsi
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
        currentObjects:insert( topText) 
        currentObjects:insert( circle1 ) 
        currentObjects:insert( hex1 )
        currentObjects:insert( square1 )
        currentObjects:insert( square2 )
        currentObjects:insert( triangle1 )
        print("Number of objects : " .. currentObjects.numChildren )
    end	--end createObjectSet3
    function createObjectSet4( currentObjects )
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
        currentObjects:insert( topText) 
        currentObjects:insert( circle1 ) 
        currentObjects:insert( circle2 )
        currentObjects:insert( square1 )
        currentObjects:insert( square2 )
        currentObjects:insert( triangle1 )
        print("Number of objects : " .. currentObjects.numChildren )
    end	--end createObjectSet4
    function createObjectSet5( currentObjects )
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
        currentObjects:insert( topText) 
        currentObjects:insert( circle1 ) 
        currentObjects:insert( circle2 )
        currentObjects:insert( square1 )
        currentObjects:insert( square2 )
        currentObjects:insert( triangle1 )
        print("Number of objects : " .. currentObjects.numChildren )
    end	--end createObjectSet5
    function createObjectSet6( currentObjects )
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
        currentObjects:insert( topText) 
        currentObjects:insert( circle1 ) 
        currentObjects:insert( hex1 )
        currentObjects:insert( hex2 )
        currentObjects:insert( square1 )
        currentObjects:insert( triangle1 )
        print("Number of objects : " .. currentObjects.numChildren )
    end	--end createObjectSet6
    function createObjectSet7( currentObjects )
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
        currentObjects:insert( topText) 
        currentObjects:insert( circle1 ) 
        currentObjects:insert( hex1 )
        currentObjects:insert( hex2 )
        currentObjects:insert( square1 )
        currentObjects:insert( triangle1 )
        print("Number of objects : " .. currentObjects.numChildren )
    end	--end createObjectSet7
    function createObjectSet8( currentObjects )
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
        currentObjects:insert( topText) 
        currentObjects:insert( circle1 ) 
        currentObjects:insert( circle2 )
        currentObjects:insert( square1 )
        currentObjects:insert( square2 )
        currentObjects:insert( triangle1 )
        print("Number of objects : " .. currentObjects.numChildren )
    end	--end createObjectSet8
return objectSets
