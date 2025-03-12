-- CONFIG
vim.opt.number = true
vim.opt.syntax = "on"
vim.opt.mouse = "a"


-- PLUGINS
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")
require("lazy").setup({ -- Install lazy first`
	'neovim/nvim-lspconfig',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'Omnisharp/omnisharp-vim',
	'preservim/nerdtree',
	'ryanoasis/vim-devicons',
	'airblade/vim-gitgutter',

	'folke/tokyonight.nvim' -- theme
})

-- Activation du theme
vim.cmd[[colorscheme tokyonight]]


local lspconfig = require('lspconfig')

-- Configuration de l'omnisharp LSP
lspconfig.omnisharp.setup {
	cmd = { "omnisharp" }, -- Install Omnisharp-roslyn first 
	enable_roslyn_analyzers = true,
	enable_import_completion = true,
	root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj"),
}

lspconfig.pyright.setup {} -- Install pyright first
lspconfig.lua_ls.setup {} -- Install luarocks and lua-language-server first

-- Configuration de l'autocomplétion
local cmp = require("cmp")
cmp.setup({
	mapping = {
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
	},
})

-- Ajout des icones pour nerdtree
vim.g['NERDTreeShowIcons'] = 1

-- Configuration des raccourcis clavier pour Nerdtree
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<CR>', ':NERDTreeFind<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFocus<CR>', { noremap = true, silent = true })

-- Configuration des raccourcis
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })

