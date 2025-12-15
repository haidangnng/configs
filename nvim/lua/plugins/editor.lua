return {
	----- OIL - FILE EXPLORER -----
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config.editor.oil")
		end,
	},
	----- STATUSLINE - LUALINE -----
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("config.editor.lualine")
		end,
	},
	----- SOME UI SHITE -----
	{
		"ibhagwan/fzf-lua",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config.editor.fzf")
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("config.editor.noice")
		end,
	},
	----- TREESITTER - SYNTAX HIGHLIGHTING -----
	{
		"nvim-treesitter/nvim-treesitter",
		event = "UIEnter",
		build = ":TSUpdate",
		lazy = true,
		config = function()
			require("config.editor.treesitter")
		end,
	},
	------ TERMINAL ------
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		version = "*",
		config = function()
			require("config.editor.toggleterm")
		end,
	},
	----- SPLIT VIEW -----
	{
		"mrjones2014/smart-splits.nvim",
		event = "VeryLazy",
	},
	----- AUTOPAIRS -----
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
	},
	----- JUMP -----
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
	},
	----- SURROUND -----
	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	----- AUTO TAG HTLM -----
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {},
	},
	----- ZEN MODE -----
	{
		"folke/zen-mode.nvim",
		opts = {
			windows = {
				width = 150,
			},
			plugins = {
				wezterm = {
					enabled = false,
					-- can be either an absolute font size or the number of incremental steps
					font = "+4", -- (10% increase per step)
				},
			},
		},
	},
	----- CENTERED CURSOR ------
	{
		"arnamak/stay-centered.nvim",
	},
}
