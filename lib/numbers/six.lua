----------------------------------------------------------------------------------------
--six.lua	Creates object shaped like the number 6
----------------------------------------------------------------------------------------

local six = {
	object = nil,
	originalColor = { Red = 0, Green = 0, Blue = 0 },
	hasAttribute = nil,
	inPosition = nil,
	"six",
	"even",
	"divisible by two"
}
local useAttributes = require "attributes"
function six.createSix( x, y, scaler, currentAttribute )
	x = x or display.contentCenterX
    y = y or display.contentCenterY
    scaler = scaler * 7 or 7
    --coordinates to make shape of six
    local sixShape = { -3*scaler,-11*scaler, 9*scaler,-11*scaler, 8*scaler,-7*scaler, 0,-7*scaler, -3*scaler,5*scaler, 1*scaler,5*scaler, 2*scaler,1*scaler, -2*scaler,1*scaler, -1*scaler,-3*scaler, 7*scaler,-3*scaler, 4*scaler,9*scaler, -8*scaler,9*scaler }
	six.object = display.newPolygon( x, y, sixShape )
	Red = 7
	Green = 5
	Blue = 0
	six.originalColor.Red = Red
	six.originalColor.Green = Green
	six.originalColor.Blue = Blue
	six.object:setFillColor( Red, Green, Blue )      -- fill the six with color
    --six.object.strokeWidth = 0.016 * display.contentWidth   -- Sets the width of the border of six
	--Set Stroke color
    six.object:setStrokeColor( 128, 0, 128 )    -- Sets the border color
    six.object:addEventListener( "touch", six.move )
    six.object.alpha = 0.7 --six opacity 
	--check if six has attributes.currentAttribute (in attributes.lua table)
	print( "Checking six Attributes" )
	local test = false
    for index, attribute in ipairs(six) do
        print("checking ", index, attribute)
        if attribute == currentAttribute then
            test = true
            print("six Has Attribute")
        end
	end
	six.hasAttribute = test
    --initialize attributes.hasAttribute if no value set it to true
    return six
end --createSix function
--Move shapes function
function six.move( event )
    --eventt.target comes from EventListener and is the object the "touch" is targeting
	local object = event.target
    local touchDistance = object.width
	--Move shape
	if math.abs( object.x - event.x ) < touchDistance and math.abs( object.y - event.y ) < touchDistance then
		object.x = event.x
		object.y = event.y
    end
    --Change color if six is in position and has attribute
	if useAttributes.isShapeWithinRadius( object, .85 * display.contentCenterX, display.contentCenterX, display.contentCenterY) then
        if six.hasAttribute then
			--change color to green
			object:setFillColor( 0, 128 , 0)
		else
			--change color to red
			object:setFillColor( 128, 0 , 0 )
		end
		six.inPosition = true
	else
		object:setFillColor( six.originalColor.Red, six.originalColor.Green, six.originalColor.Blue )
		six.inPosition = false
	end 
end --end move function
return six