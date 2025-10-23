return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("todo-comments").setup({
            signs = true,
            keywords = {
                TODO = { icon = " ", color = "info" },
                FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG" } },
                HACK = { icon = " ", color = "warning" },
                WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                PERF = { icon = " ", alt = { "OPTIMIZE" } },
                NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
            },
            highlight = {
                before = "",
                keyword = "wide",
                after = "fg",
            },
            search = {
                command = "rg",
                args = {
                    "--color=never", "--no-heading",
                    "--with-filename", "--line-number", "--column"
                },
                pattern = [[\b(KEYWORDS):]],
            },
        })

        -- Raccourcis
        vim.keymap.set("n", "]t", function()
            require("todo-comments").jump_next()
        end, { desc = "Aller au TODO suivant" })

        vim.keymap.set("n", "[t", function()
            require("todo-comments").jump_prev()
        end, { desc = "Aller au TODO précédent" })

        vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>", { desc = "Rechercher les TODO avec Telescope" })
        vim.keymap.set("n", "<leader>tq", "<cmd>TodoQuickFix<cr>", { desc = "Mettre les TODO dans la QuickFix" })
    end
}

