local lspconfig = require('lspconfig')

-- Configuration de l'omnisharp LSP
lspconfig.omnisharp.setup {
	cmd = { "omnisharp" }, -- Install Omnisharp-roslyn first 
	enable_roslyn_analyzers = true,
	enable_import_completion = true,
	root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj"),
}
