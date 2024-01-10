local util = require "lspconfig/util"

local servers = {
  -- FLUTTER
  -- dartls = {},
  -- PYTHON --
  -- pyright = {},
  prismals = {},
  -- GOLANG --
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
  -- RUST --
  rust_analyzer = {
    filetypes = "rust",
    -- root_dir = util.root_pattern("Cargo.toml"),
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = true,
        }
      }
    }
  },

  -- WEB DEV --
  cssls = {},
  html = {},
  svelte = {
    filetypes = {
      "svelte",
      "html",
    },
    cmd = { "svelteserver", "--stdio"}
  },
  emmet_ls = {
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
      "vue"
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
      filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-html", "edge", "eelixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte" },
      validate = true,
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
