require("nightfox").setup({
	options = {
		-- Compiled file's destination location
		-- transparent = true, -- Disable setting background
		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
		module_default = true, -- Default enable value for modules

		styles = { -- Style to be applied to different syntax groups
			comments = "italic",
			keywords = "bold",
			types = "italic,bold",
			constants = "bold",
			functions = "italic",
			strings = "italic",
		},
	},
})
