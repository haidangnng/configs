return {
	-- {
	--   "EdenEast/nightfox.nvim",
	--   priority = 1000,
	--   config = function()
	--     require("config.colorscheme.nightfox")
	--   end,
	-- },
	{
		"uhs-robert/oasis.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("config.colorscheme.oasis")
		end,
	},
}
