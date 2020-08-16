---------------------------------------------------------------
-- main.lua 	main program for Attribute Blocks
---------------------------------------------------------------



--change the path below to the lib directory
--change the path below to the lib directory
local curDir =  'C:\\Users\\cjmar\\Documents\\SHARED\\x_Github\\Galactic-Attributes\\'
package.path = curDir .. 'lib\\?.lua;' .. package.path
package.path = curDir .. 'lib\\numbers\\?.lua;' .. package.path
package.path = curDir .. 'lib\\shapes\\?.lua;' .. package.path

local useGameSetup = require "gameSetup"

useGameSetup.createStartBackground()
useGameSetup.createStartButton()

