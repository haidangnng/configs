return {
	{
		"wtfox/jellybeans.nvim",
		priority = 1000,
		config = function()
			require("olmaoster.configs.colorscheme.jellybeans")
			vim.cmd.colorscheme("jellybeans")
		end,
	},
}
