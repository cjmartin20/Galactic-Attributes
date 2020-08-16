----------------------------------------------------------------------------------------
--five.lua	Creates object shaped like the number 5
----------------------------------------------------------------------------------------

local five = {
	object = nil,
	originalColor = { Red = 0, Green = 0, Blue = 0 },
	hasAttribute = nil,
	inPosition = false,
	"five",
	"odd",
	"prime"
}
local useAttributes = require "attributes"
--function createCircle displays five object and initializes five.hasAttrube
--based on currentAttribute in shapes.lua.
function five.createFive( x, y, scaler, currentAttribute )
	x = x or display.contentCenterX
    y = y or display.contentCenterY
    scaler = scaler * 7 or 7
    --coordinates to make five shape
    local fiveShape = { -3*scaler,-11*scaler, -6*scaler,1*scaler, 2*scaler,1*scaler, 1*scaler,5*scaler, -7*scaler,5*scaler, -8*scaler,9*scaler, 4*scaler,9*scaler, 7*scaler,-3*scaler, -1*scaler,-3*scaler, 0,-7*scaler, 8*scaler,-7*scaler, 9*scaler,-11*scaler }
	five.object = display.newPolygon( x, y, fiveShape )
	Red = 2
	Green = 7
	Blue = 0
	five.originalColor.Red = Red
	five.originalColor.Green = Green
	five.originalColor.Blue = Blue
	five.object:setFillColor( Red, Green, Blue )      -- fill the five with color
    --five.object.strokeWidth = 0.016 * display.contentWidth   -- Sets the width of the border of five
	--Set Stroke color
    five.object:setStrokeColor( 128, 0, 128 )    -- Sets the border color
    five.object:addEventListener( "touch", five.move )
    five.object.alpha = 0.7 --five opacity 
	--check if five has attributes.currentAttribute (in attributes.lua table)
	print( "Checking five Attributes" )
	local test = false
    for index, attribute in ipairs(five) do
        print("checking ", index, attribute)
        if attribute == currentAttribute then
            test = true
            print("five Has Attribute")
        end
	end
	five.hasAttribute = test
    --initialize attributes.hasAttribute if no value set it to true
    return five
end --createFive function
--Move shapes function
function five.move( event )
    --eventt.target comes from EventListener and is the object the "touch" is targeting
	local object = event.target
    local touchDistance = object.width
	--Move shape
	if math.abs( object.x - event.x ) < touchDistance and math.abs( object.y - event.y ) < touchDistance then
		object.x = event.x
		object.y = event.y
    end
    --Change color if five is in position and has attribute
	if useAttributes.isShapeWithinRadius( object, .85 * display.contentCenterX, display.contentCenterX, display.contentCenterY) then
        if five.hasAttribute then
			--change color to green
			object:setFillColor( 0, 128 , 0)
		else
			--change color to red
			object:setFillColor( 128, 0 , 0 )
		end
		five.inPosition = true
	else
		object:setFillColor( five.originalColor.Red, five.originalColor.Green, five.originalColor.Blue )
		five.inPosition = false
	end 
end --end move function
return five