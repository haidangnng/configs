return {
	-- LUA
	lua_ls = {},
	-- FRONTEND
	ts_ls = {
		init_options = {
			plugins = {
				-- Lets ts_ls resolve `.astro` imports in .ts files (ships with astro-language-server)
				{
					name = "@astrojs/ts-plugin",
					location = vim.fn.stdpath("data")
						.. "/mason/packages/astro-language-server/node_modules/@astrojs/ts-plugin",
					enableForWorkspaceTypeScriptVersions = true,
				},
			},
		},
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
	},
	astro = {},
	eslint = {},
	cssls = {},
	html = {
		filetypes = { "html", "templ", "handlebars" },
	},
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
	},
	emmet_ls = {
		init_options = { userLanguages = { templ = "html" } },
		cmd = { "emmet-ls", "--stdio" },
		root_markers = { ".git" },
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
			"astro",
			"handlebars",
		},
	},
	pylsp = {},
}
