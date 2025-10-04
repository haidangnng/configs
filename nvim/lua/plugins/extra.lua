return {
	{
		"kawre/leetcode.nvim",
		cmd = "Leet",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
		},
		opts = {
			-- configuration goes here
			arg = "leetcode.nvim",
			lang = "python3",
			storage = {
				home = vim.fn.expand("~/Desktop/self/leetcode/data"),
				cache = vim.fn.expand("~/Desktop/self/leetcode/cache"),
			},

			plugins = {
				non_standalone = false,
			},

			keys = {
				toggle = { "q" }, ---@type string|string[]
				confirm = { "<CR>" }, ---@type string|string[]

				reset_testcases = "r", ---@type string
				use_testcase = "U", ---@type string
				focus_testcases = "H", ---@type string
				focus_result = "L", ---@type string
			},
		},
	},
}
