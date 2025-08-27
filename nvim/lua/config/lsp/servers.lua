local util = require("lspconfig/util")
return {
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
			"javascriptreact",
			"typescript",
			"typescriptreact",
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
	-- ESLINT/PRETTIER Alternative
	-- biome = {},
	-- gopls = {},
	-- golines = {},
}
