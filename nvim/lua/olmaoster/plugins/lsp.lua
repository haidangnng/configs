return {
{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			require("olmaoster.configs.lsp")
		end,
	},

	--- AUTO COMPLETION ---
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		version = "*",
		opts = {
			keymap = {
				["<C-e>"] = { "hide", "fallback" },
				["<CR>"] = { "accept", "fallback" },

				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
			},

			appearance = {
				use_nvim_cmp_as_default = true,
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				min_keyword_length = 3,
			},

			signature = { enabled = true },

			completion = {
				menu = {
					-- nvim-cmp style menu
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind" },
						},
					},
				},

				-- Show documentation when selecting a completion item
				documentation = { auto_show = true, auto_show_delay_ms = 500 },

				list = {
					cycle = {
						from_bottom = true,
						from_top = true,
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},

	--- AUTO FORMAT ---
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>fm",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		config = function()
			require("olmaoster.configs.conform")
		end,
	},

	--- JSON SCHEMA ---
	{ "b0o/schemastore.nvim" },

	--- LSPSAGA ---
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
}
