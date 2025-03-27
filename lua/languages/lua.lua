local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup { -- Install luarocks and lua-language-server first 
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false
			},
		},
	},
}
