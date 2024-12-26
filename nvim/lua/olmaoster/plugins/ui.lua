return {
	{
		"EdenEast/nightfox.nvim",
		config = function()
			require("olmaoster.configs.colorscheme.nightfox")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("olmaoster.configs.statusline")
		end,
	},

	--- SOME UI SHITE ---
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("olmaoster.configs.noice")
		end,
	},

	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
}
