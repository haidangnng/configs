local servers = require("olmaoster.configs.lsp.servers")
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local merge_tb = vim.tbl_deep_extend

local ensure_installed = {}
for server, server_opts in pairs(servers) do
  if server_opts then
    ensure_installed[#ensure_installed + 1] = server
  end
end

local default_setup = function(server)
  print("Setting up " .. server)

  local opts = merge_tb("force", {
    capabilities = vim.deepcopy(lsp_capabilities)
  }, servers[server] or {})

  require('lspconfig')[server].setup(opts)
end

require('mason').setup({})
require("mason-lspconfig").setup({
  ensure_installed = ensure_installed,
  auto_installation = true,
  handlers = {
   default_setup,
  },
})

-- DOESN'T WORK IN DEFAULT_SETUP
require'lspconfig'.gdscript.setup(lsp_capabilities)
-- require'lspconfig'.rust_analyzer.setup{
--     settings = {
--       ['rust-analyzer'] = {
--         cargo = {
--           allFeatures = true,
--         },
--         procMacro = {
--           ignored = {
--             leptos_macro = {
--               "component",
--               "server",
--             },
--           },
--         },
--       }
--     }
--   }
