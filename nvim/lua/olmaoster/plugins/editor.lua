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

  -- SCROLL BAR --
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    opts = {
      show = true,
      show_in_active_only = true,
      set_highlights = true,
      excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
        "noice",
        "dashboard",
        "alpha",
        "lazy",
        "mason",
        "DressingInput",
        "",
      },
      handlers = {
        cursor = true,
        diagnostics = true,
        gitsigns = true,
      },
    },
  },

  --- FILE EXPLORER AS BUFFER ---
  {
   'stevearc/oil.nvim',
    opts = {
      default_file_explorer = false,
      columns = {
        "icon",
      },
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
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
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["Esc"] = "actions.close",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["g."] = "actions.toggle_hidden",
      },
      use_default_keymaps = false,
    },
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- TERMINAL --
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {}
  },

  --- SIDEBAR EXPLORER ---
  {
    "nvim-tree/nvim-tree.lua",
    config = function ()
      require("olmaoster.configs.nvim-tree")
    end
  },

  --- COMMENTS ---
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    init = function()
      require("olmaoster.core.utils").load_mappings "comment"
    end,
    config = function(_, opts)
      require("Comment").setup(vim.tbl_deep_extend('force', opts, {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }))
    end,
  },
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = false },
}
