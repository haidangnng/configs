return {
	{
		"uhs-robert/oasis.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("config.colorscheme.oasis")
		end,
	},
}
