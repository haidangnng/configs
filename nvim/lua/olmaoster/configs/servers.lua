local util = require("lspconfig/util")
local servers = {
	-- WEB DEV --
	-- pylsp = {},
	cssls = {},
	html = {
		filetypes = {
			"html",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"svelte",
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
			"xml",
			"sass",
			"svelte",
			"less",
			"vue",
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
	svelte = {
		filetypes = { "typescript", "javascript", "svelte", "html", "css" },
	},
	tailwindcss = {
		settings = {
			hovers = true,
			suggestions = true,
			filetypes = {
				"html",
				"markdown",
				"mdx",
				"css",
				"less",
				"postcss",
				"sass",
				"scss",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"svelte",
			},
			validate = true,
			-- init_options = { userLanguages = { templ = "html", rs = "html", rust = "html" } },
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
