local util = require "lspconfig/util"

local servers = {
  cssls = {},
  html = {},
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
  svelte = {
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
      "less",
      "sss",
      "hbs",
      "handlebars",
    },
  },
  jsonls = {
   init_options = {
      provideFormatter = false,
    },
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
      },
    },
    setup = {
      commands = {
        -- Format = {
        --   function()
        --     vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
        --   end,
        -- },
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
        hint = {
          enable = true,
          arrayIndex = "Disable", -- "Enable", "Auto", "Disable"
          await = true,
          paramName = "Disable",  -- "All", "Literal", "Disable"
          paramType = false,
          semicolon = "Disable",  -- "All", "SameLine", "Disable"
          setType = true,
        },
        runtime = {
          version = "LuaJIT",
          special = {
            reload = "require",
          },
        },
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
        completion = {
          callSnippet = "Replace",
          autoRequire = true,
        },
        telemetry = {
          enable = false,
        },
      },
    },
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
