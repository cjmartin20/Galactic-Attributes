----------------------------------------------------------------------------------------
--seven.lua	Creates object shaped like the number 7
----------------------------------------------------------------------------------------

local seven = {
	object = nil,
	originalColor = { Red = 0, Green = 0, Blue = 0 },
	hasAttribute = nil,
	inPosition = false,
	"seven",
	"odd",
	"prime"
}
local useAttributes = require "attributes"
function seven.createSeven( x, y, scaler, currentAttribute )
	x = x or display.contentCenterX
    y = y or display.contentCenterY
    scaler = scaler * 7 or 7
    --coordinates to make shape of seven
	local sevenShape = { -3*scaler,-11*scaler, 0,-7*scaler, 4*scaler,-7*scaler, 1*scaler,5*scaler, 4*scaler,9*scaler, 9*scaler,-11*scaler }
	seven.object = display.newPolygon( x, y, sevenShape )
	Red = 7
	Green = 5
	Blue = 0
	seven.originalColor.Red = Red
	seven.originalColor.Green = Green
	seven.originalColor.Blue = Blue
	seven.object:setFillColor( Red, Green, Blue )      -- fill the seven with color
    --seven.object.strokeWidth = 0.016 * display.contentWidth   -- Sets the width of the border of seven
	--Set Stroke color
    seven.object:setStrokeColor( 128, 0, 128 )    -- Sets the border color
    seven.object:addEventListener( "touch", seven.move )
    seven.object.alpha = 0.7 --seven opacity 
	--check if seven has attributes.currentAttribute (in attributes.lua table)
	print( "Checking seven Attributes" )
	local test = false
    for index, attribute in ipairs(seven) do
        print("checking ", index, attribute)
        if attribute == currentAttribute then
            test = true
            print("seven Has Attribute")
        end
	end
	seven.hasAttribute = test
    --initialize attributes.hasAttribute if no value set it to true
    return seven
end --createSeven function
--Move shapes function
function seven.move( event )
    --eventt.target comes from EventListener and is the object the "touch" is targeting
	local object = event.target
    local touchDistance = object.width
	--Move shape
	if math.abs( object.x - event.x ) < touchDistance and math.abs( object.y - event.y ) < touchDistance then
		object.x = event.x
		object.y = event.y
    end
    --Change color if seven is in position and has attribute
	if useAttributes.isShapeWithinRadius( object, .85 * display.contentCenterX, display.contentCenterX, display.contentCenterY) then
        if seven.hasAttribute then
			--change color to green
			object:setFillColor( 0, 128 , 0)
		else
			--change color to red
			object:setFillColor( 128, 0 , 0 )
		end
		seven.inPosition = true
	else
		object:setFillColor( seven.originalColor.Red, seven.originalColor.Green, seven.originalColor.Blue )
		seven.inPosition = false
	end 
end --end move function
return seven