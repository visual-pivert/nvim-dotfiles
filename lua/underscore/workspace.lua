M = {}

function M.CloseAll()
	vim.api.nvim_command("bufdo bd")
end

function M.ToggleWorkspace(opts)
	local conf = require("underscore.config")
	local wn = opts.fargs[1]
	local path = conf.workspaces[wn]
	if path then
		M.CloseAll()
		vim.api.nvim_command("NERDTree " .. path)
	else
		print("Worspace not found: " .. wn)
	end
end

function WorkspaceCompletion()
	local conf = require("underscore.config")
	local workspaces = {}
	for key, _ in pairs(conf.workspaces) do
		table.insert(workspaces, key)
	end
	return workspaces
end

vim.api.nvim_create_user_command("USToggleWorkspace", M.ToggleWorkspace, {nargs = 1, complete=WorkspaceCompletion})

return M
