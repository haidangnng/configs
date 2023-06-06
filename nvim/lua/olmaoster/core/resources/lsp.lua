return {
  {
    "neovim/nvim-lspconfig",
    branch = "master",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "glepnir/lspsaga.nvim",
      -- "simrat39/rust-tools.nvim"
    },
    config = function()
        require("olmaoster.util").on_attach(
        function(client, buffer)
          require("olmaoster.config.lsp.keymaps").attach(client, buffer)
          require("olmaoster.config.lsp.lspsaga").attach(client, buffer)
          require("olmaoster.config.lsp.inlayhints").attach(client, buffer)
          -- require("olmaoster.config.lsp.rust-tools").attach(client, buffer)
        end
      )

      -- diagnostics
      for name, icon in pairs(require("olmaoster.core.icons").diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
      vim.diagnostic.config(require("olmaoster.config.lsp.diagnostics")["on"])

      local servers = require("olmaoster.config.lsp.servers")
      local ext_capabilites = vim.lsp.protocol.make_client_capabilities()
      local capabilities = require("olmaoster.util").capabilities(ext_capabilites)

      local function setup(server)
        if servers[server] and servers[server].disabled then
          return
        end
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})
        require("lspconfig")[server].setup(server_opts)
      end

      local available = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)

      local ensure_installed = {}
      for server, server_opts in pairs(servers) do
        if server_opts then
          if not vim.tbl_contains(available, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
      require("mason-lspconfig").setup_handlers({ setup })
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        "lua_ls",
        "cssls",
        "html",
        "tsserver",
        'rust_analyzer',
        "eslint",
        "tailwindcss"
      }
    },
    config = function()
      require("mason").setup()
    end,
    -- opts = {
    --   ui = {
    --     -- border = "rounded",
    --     border = { "▄", "▄", "▄", "█", "▀", "▀", "▀", "█" },
    --     icons = {
    --       package_installed = "◍",
    --       package_pending = "◍",
    --       package_uninstalled = "◍",
    --     },
    --   },
    --   log_level = vim.log.levels.INFO,
    --   max_concurrent_installers = 4,
    -- },
  },

  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    config = function()
      require("olmaoster.config.null-ls")
    end,
  },
  -- {
  -- -- RUST LSP
  --   "simrat39/rust-tools.nvim",
  -- },
  -- {
  --   "rust-lang/rust.vim",
  --   ft = "rust",
  --   init = function ()
  --     vim.g.rustfmt_autosave = 1
  --   end
  -- },
  {
  -- LSP INLAY HINTS
  -- rust-tools already provides this feature, but gopls doesn't
    "lvimuser/lsp-inlayhints.nvim",
    dependencies = "neovim/nvim-lspconfig"
  }
}
