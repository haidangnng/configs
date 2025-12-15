return {
	----- BLINK - COMPLETION -----
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		-- dependencies = "rafamadriz/friendly-snippets",
		dependencies = {
			{ "rafamadriz/friendly-snippets" },
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
			},
			{
				"giuxtaposition/blink-cmp-copilot",
				dependencies = {
					{
						"zbirenbaum/copilot.lua",
						cmd = "Copilot",
						config = function()
							require("copilot").setup({
								suggestion = { enabled = false },
								panel = { enabled = false },
							})
						end,
					},
				},
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
		-- event = "InsertEnter",
		-- event = "VeryLazy",
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
		-- event = "VeryLazy",
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
				-- symbol_in_winbar = { enable = false },
				lightbulb = { enable = false },
				ui = {
					border = "rounded",
					lines = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				},
			})

			-- LSP SAGA highlight
			vim.cmd("highlight HoverBorder guibg=NONE ctermbg=NONE")
			vim.cmd("highlight HoverNormal guibg=NONE ctermbg=NONE")
			vim.cmd("highlight ActionPreviewBorder guibg=NONE ctermbg=NONE")
			vim.cmd("highlight ActionPreviewNormal guibg=NONE ctermbg=NONE")
			vim.cmd("highlight DiagnosticBorder guibg=NONE ctermbg=NONE")
			vim.cmd("highlight DiagnosticNormal guibg=NONE ctermbg=NONE")
			vim.cmd("highlight RenameBorder guibg=NONE ctermbg=NONE")
			vim.cmd("highlight RenameNormal guibg=NONE ctermbg=NONE")
			vim.cmd("highlight SagaBorder guibg=NONE ctermbg=NONE")
			vim.cmd("highlight SagaNormal guibg=NONE ctermbg=NONE")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	----- TROUBLE - LSP DIAGNOGSTICS -----
	-- {
	-- 	"folke/trouble.nvim",
	-- 	opts = {}, -- for default options, refer to the configuration section for custom setup.
	-- 	cmd = "Trouble",
	-- 	keys = {
	-- 		{
	-- 			"<leader>xx",
	-- 			"<cmd>Trouble diagnostics toggle<cr>",
	-- 			desc = "Diagnostics (Trouble)",
	-- 		},
	-- 		{
	-- 			"<leader>xX",
	-- 			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	-- 			desc = "Buffer Diagnostics (Trouble)",
	-- 		},
	-- 		{
	-- 			"<leader>cs",
	-- 			"<cmd>Trouble symbols toggle focus=false<cr>",
	-- 			desc = "Symbols (Trouble)",
	-- 		},
	-- 		{
	-- 			"<leader>cl",
	-- 			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	-- 			desc = "LSP Definitions / references / ... (Trouble)",
	-- 		},
	-- 		{
	-- 			"<leader>xL",
	-- 			"<cmd>Trouble loclist toggle<cr>",
	-- 			desc = "Location List (Trouble)",
	-- 		},
	-- 		{
	-- 			"<leader>xQ",
	-- 			"<cmd>Trouble qflist toggle<cr>",
	-- 			desc = "Quickfix List (Trouble)",
	-- 		},
	-- 	},
	-- },
}
