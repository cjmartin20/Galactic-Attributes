---------------------------------------------------------------
-- main.lua 	main program for Attribute Blocks
---------------------------------------------------------------

--change the path below to the lib directory
local lib =  "C:\\Users\\cjmar\\Documents\\SHARED\\Software Engineering\\Lua\\Galactic Attributes\\lib\\"
--local lib =  ".\\lib" --trying to get this to work
package.path = lib .. "?.lua;" .. package.path

local useGameSetup = require "gameSetup"

useGameSetup.createStartBackground()
useGameSetup.createStartButton()

