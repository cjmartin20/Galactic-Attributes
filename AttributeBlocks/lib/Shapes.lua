----------------------------------------------------------------------------------------
--shapes.lua Makes shapes that user can move
----------------------------------------------------------------------------------------

--module variables
local shapes = {}
local currentShapes = {}
local physics = require( "physics" )
physics.start( true )

function shapes.start()
	shapes.circle(200, 200, 125)
	shapes.circle(200, 200, 125)
	shapes.circle(900, 1500, 180)
end

--*******************************************************************
--function to move shapes
function shapes.moveShape( event )  
	local object = event.target
                   
		object.x = event.x
		object.y = event.y
--	end
	print("test")
end

function shapes.circle(x, y, radius)
	rad = radius or 150
	xCor = x or contentCenterX
	yCor = y or contentCenterY
	local aCircle = display.newCircle( xCor, yCor, rad )		--x-coordinate, y-coordinate, radius

	aCircle:setFillColor( 121, 121, 121 )      -- fill the circle with color
	aCircle.strokeWidth = 4   -- Sets the width of the border of circle
	aCircle:setStrokeColor( 128, 0, 0 )    -- Sets the border color
	table.insert( currentShapes, aCircle )

	physics.addBody( aCircle, {friction = 0.5, bounce = 0.7, radius = rad})

	aCircle:addEventListener( "touch", shapes.moveShape )
	return aCircle
end
function shapes.createTriangle()
	local triangleShape = { 0,-32, 37,32, -37,32 }
	local triangle = display.newPolygon( worldGroup, 0, 0, triangleShape )
	physics.addBody( triangle, { friction=0.5, bounce=0.3, shape=triangleShape } )
	return triangle
end
return shapes

