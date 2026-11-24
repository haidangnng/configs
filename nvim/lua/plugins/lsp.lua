return {
	----- BLINK - COMPLETION -----
	{
		"saghen/blink.cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		version = "1.*", -- prebuilt fuzzy matcher binary
		dependencies = {
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("config.lsp.blink")
		end,
	},
	----- LSP -----
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"saghen/blink.cmp",
			"b0o/schemastore.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			require("config.lsp.lspconfig")
		end,
	},
	{
		"mason-org/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = "snacks.nvim", words = { "Snacks" } },
			},
		},
	},
	----- JSON SCHEMA -----
	{ "b0o/schemastore.nvim", lazy = true },
	------ CONFORM - FORMATTER ------
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		cmd = "ConformInfo",
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
