local servers = {
  cssls = {},
  html = {},
  jsonls = {},
  -- intelephense = {}, -- php language server
  -- sqlls = {},
  -- jdtls = {
  --   disabled = true,
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
  -- pyright = {
  --   settings = {
  --     python = {
  --       analysis = {
  --         typeCheckingMode = "basic",
  --         diagnosticMode = "workspace",
  --         inlayHints = {
  --           variableTypes = true,
  --           functionReturnTypes = true,
  --         },
  --       },
  --     },
  --   },
  -- },
  -- bashls = {},
}

return servers
