----------------------------------------------------------------------------------------
--circle.lua Makes shapes that user can move
----------------------------------------------------------------------------------------

local circle = {
	originalStrokeColor = { Red = 0, Green = 0, Blue = 0},
	hasAttribute = nil,
	inPosition = nil,
    "round",
    "radius",
    "circumference",
    "no vertices"
}

local useAttributes = require "attributes"



--function createCircle displays circle object and initializes circle.hasAttrube
--based on currentAttribute in shapes.lua.
function circle.createCircle( x, y, rad )
	x = x or display.contentCenterX
	y = y or display.contentCenterY
    rad = rad or 150
    aCircle = display.newCircle( x, y, rad )		--x-coordinate, y-coordinate, radius
    --make random colors (excluding green - setting to zero)
	Red = 0
	Green = ( math.random( 0, 255) + 50 ) % 255
	Blue = ( math.random( 0, 255) + 50 ) % 255
	aCircle:setFillColor( Red, Green, Blue )      -- fill the circle with color
	aCircle.strokeWidth = 0.016 * display.contentWidth   -- Sets the width of the border of circle
	--Set Stroke color
	Red = 30
	Green = 0
	Blue = 150
	circle.originalStrokeColor.Red = Red
	circle.originalStrokeColor.Green = Green
	circle.originalStrokeColor.Blue = Blue
	aCircle:setStrokeColor( Red, Green, Blue )    -- Sets the border color
    aCircle:addEventListener( "touch", circle.move )
    aCircle.alpha = 0.7 --circle opacity 
    --check if cirlce has attributes.currentAttribute (in attributes.lua table)
    for index, attribute in ipairs(circle) do
        print("checking ", index, attribute)
        if attribute == useAttributes.currentAttribute then
            circle.hasAttribute = true
            print("true")
        end
    end
    --initialize attributes.hasAttribute if no value set it to true
    if circle.hasAttribute == nil then
        circle.hasAttribute = false
    end
    return aCircle
end --createCircle function

--Move shapes function
function circle.move( event )

    --eventt.target comes from EventListener and is the object the "touch" is targeting
	local object = event.target
    local touchDistance = object.width

	--Move shape
	if math.abs( object.x - event.x ) < touchDistance and math.abs( object.y - event.y ) < touchDistance then
		object.x = event.x
		object.y = event.y
    end
    --Change color if circle is in moon and has attribute
	if useAttributes.isShapeWithinRadius( object, .85 * display.contentCenterX, display.contentCenterX, display.contentCenterY) then
        if circle.hasAttribute then
			--change color to green
			object:setStrokeColor( 0, 128 , 0)
		else
			--change color to red
			object:setStrokeColor( 128, 0 , 0 )
		end
		circle.inPosition = true
	else
		object:setStrokeColor( circle.originalStrokeColor.Red, circle.originalStrokeColor.Green, circle.originalStrokeColor.Blue )
		circle.inPosition = false
	end 
end --move function
return circle