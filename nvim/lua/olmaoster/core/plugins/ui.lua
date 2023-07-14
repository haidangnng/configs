return {
  --- BUFFER TAB BAR --- 
  {
    "akinsho/bufferline.nvim",
    event = { "BufReadPost" },
    opts = {
      options = {
        diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
        separator_style = "slant", -- | "thick" | "thin" | "slope" | { 'any', 'any' },
        indicator = {
          style = "underline",
        },
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        diagnostics_indicator = function(count, _, _, _)
          if count > 9 then
            return "9+"
          end
          return tostring(count)
        end,
        hover = {
          enabled = true,
          delay = 0,
          reveal = { "close" },
        },
      },
    },
  },

  --- FILE STATUS LINE --- 
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      float = true,
      separator = "bubble", -- bubble | triangle
      ---@type any
      colorful = true,
    },
    config = function(_, opts)
      local lualine_config = require("olmaoster.config.editor.lualine")
      lualine_config.setup(opts)
      lualine_config.load()
    end,
  },

  --- INDENT LINE ---
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "▏",
      context_char = "▏",
      show_end_of_line = false,
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
      filetype_exclude = {
        "help",
        "startify",
        "dashboard",
        "packer",
        "neogitstatus",
        "NvimTree",
        "Trouble",
        "alpha",
        -- "neo-tree",
      },
      buftype_exclude = {
        "terminal",
        "nofile",
      },
    },
  },

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

  --- COLOR TAGS ---
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = { "*", "!lazy" },
        -- "!neo-tree"
      buftype = { "*", "!prompt", "!nofile" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        virtualtext = "■",
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
      select = { telescope = require("olmaoster.util").telescope_theme("dropdown") },
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

