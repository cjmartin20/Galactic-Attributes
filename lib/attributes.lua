----------------------------------------------------------------------------------------
--shapes.lua Makes shapes that user can move
----------------------------------------------------------------------------------------

--module variables
local attributes = {
	--current attribute
	currentAttribute = "",
	

	--shape related attributes
	"round",
	"vertices",
	"radius",
	"circumference",
	"right angles",
	"hypotenuse",

	--number related attributes
	"prime",
	"even",
	"odd"
}

--Initializing function
function attributes.start()

	attributes.currentAttribute = "Aide's Triangle"
	print("works so far")

end

--function to check if shapes is within certain radius of x, y coordinate
function attributes.isShapeWithinRadius( obj, radius, x, y )

	radius = radius or 0.4 * display.contentCenterX
	x = x or display.contentCenterX
	y = y or display.contentCenterY

	--distance is length of hypotenuse for right triangle with sides x and y
	x = (obj.x - x) * (obj.x - x) --(obj.x - x) ^ 2
	y = (obj.y - y) * (obj.y - y) --(obj.y - y) ^ 2
	distance = math.sqrt( x + y )

	if distance < radius then
		return true
	else
		return false
	end
end

local clock = os.clock

function sleep(n)  -- seconds
  local t0 = clock()
  while clock() - t0 <= n do
	print( clock() - t0 )
  end
end


return attributes







--[[
-------------------------------------------------------------------------------------------
--The below codes has been borrowed and edited from :
-- Corona > Sameple Code > Physics > ShapeTumbler
-------------------------------------------------------------------------------------------






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