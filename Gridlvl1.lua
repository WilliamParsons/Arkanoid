local grid = {}
local numberyellow = 2
local numbergrey = 6
local rows = 4
local columns = 6
local gridentry = 0
local donewithyellow = 1
local donewithgrey = 1
local randomrow = 0
local randomcolumn = 0
local mygrid 

local function gridlayout()
	for k = 1, rows do	
		grid[k] = {}	
		for j = 1, columns do
			grid[j] = {}
			grid[k][j] = 0
		end
	end

	while donewithyellow == 1 do
		if not(numberyellow == 0) then 
			randomrow = math.random(1,4)
			randomcolumn = math.random(1,6)
			if not(grid[randomrow][randomcolumn] == 0) then
				grid[randomrow][randomcolumn] = 3
				numberyellow = numberyellow - 1
			end
		else
			donewithyellow = 0
		end
	end
	while donewithgrey == 1 do
		if not(numbergrey == 0) then 
			randomrow = math.random(1,2)
			randomcolumn = math.random(1,6)
			if not(grid[randomrow][randomcolumn] == 0) and randomrow == 1 then
				grid[1][randomcolumn] = 4
				numbergrey = numbergrey - 1
			elseif not(grid[randomrow][randomcolumn] == 0) and randomrow == 2 then
			 	grid[3][randomcolumn] = 4
			 	numbergrey = numbergrey -1
			end
		else
			donewithgrey = 0
		end
	end

	for k = 1, rows do		
		-- grid[k] = {}
		for j = 1, columns do
			if grid[rows][columns] == 0 then
				grid[rows][columns] = math.random(1,2)
			end
		end
	end
end