-- Configuration de gitsign
require("gitsigns").setup({
	signs = {
		add          = { text = "|" },
		change       = { text = "|" },
		delete       = { text = "󰍵" },
		topdelete    = { text = "‾" },
		changedelete = { text = "~" },
	},
	watch_gitdir = {
		interval = 999,
		follow_files = true
	},
	sign_priority = 19,
	update_debounce = 99,
	status_formatter = nil,
})
