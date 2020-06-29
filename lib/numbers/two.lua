----------------------------------------------------------------------------------------
--two.lua	Creates object shaped like the number 2
----------------------------------------------------------------------------------------

local two = {
	object = nil,
	originalColor = { Red = 0, Green = 0, Blue = 0 },
	hasAttribute = nil,
	inPosition = nil,
	"two",
	"even",
	"prime"
}
local useAttributes = require "attributes"
--function createCircle displays two object and initializes two.hasAttrube
--based on currentAttribute in shapes.lua.
function two.createTwo( x, y, scaler, currentAttribute )
	x = x or display.contentCenterX
    y = y or display.contentCenterY
    scaler = scaler * 7 or 7
    --coordinates to make two shape
    local twoShape = { -3*scaler,-11*scaler, -4*scaler,-7*scaler, 4*scaler,-7*scaler, 3*scaler,-3*scaler, -5*scaler,-3*scaler, -8*scaler,9*scaler, 4*scaler,9*scaler, 5*scaler,5*scaler, -3*scaler,5*scaler, -2*scaler,1*scaler, 6*scaler,1*scaler, 9*scaler,-11*scaler  }
	two.object = display.newPolygon( x, y, twoShape )
	Red = 2
	Green = 7
	Blue = 0
	two.originalColor.Red = Red
	two.originalColor.Green = Green
	two.originalColor.Blue = Blue
	two.object:setFillColor( Red, Green, Blue )      -- fill the two with color
    --two.object.strokeWidth = 0.016 * display.contentWidth   -- Sets the width of the border of two
	--Set Stroke color
    two.object:setStrokeColor( 128, 0, 128 )    -- Sets the border color
    two.object:addEventListener( "touch", two.move )
    two.object.alpha = 0.7 --two opacity 
	--check if two has attributes.currentAttribute (in attributes.lua table)
	print( "Checking two Attributes" )
	local test = false
    for index, attribute in ipairs(two) do
        print("checking ", index, attribute)
        if attribute == currentAttribute then
            test = true
            print("two Has Attribute")
        end
	end
	two.hasAttribute = test
    --initialize attributes.hasAttribute if no value set it to true
    return two
end --createTwo function
--Move shapes function
function two.move( event )
    --eventt.target comes from EventListener and is the object the "touch" is targeting
	local object = event.target
    local touchDistance = object.width
	--Move shape
	if math.abs( object.x - event.x ) < touchDistance and math.abs( object.y - event.y ) < touchDistance then
		object.x = event.x
		object.y = event.y
    end
    --Change color if two is in position and has attribute
	if useAttributes.isShapeWithinRadius( object, .85 * display.contentCenterX, display.contentCenterX, display.contentCenterY) then
        if two.hasAttribute then
			--change color to green
			object:setFillColor( 0, 128 , 0)
		else
			--change color to red
			object:setFillColor( 128, 0 , 0 )
		end
		two.inPosition = true
	else
		object:setFillColor( two.originalColor.Red, two.originalColor.Green, two.originalColor.Blue )
		two.inPosition = false
	end 
end --end move function
return two