----------------------------------------------------------------------------------------
--shapes.lua Makes shapes that user can move
----------------------------------------------------------------------------------------

--module variables
local attributes = {
	--current attribute
	currentAttribute = "",
	--shape related attributes
	"3 sides",
	"4 side",
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
	attributes.currentAttribute = "round"
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