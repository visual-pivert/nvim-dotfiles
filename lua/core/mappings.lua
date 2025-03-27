-- Configuration des raccourcis clavier pour nvimtree
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- Configuration des raccourcis
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Configuration de copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept()', { noremap = true, expr = true })

-- Ajouter des raccourcis clavier pour une navigation rapide dans Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', ":Telescope find_files cwd=" .. vim.fn.getcwd() .. "<CR>", { noremap = true, silent = true }) -- \ff
vim.api.nvim_set_keymap('n', '<leader>fg', ":Telescope live_grep cwd=" .. vim.fn.getcwd() .. "<CR>", { noremap = true, silent = true }) -- \fg
vim.api.nvim_set_keymap('n', '<leader>fb', ":Telescope buffers<CR>", { noremap = true, silent = true }) -- \fb
vim.api.nvim_set_keymap('n', '<leader>fc', ":Telescope command_history<CR>", { noremap = true, silent = true }) -- \fc

-- Raccourcis clavier pour lazygit
 vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true }) -- \gg
