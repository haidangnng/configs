local util = require("lspconfig/util")
local servers = {
	-- WEB DEV --
	cssls = {},
	html = {
		filetypes = {
			"html",
			"templ",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"svelte",
			"gotmpl",
			"templ",
			"vue",
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
			"haml",
			"xml",
			"xsl",
			"pug",
			"slim",
			"sass",
			"stylus",
			"svelte",
			"less",
			"sss",
			"hbs",
			"handlebars",
			"vue",
			"templ",
			"gotmpl",
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
		setup = {
			commands = {},
		},
	},
	tailwindcss = {
		settings = {
			hovers = true,
			suggestions = true,
			filetypes = {
				"django-html",
				"gohtml",
				"haml",
				"html",
				"html-eex",
				"markdown",
				"mdx",
				"twig",
				"css",
				"less",
				"postcss",
				"sass",
				"scss",
				"stylus",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"svelte",
				"templ",
				"gotmpl",
				"rs",
				"rust",
			},
			validate = true,
			init_options = { userLanguages = { templ = "html", rs = "html", rust = "html" } },
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidScreen = "error",
				invalidVariant = "error",
				invalidConfigPath = "error",
				invalidTailwindDirective = "error",
				recommendedVariantOrder = "warning",
			},
			classAttributes = {
				"class",
				"className",
				"class:list",
				"classList",
				"ngClass",
			},
		},
	},
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					checkThirdParty = false,
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = false,
						[vim.fn.stdpath("config") .. "/lua"] = false,
					},
				},
			},
		},
	},
	eslint = {
		root_dir = util.root_pattern(
			".eslintrc",
			".eslintrc.js",
			".eslintrc.cjs",
			".eslintrc.yaml",
			".eslintrc.yml",
			".eslintrc.json",
			"eslint.config.js"
		),
		codeAction = {
			disableRuleComment = {
				enable = true,
				location = "separateLine",
			},
			showDocumentation = {
				enable = true,
			},
		},
		codeActionOnSave = {
			enable = false,
			mode = "all",
		},
		format = true,
		nodePath = "",
		onIgnoredFiles = "off",
		packageManager = "npm",
		quiet = false,
		rulesCustomizations = {},
		run = "onType",
		useESLintClass = false,
		validate = "on",
		workingDirectory = {
			mode = "location",
		},
	},
	ts_ls = {
		typescript = {
			inlayhints = {
				includeinlayparameternamehints = "all",
				includeinlayparameternamehintswhenargumentmatchesname = true,
				includeinlayfunctionparametertypehints = true,
				includeinlayvariabletypehints = true,
				includeinlaypropertydeclarationtypehints = true,
				includeinlayfunctionlikereturntypehints = true,
				includeinlayenummembervaluehints = true,
			},
		},
		javascript = {
			inlayhints = {
				includeinlayparameternamehints = "all",
				includeinlayparameternamehintswhenargumentmatchesname = false,
				includeinlayfunctionparametertypehints = true,
				includeinlayvariabletypehints = true,
				includeinlaypropertydeclarationtypehints = true,
				includeinlayfunctionlikereturntypehints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		settings = {},
	},
	prismals = {},
}

return servers
