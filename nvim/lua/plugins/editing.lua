return {
	----- SPLIT VIEW -----
	{
		"mrjones2014/smart-splits.nvim",
		event = "VeryLazy",
		config = function()
			require("config.editing.smart_splits")
		end,
	},
	----- AUTOPAIRS -----
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("config.editing.autopairs")
		end,
	},
	----- COMMENTSTRING -----
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		config = function()
			require("config.editing.ts_comments")
		end,
	},
	----- JUMP -----
	{
		"folke/flash.nvim",
		event = "VeryLazy",
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
		config = function()
			require("config.editing.flash")
		end,
	},
	----- SURROUND -----
	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("config.editing.surround")
		end,
	},
	----- TODO COMMENTS -----
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("config.editing.todo_comments")
		end,
	},
}
