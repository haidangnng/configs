local util = require "lspconfig/util"

local servers = {
  -- MATLAB --
  matlab_ls = {
    filetypes = {"matlab"},
    settings = {
        MATLAB = {
            installPath = "/Applications/MATLAB_R2023b.app/",
            indexWorkspace = false,
            matlabConnectionTiming = "onStart",
            telemetry = true
        },
    },
    single_file_support = true
  },
  -- -- PYTHON --
  pyright = {},
  -- prismals = {},
  -- -- GOLANG --
  templ = {},
  gopls = {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
        },
      },
    },
  },

  -- WEB DEV --
  cssls = {},
  -- htmx = {
  --   filetypes = {
  --     "html",
  --     "rs",
  --     "rust",
  --     "templ",
  --     "javascript",
  --     "javascriptreact",
  --     "typescript",
  --     "typescriptreact",
  --     "gotmpl",
  --     "templ",
  --   },
  -- },
  html = {
    filetypes = {
      "html",
      "templ",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "gotmpl",
      "templ",
      "rs",
      "rust",
    },
  },
  svelte = {
    filetypes = {
      "svelte",
      "html",
    },
    cmd = { "svelteserver", "--stdio"}
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
      "rs",
      "rust",
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
      "gotmpl"
    },
  },
  jsonls = {
   init_options = {
      provideFormatter = false,
    },
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      },
    },
    setup = {
      commands = {
      },
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
        "mdx","twig",
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
        cssConflict = 'warning',
        invalidApply = 'error',
        invalidScreen = 'error',
        invalidVariant = 'error',
        invalidConfigPath = 'error',
        invalidTailwindDirective = 'error',
        recommendedVariantOrder = 'warning',
      },
      classAttributes = {
        'class',
        'className',
        'class:list',
        'classList',
        'ngClass',
      },
    }
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
       '.eslintrc',
       '.eslintrc.js',
       '.eslintrc.cjs',
       '.eslintrc.yaml',
       '.eslintrc.yml',
       '.eslintrc.json'
    ),
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine"
      },
      showDocumentation = {
        enable = true
      }
    },
    codeActionOnSave = {
      enable = false,
      mode = "all"
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
      mode = "location"
    }
  },
  tsserver = {
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
}

return servers
