return {
  -- {
  --   "EdenEast/nightfox.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('nightfox').load()
  --   end,
  -- },
  --- LOCATION BARBECUE LINE ---
  {
    "utilyre/barbecue.nvim",
    event = { "BufReadPost" },
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      theme = "auto",
      include_buftypes = { "" },
      exclude_filetypes = { "gitcommit", "Trouble", "toggleterm" },
      show_modified = false,
      kinds = {
        File = "", -- File
        Module = "", -- Module
        Namespace = "", -- Namespace
        Package = "", -- Package
        Class = "", -- Class
        Method = "", -- Method
        Property = "", -- Property
        Field = "", -- Field
        Constructor = "", -- Constructor
        Enum = "", -- Enum
        Interface = "", -- Interface
        Function = "", -- Function
        Variable = "", -- Variable
        Constant = "", -- Constant
        String = "", -- String
        Number = "", -- Number
        Boolean = "◩", -- Boolean
        Array = "", -- Array
        Object = "", -- Object
        Key = "", -- Key
        Null = "ﳠ", -- Null
        EnumMember = "", -- EnumMember
        Struct = "", -- Struct
        Event = "", -- Event
        Operator = "", -- Operator
        TypeParameter = "", -- TypeParameter
        Macro = "", -- Macro
      },
    },
  },

--- SCROLL BAR ---
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

--- BETTER VIM.UI ---
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

--- NOTIFY UI BOX ---
{
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
  },
  opts = {
    cmdline = {
      view = "cmdline",
      format = {
        cmdline = { icon = "  " },
        search_down = { icon = "  󰄼" },
        search_up = { icon = "  " },
        lua = { icon = "  " },
      },
    },
    lsp = {
      progress = { enabled = true },
      hover = { enabled = false },
      signature = { enabled = false },
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          find = "%d+L, %d+B",
        },
      },
    },
  },
  }
}
