return {
  --- STATUSLINE ---
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function ()
      require("olmaoster.configs.statusline")
    end
  },

  --- VIM UI ---
  {
    "stevearc/dressing.nvim",
    lazy = true,
    opts = {
      input = {
        border = { "▄", "▄", "▄", "█", "▀", "▀", "▀", "█" }, -- [ top top top - right - bottom bottom bottom - left ]
        win_options = { winblend = 0 },
      },
    },
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },

  --- NOTIFY UI --
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- "rcarriga/nvim-notify",
  --   },
  --   config = function ()
  --     require("olmaoster.configs.noice")
  --   end
  -- },

  --- INDENT LINE ---
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function ()
      vim.opt.list = true
      -- vim.opt.listchars:append "space:⋅"

      require("ibl").setup {
      }
    end
  },

  --- FOLD ---
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("olmaoster.configs.ufo")
    end,
  },
}
