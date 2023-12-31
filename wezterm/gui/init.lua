local wezterm = require("wezterm")

local function font_with_fallback(name, params)
	local names = { name,"Space Nerd Font Mono", "SF Pro", "Hack Nerd Font Mono", "Apple Color Emoji", "azuki_font" }
	return wezterm.font_with_fallback(names, params)
end

-- local font_name = "FiraMono Nerd Font Mono"
-- local font_name = "SpaceMono Nerd Font"
-- local font_name = "Hack Nerd Font"
-- local font_name = "Inconsolata Nerd Font"
local font_name = "Monaspace Neon"-- Xenon || Argon || Krypton || Radon || Neon
local font_name_comment = "Monaspace Radon"-- Xenon || Argon || Krypton || Radon || Neon


return {
  -- OpenGL for GPU acceleration, Software for CPU
  front_end = "OpenGL",
  -- Font config
  font = font_with_fallback(font_name, { weight = "Light" }),
  font_size = 15,
  line_height = 1.6,
  font_rules = {
    {
      italic = true,
      font = font_with_fallback(font_name_comment, { italic = true, weight = "ExtraLight" }),
    },
    {
      italic = true,
      intensity = "Bold",
      font = font_with_fallback(font_name, { italic = true, bold = true }),
    },
    {
      intensity = "Bold",
      font = font_with_fallback(font_name, { weight = "Bold" }),
    },
  },

  use_fancy_tab_bar = false,
  tab_max_width = 150,
  -- color_scheme = 'nightfox',
  color_scheme = 'Kasugano (terminal.sexy)',
	bold_brightens_ansi_colors = true,
	-- colors = {
	-- 	background = "#050212",
	-- },

  -- Padding
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },


  -- Tab Bar
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
  show_new_tab_button_in_tab_bar = false,
  tab_bar_at_bottom = true,

  -- General
  automatically_reload_config = true,
  inactive_pane_hsb = { saturation = 0.8, brightness = 0.2 },
  window_background_opacity = 0.90,
  macos_window_background_blur = 40,

  mouse_wheel_scrolls_tabs = false,

  window_frame = {
    -- active_titlebar_bg = "#090909",
    font = font_with_fallback(font_name, { bold = true })
  },
}
