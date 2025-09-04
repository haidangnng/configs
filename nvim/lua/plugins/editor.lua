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
	----- TELESCOPE -----
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-telescope/telescope-media-files.nvim" },
			"nvim-telescope/telescope-ui-select.nvim",
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		cmd = "Telescope",
		config = function()
			require("config.editor.telescope")
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
			require("toggleterm").setup({})
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
	----- COMMENTS -----
	-- {
	-- 	"echasnovski/mini.comment",
	-- 	event = "BufEnter",
	-- 	version = "*",
	-- 	dependencies = {
	-- 		"JoosepAlviste/nvim-ts-context-commentstring",
	-- 	},
	-- 	config = function()
	-- 		require("mini.comment").setup({
	-- 			options = {
	-- 				custom_commentstring = function()
	-- 					return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
	-- 				end,
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
	},
	----- REMOVE BUFFER -----
	{
		"echasnovski/mini.bufremove",
		event = "VeryLazy",
		version = "*",
		config = function()
			require("mini.bufremove").setup()
		end,
	},
	----- JUMP -----
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
	 -- stylua: ignore
	 keys = {
	   { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
	   { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
	   { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
	   { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
	   { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
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
	----- POSTGRESQL CLIENT -----
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql" }, lazy = true }, -- Optional
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
}
