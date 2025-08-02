require("jellybeans").setup({
	background = "dark", -- "dark" or "light"
	transparent = true,
	italics = true,
	flat_ui = false, -- toggles "flat UI" for pickers
	plugins = {
		all = false,
		auto = true, -- will read lazy.nvim and apply the colors for plugins that are installed
	},
})

vim.cmd.colorscheme("jellybeans")
