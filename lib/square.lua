-- Create small box function

square = {
    hasAttribute = nil,
    "right angles",
    "vertices",
    "4 sides",
    "4 vertices"
}

local useAttributes = require "attributes"
local usePhysics = require"physics"

function square.createSquare(x, y, sideLength)
	x = x or display.contentCenterX
	y = y or display.contentCenterY
	sideLength = sideLength or 150
	--make random colors (excluding green - setting to zero)
	Red = 30
	Green = 0
	Blue = 150
	local boxSmall = display.newRect( x, y, sideLength, sideLength )
	boxSmall.strokeWidth = 10   -- Sets the width of the border of circle
	boxSmall:setStrokeColor( Red, Green, Blue )    -- Sets the border color
	physics.addBody( boxSmall, { friction=0.5, bounce=0.4 } )
	boxSmall:addEventListener( "touch", square.move )
    boxSmall.alpha = 0.7 --circle opacity 
end

--Move shapes function
function square.move( event )

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
			object:setFillColor( 0, 128 , 0)
		else
			--change color to red
			object:setFillColor( 128, 0 , 0 )
		end
	else
		object:setFillColor( 30, 0, 150 )
    end 
end --move function

return square