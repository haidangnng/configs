return {
  -- TELESCOPE --
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    cmd = "Telescope",
    config = function ()
      require("olmaoster.configs.telescope")
    end
  },


  --- FILE EXPLORER AS BUFFER ---
  {
    'stevearc/oil.nvim',
    opts = {
    default_file_explorer = true,
    columns = {
      "icon",
    },
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
      skip_confirm_for_simple_edits = true,
      -- This function defines what is considered a "hidden" file
      is_hidden_file = function(name)
        return vim.startswith(name, ".")
      end,
      -- This function defines what will never be shown, even when `show_hidden` is set
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
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function ()
      require("toggleterm").setup{}
    end
  },
}
