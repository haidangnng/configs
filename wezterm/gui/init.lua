local wezterm = require("wezterm")

local function font_with_fallback(name, params)
	local names = {
		name,
		"SF Pro",
		"Apple Color Emoji",
	}
	return wezterm.font_with_fallback(names, params)
end

local font_name = "Monaspace Neon"
-- local font_name = "Inconsolata Nerd Font Mono"
-- local font_name = "Iosevka Nerd Font Mono"

return {
	-- OpenGL for GPU acceleration, Software for CPU
	front_end = "OpenGL",
	font = font_with_fallback(font_name),
	font_size = 14,
	-- Font consistency settings
	line_height = 1.3,
	cell_width = 1,
	adjust_window_size_when_changing_font_size = false,
	use_ime = true,
	font_rules = {
		{
			italic = true,
			font = font_with_fallback(font_name, { italic = true, weight = "Light" }),
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

	-- color_scheme = "Kasugano (terminal.sexy)",
	-- color_scheme = "carbonfox",
	color_scheme = "Jellybeans (Gogh)",

	bold_brightens_ansi_colors = true,

	-- Padding
	window_padding = {
		left = "1cell",
		right = "1cell",
		top = "0cell",
		bottom = "0cell",
	},

	-- Tab Bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = false,
	show_new_tab_button_in_tab_bar = false,
	tab_bar_at_bottom = false,
	use_fancy_tab_bar = false,
	-- tab_max_width = 150,

	-- General
	automatically_reload_config = true,
	inactive_pane_hsb = { saturation = 0.9, brightness = 0.9 },
	window_background_opacity = 0.90,
	macos_window_background_blur = 10,
	window_decorations = "RESIZE",

	mouse_wheel_scrolls_tabs = false,
	term = "xterm-256color",
}
