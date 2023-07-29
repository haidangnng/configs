local wezterm = require("wezterm")

local function font_with_fallback(name, params)
	local names = { name, "SF Pro", "Hack Nerd Font Mono", "Apple Color Emoji", "azuki_font" }
	return wezterm.font_with_fallback(names, params)
end

local font_name = "SpaceMono Nerd Font Mono"

return {
	-- OpenGL for GPU acceleration, Software for CPU
  color_scheme = "Catppuccin Mocha", -- or Macchiato, Frappe, Latte
	front_end = "OpenGL",
	-- Font config
	font = font_with_fallback(font_name),
	font_size = 12.5,
	line_height = 1.2,

  use_fancy_tab_bar = false,
  tab_max_width = 50,
	-- Aesthetic Night Colorscheme
	bold_brightens_ansi_colors = true,
	colors = {
		-- foreground = "#cdd6f4",
		-- background = "#1e1e2e",
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
      background = "#181825",
      active_tab = {
        bg_color =  "#313244",
        fg_color = '#cdd6f4',
        underline = 'None',
      },

      inactive_tab = {
        bg_color = 'rgba(255,255,255,0)',
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
	inactive_pane_hsb = { saturation = 0.7, brightness = 0.5 },
	window_background_opacity = 0.8,
  macos_window_background_blur = 5,
	window_close_confirmation = "NeverPrompt",
	window_frame = {
    active_titlebar_bg = "#090909",
    font = font_with_fallback(font_name, { bold = true }) },
}
