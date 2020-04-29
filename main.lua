---------------------------------------------------------------
-- main.lua 	main program for Attribute Blocks
---------------------------------------------------------------

--change the path below to the lib directory
--change the path below to the lib directory
local curDir =  'C:\\Users\\cjmar\\Documents\\SHARED\\Software Engineering\\Lua\\Galactic Attributes\\'
package.path = curDir .. 'lib\\?.lua;' .. package.path

local useGameSetup = require "gameSetup"

useGameSetup.createStartBackground()
useGameSetup.createStartButton()

