local lspconfig = require("lspconfig")
lspconfig.html.setup({
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html" },
	init_options = {
		provideFormatter = true
	}
})
