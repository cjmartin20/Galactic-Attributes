-----------------------------------------------------------------------
-- square.lua	Creates Square Object
-----------------------------------------------------------------------

local square = {
	aSquare = nil,
	originalColor = { Red = 0, Green = 0, Blue = 0},
	hasAttribute = nil,
	inPosition = nil,
	"square",
    "right angles",
    "vertices",
    "4 sides",
	"4 vertices",
	"polygon"
}
local useAttributes = require "attributes"
function square.createSquare(x, y, scaler, currentAttribute )
	x = x or display.contentCenterX
	y = y or display.contentCenterY
	scaler = scaler or 1
	Red =  0
	Green = 50
	Blue = 50
	square.originalColor.Red = Red
	square.originalColor.Green = Green
	square.originalColor.Blue = Blue
	square.aSquare = display.newRect( x, y, scaler * 110, scaler * 110 )
	square.aSquare:setFillColor( Red, Green, Blue )
	square.aSquare.strokeWidth = 0.016 * display.contentWidth   -- Sets the width of the border
	square.aSquare:setStrokeColor( 128, 0, 128 )    -- Sets the border color
	--Set Stroke color
	square.aSquare:addEventListener( "touch", square.move )
	square.aSquare.alpha = 0.7 --opacity 
	print( "Checking Square Attributes" )
	local test = false
    for index, attribute in ipairs(square) do
        print("checking ", index, attribute)
        if attribute == currentAttribute then
            test = true
            print("Square Has Attribute")
        end
	end
	square.hasAttribute = test
	--initialize attributes.hasAttribute if no value set it to true
	return square
end --createSquare function	
--Move shapes function
function square.move( event )
    --event.target comes from EventListener and is the object the "touch" is targeting	
	local object = event.target
    local touchDistance = object.width
	--Move shape
	if math.abs( object.x - event.x ) < touchDistance and math.abs( object.y - event.y ) < touchDistance then
		object.x = event.x
		object.y = event.y
    end
    --Change color if square is in position and has attribute
	if useAttributes.isShapeWithinRadius( object, .85 * display.contentCenterX, display.contentCenterX, display.contentCenterY) then
        if square.hasAttribute == true then
			--change color to green
			object:setFillColor( 0, 128 , 0)
		else
			--change color to red
			object:setFillColor( 128, 0, 0 )
		end
		square.inPosition = true
	else
		object:setFillColor( square.originalColor.Red, square.originalColor.Green , square.originalColor.Blue )
		square.inPosition = false
    end 
end --move function
return square