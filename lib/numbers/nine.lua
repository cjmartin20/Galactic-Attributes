----------------------------------------------------------------------------------------
--nine.lua	Creates object shaped like the number 9
----------------------------------------------------------------------------------------

local nine = {
	originalColor = { Red = 0, Green = 0, Blue = 0 },
	hasAttribute = nil,
	inPosition = nil,
	"nine",
    "odd"
}
local useAttributes = require "attributes"
function nine.createNine( x, y, scaler, currentAttribute )
	x = x or display.contentCenterX
    y = y or display.contentCenterY
    scaler = scaler * 7 or 7
    --coordinates to make shape of nine
	local nineShape = { -3*scaler,-11*scaler, -6*scaler,1*scaler, 2*scaler,1*scaler, 3*scaler,-3*scaler, -1*scaler,-3*scaler, 0,-7*scaler, 4*scaler,-7*scaler, 1*scaler,5*scaler, -7*scaler,5*scaler, -8*scaler,9*scaler, 4*scaler,9*scaler, 9*scaler,-11*scaler }
	local anine = display.newPolygon( x, y, nineShape )
	Red = 7
	Green = 5
	Blue = 0
	nine.originalColor.Red = Red
	nine.originalColor.Green = Green
	nine.originalColor.Blue = Blue
	anine:setFillColor( Red, Green, Blue )      -- fill the nine with color
    --anine.strokeWidth = 0.016 * display.contentWidth   -- Sets the width of the border of nine
	--Set Stroke color
    anine:setStrokeColor( 128, 0, 128 )    -- Sets the border color
    anine:addEventListener( "touch", nine.move )
    anine.alpha = 0.7 --nine opacity 
	--check if nine has attributes.currentAttribute (in attributes.lua table)
	print( "Checking nine Attributes" )
	local test = false
    for index, attribute in ipairs(nine) do
        print("checking ", index, attribute)
        if attribute == currentAttribute then
            test = true
            print("nine Has Attribute")
        end
	end
	nine.hasAttribute = test
    --initialize attributes.hasAttribute if no value set it to true
    return anine
end --createNine function
--Move shapes function
function nine.move( event )
    --eventt.target comes from EventListener and is the object the "touch" is targeting
	local object = event.target
    local touchDistance = object.width
	--Move shape
	if math.abs( object.x - event.x ) < touchDistance and math.abs( object.y - event.y ) < touchDistance then
		object.x = event.x
		object.y = event.y
    end
    --Change color if nine is in position and has attribute
	if useAttributes.isShapeWithinRadius( object, .85 * display.contentCenterX, display.contentCenterX, display.contentCenterY) then
        if nine.hasAttribute then
			--change color to green
			object:setFillColor( 0, 128 , 0)
		else
			--change color to red
			object:setFillColor( 128, 0 , 0 )
		end
		nine.inPosition = true
	else
		object:setFillColor( nine.originalColor.Red, nine.originalColor.Green, nine.originalColor.Blue )
		nine.inPosition = false
	end 
end --end move function
return nine