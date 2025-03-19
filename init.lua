-- CONFIG
vim.opt.number = true
vim.opt.syntax = "on"
vim.opt.mouse = "a"
vim.opt.signcolumn = "auto:1"

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
	'lewis6991/gitsigns.nvim', -- deps: plenary
	'nvim-lua/plenary.nvim', -- utilities function for async etc

--	'lervag/vimtex', -- latex integration
	'github/copilot.vim',

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

--lspconfig.texlab.setup{} -- Install texlab first

-- npm install -g vscode-langservers-extracted typescript typescript-language-server emmet-ls
lspconfig.ts_ls.setup{
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
	filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
} -- Install typescript-language-server first

lspconfig.html.setup({
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html" },
	init_options = {
		provideFormatter = true
	}
})

lspconfig.cssls.setup({
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	settings = {
		css = { validate = true },
		scss = { validate = true },
		less = { validate = true }
	}
})

lspconfig.emmet_ls.setup({
  cmd = { "emmet-ls", "--stdio" },
  filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact" },
  init_options = {
    showexpandedabbreviation = true,
    showabbreviationsuggestions = true,
    syntaxProfiles = {},
  }
})

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
		interval = 1000,
		follow_files = true
	},
	sign_priority = 20,
	update_debounce = 100,
	status_formatter = nil,
})

require("underscore")

-- Configuration de nerdtree
vim.g.NERDTreeShowIcons = 1
vim.g.NERDTreeShowHidden = 1

-- Configuration de l'integration de latex
--vim.g.vimtex_view_method = 'zathura' -- install zathura and zathura-pdf-poppler and texlive-binextra first
--vim.g.vimtex_compiler_method = 'latexmk'

-- Configuration des raccourcis clavier pour Nerdtree
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<CR>', ':NERDTreeFind<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFocus<CR>', { noremap = true, silent = true })

-- Configuration des raccourcis
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Configuration de copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept()', { noremap = true, expr = true })
