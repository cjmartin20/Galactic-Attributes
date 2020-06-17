----------------------------------------------------------------------------------------
--one.lua	Creates object shaped like the number 1
----------------------------------------------------------------------------------------

local one = {
	originalColor = { Red = 0, Green = 0, Blue = 0 },
	hasAttribute = nil,
	inPosition = nil,
	"one",
    "odd"
}
local useAttributes = require "attributes"
--function createCircle displays one object and initializes one.hasAttrube
--based on currentAttribute in shapes.lua.
function one.createOne( x, y, scaler, currentAttribute )
	x = x or display.contentCenterX
    y = y or display.contentCenterY
    scaler = scaler or 8
    --coordinates to make shape of one
    local oneShape = { -8*scaler,-20*scaler, -14*scaler,-20*scaler, -14*scaler,-27*scaler, -8*scaler,-30*scaler, 8*scaler,-30*scaler, 8*scaler,24*scaler, 17*scaler,24*scaler, 17*scaler,30*scaler, -17*scaler,30*scaler, -17*scaler,24*scaler, -8*scaler,24*scaler}
	local aOne = display.newPolygon( 0, 0, oneShape )
	Red = 7
	Green = 5
	Blue = 0
	one.originalColor.Red = Red
	one.originalColor.Green = Green
	one.originalColor.Blue = Blue
	aOne:setFillColor( Red, Green, Blue )      -- fill the one with color
    aOne.strokeWidth = 0.016 * display.contentWidth   -- Sets the width of the border of one
	--Set Stroke color
    aOne:setStrokeColor( 128, 0, 128 )    -- Sets the border color
    aOne:addEventListener( "touch", one.move )
    aOne.alpha = 0.7 --one opacity 
	--check if one has attributes.currentAttribute (in attributes.lua table)
	print( "Checking one Attributes" )
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
    --Change color if one is in position and has attribute
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