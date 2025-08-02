require("nightfox").setup({
	options = {
		-- Compiled file's destination location
		transparent = true, -- Disable setting background
		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
	},
})

vim.cmd("colorscheme carbonfox")
