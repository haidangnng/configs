return {
  --- AUTOCOMPLETION ---
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      'L3MON4D3/LuaSnip',
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets"
    },
    config = function ()
      require("olmaoster.configs.lsp.cmp")
    end
  },

  --- LANGUAGE SERVER MANAGER (MASON)---
  {
    'williamboman/mason.nvim',
    event = "BufReadPre",
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('olmaoster.configs.lsp.mason')
    end
  },

  --- LSP CONFIG ---
  {
    'neovim/nvim-lspconfig',
    event = {
      "BufReadPre", "BufNewFile"
    },
    dependencies = {
       'hrsh7th/cmp-nvim-lsp',
       { 'antosha417/nvim-lsp-file-operations', config = true }
    },
    -- config = function()
    --   require('olmaoster.configs.lsp.lspconfigs')
    -- end
  },

  --- NULL LS ---
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    config = function()
      require('olmaoster.configs.lsp.null-ls')
    end
  },

  --- LSPSAGA ---
  {
    'nvimdev/lspsaga.nvim',
    event = "LspAttach",
    config = function()
      require('lspsaga').setup({
        symbol_in_winbar = { enable = false },
        lightbulbs = { enable = false },
        ui = {
          border = "rounded",
          lines = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        }
      })

      -- LSP SAGA highlight
      vim.cmd('highlight HoverBorder guibg=NONE ctermbg=NONE')
      vim.cmd('highlight HoverNormal guibg=NONE ctermbg=NONE')
      vim.cmd('highlight ActionPreviewBorder guibg=NONE ctermbg=NONE')
      vim.cmd('highlight ActionPreviewNormal guibg=NONE ctermbg=NONE')
      vim.cmd('highlight DiagnosticBorder guibg=NONE ctermbg=NONE')
      vim.cmd('highlight DiagnosticNormal guibg=NONE ctermbg=NONE')
      vim.cmd('highlight RenameBorder guibg=NONE ctermbg=NONE')
      vim.cmd('highlight RenameNormal guibg=NONE ctermbg=NONE')
      vim.cmd('highlight SagaBorder guibg=NONE ctermbg=NONE')
      vim.cmd('highlight SagaNormal guibg=NONE ctermbg=NONE')
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons'     -- optional
    }
  },

  --- JSON SCHEMA ---
  {"b0o/schemastore.nvim"},

  -- RUST --
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "olmaoster.configs.rust-tool"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end
  },

  -- GOLANG --
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "BufReadPre", "BufNewFile" },
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },

  -- FLUTTER
  {
    'dart-lang/dart-vim-plugin',
    ft="dart"
  },
  {
    'akinsho/flutter-tools.nvim',
    ft="dart",
    config = function()
      require('flutter-tools').setup({
        flutter_path = '/Users/olmaoster/development/flutter/bin/flutter'
      })
    end
  },
}
--
-- return {
--   --- LSP ---
--   {
--     'VonHeikemen/lsp-zero.nvim',
--     branch = 'dev-v3',
--     config = function()
--       require('olmaoster.configs.lsp.lsp-zero')
--     end
--   },
--
--   --- Uncomment these if you want to manage LSP servers from neovim
--   {'williamboman/mason.nvim'},
--   {'williamboman/mason-lspconfig.nvim'},
--
--
--   -- Autocompletion
--   {
--     'hrsh7th/nvim-cmp',
--     dependencies = {
--       {
--         'L3MON4D3/LuaSnip',
--         "saadparwaiz1/cmp_luasnip",
--         "hrsh7th/cmp-nvim-lua",
--         "hrsh7th/cmp-nvim-lsp",
--         "hrsh7th/cmp-buffer",
--         "hrsh7th/cmp-path",
--       },
--     }
--   },
--   {
--     "zbirenbaum/copilot-cmp",
--     config = function ()
--       require("copilot_cmp").setup()
--     end
--   },
--   {
--     'nvimdev/lspsaga.nvim',
--     config = function()
--     end,
--   },
--   -- { "folke/neodev.nvim", opts = {} },
-- }
