return {
  -- COLORSCHEME --
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require('olmaoster.configs.colorscheme')
    end,
  },
  --- DASHBOARD ---
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require("olmaoster.configs.dashboard")
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
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
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- "rcarriga/nvim-notify",
    },
    config = function ()
      require("olmaoster.configs.noice")
    end
  },

  --- INDENT LINE ---
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      vim.opt.list = true
      -- vim.opt.listchars:append "space:⋅"

      require("indent_blankline").setup {
        indentLine_enabled = 1,
        filetype_exclude = {
          "help",
          "terminal",
          "lazy",
          "lspinfo",
          "TelescopePrompt",
          "TelescopeResults",
          "mason",
          "nvdash",
          "dashboard",
          "nvcheatsheet",
          "",
        },
        buftype_exclude = { "terminal" },
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  },
}