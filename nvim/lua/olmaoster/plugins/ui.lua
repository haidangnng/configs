return {
  --- COLORSCHEME ---
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
     -- Main options --
      style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      transparent = true,  -- Show/hide background
      term_colors = true, -- Change terminal color as per the selected theme style
      ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
      cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

      -- Change code style ---
      -- Options are italic, bold, underline, none
      -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
      code_style = {
          comments = 'italic',
          functions = 'bold',
      },

      -- Lualine options --
      lualine = {
          transparent = false, -- lualine center bar transparency
      },

      -- Plugins Config --
      diagnostics = {
          darker = true, -- darker colors for diagnostic
          undercurl = true,   -- use undercurl instead of underline for diagnostics
          background = true,    -- use background color for virtual text
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
