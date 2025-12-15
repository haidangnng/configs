local fzf = require("fzf-lua")

fzf.setup({
	winopts = {
		height = 0.4,
		width = 0.5,
		row = 0.5,
		col = 0.5,
		border = "rounded",
		preview = {
			hidden = "hidden",
		},
	},
	fzf_opts = {
		["--layout"] = "reverse",
	},
})

-- Register fzf-lua as the select UI
fzf.register_ui_select()
