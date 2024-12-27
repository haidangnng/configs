return {
  -- TELESCOPE --
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-media-files.nvim" },
      { "nvim-tree/nvim-web-devicons",              enabled = vim.g.have_nerd_font },
    },
    cmd = "Telescope",
    config = function()
      require("olmaoster.configs.telescope")
    end,
  },

  --- FILE EXPLORER AS BUFFER ---
  {
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = true,
      columns = { "icon" },
      view_options = {
        show_hidden = true,
        skip_confirm_for_simple_edits = true,
        is_hidden_file = function(name)
          return vim.startswith(name, ".")
        end,
        is_always_hidden = function()
          return false
        end,
      },
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["g."] = "actions.toggle_hidden",
      },
      use_default_keymaps = false,
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- TERMINAL --
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    version = "*",
    config = function()
      require("toggleterm").setup({})
    end,
  },

  --- NAVIGATOR ---
  {
    "mrjones2014/smart-splits.nvim",
  },

  ---- TREESITTER ---
  {
    "nvim-treesitter/nvim-treesitter",
    event = 'UIEnter',
    build = ":TSUpdate",
    config = function()
      require("olmaoster.configs.treesitter")
    end,
  },

  --- GITSIGNS ---
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufRead" },
    config = function()
      require("olmaoster.configs.gitsigns")
    end,
  },
}
