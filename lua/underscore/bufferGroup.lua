M = {}

M.buffPath = "/home/visualpivert/Projects/underscore.nvim/lua/underscore/.buffer/"

function M.InitBufferGroup()
	local config = require("underscore.config")
	local buffers = config.buffers
	local fileNames = {}

	for dirname, buffs in pairs(buffers) do

		-- Create the dir buffer if does not exist
		local currentDir = M.buffPath .. dirname .. "/"
		if not CheckDir(currentDir) then
			vim.api.nvim_command("!mkdir " .. currentDir)
		--	vim.api.nvim_command("!git init " .. currentDir)
		end

		-- Get filenames
		for _, b in pairs(buffs) do
			table.insert(fileNames, GetFileName(b))
		end

		-- Copy them into our buffer space
		local counter = 1
		for _, buff in pairs(buffs) do
			local currentPath = currentDir .. fileNames[counter]
			if not CheckFile(currentPath) or CheckDiff(currentPath, buff) then
				vim.api.nvim_command("!cp " .. buff .. " " .. currentPath)
			--	vim.api.nvim_command("!git add " .. currentPath)
			--	vim.api.nvim_command("!git commit -m '" .. fileNames[counter] .. " added'")
			end
			counter = counter + 1
		end

	end

end


function M.ApplyBufferGroup(bufferGroupName)
	local config = require("underscore.config")
	local buffers = config.buffers[bufferGroupName]
	for _, buff in pairs(buffers) do
		local buffFilename = GetFileName(buff)
		local filepath = M.buffPath .. bufferGroupName .. "/" .. buffFilename
		if CheckDiff(filepath, buff) then
			vim.api.nvim_command("!sudo -S cp " .. filepath .. " " .. buff)
		end
	end
end


function CheckFile (path)
	return vim.fn.filereadable(path) == 1
end

function CheckDir (path)
	return vim.fn.isdirectory(path) == 1
end

function CheckDiff(file1, file2)
	local diff_cmd = string.format("diff -q %s %s", file1, file2)
	local handle = io.popen(diff_cmd)
	local result = handle:read("*a")
	handle:close()
	return result ~= ""
end

function GetFileName(path)
	local pathSplitted = Split(path, "/")
	if pathSplitted then
		return pathSplitted[#pathSplitted]
	end
	return nil
end

function Split(s, sep)
	local arr = {}
	local acc = ""
	for i = 1 , #s do
		if (s:sub(i,i) == sep) then
			table.insert(arr, acc)
			acc = ""
		else
			acc = acc .. s:sub(i,i)
		end
	end
	if acc then
		table.insert(arr, acc)
	end
	return arr
end

M.ApplyBufferGroup("config")

return M
