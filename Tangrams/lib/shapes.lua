----------------------------------------------------------------------------------------
--shapes.lua Makes shapes that user can move
----------------------------------------------------------------------------------------

--module variables
local shapes = {}
local currentShapes = {}

local physics = require( "physics" )
physics.start( true )
physics.setGravity( 0, 0 ) --( gravityX, gravityY )


local worldGroup = display.newGroup()


--Initializing function
function shapes.start()
	shapes.createCircle(60, 450, 40)
	shapes.createTriangle()
end



--Move shapes function
function shapes.moveShape( event )  
	local object = event.target
	object.x = event.x
	object.y = event.y
end

--Create circle function
function shapes.createCircle(x , y, rad)
	--need to make default parameters
	x = x or contentCenterX
	y = y or contentCenterY
	rad = rad or 150

	local aCircle = display.newCircle( x, y, rad )		--x-coordinate, y-coordinate, radius
	aCircle:setFillColor( 121, 121, 121 )      -- fill the circle with color
	aCircle.strokeWidth = 4   -- Sets the width of the border of circle
	aCircle:setStrokeColor( 128, 0, 0 )    -- Sets the border color
	table.insert( currentShapes, aCircle )
	physics.addBody( aCircle, {friction = 0.5, bounce = 0.7, radius = rad, setGravity = 0 })
	aCircle:addEventListener( "touch", shapes.moveShape )

	return aCircle
end

function shapes.createTriangle()

	local triangleShape = { 500,400, 500,400, 500,400}
	local triangle = display.newPolygon( worldGroup, 0, 0, triangleShape )
	physics.addBody( triangle, { friction=0.5, bounce=0.3, shape=triangleShape } )
	triangle:addEventListener( "touch", shapes.moveShape )
	return triangle


	


end

--[[
-------------------------------------------------------------------------------------------
--The below codes has been borrowed and edited from :
-- Corona > Sameple Code > Physics > ShapeTumbler
-------------------------------------------------------------------------------------------
function shapes.createTriangle()
	local triangleShape = { 0,-32, 37,32, -37,32 }
	local triangle = display.newPolygon( worldGroup, 0, 0, triangleShape )
	physics.addBody( triangle, { friction=0.5, bounce=0.3, shape=triangleShape } )
	return triangle
end
local function createTriangle()
	local triangleShape = { 0,-32, 37,32, -37,32 }
	local triangle = display.newPolygon( worldGroup, 0, 0, triangleShape )
	physics.addBody( triangle, { friction=0.5, bounce=0.3, shape=triangleShape } )
	return triangle
end
-- Create hexagon function
local function createHexagon()
	local hexagonShape = { 0,-38, 33,-19, 33,19, 0,38, -33,19, -33,-19 }
	local hexagon = display.newPolygon( worldGroup, 0, 0, hexagonShape )
	physics.addBody( hexagon, { friction=0.5, bounce=0.4, shape=hexagonShape } )
	return hexagon
end
-- Create small box function
local function createBoxSmall()
	local boxSmall = display.newRect( worldGroup, 0, 0, 50, 50 )
	physics.addBody( boxSmall, { friction=0.5, bounce=0.4 } )
	return boxSmall
end
-- Create large box function
local function createBoxLarge()
	local boxLarge = display.newRect( worldGroup, 0, 0, 75, 75 )
	physics.addBody( boxLarge, { friction=0.5, bounce=0.4 } )
	return boxLarge
end
-- Create cell function
local function createCell()
	local cellShape = { -30,-10, -25,-15, 25,-15, 30,-10, 30,10, 25,15, -25,15, -30,10 }
	local cell = display.newPolygon( worldGroup, 0, 0, cellShape )
	physics.addBody( cell, { friction=0.5, bounce=0.4, shape=cellShape } )
	return cell
end
-- Create ball function
local function createBall()
	local ball = display.newCircle( worldGroup, 0, 0, 30 )
	physics.addBody( ball, { friction=0.5, bounce=0.7, radius=30 } )
	return ball
end
-- Create random object function
local function createRandomObject()
	local r = math.random( 1, 6 )
	local object
	if ( r == 1 ) then
		object = createTriangle()
	elseif ( r == 2 ) then
		object = createHexagon()
	elseif ( r == 3 ) then
		object = createBoxSmall()
	elseif ( r == 4 ) then
		object = createBoxLarge()
	elseif ( r == 5 ) then
		object = createCell()
	elseif ( r == 6 ) then
		object = createBall()
	end
	return object
end
-- Fill the content area with some objects
local function spawnObjects()
	local xIndex = 0
	local yPos = 100
	for i = 1, 8 do
		local object = createRandomObject()
		object:setFillColor( ( math.random( 4, 8 ) / 10 ), ( math.random( 0, 2 ) / 10 ), ( math.random( 4, 10 ) / 10 ) )
		if ( xIndex == 4 ) then
			xIndex = 0
			yPos = 220
		end
		object.y = yPos + ( math.random( -1, 1 ) * 15 )
		object.x = ( xIndex * 120 ) + 60 + ( math.random( -1, 1 ) * 15 )
		xIndex = xIndex + 1
	end
end
-- Function to adjust gravity based on accelerometer response
local function onTilt( event )
	-- Gravity is in portrait orientation on Android, iOS, and Windows Phone
	-- On tvOS, gravity is in the orientation of the device attached to the event
	if ( event.device ) then
		physics.setGravity( ( 9.8 * event.xGravity ), ( -9.8 * event.yGravity ) )
	else
		physics.setGravity( ( -9.8 * event.yGravity ), ( -9.8 * event.xGravity ) )
	end
end
--]]

return shapes
