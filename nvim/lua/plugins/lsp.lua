return {
	----- BLINK - COMPLETION -----
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		dependencies = {
			"rafamadriz/friendly-snippets",
			{
				"L3MON4D3/LuaSnip",
				event = "InsertEnter",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				config = function()
					-- `init` runs unconditionally at startup regardless of lazy triggers,
					-- so load snippets here (config, on InsertEnter) instead to keep this deferred.
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
		},
		version = "*",
		opts_extend = { "sources.default" },
		config = function()
			require("config.lsp.blink")
		end,
	},
	----- LSP -----
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
			"onsails/lspkind.nvim",
			"saghen/blink.cmp",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			require("config.lsp.lspconfig")
		end,
	},
	----- JSON SCHEMA -----
	{ "b0o/schemastore.nvim" },
	------ CONFORM - FORMATTER ------
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		config = function()
			require("config.lsp.conform")
		end,
	},
	----- LSP SAGA -----
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("config.lsp.lspsaga")
		end,
	},
}
