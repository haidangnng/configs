local servers = require("olmaoster.configs.lsp.servers")
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local ensure_installed = {}
for server, server_opts in pairs(servers) do
  if server_opts then
    ensure_installed[#ensure_installed + 1] = server
  end
end

local default_setup = function(server)
  require('lspconfig')[server].setup({
    capabilities = lsp_capabilities,
  })
end

require('mason').setup({})
require("mason-lspconfig").setup({
  ensure_installed = ensure_installed,
  auto_installation = true,
  handlers = {
   default_setup,
  },
})

