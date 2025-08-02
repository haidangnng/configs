local util = require("lspconfig/util")

return {
	-- PYTHON
	-- ruff = {},
	-- pylsp = {
	-- 	settings = {
	-- 		plugins = {
	-- 			pyflakes = { enabled = false },
	-- 			pycodestyle = { enabled = false },
	-- 			autopep8 = { enabled = false },
	-- 			yapf = { enabled = false },
	-- 			mccabe = { enabled = false },
	-- 			pylsp_mypy = { enabled = false },
	-- 			pylsp_black = { enabled = false },
	-- 			pylsp_isort = { enabled = false },
	-- 		},
	-- 	},
	-- },
	-- LUA
	lua_ls = {},
	-- FRONTEND
	ts_ls = {
		init_options = {
			plugins = {
				{
					name = "@vue/typescript-plugin",
					location = vim.fn.stdpath("data")
						.. "/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
					languages = { "typescript", "javascript", "vue" },
				},
				-- {
				-- 	name = "typescript-svelte-plugin",
				-- 	location = vim.fn.stdpath("data")
				-- 		.. "/mason/packages/svelte-language-server/node_modules/typescript-svelte-plugin",
				-- 	languages = { "typescript", "javascript", "svelte" },
				-- },
			},
		},
		filetypes = {
			"javascript",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"typescript",
			"vue",
		},
	},
	eslint = {},
	cssls = {},
	html = {},
	tailwindcss = {
		filetypes = {
			"templ",
			"vue",
			"html",
			"astro",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"react",
			"htmlangular",
		},
	},
	-- prettier = {},
	jsonls = {
		init_options = {
			provideFormatter = false,
		},
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
		setup = {
			commands = {},
		},
	},
	emmet_ls = {
		init_options = { userLanguages = { templ = "html" } },
		cmd = { "emmet-ls", "--stdio" },
		root_dir = util.root_pattern(".git"),
		filetypes = {
			"html",
			"css",
			"scss",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"xml",
			"sass",
			"less",
			"vue",
		},
	},
	prismals = {},
	yamlls = {},
	-- volar = {
	-- 	init_options = {
	-- 		vue = {
	-- 			hybridMode = true,
	-- 		},
	-- 	},
	-- 	filetypes = { "vue" },
	-- },
	-- ESLINT/PRETTIER Alternative
	biome = {},
	-- angularls = {},
	-- GOLANG
	gopls = {},
	golines = {},
	-- -- DART
	-- dartls = {},
}
