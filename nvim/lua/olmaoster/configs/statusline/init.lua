local components = require("olmaoster.configs.statusline.components")

require('lualine').setup {
  options = {
    icons_enabled = true,
    component_separators = {},
    section_separators = {},
    disabled_filetypes = {
      statusline = {
        "dashboard",
        "lazy",
        "alpha",
        "NvimTree"
      },
      winbar = {"*"},
      tabline = {"*"},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
    }
  },
  sections = {
    lualine_a = {
      {
        "mode",
        -- fmt = function()
        --   return " "
        -- end,
        -- draw_empty = true
      },
    },
    lualine_b = {
      components.fileInfo,
    },
    lualine_c = {
      components.git,
    },
    lualine_x = {
      components.LSP_Diagnostics,
      components.LSP_progress,
    },
    lualine_y = {
      components.gitchanges
    },
    lualine_z = {
      components.filetype,
      components.LSP_status,
      components.cwd,
    }
  },
}
