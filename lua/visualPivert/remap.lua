vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv",  vim.cmd.Ex)

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Déplacer la selection vers le haut 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Déplacer la selection vers le bas

vim.keymap.set("n", "J", "mzJ`z")        -- Joindre les lignes sans déplacer le curseur
vim.keymap.set("n", "<C-d>", "<C-d>zz")  -- Scroll vers le bas en centrant la ligne du curseur
vim.keymap.set("n", "<C-u>", "<C-u>zz")  -- Scroll vers le haut en centrant la ligne du curseur
vim.keymap.set("n", "n", "nzzzv")        -- Aller au prochain résultat de recherche et recentrer + déplier
vim.keymap.set("n", "N", "Nzzzv")        -- Aller au résultat précédent et recentrer + déplier
vim.keymap.set("n", "=ap", "ma=ap'a")    -- Indenter un paragraphe sans déplacer le curseur

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

-- En mode visuel : supprime dans le registre noir (donc sans modifier le presse-papiers)
-- puis colle le contenu courant du registre par-dessus la sélection
vim.keymap.set("x", "<leader>p", [["_dP]])
