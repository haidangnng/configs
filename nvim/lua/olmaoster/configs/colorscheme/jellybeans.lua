require("jellybeans").setup({
	style = "dark", -- "dark" or "light"
	transparent = true,
	italics = true,
	flat_ui = true, -- toggles "flat UI" for pickers
	plugins = {
		all = false,
		auto = true, -- will read lazy.nvim and apply the colors for plugins that are installed
	},
})
