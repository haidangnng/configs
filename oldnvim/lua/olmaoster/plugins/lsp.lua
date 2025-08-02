return {
	-- {
	-- 	"folke/lazydev.nvim",
	-- 	ft = "lua",
	-- 	opts = {
	-- 		library = {
	-- 			{ path = "luvit-meta/library", words = { "vim%.uv" } },
	-- 		},
	-- 	},
	-- },
	-- { "Bilal2453/luvit-meta", lazy = true },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"saghen/blink.cmp",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			require("olmaoster.configs.lsp")
		end,
	},

	--- AUTO FORMAT ---
	-- {
	-- 	"stevearc/conform.nvim",
	-- 	event = { "BufWritePre" },
	-- 	cmd = { "ConformInfo" },
	-- 	keys = {
	-- 		{
	-- 			"<leader>fm",
	-- 			function()
	-- 				require("conform").format({ async = true, lsp_fallback = true })
	-- 			end,
	-- 			mode = "",
	-- 			desc = "[F]ormat buffer",
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		require("olmaoster.configs.conform")
	-- 	end,
	-- },

	--- JSON SCHEMA ---
	{ "b0o/schemastore.nvim" },

	--- LSPSAGA ---
	-- {
	-- 	"nvimdev/lspsaga.nvim",
	-- 	event = "LspAttach",
	-- 	config = function()
	-- 		require("lspsaga").setup({
	-- 			-- symbol_in_winbar = { enable = false },
	-- 			lightbulb = { enable = false },
	-- 			ui = {
	-- 				border = "rounded",
	-- 				lines = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	-- 			},
	-- 		})
	--
	-- 		-- LSP SAGA highlight
	-- 		vim.cmd("highlight HoverBorder guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("highlight HoverNormal guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("highlight ActionPreviewBorder guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("highlight ActionPreviewNormal guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("highlight DiagnosticBorder guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("highlight DiagnosticNormal guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("highlight RenameBorder guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("highlight RenameNormal guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("highlight SagaBorder guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("highlight SagaNormal guibg=NONE ctermbg=NONE")
	-- 	end,
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter", -- optional
	-- 		"nvim-tree/nvim-web-devicons", -- optional
	-- 	},
	-- },
	-- {
	-- 	"windwp/nvim-ts-autotag",
	-- 	filetypes = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue", "xml" },
	-- 	config = function()
	-- 		require("nvim-ts-autotag").setup()
	-- 	end,
	-- },
	--- FLUTTER TOOLS ---
	-- {
	-- 	"akinsho/flutter-tools.nvim",
	-- 	lazy = false,
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"stevearc/dressing.nvim", -- optional for vim.ui.select
	-- 	},
	-- 	config = function()
	-- 		require("flutter-tools").setup({}) --
	-- 	end,
	-- },
	--- TYPESCRIPT-TOOLS ---
	-- {
	-- 	"pmizio/typescript-tools.nvim",
	-- 	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	-- 	opts = {},
	-- 	ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
	-- 	config = function()
	-- 		require("typescript-tools").setup({
	-- 			on_attach = function(client, bufnr)
	-- 				client.server_capabilities.documentFormattingProvider = false
	-- 				client.server_capabilities.documentRangeFormattingProvider = false
	-- 			end,
	-- 			filetypes = {
	-- 				"javascript",
	-- 				"javascriptreact",
	-- 				"typescript",
	-- 				"typescriptreact",
	-- 				"vue",
	-- 			},
	-- 			settings = {
	-- 				tsserver_plugins = {
	-- 					"@vue/typescript-plugin",
	-- 				},
	-- 				jsx_close_tag = {
	-- 					enable = true,
	-- 					filetypes = { "javascriptreact", "typescriptreact" },
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
