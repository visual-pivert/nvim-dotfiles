local lspconfig = require("lspconfig")
lspconfig.emmet_ls.setup({
  cmd = { "emmet-ls", "--stdio" },
  filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact" },
  init_options = {
    showexpandedabbreviation = true,
    showabbreviationsuggestions = true,
    syntaxProfiles = {},
  }
})
