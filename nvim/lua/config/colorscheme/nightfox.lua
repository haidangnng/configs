require("nightfox").setup({
	options = {
		-- Compiled file's destination location
		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
		transparent = true,
	},
})

vim.cmd("colorscheme carbonfox")
