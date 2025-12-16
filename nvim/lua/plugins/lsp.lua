return {
	----- BLINK - COMPLETION -----
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		dependencies = {
			"rafamadriz/friendly-snippets",
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				init = function()
					-- Only load snippets when LuaSnip is actually loaded
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
		opts = {},
		event = "VeryLazy",
		config = function()
			require("config.editor.conform")
		end,
	},
	----- LSP SAGA -----
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({
				lightbulb = { enable = false },
				ui = {
					border = "rounded",
					lines = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				},
				code_action = {
					num_shortcut = true,
					show_server_name = false,
					extend_gitsigns = false,
					keys = {
						quit = { "q", "<ESC>" },
						exec = "<CR>",
					},
				},
			})

			-- LSP SAGA highlight
			vim.cmd([[
				highlight HoverBorder guibg=NONE ctermbg=NONE
				highlight HoverNormal guibg=NONE ctermbg=NONE
				highlight ActionPreviewBorder guibg=NONE ctermbg=NONE
				highlight ActionPreviewNormal guibg=NONE ctermbg=NONE
				highlight DiagnosticBorder guibg=NONE ctermbg=NONE
				highlight DiagnosticNormal guibg=NONE ctermbg=NONE
				highlight RenameBorder guibg=NONE ctermbg=NONE
				highlight RenameNormal guibg=NONE ctermbg=NONE
				highlight SagaBorder guibg=NONE ctermbg=NONE
				highlight SagaNormal guibg=NONE ctermbg=NONE
			]])
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
