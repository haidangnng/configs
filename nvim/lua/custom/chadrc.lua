--@type ChadrcConfig 
local M = {}
M.ui = {
   hl_override = {
       Comment = { -- custom highlights are also allowed
         fg = { "dark_purple", 1 }
      },
   },

  hl_add ={
      GitSignsCurrentLineBlame = {
        fg = 'cyan'
      }
  },
  theme_toggle = { "kanagawa", "dark_horizon" },
  -- theme_toggle = { "kanagawa", "chadracula" },
  -- transparency = true,
  theme = "kanagawa",
  telescope = { style = "bordered" }, -- borderless / bordered
  statusline = {
    theme = "vscode_colored",
    overriden_modules = function()
      return {
        fileInfo = function()
          local icon = " 󰈚 "
          local filename = (vim.fn.expand "%" == "" and "Empty ") or vim.fn.expand "%:."

          if filename ~= "Empty " then
            local devicons_present, devicons = pcall(require, "nvim-web-devicons")

            if devicons_present then
              local ft_icon = devicons.get_icon(filename)
              icon = (ft_icon ~= nil and " " .. ft_icon) or ""
            end

            filename = " " .. filename .. " "
          end

          return "%#StText# " .. icon .. filename
        end,
      }
    end,
  }
}
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"
return M
