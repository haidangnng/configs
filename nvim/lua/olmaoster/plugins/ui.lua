return {
	--- COLORTHEME ---
	{
		"navarasu/onedark.nvim",
		opts = {
			style = "warmer",
		},
		init = function()
			vim.cmd.colorscheme("onedark")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
		opts = {
			transparent_mode = true,
		},
		init = function()
			-- vim.cmd.colorscheme("gruvbox")
		end,
	},
	--- STATUSLINE ---
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("olmaoster.configs.statusline")
		end,
	},

	--- VIM UI ---
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},

	--- NOTIFY UI --
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

	--- INDENT LINE ---
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		main = "ibl",
		config = function()
			vim.opt.list = true
			require("ibl").setup({})
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
