return {
  {
    "navarasu/onedark.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      style = 'warmer', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      transparent = true,  -- Show/hide background
      code_style = {
        comments = 'italic',
        functions = 'bold',
      },
      lualine = {
        transparent = false, -- lualine center bar transparency
      },
    },
  },

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
    event = "VeryLazy",
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
    event = { "BufReadPost", "BufNewFile" },
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
    },
    config = function()
      require("olmaoster.configs.ufo")
    end,
  },
}
