local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = require("custom.configs.servers")

local function setup(server)
  if servers[server] and servers[server].disabled then
    return
  end
  local server_opts = vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    capabilities = vim.deepcopy(capabilities),
  }, servers[server] or {})
  lspconfig[server].setup(server_opts)
end

local available = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)

local ensure_installed = {}
for server, server_opts in pairs(servers) do
  if server_opts then
    if not vim.tbl_contains(available, server) then
      setup(server)
    else
      ensure_installed[#ensure_installed + 1] = server
    end
  end
end

require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
require("mason-lspconfig").setup_handlers({ setup })