return {
	----- OIL - FILE EXPLORER -----
	{
		"stevearc/oil.nvim",
		lazy = false, -- needed to replace netrw when opening a directory
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config.editor.oil")
		end,
	},
	----- STATUSLINE - LUALINE -----
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config.editor.lualine")
		end,
	},

	----- TREESITTER - SYNTAX HIGHLIGHTING -----
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false, -- main branch does not support lazy-loading
		build = ":TSUpdate",
		config = function()
			require("config.editor.treesitter")
		end,
	},

	----- SPLIT VIEW -----
	{
		"mrjones2014/smart-splits.nvim",
		-- not lazy: tmux only learns a pane runs nvim (@pane-is-vim) when the plugin loads
		lazy = false,
		dependencies = {
			{ "smart-splits-nvim/backend-tmux", main = "smart-splits-backend-tmux" },
		},
		opts = {
			mux = { backend = "smart-splits-backend-tmux", warn_if_unusable = false },
			ignored_buftypes = { "nofile", "quickfix", "prompt" },
			resize = { amount = 3 },
			move = {
				-- At the edge of nvim and of tmux panes: hand off to aerospace (async)
				at_edge = function(ctx)
					if vim.env.TMUX or vim.env.TERM_PROGRAM == "ghostty" then
						vim.fn.jobstart({ "/opt/homebrew/bin/aerospace", "focus", ctx.direction }, { detach = true })
					end
				end,
				same_row = false,
			},
		},
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
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	----- TODO COMMENTS -----
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
