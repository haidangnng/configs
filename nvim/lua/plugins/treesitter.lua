return {
	----- TREESITTER - SYNTAX HIGHLIGHTING -----
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			require("config.treesitter.treesitter")
		end,
	},
	----- AUTO TAG HTML -----
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("config.treesitter.autotag")
		end,
	},
}
