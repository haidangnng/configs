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
  },

  --- NOTIFY UI --
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function ()
      require("olmaoster.configs.noice")
    end
  },

  --- INDENT LINE ---
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function ()
      vim.opt.list = true
      require("ibl").setup { }
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
