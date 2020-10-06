Galactic Attributes
Game design to teach young students about attributes in objects.

**Change Current Path in main.lua code before running**
	Windows : 
		local curDir = 'C:\\path\\to\\working\\directory\\Galactic Attributes\\'
	Unix : 
		--the double backslashes need to be changed to a forward slash
		local curDir /path/to/working/directory/Galactic Attributes/
		package.path = curDir .. 'lib/?.lua;' .. package.path
	*If launching the simulator generates error 'gameSetup.lua' not found, the current directory is not set correctly.
To Run Program :
	-Download Corona Simulator https://coronalabs.com/product/
	-Launch Simulator
		Spotlight Search for 'Corona Simulator' and start simulator
		Click 'Open Project'
		Navigate to directory where main.lua is located and open it
		The game should should automatically start
To change the type of device being simulated go to top of simulator "view" > "view as" 
The testing was done using 'IphoneX'

The majority of the functionality is in the file ./lib/gameSetup.lua
The ./lib/images/ directory holds the pictures used
The ./lib/numbers/ directory holds .lua files that are used to create number
objects on the screen. The code in these files are uniformly formatted.
The ./lib/numbers/ directory holds .lua files that are used to create basic
shapes on the screen. The code in these files are uniformly formatted.
