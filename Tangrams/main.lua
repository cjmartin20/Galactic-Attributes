---------------------------------------------------------------
-- main.lua 	main program for Attribute Blocks
---------------------------------------------------------------

--change the path below to the lib directory
local lib =  "C:\\Users\\cjmar\\Documents\\SHARED\\Software Engineering\\Learning Modules\\Tangrams\\lib\\"

--local lib = "C:\\Users\\matthewmartinez\\Desktop\\AttributeBlocks"
--local lib =  ".\\lib\\" --trying to get this to work

--local lib =  ".\\lib" --trying to get this to work
package.path = lib .. "?.lua;" .. package.path
local useShapes = require "shapes"
local setgame = require "gameSetup"


setgame.startMenu()




