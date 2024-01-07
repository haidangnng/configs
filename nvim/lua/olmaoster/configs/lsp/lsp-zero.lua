local lsp = require('lsp-zero').preset({})
lsp.extend_lspconfig()

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

require("olmaoster.configs.lsp.null-ls")
require("olmaoster.configs.lsp.mason")
require("olmaoster.configs.lsp.cmp")

