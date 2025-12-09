require("oasis").setup({
	style = "lagoon",
	light_intensity = 5,

	transparent = true,
	terminal_colors = true,

	contrast = {
		min_ratio = 5.8,
		force_aaa = false,
	},

	palette_overrides = {},
	highlight_overrides = {},
})

vim.cmd.colorscheme("oasis-starlight")
