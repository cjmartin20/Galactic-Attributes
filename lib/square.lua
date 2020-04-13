-- Create small box function

square = {
	originalStrokeColor = { Red = 0, Green = 0, Blue = 0},
    hasAttribute = nil,
    "right angles",
    "vertices",
    "4 sides",
    "4 vertices"
}

local useAttributes = require "attributes"
--local usePhysics = require"physics"

function square.createSquare(x, y, sideLength)
	x = x or display.contentCenterX
	y = y or display.contentCenterY
	sideLength = sideLength or 150
	--make random colors (excluding green - setting to zero)
	Red =  0
	Green = math.random( 0, 100)
	Blue = math.random( 30, 200)
	local boxSmall = display.newRect( x, y, sideLength, sideLength )
	boxSmall:setFillColor( Red, Green, Blue )
	boxSmall.strokeWidth = 0.016 * display.contentWidth   -- Sets the width of the border
	--Set Stroke color
	Red = 30
	Green = 0
	Blue = 150
	square.originalStrokeColor.Red = Red
	square.originalStrokeColor.Green = Green
	square.originalStrokeColor.Blue = Blue
	boxSmall:setStrokeColor( Red, Green, Blue )    -- Sets the border color
--	usePhysics.start()
--	usePhysics.addBody( boxSmall, { friction=0.5, bounce=0.4 } )
	boxSmall:addEventListener( "touch", square.move )
	boxSmall.alpha = 0.7 --circle opacity 
	return boxSmall
end --createSquare function	

--Move shapes function
function square.move( event )

    --event.target comes from EventListener and is the object the "touch" is targeting	
	local object = event.target
    local touchDistance = object.width

	--Move shape
	if math.abs( object.x - event.x ) < touchDistance and math.abs( object.y - event.y ) < touchDistance then
		object.x = event.x
		object.y = event.y
    end
    --Change color if circle is in moon and has attribute
	if useAttributes.isShapeWithinRadius( object, .85 * display.contentCenterX, display.contentCenterX, display.contentCenterY) then
        if square.hasAttribute then
			--change color to green
			object:setStrokeColor( 0, 128 , 0)
		else
			--change color to red
			object:setStrokeColor( 128, 0, 0 )
		end
	else
		object:setStrokeColor( square.originalStrokeColor.Red, square.originalStrokeColor.Green , square.originalStrokeColor.Blue )
    end 
end --move function

return square