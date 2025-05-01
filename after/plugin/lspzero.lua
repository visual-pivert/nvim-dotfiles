vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local opts = {buffer = event.buf}

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

        -- Diagnostics
        vim.keymap.set('n', '<leader>r', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<leader>t', vim.diagnostic.setloclist, opts)
    end,
})

local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        function(server_name)
            local opts = {}

            if server_name == "lua_ls" then
                opts = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" }, 
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                            },
                            telemetry = { enable = false },
                        },
                    },
                }
            end
            require('lspconfig')[server_name].setup(opts)
        end,
    }
})

local cmp = require('cmp')

cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
    },
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        -- Naviguer dans la liste de complétion
        ['<C-n>'] = cmp.mapping.select_next_item(),  -- élément suivant
        ['<C-p>'] = cmp.mapping.select_prev_item(),  -- élément précédent

        -- Scroller dans la documentation des items
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        -- Afficher manuellement la complétion
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Fermer la fenêtre de complétion
        ['<C-e>'] = cmp.mapping.abort(),

        -- Valider la suggestion
         -- Shift+Tab : accepte la suggestion sélectionnée
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),

    }),
})
