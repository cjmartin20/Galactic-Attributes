----------------------------------------------------------------------------------------
--pentagon.lua	Creates Pentagon Object
----------------------------------------------------------------------------------------

local pentagon = {
	object = nil,
	originalColor = { Red = 0, Green = 0, Blue = 0},
	hasAttribute = nil,
	inPosition = nil,
	"pentagon",
    "5 sides",
	"5 vertices",
	"polygon"
}
local useAttributes = require "attributes"

function pentagon.createPentagon( x, y, scaler, currentAttribute )
	x = x or display.contentCenterX
	y = y or display.contentCenterY
	scaler = scaler * 11 or 11
	local pentagonShape = { 0,-6*scaler, -7*scaler,-2*scaler, -4*scaler,5*scaler, 4*scaler,5*scaler, 7*scaler,-2*scaler }
	pentagon.object = display.newPolygon( x, y, pentagonShape )
	Red = 0
	Green = 5
	Blue = 5
	pentagon.originalColor.Red = Red
	pentagon.originalColor.Green = Green
	pentagon.originalColor.Blue = Blue
	pentagon.object:setFillColor( Red, Green, Blue )      -- fill the pentagon with color
	pentagon.object.strokeWidth = 0.016 * display.contentWidth   -- Sets the width of the border of pentagon
	--Set Stroke color
	pentagon.object:setStrokeColor( 128, 0, 128 )    -- Sets the border color
    pentagon.object:addEventListener( "touch", pentagon.move )
    pentagon.object.alpha = 0.7 --pentagon opacity 
	--check if pentagon has attributes.currentAttribute (in attributes.lua table)
	print( "Checking pentagon Attributes" )
	local test = false
    for index, attribute in ipairs(pentagon) do
        print("checking ", index, attribute)
        if attribute == currentAttribute then
            test = true
            print("pentagon Has Attribute")
        end
	end
	pentagon.hasAttribute = test
    --initialize attributes.hasAttribute if no value set it to true
    return pentagon
end --createPentagon function
--Move shapes function
function pentagon.move( event )
    --eventt.target comes from EventListener and is the object the "touch" is targeting
	local object = event.target
    local touchDistance = object.width
	--Move shape
	if math.abs( object.x - event.x ) < touchDistance and math.abs( object.y - event.y ) < touchDistance then
		object.x = event.x
		object.y = event.y
    end
    --Change color if pentagon is in position and has attribute
	if useAttributes.isShapeWithinRadius( object, .85 * display.contentCenterX, display.contentCenterX, display.contentCenterY) then
        if pentagon.hasAttribute then
			--change color to green
			object:setFillColor( 0, 128 , 0)
		else
			--change color to red
			object:setFillColor( 128, 0 , 0 )
		end
		pentagon.inPosition = true
	else
		object:setFillColor( pentagon.originalColor.Red, pentagon.originalColor.Green, pentagon.originalColor.Blue )
		pentagon.inPosition = false
	end 
end --end move function
return pentagon