require('core.settings')
require('core.mappings')

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
	'nvim-lualine/lualine.nvim',

	'github/copilot.vim',

	'folke/tokyonight.nvim' -- theme
})

-- Activation du theme
vim.cmd[[colorscheme tokyonight]]

-- import PLUGINS
require('plugins.cmp')
require('plugins.gitsigns')
require('plugins.lualine')
require('plugins.nerdtree')
require('plugins.underscore')
require('plugins.copilot')

-- import LANGUAGE SERVERS
require('languages.csharp')
require('languages.lua')
require('languages.python')
require('languages.typescript')
require('languages.html')
require('languages.css')
require('languages.emmet')
