----------------------------------------------------------------------------------------
--one.lua	Creates object shaped like the number 1
----------------------------------------------------------------------------------------

local one = {
	originalColor = { Red = 0, Green = 0, Blue = 0},
	hasAttribute = nil,
	inPosition = nil,
	"one",
    "odd"
}
local useAttributes = require "attributes"
--function createCircle displays hexagon object and initializes hexagon.hasAttrube
--based on currentAttribute in shapes.lua.
function hexagon.createHexagon( x, y, currentAttribute )
	x = x or display.contentCenterX
    y = y or display.contentCenterY
    scaler = 1
    local oneShape = { -15*scaler,35*scaler, -20*scaler,35*scaler, -20*scaler,45*scaler, -15*scaler,50*scaler, 15*scaler,50*scaler, 15*scaler,-40*scaler, 25*scaler,-40*scaler, 25*scaler,-50*scaler, -25*scaler,-50*scaler, -25*scaler,-40*scaler, -15*scaler,-40*scaler}
	local aOne = display.newPolygon( 0, 0, oneShape )
	Red = 7
	Green = 5
	Blue = 0
	hexagon.originalColor.Red = Red
	hexagon.originalColor.Green = Green
	hexagon.originalColor.Blue = Blue
	aHexagon:setFillColor( Red, Green, Blue )      -- fill the hexagon with color
	aHexagon.strokeWidth = 0.016 * display.contentWidth   -- Sets the width of the border of hexagon
	--Set Stroke color
	aHexagon:setStrokeColor( 128, 0, 128 )    -- Sets the border color
    aHexagon:addEventListener( "touch", one.move )
    aHexagon.alpha = 0.7 --hexagon opacity 
	--check if hexagon has attributes.currentAttribute (in attributes.lua table)
	print( "Checking Hexagon Attributes" )
	local test = false
    for index, attribute in ipairs(one) do
        print("checking ", index, attribute)
        if attribute == currentAttribute then
            test = true
            print("One Has Attribute")
        end
	end
	one.hasAttribute = test
    --initialize attributes.hasAttribute if no value set it to true
    return aOne
end --createCircle function
--Move shapes function
function one.move( event )
    --eventt.target comes from EventListener and is the object the "touch" is targeting
	local object = event.target
    local touchDistance = object.width
	--Move shape
	if math.abs( object.x - event.x ) < touchDistance and math.abs( object.y - event.y ) < touchDistance then
		object.x = event.x
		object.y = event.y
    end
    --Change color if hexagon is in position and has attribute
	if useAttributes.isShapeWithinRadius( object, .85 * display.contentCenterX, display.contentCenterX, display.contentCenterY) then
        if one.hasAttribute then
			--change color to green
			object:setFillColor( 0, 128 , 0)
		else
			--change color to red
			object:setFillColor( 128, 0 , 0 )
		end
		one.inPosition = true
	else
		object:setFillColor( one.originalColor.Red, one.originalColor.Green, one.originalColor.Blue )
		one.inPosition = false
	end 
end --end move function
return one