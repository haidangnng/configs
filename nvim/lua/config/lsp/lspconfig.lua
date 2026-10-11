local servers = require("config.lsp.servers")

require("mason").setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	registries = {
		"github:mason-org/mason-registry",
		"github:crashdummyy/mason-registry",
	},
})

-- Completion capabilities for every server
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

-- Per-server overrides (merged on top of nvim-lspconfig's lsp/<name>.lua defaults)
for name, config in pairs(servers) do
	vim.lsp.config(name, config)
end

local ensure_installed = vim.tbl_keys(servers)
vim.list_extend(ensure_installed, {
	"stylua", -- Used to format Lua code
	"prettier",
})

require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

-- Enables every server installed through mason
require("mason-lspconfig").setup({ automatic_enable = true })
