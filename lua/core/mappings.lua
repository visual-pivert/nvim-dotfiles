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
