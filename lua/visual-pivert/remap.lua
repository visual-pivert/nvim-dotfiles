local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local builtin = require('telescope.builtin')

vim.g.mapleader = " "

-- ================================
-- 🌍 Project keybindings
-- ================================
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Open file explorer
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' }) -- Find files using Telescope
vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope live grep' })   -- Search text inside project files

-- ================================
-- 🧭 Buffer / Harpoon keybindings
-- ================================
vim.keymap.set("n", "<leader>ba", mark.add_file)             -- Add current file to Harpoon list
vim.keymap.set("n", "<leader>be", ui.toggle_quick_menu)      -- Toggle Harpoon quick menu
vim.keymap.set('n', '<leader>bb', builtin.buffers, { noremap = true, silent = true }) -- List open buffers with Telescope

-- Quick navigation between marked files (Harpoon)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-h>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(4) end)

-- ================================
-- 📁 File keybindings
-- ================================
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' }) -- Find files
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })   -- Search text

-- ================================
-- 💻 Code keybindings
-- ================================
vim.keymap.set("n", "<leader>cf", function()
    vim.lsp.buf.format()
end, { desc = "Format file" }) -- Format the current file with LSP

-- Move selected lines up or down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move selection up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move selection down
vim.keymap.set("n", "J", "mzJ`z")            -- Join lines without moving cursor

-- Scroll improvements
vim.keymap.set("n", "<C-d>", "<C-d>zz")      -- Scroll down and center cursor line
vim.keymap.set("n", "<C-u>", "<C-u>zz")      -- Scroll up and center cursor line
vim.keymap.set("n", "n", "nzzzv")            -- Go to next search result, center and unfold
vim.keymap.set("n", "N", "Nzzzv")            -- Go to previous search result, center and unfold
vim.keymap.set("n", "=ap", "ma=ap'a")        -- Re-indent a paragraph without moving cursor

-- ================================
-- 🧩 Misc
-- ================================

-- Escape insert mode with Ctrl+C
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable the 'Q' key in normal mode (used for Ex mode)
vim.keymap.set("n", "Q", "<nop>")

-- In visual mode: delete selection into the black hole register (so clipboard is untouched)
-- then paste current clipboard content over it
vim.keymap.set("x", "<leader>p", [["_dP]])

