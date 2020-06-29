----------------------------------------------------------------------------------------
--four.lua	Creates object shaped like the number 4
----------------------------------------------------------------------------------------

local four = {
	object = nil,
	originalColor = { Red = 0, Green = 0, Blue = 0 },
	hasAttribute = nil,
	inPosition = nil,
	"four",
	"even",
	"divisible by two"
}
local useAttributes = require "attributes"
function four.createFour( x, y, scaler, currentAttribute )
	x = x or display.contentCenterX
    y = y or display.contentCenterY
    scaler = scaler * 7 or 7
    --coordinates to make shape of four
	local fourShape = { -3*scaler,-11*scaler, -6*scaler,1*scaler, 2*scaler,1*scaler, 1*scaler,5*scaler, 4*scaler,9*scaler, 9*scaler,-11*scaler, 4*scaler,-7*scaler, 3*scaler,-3*scaler, -1*scaler,-3*scaler, 0,-7*scaler }
	four.object = display.newPolygon( x, y, fourShape )
	Red = 7
	Green = 5
	Blue = 0
	four.originalColor.Red = Red
	four.originalColor.Green = Green
	four.originalColor.Blue = Blue
	four.object:setFillColor( Red, Green, Blue )      -- fill the four with color
    --four.object.strokeWidth = 0.016 * display.contentWidth   -- Sets the width of the border of four
	--Set Stroke color
    four.object:setStrokeColor( 128, 0, 128 )    -- Sets the border color
    four.object:addEventListener( "touch", four.move )
    four.object.alpha = 0.7 --four opacity 
	--check if four has attributes.currentAttribute (in attributes.lua table)
	print( "Checking four Attributes" )
	local test = false
    for index, attribute in ipairs(four) do
        print("checking ", index, attribute)
        if attribute == currentAttribute then
            test = true
            print("four Has Attribute")
        end
	end
	four.hasAttribute = test
    --initialize attributes.hasAttribute if no value set it to true
    return four
end --createFour function
--Move shapes function
function four.move( event )
    --eventt.target comes from EventListener and is the object the "touch" is targeting
	local object = event.target
    local touchDistance = object.width
	--Move shape
	if math.abs( object.x - event.x ) < touchDistance and math.abs( object.y - event.y ) < touchDistance then
		object.x = event.x
		object.y = event.y
    end
    --Change color if four is in position and has attribute
	if useAttributes.isShapeWithinRadius( object, .85 * display.contentCenterX, display.contentCenterX, display.contentCenterY) then
        if four.hasAttribute then
			--change color to green
			object:setFillColor( 0, 128 , 0)
		else
			--change color to red
			object:setFillColor( 128, 0 , 0 )
		end
		four.inPosition = true
	else
		object:setFillColor( four.originalColor.Red, four.originalColor.Green, four.originalColor.Blue )
		four.inPosition = false
	end 
end --end move function
return four