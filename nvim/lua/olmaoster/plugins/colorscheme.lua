return {
	{
		"EdenEast/nightfox.nvim",
		config = function()
			-- require("olmaoster.configs.colorscheme.nightfox")
			-- vim.cmd("colorscheme carbonfox")
		end,
	},
	{
		"wtfox/jellybeans.nvim",
		priority = 1000,
		config = function()
			require("olmaoster.configs.colorscheme.jellybeans")
			vim.cmd.colorscheme("jellybeans")
		end,
	},
}
