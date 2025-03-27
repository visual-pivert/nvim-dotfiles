local lspconfig = require("lspconfig")

-- npm install -g vscode-langservers-extracted typescript typescript-language-server emmet-ls
lspconfig.ts_ls.setup{
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
	filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
} -- Install typescript-language-server first
