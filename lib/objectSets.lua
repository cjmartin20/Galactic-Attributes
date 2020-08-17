
    local objectSets = {
    }
    
    local lib =  "C:\\Users\\cjmar\\Documents\\SHARED\\Software Engineering\\Learning Modules\\AttributeBlocks\\lib\\"
    package.path = lib .. "?.lua;" .. package.path

    local useTriangle = require "aidesTriangle"
    local useCircle = require "circle"
    local useHexagon = require "hexagon"
    local usePentagon = require "pentagon"
    local useSquare = require "square"

    local useOne = require "one"
    local useTwo = require "two"
    local useThree = require "three"
    local useFour = require "four"
    local useFive = require "five"
    local useSix = require "six"
    local useSeven = require "seven"
    local useEight = require "eight"
    local useNine = require "nine"

    local pos1X = 0.15 * display.contentWidth
    local pos1Y = 0.23 * display.contentHeight
    local pos2X = 0.5 * display.contentWidth
    local pos2Y = 0.18 * display.contentHeight
    local pos3X = 0.88 * display.contentWidth
    local pos3Y = 0.23 * display.contentHeight
    local pos4X = 0.15 * display.contentWidth
    local pos4Y = 0.77 * display.contentHeight
    local pos5X = 0.5 * display.contentWidth
    local pos5Y = 0.82 * display.contentHeight
    local pos6X = 0.88 * display.contentWidth
    local pos6Y = 0.82 * display.contentHeight

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
    end
    function objectSets.createObjectSet1()

        local currentObjects = {}

        local currentAttribute = "even" 
        local topText = display.newText( {
            text = ("Objects with attribute \"" .. currentAttribute .. "\""),
            x = 0.5 * display.contentWidth,
            y = 0.18 * display.contentHeight, 
            width = 0.8 * display.contentWidth,
            height = 0.25 * display.contentHeight,
            font = native.systemFont,
            fontSize = 23 * scaler,
            align = "center"
            }
        )
        --allow text to be treated like objects with attributes by adding to table
        textObject = {
            hint = "Even numbers are divisble by two!",
            object = topText,
            hasAttribute = false,
            inPosition = false
        }
        local one1 = useOne.createOne( pos1X, pos1Y, scaler, currentAttribute )
        --local one2 = useOne2.createOne( display.contentCenterX, display.contentCenterY, scaler, currentAttribute )
        local two1 = useTwo.createTwo( pos2X, pos2Y, scaler, currentAttribute )
        local five1 = useFive.createFive( pos6X, pos6Y, scaler, currentAttribute )
        local eight1 = useEight.createEight( pos3X, pos3Y, scaler, currentAttribute )
        local nine1 = useNine.createNine( pos4X, pos4Y, scaler, currentAttribute )
        local three1 = useThree.createThree( pos5X, pos5Y, scaler, currentAttribute )
        --add "Physics" to all objects
        physics.addBody( one1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( two1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( five1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        physics.addBody( eight1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( nine1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        physics.addBody( three1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        --insert objects in to currentObjects group
        table.insert( currentObjects, textObject)
        table.insert( currentObjects, one1 )
        --table.insert( currentObjects, one2 )
        table.insert( currentObjects, two1 )
        table.insert( currentObjects, five1 )
        table.insert( currentObjects, eight1 )
        table.insert( currentObjects, nine1 )
        table.insert( currentObjects, three1 )
        knt = 0
        for uselessVar in pairs( currentObjects ) do 
            knt = knt + 1 
        end
        print("Knt in currentObjects (objectSets) :", knt )
        return currentObjects
    end	--end createObjectSet1
    function objectSets.createObjectSet2()

        local currentObjects = {}

        local currentAttribute = "square" 
        local topText = display.newText( {
            text = ("Objects with attribute \"" .. currentAttribute .. "\""),
            x = 0.5 * display.contentWidth,
            y = 0.18 * display.contentHeight, 
            width = 0.8 * display.contentWidth,
            height = 0.25 * display.contentHeight,
            font = native.systemFont,
            fontSize = 23 * scaler,
            align = "center"
            }
        )
        --allow text to be treated like objects with attributes by adding to table
        local textObject = {
            hint = "A square has 4 sides!",
            object = topText,
            hasAttribute = false,
            inPosition = false
        }
        local hex1 = useHexagon.createHexagon( pos1X, pos1Y, scaler, currentAttribute )
        local tri1 = useTriangle.createTriangle( pos2X, pos2Y, scaler, currentAttribute )
        local square1 = useSquare.createSquare( pos3X, pos3Y, scaler, currentAttribute )
        local circle1 = useCircle.createCircle( pos4X, pos4Y, scaler, currentAttribute )
        local pent1 = usePentagon.createPentagon( pos5X, pos5Y, scaler, currentAttribute )
        --add "Physics" to all objects
        physics.addBody( hex1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( tri1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( square1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        physics.addBody( circle1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        physics.addBody( pent1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        --insert objects in to currentObjects group
        table.insert( currentObjects, textObject)
        table.insert( currentObjects, hex1 )
        table.insert( currentObjects, tri1 )
        table.insert( currentObjects, square1 )
        table.insert( currentObjects, circle1 )
        table.insert( currentObjects, pent1 )
        knt = 0
        for uselessVar in pairs( currentObjects ) do 
            knt = knt + 1 
        end
        print("Knt in currentObjects (objectSets) :", knt )
        return currentObjects
    end	--end createObjectSet2
    function objectSets.createObjectSet3()

        local currentObjects = {}

        local currentAttribute = "6 sides" 
        local topText = display.newText( {
            text = ("Objects with attribute \"" .. currentAttribute .. "\""),
            x = 0.5 * display.contentWidth,
            y = 0.18 * display.contentHeight, 
            width = 0.8 * display.contentWidth,
            height = 0.25 * display.contentHeight,
            font = native.systemFont,
            fontSize = 23 * scaler,
            align = "center"
            }
        )
        --allow text to be treated like objects with attributes by adding to table
        local textObject = {
            hint = "Come on, just count the sides!",
            object = topText,
            hasAttribute = false,
            inPosition = false
        }
        local hex1 = useHexagon.createHexagon( pos3X, pos3Y, scaler, currentAttribute )
        local tri1 = useTriangle.createTriangle( pos5X, pos5Y, scaler, currentAttribute )
        local square1 = useSquare.createSquare( pos1X, pos1Y, scaler, currentAttribute )
        local circle1 = useCircle.createCircle( pos4X, pos4Y, scaler, currentAttribute )
        local pent1 = usePentagon.createPentagon( pos2X, pos2Y, scaler, currentAttribute )
        --add "Physics" to all objects
        physics.addBody( hex1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( tri1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( square1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        physics.addBody( circle1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        physics.addBody( pent1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        --insert objects in to currentObjects group
        table.insert( currentObjects, textObject)
        table.insert( currentObjects, hex1 )
        table.insert( currentObjects, tri1 )
        table.insert( currentObjects, square1 )
        table.insert( currentObjects, circle1 )
        table.insert( currentObjects, pent1 )
        return currentObjects
    end	--end createObjectSet3
    function createObjectSet4( currentObjects )

        local currentObjects = {}

        local currentAttribute = "odd" 
        local topText = display.newText( {
            text = ("Objects with attribute \"" .. currentAttribute .. "\""),
            x = 0.5 * display.contentWidth,
            y = 0.18 * display.contentHeight, 
            width = 0.8 * display.contentWidth,
            height = 0.25 * display.contentHeight,
            font = native.systemFont,
            fontSize = 23 * scaler,
            align = "center"
            }
        )
        --allow text to be treated like objects with attributes by adding to table
        local textObject = {
            hint = "An odd number cannot be divided by two, without a remainder!",
            object = topText,
            hasAttribute = false,
            inPosition = false
        }
        local one1 = useOne.createOne( pos6X, pos6Y, scaler, currentAttribute )
        local two1 = useTwo.createTwo( pos5X, pos5Y, scaler, currentAttribute )
        local four1 = useFour.createFour( pos1X, pos1Y, scaler, currentAttribute )
        local six1 = useSix.createSix( pos2X, pos2Y, scaler, currentAttribute )
        local eight1 = useEight.createEight( pos3X, pos3Y, scaler, currentAttribute )
        local nine1 = useNine.createNine( pos4X, pos4Y, scaler, currentAttribute )
        --add "Physics" to all objects
        physics.addBody( one1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( two1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( four1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        physics.addBody( six1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        physics.addBody( eight1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( nine1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        --insert objects in to currentObjects group
        table.insert( currentObjects, textObject)
        table.insert( currentObjects, one1 )
        table.insert( currentObjects, two1 )
        table.insert( currentObjects, four1 )
        table.insert( currentObjects, six1 )
        table.insert( currentObjects, eight1 )
        table.insert( currentObjects, nine1 )
        knt = 0
        for uselessVar in pairs( currentObjects ) do 
            knt = knt + 1 
        end
        print("Knt in currentObjects (objectSets) :", knt )
        return currentObjects
    end	--end createObjectSet4
    function createObjectSet5( currentObjects )

        local currentObjects = {}

        local currentAttribute = "triangle" 
        local topText = display.newText( {
            text = ("Objects with attribute \"" .. currentAttribute .. "\""),
            x = 0.5 * display.contentWidth,
            y = 0.18 * display.contentHeight, 
            width = 0.8 * display.contentWidth,
            height = 0.25 * display.contentHeight,
            font = native.systemFont,
            fontSize = 23 * scaler,
            align = "center"
            }
        )
        --allow text to be treated like objects with attributes by adding to table
        local textObject = {
            hint = "triangles have 3 sides!",
            object = topText,
            hasAttribute = false,
            inPosition = false
        }
        local hex1 = useHexagon.createHexagon( pos1X, pos1Y, scaler, currentAttribute )
        local tri1 = useTriangle.createTriangle( pos2X, pos2Y, scaler, currentAttribute )
        local square1 = useSquare.createSquare( pos3X, pos3Y, scaler, currentAttribute )
        local circle1 = useCircle.createCircle( pos4X, pos4Y, scaler, currentAttribute )
        local pent1 = usePentagon.createPentagon( pos5X, pos5Y, scaler, currentAttribute )
        --add "Physics" to all objects
        physics.addBody( hex1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( tri1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( square1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        physics.addBody( circle1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        physics.addBody( pent1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        --insert objects in to currentObjects group
        table.insert( currentObjects, textObject)
        table.insert( currentObjects, hex1 )
        table.insert( currentObjects, tri1 )
        table.insert( currentObjects, square1 )
        table.insert( currentObjects, circle1 )
        table.insert( currentObjects, pent1 )
        return currentObjects
    end	--end createObjectSet5
    function createObjectSet6( currentObjects )

        local currentObjects = {}

        local currentAttribute = "prime" 
        local topText = display.newText( {
            text = ("Objects with attribute \"" .. currentAttribute .. "\""),
            x = 0.5 * display.contentWidth,
            y = 0.18 * display.contentHeight, 
            width = 0.8 * display.contentWidth,
            height = 0.25 * display.contentHeight,
            font = native.systemFont,
            fontSize = 23 * scaler,
            align = "center"
            }
        )
        --allow text to be treated like objects with attributes by adding to table
        local textObject = {
            hint = "Prime numbers are only divisble by 1 and themselves!",
            object = topText,
            hasAttribute = false,
            inPosition = false
        }
        local one1 = useOne.createOne( pos6X, pos6Y, scaler, currentAttribute )
        local two1 = useTwo.createTwo( pos5X, pos5Y, scaler, currentAttribute )
        local three1 = useThree.createThree( pos1X, pos1Y, scaler, currentAttribute )
        local five1 = useFive.createFive( pos2X, pos2Y, scaler, currentAttribute )
        local eight1 = useEight.createEight( pos3X, pos3Y, scaler, currentAttribute )
        local nine1 = useNine.createNine( pos4X, pos4Y, scaler, currentAttribute )
        --add "Physics" to all objects
        physics.addBody( one1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( two1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( four1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        physics.addBody( six1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        physics.addBody( eight1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( nine1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        --insert objects in to currentObjects group
        table.insert( currentObjects, textObject)
        table.insert( currentObjects, one1 )
        table.insert( currentObjects, two1 )
        table.insert( currentObjects, four1 )
        table.insert( currentObjects, six1 )
        table.insert( currentObjects, eight1 )
        table.insert( currentObjects, nine1 )
        return currentObjects
    end	--end createObjectSet6
    function createObjectSet7( currentObjects )

        local currentObjects = {}

        local currentAttribute = "hexagon" 
        local topText = display.newText( {
            text = ("Objects with attribute \"" .. currentAttribute .. "\""),
            x = 0.5 * display.contentWidth,
            y = 0.18 * display.contentHeight, 
            width = 0.8 * display.contentWidth,
            height = 0.25 * display.contentHeight,
            font = native.systemFont,
            fontSize = 23 * scaler,
            align = "center"
            }
        )
        --allow text to be treated like objects with attributes by adding to table
        local textObject = {
            hint = "Hexagons have 6 sides!",
            object = topText,
            hasAttribute = false,
            inPosition = false
        }
        local hex1 = useHexagon.createHexagon( pos5X, pos5Y, scaler, currentAttribute )
        local tri1 = useTriangle.createTriangle( pos3X, pos3Y, scaler, currentAttribute )
        local square1 = useSquare.createSquare( pos2X, pos2Y, scaler, currentAttribute )
        local circle1 = useCircle.createCircle( pos4X, pos4Y, scaler, currentAttribute )
        local pent1 = usePentagon.createPentagon( pos1X, pos1Y, scaler, currentAttribute )
        --add "Physics" to all objects
        physics.addBody( hex1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( tri1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( square1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        physics.addBody( circle1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        physics.addBody( pent1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        --insert objects in to currentObjects group
        table.insert( currentObjects, textObject)
        table.insert( currentObjects, hex1 )
        table.insert( currentObjects, tri1 )
        table.insert( currentObjects, square1 )
        table.insert( currentObjects, circle1 )
        table.insert( currentObjects, pent1 )
        return currentObjects
    end	--end createObjectSet7
    function createObjectSet8( currentObjects )

        local currentObjects = {}

        local currentAttribute = "two" 
        local topText = display.newText( {
            text = ("Objects with attribute \"" .. currentAttribute .. "\""),
            x = 0.5 * display.contentWidth,
            y = 0.18 * display.contentHeight, 
            width = 0.8 * display.contentWidth,
            height = 0.25 * display.contentHeight,
            font = native.systemFont,
            fontSize = 23 * scaler,
            align = "center"
            }
        )
        --allow text to be treated like objects with attributes by adding to table
        local textObject = {
            hint = "You know the number two, right?",
            object = topText,
            hasAttribute = false,
            inPosition = false
        }
        local one1 = useOne.createOne( pos1X, pos1Y, scaler, currentAttribute )
        local two1 = useTwo.createTwo( pos2X, pos2Y, scaler, currentAttribute )
        local five1 = useFive.createFive( pos6X, pos6Y, scaler, currentAttribute )
        local eight1 = useEight.createEight( pos3X, pos3Y, scaler, currentAttribute )
        local nine1 = useNine.createNine( pos4X, pos4Y, scaler, currentAttribute )
        local three1 = useThree.createThree( pos5X, pos5Y, scaler, currentAttribute )
        --add "Physics" to all objects
        physics.addBody( one1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( two1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( five1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        physics.addBody( eight1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth } )
        physics.addBody( nine1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        physics.addBody( three1.object, { bounce=1, friction=1, radius = 0.13 * display.contentWidth })
        --insert objects in to currentObjects group
        table.insert( currentObjects, textObject)
        table.insert( currentObjects, one1 )
        table.insert( currentObjects, two1 )
        table.insert( currentObjects, five1 )
        table.insert( currentObjects, eight1 )
        table.insert( currentObjects, nine1 )
        table.insert( currentObjects, three1 )
    end --objectSet8
return objectSets
