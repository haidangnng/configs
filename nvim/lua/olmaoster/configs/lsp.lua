local servers = require("olmaoster.configs.servers")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

require("mason").setup()

local ensure_installed = vim.tbl_keys(servers or {})

vim.list_extend(ensure_installed, {
	"stylua", -- Used to format Lua code
	"prettier",
})
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

local default_setup = function(server_name)
	local server = servers[server_name] or {}
	server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
	require("lspconfig")[server_name].setup(server)
end

require("mason-lspconfig").setup({
	auto_installation = true,
	handlers = { default_setup },
})
