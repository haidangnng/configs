local servers = {
  cssls = {},
  html = {},
  emmet_ls = {
    cmd = { "ls_emmet", "--stdio" },
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
  -- svelte = {
  --   "svelte-language-server"
  -- },
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
  -- rust_analyzer = {
  --   tools = {
  --     -- autoSetHints = false,
  --     on_initialized = function()
  --       vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
  --         pattern = { "*.rs" },
  --         callback = function()
  --           vim.lsp.codelens.refresh()
  --         end,
  --       })
  --     end,
  --
  --     auto = false,
  --     inlay_hints = {
  --       -- Only show inlay hints for the current line
  --       only_current_line = false,
  --       auto = false,
  --
  --       -- Event which triggers a refersh of the inlay hints.
  --       -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
  --       -- not that this may cause higher CPU usage.
  --       -- This option is only respected when only_current_line and
  --       -- autoSetHints both are true.
  --       only_current_line_autocmd = "CursorHold",
  --
  --       -- whether to show parameter hints with the inlay hints or not
  --       -- default: true
  --       show_parameter_hints = false,
  --
  --       -- whether to show variable name before type hints with the inlay hints or not
  --       -- default: false
  --       show_variable_name = false,
  --
  --       -- prefix for parameter hints
  --       -- default: "<-"
  --       -- parameter_hints_prefix = "<- ",
  --       parameter_hints_prefix = " ",
  --
  --       -- prefix for all the other hints (type, chaining)
  --       -- default: "=>"
  --       -- other_hints_prefix = "=> ",
  --       other_hints_prefix = " ",
  --
  --       -- whether to align to the lenght of the longest line in the file
  --       max_len_align = false,
  --
  --       -- padding from the left if max_len_align is true
  --       max_len_align_padding = 1,
  --
  --       -- whether to align to the extreme right or not
  --       right_align = false,
  --
  --       -- padding from the right if right_align is true
  --       right_align_padding = 7,
  --
  --       -- The color of the hints
  --       highlight = "Comment",
  --     },
  --     hover_actions = {
  --       auto_focus = false,
  --       border = "rounded",
  --       width = 60,
  --       -- height = 30,
  --     },
  -- },
  -- server = {
  --   --[[
  --       $ mkdir -p ~/.local/bin
  --       $ curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
  --       $ chmod +x ~/.local/bin/rust-analyzer
  --   --]]
  --   -- cmd = { os.getenv "HOME" .. "/.local/bin/rust-analyzer" },
  --   cmd = { "rustup", "run", "nightly", os.getenv "HOME" .. "/.local/bin/rust-analyzer" },
  --   on_attach = require("user.lsp.handlers").on_attach,
  --   capabilities = require("user.lsp.handlers").capabilities,
  --
  --   settings = {
  --     ["rust-analyzer"] = {
  --       lens = {
  --         enable = true,
  --       },
  --       checkOnSave = {
  --         command = "clippy",
  --       },
  --     },
  --   },
  -- },  
  -- },
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
