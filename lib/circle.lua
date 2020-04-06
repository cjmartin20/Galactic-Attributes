----------------------------------------------------------------------------------------
--circle.lua Makes shapes that user can move
----------------------------------------------------------------------------------------

local circle = {
    hasAttribute = nil,
    "round",
    "radius",
    "circumference",
    "no vertices"
}

local useAttributes = require "attributes"
local usePhysics = require "physics"


--function createCircle displays circle object and initializes circle.hasAttrube
--based on currentAttribute in shapes.lua.
function circle.createCircle( x, y, rad )
	x = x or display.contentCenterX
	y = y or display.contentCenterY
    rad = rad or 150
	--make random colors (excluding green - setting to zero)
	Red = 30
	Green = 0
	Blue = 150
	aCircle = display.newCircle( x, y, rad )		--x-coordinate, y-coordinate, radius
	aCircle:setFillColor( Red, Green, Blue )      -- fill the circle with color
	aCircle.strokeWidth = 10   -- Sets the width of the border of circle
	aCircle:setStrokeColor( 128, 0, 128 )    -- Sets the border color
	physics.addBody( aCircle, {friction = 1.0, bounce = 0.7, radius = rad, setGravity = .5 })
    aCircle:addEventListener( "touch", circle.move )
    aCircle.alpha = 0.7 --circle opacity 
    --check if cirlce has attributes.currentAttribute (in attributes.lua table)
    for index, attribute in ipairs(circle) do
        print("checking ", index, attribute)
        if attribute == useAttributes.currentAttribute then
            circle.hasAttribute = true
            print("true")
        end
    end
    --initialize attributes.hasAttribute if no value set it to true
    if circle.hasAttribute == nil then
        circle.hasAttribute = false
    end
    return aCircle
end --createCircle function

--Move shapes function
function circle.move( event )

    --eventt.target comes from EventListener and is the object the "touch" is targeting
	local object = event.target
    local touchDistance = object.width

	--Move shape
	if math.abs( object.x - event.x ) < touchDistance and math.abs( object.y - event.y ) < touchDistance then
		object.x = event.x
		object.y = event.y
    end
    --Change color if circle is in moon and has attribute
	if useAttributes.isShapeWithinRadius( object, .85 * display.contentCenterX, display.contentCenterX, display.contentCenterY) then
        if circle.hasAttribute then
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
return circle