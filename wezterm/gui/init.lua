local wezterm = require("wezterm")

local function font_with_fallback(name, params)
	local names = { name, "SF Pro", "Hack Nerd Font Mono", "Apple Color Emoji", "azuki_font" }
	return wezterm.font_with_fallback(names, params)
end

-- local font_name = "Hack Nerd Font Mono"
local font_name = "Inconsolata Nerd Font"

return {
  -- OpenGL for GPU acceleration, Software for CPU
  front_end = "OpenGL",
  -- Font config
  font = font_with_fallback(font_name),
  font_size = 15.5,
  line_height = 1.3,

  use_fancy_tab_bar = false,
  tab_max_width = 50,
  color_scheme = 'Everblush',
  -- Aesthetic Night Colorscheme
  bold_brightens_ansi_colors = true,
  colors = {
    tab_bar = {
      background = "#1e2326",
      active_tab = {
        bg_color =  "#56635f",
        fg_color = '#D3C6AA',
        underline = 'None',
      },

      inactive_tab = {
        bg_color = '#1e2326',
        fg_color = '#808080',
      },

      -- inactive_tab_hover = {
      --   bg_color = 'rgba(255,255,255,0)',
      --   fg_color = '#909090',
      -- },

    },
  },

  -- Padding
  window_padding = {
    left = 5,
    right = 5,
    top = 0,
    bottom = 0,
  },

  -- Tab Bar
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  show_tab_index_in_tab_bar = true,
  show_new_tab_button_in_tab_bar = false,
  tab_bar_at_bottom = true,

  -- General
  automatically_reload_config = true,
  inactive_pane_hsb = { saturation = 0.7, brightness = 0.6 },
  window_background_opacity = 0.95,
  macos_window_background_blur = 10,
  window_close_confirmation = "NeverPrompt",
  window_frame = {
    active_titlebar_bg = "#090909",
    font = font_with_fallback(font_name, { bold = true }) },
}
