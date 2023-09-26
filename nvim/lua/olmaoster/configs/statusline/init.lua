local components = require("olmaoster.configs.statusline.components")

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'codedark',
    component_separators = {},
    section_separators = {},
    disabled_filetypes = {
      statusline = {
        "dashboard",
        "lazy",
        "alpha",
        "NvimTree"
      },
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  color = {
    bg = "none"
  },
  sections = {
    lualine_a = {
      "mode",
      -- fmt =       components.mode(),
    },
    lualine_b = {
      components.fileInfo,
    },
    lualine_c = {
      components.git,
    },
    lualine_x = {
      components.LSP_Diagnostics,
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
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
