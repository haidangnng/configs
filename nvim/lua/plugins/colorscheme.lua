return {
	-- {
	-- 	"uhs-robert/oasis.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("config.colorscheme.oasis")
	-- 	end,
	-- },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("config.colorscheme.tokyonight")
	-- 	end,
	-- },
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("config.colorscheme.kanagawa")
		end,
	},
	-- {
	-- 	"nyoom-engineering/oxocarbon.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		transparent = false,
	-- 	},
	-- 	config = function()
	-- 		require("config.colorscheme.oxocarbon")
	-- 	end,
	-- },
}
