----------------------------------------------------------------------------------------
--shapes.lua Makes shapes that user can move
----------------------------------------------------------------------------------------

--module variables
local shapes = {}
local currentShapes = {}
local physics = require( "physics" )
local currentAttribute = "round"
local attributeList = {

}


--Initializing function
function shapes.start()
	shapes.createCircle( 0.15 * display.contentWidth, 0.10 * display.contentHeight, 200  ) 
	shapes.createCircle( display.contentCenterX, 0.95 * display.contentHeight, 200  )
	shapes.createBoxSmall( 0.90 * display.contentWidth, 0.15 * display.contentHeight, 250  )
	shapes.createBoxSmall( 0.85 * display.contentWidth, 0.90 * display.contentHeight, 250  )

end

function shapes.changeAttribute()
	--create function to randomly assign the attribute to focus
	number = math.random( 0, 1)
	currentAttribute = number
	print(currentAttribute)
end

--Move shapes function
function shapes.moveShape( event )

	local object = event.target
	local touchDistance = object.width
	--[[
	--X distance to keep object center away from edge
	local cushionX = 0.01 * display.contentWidth
	--Y distance to keep object center away from edge
	local cushionY = 0.01 * display.contentHeight

	--make boundaries to prevent objects from leaving screen
	if object.x < cushionX or object.x < ( display.contentWidth - cushionX ) then
		--if it is top
		if object.x < cushionX then
			object.x = object.x + cushionX
		else
			object.x = object.x - cushionX
		end	
	else
		object.x = event.x
	end 
	if object.y < cushionY or object.y < ( display.contentHeight - cushionY ) then
		--if it is left side
		if object.y < cushionX then
			object.y = object.y + cushionY
		else
			object.y = object.y - cushionY
		end	
	else
		object.y = event.y
	end 
	--]]
	--Shape is not too close to border
		--Shape is within attribute area 
		--if  then
			--Shape has named attribute
		--	if then
	
	--Move shape
	if math.abs( object.x - event.x ) < touchDistance and math.abs( object.y - event.y ) < touchDistance then
		object.x = event.x
		object.y = event.y
	end
	if shapes.isShapeWithinRadius( object, .85 * display.contentCenterX, display.contentCenterX, display.contentCenterY) then
		if shapes.hasAttribute( object ) then
			--change color to green
			object:setFillColor( 0, 128 , 0)
		else
			--change color to red
			object:setFillColor( 128, 0 , 0 )
		end
	else
		object:setFillColor( 30, 0, 150 )
	end 

--	if object.vertices == false then
--		print("Not vertices")
--	end
end --moveShape function

--function to check if shapes is within certain radius of x, y coordinate
function shapes.isShapeWithinRadius( obj, radius, x, y )
	radius = radius or 0.4 * display.contentCenterX
	x = x or display.contentCenterX
	y = y or display.contentCenterY

	x = (obj.x - x) * (obj.x - x)
	y = (obj.y - y) * (obj.y - y)
	distance = math.sqrt( x + y )

	if distance < radius then
		return true
	else
		return false
	end
end

function shapes.hasAttribute( object )
	if object.width == 260 then
		print(object.width)
		return true
	else 
		return false
	end
end




--Create circle function
function shapes.createCircle(x , y, rad)
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
	physics.addBody( aCircle, {friction = 0.5, bounce = 0.7, radius = rad, setGravity = .5 })
	aCircle:addEventListener( "touch", shapes.moveShape )
	aCircle.alpha = 0.7 --circle opacity 
	return aCircle
end
-- Create small box function
function shapes.createBoxSmall(x, y, sideLength)
	x = x or display.contentCenterX
	y = y or display.contentCenterY
	sideLength = sideLength or 150
	--make random colors (excluding green - setting to zero)
	Red = 30
	Green = 0
	Blue = 150
	local boxSmall = display.newRect( x, y, sideLength, sideLength )
	boxSmall.strokeWidth = 10   -- Sets the width of the border of circle
	boxSmall:setStrokeColor( Red, Green, Blue )    -- Sets the border color
	physics.addBody( boxSmall, { friction=0.5, bounce=0.4 } )
	boxSmall:addEventListener( "touch", shapes.moveShape )
	boxSmall.alpha = 0.7 --circle opacity 
	return boxSmall
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

