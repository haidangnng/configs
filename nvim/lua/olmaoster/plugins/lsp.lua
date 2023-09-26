return {
  --- TREE SITTER ---
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      require("olmaoster.configs.treesitter")
    end
  },

  --- LSP ---
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'dev-v3',
    config = function()
      require('olmaoster.configs.lsp.lsp-zero')
    end
  },
  --- Uncomment these if you want to manage LSP servers from neovim
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  -- LSP Support
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
    },
  },
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        config = function()
          local tabnine = require "cmp_tabnine.config"
          tabnine:setup {
            max_lines = 1000,
            max_num_results = 20,
            sort = true,
            run_on_every_keystroke = true,
            snippet_placeholder = "..",
          } -- put your options here
        end,
      }
    }
  },
  {"b0o/schemastore.nvim"},
  {"jose-elias-alvarez/null-ls.nvim"},
  {
   'nvimdev/lspsaga.nvim',
    lazy = false,
    config = function()
      require('lspsaga').setup({})
    end,
  },
  { "folke/neodev.nvim", opts = {} },
}
