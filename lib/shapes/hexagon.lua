----------------------------------------------------------------------------------------
--hexagon.lua	Creates Hexagon Object
----------------------------------------------------------------------------------------

local hexagon = {
	originalColor = { Red = 0, Green = 0, Blue = 0},
	hasAttribute = nil,
	inPosition = nil,
	"hexagon",
    "6 sides",
	"6 vertices",
	"polygon"
}
local useAttributes = require "attributes"
function hexagon.createHexagon( x, y, scaler, currentAttribute )
	x = x or display.contentCenterX
	y = y or display.contentCenterY
	scaler = scaler * 0.5 or 0.5
	local hexagonShape = { 0,-152*scaler, 132*scaler,-76*scaler, 132*scaler,76*scaler, 0,152*scaler, -132*scaler,76*scaler, -132*scaler,-76*scaler }
	local aHexagon = display.newPolygon( 0, 0, hexagonShape )
	Red = 0
	Green = 5
	Blue = 5
	hexagon.originalColor.Red = Red
	hexagon.originalColor.Green = Green
	hexagon.originalColor.Blue = Blue
	aHexagon:setFillColor( Red, Green, Blue )      -- fill the hexagon with color
	aHexagon.strokeWidth = 0.016 * display.contentWidth   -- Sets the width of the border of hexagon
	--Set Stroke color
	aHexagon:setStrokeColor( 128, 0, 128 )    -- Sets the border color
    aHexagon:addEventListener( "touch", hexagon.move )
    aHexagon.alpha = 0.7 --hexagon opacity 
	--check if hexagon has attributes.currentAttribute (in attributes.lua table)
	print( "Checking Hexagon Attributes" )
	local test = false
    for index, attribute in ipairs(hexagon) do
        print("checking ", index, attribute)
        if attribute == currentAttribute then
            test = true
            print("Hexagon Has Attribute")
        end
	end
	hexagon.hasAttribute = test
    --initialize attributes.hasAttribute if no value set it to true
    return aHexagon
end --createHexagon function
--Move shapes function
function hexagon.move( event )
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
        if hexagon.hasAttribute then
			--change color to green
			object:setFillColor( 0, 128 , 0)
		else
			--change color to red
			object:setFillColor( 128, 0 , 0 )
		end
		hexagon.inPosition = true
	else
		object:setFillColor( hexagon.originalColor.Red, hexagon.originalColor.Green, hexagon.originalColor.Blue )
		hexagon.inPosition = false
	end 
end --end move function
return hexagon
