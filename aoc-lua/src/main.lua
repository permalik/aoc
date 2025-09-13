function one()
	io.write("Started one..\n")

	local file = io.open("/home/parallels/Docs/Git/aoc/aoc-lua/aoc/2015/001/input.txt", "r")
	if not file then
		error("Failed to open file")
	end

	local contents = file:read("*a")
	file:close()

	floor = 0
	for char in contents:gmatch(".") do
		if char == "(" then
			floor = floor + 1
		elseif char == ")" then
			floor = floor - 1
		end
	end

	local result = "Santa is on floor " .. floor .. "\n"
	print(result)
end

function two()
	io.write("Started two..\n")

	local file = io.open("/home/parallels/Docs/Git/aoc/aoc-lua/aoc/2015/001/input.txt", "r")
	if not file then
		error("Failed to open file")
	end

	local contents = file:read("*a")
	file:close()

	local floor = 0
	for index = 1, #contents do
		local char = contents:sub(index, index)
		if floor == -1 then
			local zero_based_index = index - 1
			local result = "Santa is on basement floor " .. floor .. " at position " .. zero_based_index
			print(result)
			break
		end
		if char == "(" then
			floor = floor + 1
		elseif char == ")" then
			floor = floor - 1
		end
	end
end

one()
two()
