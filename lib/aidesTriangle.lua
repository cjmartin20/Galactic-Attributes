-------------------------------------------------------------------
-- aidesTriangle.lua    Creates Triangle Object
-------------------------------------------------------------------

local aidesTriangle = {
	originalColor = { Red = 0, Green = 0, Blue = 0},
    hasAttribute = nil,
    inPosition = nil,
    "triangle",
    "vertices",
    "3 sides",
    "polygon"
}
local useAttributes = require "attributes"
function aidesTriangle.createTriangle( x, y, scaler, currentAttribute )
    x = x or display.contentCenterX
    y = y or display.contentCenterY
    scaler = scaler or 1
	local triangleShape = { 0,-100*scaler, 130*scaler,100*scaler, -130*scaler,100*scaler }
	local aTriangle = display.newPolygon( 350, 500, triangleShape )
    physics.addBody( aTriangle, { friction=0.5, bounce=0.3, shape=triangleShape } )
    Red = 25
	Green = 0
	Blue = 50
	aidesTriangle.originalColor.Red = Red
	aidesTriangle.originalColor.Green = Green
	aidesTriangle.originalColor.Blue = Blue
    aTriangle:setFillColor( Red, Green, Blue )      -- fill the triangle with color
    aTriangle.strokeWidth = 0.016 * display.contentWidth   -- Sets the width of the border of the triangle
    aTriangle:setStrokeColor( 128, 0, 128 )    -- Sets the border color
    aTriangle:addEventListener( "touch", aidesTriangle.move )
    aTriangle.alpha = 0.7 --circle opacity 
    --check if triangle has attributes.currentAttribute (in attributes.lua table)
    print( "Checking Triangle Attributes" )
    local test = false
    for index, attribute in ipairs( aidesTriangle ) do
        print( "checking ", index, attribute )
        if attribute == currentAttribute then
            test = true
            print( "Triangle Has Attribute" )
        end
    end
    aidesTriangle.hasAttribute = test
    --initialize attributes.hasAttribute if no value set it to true
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
    --Change color if triangle is in position and has attribute
	if useAttributes.isShapeWithinRadius( object, .85 * display.contentCenterX, display.contentCenterX, display.contentCenterY) then
        if aidesTriangle.hasAttribute then
			--change color to green
			object:setFillColor( 0, 128 , 0)
		else
			--change color to red
			object:setFillColor( 128, 0 , 0 )
        end
        aidesTriangle.inPosition = true
	else
        object:setFillColor( aidesTriangle.originalColor.Red, aidesTriangle.originalColor.Green , aidesTriangle.originalColor.Blue )
        aidesTriangle.inPosition = false
    end 
end --end move function
return aidesTriangle
