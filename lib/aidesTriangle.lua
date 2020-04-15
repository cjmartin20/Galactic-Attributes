-------------------------------------------------------------------
-- aidesTriangle.lua
-------------------------------------------------------------------

local aidesTriangle = {
	originalStrokeColor = { Red = 0, Green = 0, Blue = 0},
    hasAttribute = nil,
    inPosition = nil,
    "Aide's Triangle",
    "vertices",
    ""
}
local useAttributes = require "attributes"

function aidesTriangle.createTriangle( x, y )

    x = x or display.contentCenterX
    y = y or display.contentCenterY

	local triangleShape = { 0,-100, 130,100, -130,100 }
	local aTriangle = display.newPolygon( 350, 500, triangleShape )
    physics.addBody( aTriangle, { friction=0.5, bounce=0.3, shape=triangleShape } )
    Red = math.random( 0, 100)
	Green = 0
	Blue = math.random( 30, 200)
    aTriangle:setFillColor( Red, Green, Blue )      -- fill the circle with color
    aTriangle.strokeWidth = 0.016 * display.contentWidth   -- Sets the width of the border of circle
    Red = 30
	Green = 0
	Blue = 150
	aidesTriangle.originalStrokeColor.Red = Red
	aidesTriangle.originalStrokeColor.Green = Green
	aidesTriangle.originalStrokeColor.Blue = Blue
    aTriangle:setStrokeColor( 128, 0, 128 )    -- Sets the border color
    aTriangle:addEventListener( "touch", aidesTriangle.move )
    aTriangle.alpha = 0.7 --circle opacity 
    --check if cirlce has attributes.currentAttribute (in attributes.lua table)
    for index, attribute in ipairs( aidesTriangle ) do
        print( "checking ", index, attribute )
        if attribute == useAttributes.currentAttribute then
            aidesTriangle.hasAttribute = true
            print( "true" )
        end
    end
    --initialize attributes.hasAttribute if no value set it to true
    if aidesTriangle.hasAttribute == nil then
        aidesTriangle.hasAttribute = false
    end
    return aTriangle
end

--Move shapes function
function aidesTriangle.move( event )

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
        if aidesTriangle.hasAttribute then
			--change color to green
			object:setStrokeColor( 0, 128 , 0)
		else
			--change color to red
			object:setStrokeColor( 128, 0 , 0 )
        end
        aidesTriangle.inPosition = true
	else
        object:setStrokeColor( aidesTriangle.originalStrokeColor.Red, aidesTriangle.originalStrokeColor.Green , aidesTriangle.originalStrokeColor.Blue )
        aidesTriangle.inPosition = false
    end 
end --move function
return aidesTriangle
