----------------------------------------------------------------------------------------
--eight.lua	Creates object shaped like the number 8
----------------------------------------------------------------------------------------

local eight = {
	object = nil,
	originalColor = { Red = 0, Green = 0, Blue = 0 },
	hasAttribute = nil,
	inPosition = nil,
	"eight",
	"even",
	"divisible by two"
}
local useAttributes = require "attributes"
function eight.createEight( x, y, scaler, currentAttribute )
	x = x or display.contentCenterX
    y = y or display.contentCenterY
    scaler = scaler * 7 or 7
    --coordinates to make shape of eight
	local eightShape = { -3*scaler,-11*scaler, -6*scaler,1*scaler, 2*scaler,1*scaler, 3*scaler,-3*scaler, -1*scaler,-3*scaler, 0,-7*scaler, 4*scaler,-7*scaler, 1*scaler,5*scaler, -3*scaler,5*scaler, -2*scaler,1.01*scaler, -6*scaler,1.01*scaler, -8*scaler,9*scaler, 4*scaler,9*scaler, 9*scaler,-11*scaler }
	eight.object = display.newPolygon( x, y, eightShape )
	Red = 7
	Green = 5
	Blue = 0
	eight.originalColor.Red = Red
	eight.originalColor.Green = Green
	eight.originalColor.Blue = Blue
	eight.object:setFillColor( Red, Green, Blue )      -- fill the eight with color
    --eight.object.strokeWidth = 0.016 * display.contentWidth   -- Sets the width of the border of eight
	--Set Stroke color
    eight.object:setStrokeColor( 128, 0, 128 )    -- Sets the border color
    eight.object:addEventListener( "touch", eight.move )
    eight.object.alpha = 0.7 --eight opacity 
	--check if eight has attributes.currentAttribute (in attributes.lua table)
	print( "Checking eight Attributes" )
	local test = false
    for index, attribute in ipairs(eight) do
        print("checking ", index, attribute)
        if attribute == currentAttribute then
            test = true
            print("eight Has Attribute")
        end
	end
	eight.hasAttribute = test
    --initialize attributes.hasAttribute if no value set it to true
    return eight
end --createEight function
--Move shapes function
function eight.move( event )
    --eventt.target comes from EventListener and is the object the "touch" is targeting
	local object = event.target
    local touchDistance = object.width
	--Move shape
	if math.abs( object.x - event.x ) < touchDistance and math.abs( object.y - event.y ) < touchDistance then
		object.x = event.x
		object.y = event.y
    end
    --Change color if eight is in position and has attribute
	if useAttributes.isShapeWithinRadius( object, .85 * display.contentCenterX, display.contentCenterX, display.contentCenterY) then
        if eight.hasAttribute then
			--change color to green
			object:setFillColor( 0, 128 , 0)
		else
			--change color to red
			object:setFillColor( 128, 0 , 0 )
		end
		eight.inPosition = true
	else
		object:setFillColor( eight.originalColor.Red, eight.originalColor.Green, eight.originalColor.Blue )
		eight.inPosition = false
	end 
end --end move function
return eight