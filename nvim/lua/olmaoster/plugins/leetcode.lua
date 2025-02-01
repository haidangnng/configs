return {
	"kawre/leetcode.nvim",
	cmd = "Leet",
	build = ":TSUpdate html",
	dependencies = {
		-- "MunifTanjim/nui.nvim",
		-- "rcarriga/nvim-notify",
	},
	opts = {
		-- configuration goes here
		arg = "leetcode.nvim",
		lang = "python3",
		storage = {
			home = vim.fn.expand("~/Projects/self/leetcode/data"),
			cache = vim.fn.expand("~/Projects/self/leetcode/cache"),
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
}
