----------------------------------------------------------------------------------------
--Shapes.lua Makes shapes that user can move
----------------------------------------------------------------------------------------

--module variables
local Shapes = {}
local currentShapes = {}
function Shapes.start()
	Shapes.circle(200, 200, 125)
	Shapes.circle(200, 200, 125)
	Shapes.circle(900, 1500, 180)
end

--*******************************************************************
--function to move shapes
function Shapes.moveShape( event )  
	local object = event.target
                   
		object.x = event.x
		object.y = event.y
--	end
	print("test")
end

function Shapes.circle(x, y, radius)
	rad = radius or 150
	xCor = x or contentCenterX
	yCor = y or contentCenterY
	local aCircle = display.newCircle( xCor, yCor, rad )		--x-coordinate, y-coordinate, radius

	aCircle:setFillColor( 121, 121, 121 )      -- fill the circle with color
	aCircle.strokeWidth = 4   -- Sets the width of the border of circle
	aCircle:setStrokeColor( 128, 0, 0 )    -- Sets the border color
	table.insert( currentShapes, aCircle )

	aCircle:addEventListener( "touch", Shapes.moveShape )
	return true
end
return Shapes

