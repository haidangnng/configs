local servers = {
  cssls = {},
  html = {},
  jsonls = {},
  svelte = {
    "svelte-language-server"
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
      -- root_dir = function(fname)
      --   local root_pattern = require("lspconfig").util.root_pattern(
      --     "tailwind.config.cjs",
      --     "tailwind.config.js",
      --     "postcss.config.js"
      --   )
      --   return root_pattern(fname)
      -- end,
    }
  },
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          features = "all",
        },
        -- Add clippy lints for Rust.
        checkOnSave = {
          command = "clippy",
          extraArgs = {
            "--target-dir",
            "/tmp/rust-analyzer-check",
          },
        },
        check = {
          command = "clippy",
          features = "all",
        },
        procMacro = {
          enable = true,
        },
      }
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
