local lsp = require('lsp-zero').preset({})
lsp.extend_lspconfig()

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

require("olmaoster.configs.lsp.null-ls")
require("olmaoster.configs.lsp.mason")
require("olmaoster.configs.lsp.cmp")

