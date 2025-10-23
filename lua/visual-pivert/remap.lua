local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local builtin = require('telescope.builtin')

vim.g.mapleader = " "

-- Project keybinding
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope live grep' })

-- buffer keybinding
vim.keymap.set("n", "<leader>ba", mark.add_file)
vim.keymap.set("n", "<leader>be", ui.toggle_quick_menu)
vim.keymap.set('n', '<leader>bb', require('telescope.builtin').buffers, { noremap = true, silent = true })

vim.keymap.set("n", "<C-s>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-h>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(4) end)


-- file keybinding
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

-- Code keybinding
vim.keymap.set("n", "<leader>cf", function()
    vim.lsp.buf.format()
end, { desc = "Format file" })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Déplacer la selection vers le haut
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Déplacer la selection vers le bas
vim.keymap.set("n", "J", "mzJ`z")            -- Joindre les lignes sans déplacer le curseur

vim.keymap.set("n", "<C-d>", "<C-d>zz")      -- Scroll vers le bas en centrant la ligne du curseur
vim.keymap.set("n", "<C-u>", "<C-u>zz")      -- Scroll vers le haut en centrant la ligne du curseur
vim.keymap.set("n", "n", "nzzzv")            -- Aller au prochain résultat de recherche et recentrer + déplier
vim.keymap.set("n", "N", "Nzzzv")            -- Aller au résultat précédent et recentrer + déplier
vim.keymap.set("n", "=ap", "ma=ap'a")        -- Indenter un paragraphe sans déplacer le curseur

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

-- En mode visuel : supprime dans le registre noir (donc sans modifier le presse-papiers)
-- puis colle le contenu courant du registre par-dessus la sélection
vim.keymap.set("x", "<leader>p", [["_dP]])
