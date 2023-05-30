local config = require("olmaoster.config.lualine.config")

local M = {}

local function setup()
  local cpn = require("olmaoster.config.lualine.components")
  local theme = require("olmaoster.config.lualine.highlights").custom(config.options)

  require("lualine").setup({
    options = {
      theme = theme,
      icons_enabled = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = { "dashboard", "lazy", "alpha" },
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        -- winbar = 100,
      },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = { {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
      } },
      lualine_x = {
        { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ',
          hint = ' ' } },
        'encoding',
        'filetype'
      },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
      } },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = { 'fugitive' }
  })
end

M.setup = config.setup

M.load = function()
  setup()
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      setup()
    end,
  })
end

return M
