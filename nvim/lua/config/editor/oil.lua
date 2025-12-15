local options = {
	default_file_explorer = true,
	columns = { "icon" },
	win_options = {
		wrap = false,
	},
	float = {
		padding = 2,
		max_width = 90,
		max_height = 0,
		border = "rounded",
		win_options = {
			winblend = 0,
		},
	},
	confirmation = {
		border = "rounded",
	},
	view_options = {
		show_hidden = true,
		skip_confirm_for_simple_edits = true,
		is_hidden_file = function(name)
			return vim.startswith(name, ".")
		end,
		is_always_hidden = function()
			return false
		end,
	},
	keymaps = {
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.select",
		["-"] = "actions.parent",
		["_"] = "actions.open_cwd",
		["`"] = "actions.cd",
		["~"] = "actions.tcd",
		["g."] = "actions.toggle_hidden",
	},
	use_default_keymaps = false,
}

require("oil").setup(options)
