return {
	name = "clang++ build",
	builder = function()
		local file = vim.fn.expand("%:p")
		local out_file = vim.fn.expand("%:p:r")
		return {
			cmd = { out_file },
			components = {
				{
					"dependencies",
					task_names = { -- change task_name to task_names
						{
							cmd = "clang++",
							args = { file, "-o", out_file },
						},
					},
				},
				{ "on_output_quickfix", open = true },
				"default",
			},
		}
	end,
	condition = {
		filetype = { "cpp" },
	},
}
