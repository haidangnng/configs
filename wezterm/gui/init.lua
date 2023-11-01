local wezterm = require("wezterm")

local function font_with_fallback(name, params)
	local names = { name, "SF Pro", "Hack Nerd Font Mono", "Apple Color Emoji", "azuki_font" }
	return wezterm.font_with_fallback(names, params)
end

local font_name = "FiraMono Nerd Font Mono"

return {
  -- OpenGL for GPU acceleration, Software for CPU
  front_end = "OpenGL",
  -- Font config
  -- cell_width = 1,
  font = font_with_fallback(font_name),
  font_size = 14,
  line_height = 1.4,
  font_rules = {
    {
      italic = true,
      font = font_with_fallback(font_name, { italic = true }),
    },
    {
      italic = true,
      intensity = "Bold",
      font = font_with_fallback(font_name, { italic = true, bold = true }),
    },
    {
      intensity = "Bold",
      font = font_with_fallback(font_name, { bold = true }),
    },
  },

  use_fancy_tab_bar = false,
  tab_max_width = 150,
  color_scheme = 'duskfox',
  -- Aesthetic Night Colorscheme
	bold_brightens_ansi_colors = true,
	colors = {
		-- foreground = "#edeff0",
		background = "#110f1a",
		-- -- background = "#0c0e0f",
		-- cursor_bg = "#edeff0",
		-- cursor_fg = "#edeff0",
		-- cursor_border = "#232526",
		-- selection_fg = "#0c0e0f",
		-- selection_bg = "#edeff0",
		-- scrollbar_thumb = "#edeff0",
		-- split = "#090909",
		-- ansi = { "#232526", "#df5b61", "#78b892", "#de8f78", "#6791c9", "#bc83e3", "#67afc1", "#e4e6e7" },
		-- brights = { "#2c2e2f", "#e8646a", "#81c19b", "#e79881", "#709ad2", "#c58cec", "#70b8ca", "#f2f4f5" },
		-- indexed = { [136] = "#edeff0" },
		tab_bar = {
			active_tab = {
				bg_color = "#0c0e0f",
				fg_color = "#edeff0",
				italic = true,
			},
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
  show_new_tab_button_in_tab_bar = false,
  tab_bar_at_bottom = true,

  -- General
  automatically_reload_config = true,
  inactive_pane_hsb = { saturation = 0.7, brightness = 0.6 },
  window_background_opacity = 0.90,
  macos_window_background_blur = 15,

  window_frame = {
    active_titlebar_bg = "#090909",
    font = font_with_fallback(font_name, { bold = true }) },
}
