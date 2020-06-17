----------------------------------------------------------------------------------------
--three.lua	Creates object shaped like the number 3
----------------------------------------------------------------------------------------

local three = {
	originalColor = { Red = 0, Green = 0, Blue = 0 },
	hasAttribute = nil,
	inPosition = nil,
	"three",
    "odd"
}
local useAttributes = require "attributes"
--function createCircle displays three object and initializes three.hasAttrube
--based on currentAttribute in shapes.lua.
function three.createThree( x, y, scaler, currentAttribute )
	x = x or display.contentCenterX
    y = y or display.contentCenterY
    scaler = scaler or 5
    --coordinates to make three shape
    local threeShape = { -3*scaler,-5*scaler, 3*scaler,-5*scaler, 3*scaler, 5*scaler, -3*scaler,5*scaler, -3*scaler,3*scaler, 1*scaler,3*scaler, 1*scaler,1*scaler, -3*scaler,1*scaler, -3*scaler,-1*scaler, 1*scaler,-1*scaler, 1*scaler,-3*scaler, -3*scaler,-3*scaler }
	local aThree = display.newPolygon( x, y, threeShape )
	Red = 2
	Green = 7
	Blue = 0
	three.originalColor.Red = Red
	three.originalColor.Green = Green
	three.originalColor.Blue = Blue
	aThree:setFillColor( Red, Green, Blue )      -- fill the three with color
    aThree.strokeWidth = 0.016 * display.contentWidth   -- Sets the width of the border of three
	--Set Stroke color
    aThree:setStrokeColor( 128, 0, 128 )    -- Sets the border color
    aThree:addEventListener( "touch", three.move )
    aThree.alpha = 0.7 --three opacity 
	--check if three has attributes.currentAttribute (in attributes.lua table)
	print( "Checking three Attributes" )
	local test = false
    for index, attribute in ipairs(three) do
        print("checking ", index, attribute)
        if attribute == currentAttribute then
            test = true
            print("three Has Attribute")
        end
	end
	three.hasAttribute = test
    --initialize attributes.hasAttribute if no value set it to true
    return aThree
end --createCircle function
--Move shapes function
function three.move( event )
    --eventt.target comes from EventListener and is the object the "touch" is targeting
	local object = event.target
    local touchDistance = object.width
	--Move shape
	if math.abs( object.x - event.x ) < touchDistance and math.abs( object.y - event.y ) < touchDistance then
		object.x = event.x
		object.y = event.y
    end
    --Change color if three is in position and has attribute
	if useAttributes.isShapeWithinRadius( object, .85 * display.contentCenterX, display.contentCenterX, display.contentCenterY) then
        if three.hasAttribute then
			--change color to green
			object:setFillColor( 0, 128 , 0)
		else
			--change color to red
			object:setFillColor( 128, 0 , 0 )
		end
		three.inPosition = true
	else
		object:setFillColor( three.originalColor.Red, three.originalColor.Green, three.originalColor.Blue )
		three.inPosition = false
	end 
end --end move function
return three