local util = require("config.keymaps.util")
local map = util.map
local desc = util.desc

--------------------------------------------------------------------------------
-- PICKER (Snacks)
--------------------------------------------------------------------------------
-- File/Search pickers
map("n", "<leader>pf", function()
	Snacks.picker.files()
end, desc("Find files"))
map("n", "<leader>ps", function()
	Snacks.picker.grep()
end, desc("Search in files (grep)"))
map("n", "<leader>pb", function()
	Snacks.picker.buffers()
end, desc("Find open buffers"))
map("n", "<leader>ff", function()
	Snacks.picker.lines()
end, desc("Search in current buffer"))
map("n", "<leader>fh", function()
	Snacks.picker.help()
end, desc("Search help tags"))
map("n", "<leader>sk", function()
	Snacks.picker.keymaps({
		layout = {
			layout = {
				backdrop = false,
				width = 0.4,
				height = 0.5,
				box = "vertical",
				border = "rounded",
				title = "{title}",
				title_pos = "center",
				{ win = "input", height = 1, border = "bottom" },
				{ win = "list", border = "none" },
			},
		},
		win = {
			input = {
				keys = {
					["<C-d>"] = { "list_scroll_down", mode = { "i", "n" } },
					["<C-u>"] = { "list_scroll_up", mode = { "i", "n" } },
				},
			},
			list = {
				wo = {
					wrap = true,
					linebreak = true,
				},
			},
		},
		format = function(item, picker)
			local k = item.item
			local lhs = Snacks.util.normkey(k.lhs)
			local kdesc = k.desc or ""
			local align = Snacks.picker.util.align
			return {
				{ align(lhs, 20), "SnacksPickerKeymapLhs" },
				{ "  " },
				{ kdesc, "Comment" },
			}
		end,
	})
end, desc("Search keymaps"))

-- Git pickers
map("n", "<leader>cm", function()
	Snacks.picker.git_log()
end, desc("Git commits log"))
map("n", "<leader>gs", function()
	Snacks.picker.git_status()
end, desc("Git status"))
