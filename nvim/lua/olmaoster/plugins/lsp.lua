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
			"saghen/blink.cmp",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			require("olmaoster.configs.lsp")
		end,
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
	{
		"windwp/nvim-ts-autotag",
		filetypes = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue", "xml" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	--- RAZOR / C# ---
	{
		"seblyng/roslyn.nvim",
		ft = { "cs", "razor" },
		dependencies = {
			{
				"tris203/rzls.nvim",
				config = function()
					---@diagnostic disable-next-line: missing-fields
					require("rzls").setup({})
				end,
			},
		},
		config = function()
			require("roslyn").setup({
				args = {
					"--stdio",
					"--logLevel=Information",
					"--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
					"--razorSourceGenerator=" .. vim.fs.joinpath(
						vim.fn.stdpath("data") --[[@as string]],
						"mason",
						"packages",
						"roslyn",
						"libexec",
						"Microsoft.CodeAnalysis.Razor.Compiler.dll"
					),
					"--razorDesignTimePath=" .. vim.fs.joinpath(
						vim.fn.stdpath("data") --[[@as string]],
						"mason",
						"packages",
						"rzls",
						"libexec",
						"Targets",
						"Microsoft.NET.Sdk.Razor.DesignTime.targets"
					),
				},
				---@diagnostic disable-next-line: missing-fields
				config = {
					handlers = require("rzls.roslyn_handlers"),
					settings = {
						["csharp|inlay_hints"] = {
							csharp_enable_inlay_hints_for_implicit_object_creation = true,
							csharp_enable_inlay_hints_for_implicit_variable_types = true,

							csharp_enable_inlay_hints_for_lambda_parameter_types = true,
							csharp_enable_inlay_hints_for_types = true,
							dotnet_enable_inlay_hints_for_indexer_parameters = true,
							dotnet_enable_inlay_hints_for_literal_parameters = true,
							dotnet_enable_inlay_hints_for_object_creation_parameters = true,
							dotnet_enable_inlay_hints_for_other_parameters = true,
							dotnet_enable_inlay_hints_for_parameters = true,
							dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
							dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
							dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
						},
						["csharp|code_lens"] = {
							dotnet_enable_references_code_lens = true,
						},
					},
				},
			})
		end,
		init = function()
			-- we add the razor filetypes before the plugin loads
			vim.filetype.add({
				extension = {
					razor = "razor",
					cshtml = "razor",
				},
			})
		end,
	},
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
