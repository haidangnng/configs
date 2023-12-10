return {
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
            max_lines = 5,
            max_num_results = 5,
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
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
}
