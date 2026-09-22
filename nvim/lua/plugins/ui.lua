return {
	----- STATUSLINE - LUALINE -----
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("config.ui.lualine")
		end,
	},
	----- OIL - FILE EXPLORER -----
	{
		"stevearc/oil.nvim",
		-- Not lazy: needs to load before netrw would open a directory buffer
		-- (e.g. `nvim .`), since it replaces netrw as the default file explorer.
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config.ui.oil")
		end,
	},
}
