-------------------------------------------------------------------
-- aideTriangle.lua
-------------------------------------------------------------------

local aideTriangle = {
    hasAttribute = nil,
    "Aide's Triangle",
    "vertices",
    ""
}

local useAttributes = require "attributes"
local usePhysics = require "physics"

function aideTriangle.createTriangle()
	local triangleShape = { 0,-100, 130,100, -130,100 }
	local aTriangle = display.newPolygon( 350, 500, triangleShape )
	physics.addBody( aTriangle, { friction=0.5, bounce=0.3, shape=triangleShape } )
    aTriangle:setFillColor( Red, Green, Blue )      -- fill the circle with color
	aTriangle.strokeWidth = 10   -- Sets the width of the border of circle
	aTriangle:setStrokeColor( 128, 0, 128 )    -- Sets the border color
	physics.addBody( aTriangle, {friction = 1.0, bounce = 0.7, radius = rad, setGravity = .5 })
    aTriangle:addEventListener( "touch", aideTriangle.move )
    aTriangle.alpha = 0.7 --circle opacity 
    --check if cirlce has attributes.currentAttribute (in attributes.lua table)
    for index, attribute in ipairs( aideTriangle ) do
        print( "checking ", index, attribute )
        if attribute == useAttributes.currentAttribute then
            aideTriangle.hasAttribute = true
            print( "true" )
        end
    end
    --initialize attributes.hasAttribute if no value set it to true
    if aideTriangle.hasAttribute == nil then
        aideTriangle.hasAttribute = false
    end
    return aTriangle
end

--Move shapes function
function aideTriangle.move( event )

    --event.target comes from EventListener and is the object the "touch" is targeting
	local object = event.target
    local touchDistance = object.width

	--Move shape
	if math.abs( object.x - event.x ) < touchDistance and math.abs( object.y - event.y ) < touchDistance then
		object.x = event.x
		object.y = event.y
    end
    --Change color if circle is in moon and has attribute
	if useAttributes.isShapeWithinRadius( object, .85 * display.contentCenterX, display.contentCenterX, display.contentCenterY) then
        if aideTriangle.hasAttribute then
			--change color to green
			object:setFillColor( 0, 128 , 0)
		else
			--change color to red
			object:setFillColor( 128, 0 , 0 )
		end
	else
		object:setFillColor( 30, 0, 150 )
    end 
end --move function
return aideTriangle
