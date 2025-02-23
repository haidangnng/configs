local util = require("lspconfig/util")

return {
	-- PYTHON
	ruff = {},
	pylsp = {
		settings = {
			plugins = {
				pyflakes = { enabled = false },
				pycodestyle = { enabled = false },
				autopep8 = { enabled = false },
				yapf = { enabled = false },
				mccabe = { enabled = false },
				pylsp_mypy = { enabled = false },
				pylsp_black = { enabled = false },
				pylsp_isort = { enabled = false },
			},
		},
	},
	-- LUA
	lua_ls = {},
	-- FRONTEND
	ts_ls = {},
	eslint = {},
	cssls = {},
	html = {},
	tailwindcss = {},
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
}
