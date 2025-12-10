local exclude_patterns = {
	"node_modules",
	"package_lock.json",
	"assets/",
	"%.tscn",
	"%.gd.uid",
	".godot/",
	"env/",
	".mypy_cache",
	".next/",
	".venv",
	"__pycache__",
	".git/",
	"target/",
	"docs/",
	"vendor/*",
	"%.lock",
	"__pycache__/*",
	"%.sqlite3",
	"%.ipynb",
	"node_modules/*",
	"%.webp",
	".github/",
	".idea/",
	".settings/",
	".vscode/",
	"__pycache__/",
	"node_modules/",
	"%.pdb",
	"%.dll",
	"%.class",
	"%.exe",
	"%.cache",
	"%.ico",
	"%.pdf",
	"%.dylib",
	"%.jar",
	"%.docx",
	"%.met",
	"smalljre_*/*",
	".vale/",
	"%.burp",
	"%.mp4",
	"%.mkv",
	"%.rar",
	"%.zip",
	"%.7z",
	"%.tar",
	"%.bz2",
	"%.epub",
	"%.flac",
	"%.tar.gz",
	"%__virtual.cs$",
	"pnpm%-lock%.yaml",
}

return {
	enabled = true,
	sources = {
		files = { exclude = exclude_patterns },
		grep = { exclude = exclude_patterns },
	},
	win = {
		input = {
			keys = {
				["<C-l>"] = { "my_vsplit", mode = { "i", "n" } },
				["<C-j>"] = { "my_split", mode = { "i", "n" } },
				["<C-e>"] = "close",
				["q"] = { "close", mode = "n" },
				["<C-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
				["<C-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
				["<leader>pf"] = { "switch_files", mode = { "i", "n" } },
				["<leader>ps"] = { "switch_grep", mode = { "i", "n" } },
			},
		},
	},
	actions = {
		switch_files = function(picker)
			picker:close()
			vim.defer_fn(function()
				Snacks.picker.files()
			end, 10)
		end,
		switch_grep = function(picker)
			picker:close()
			vim.defer_fn(function()
				Snacks.picker.grep()
			end, 10)
		end,
		my_vsplit = function(picker)
			local item = picker:current()
			if item and item.file then
				picker:close()
				vim.cmd("vsplit " .. vim.fn.fnameescape(item.file))
				if item.pos then
					vim.api.nvim_win_set_cursor(0, { item.pos[1], item.pos[2] - 1 })
				end
			end
		end,
		my_split = function(picker)
			local item = picker:current()
			if item and item.file then
				picker:close()
				vim.cmd("split " .. vim.fn.fnameescape(item.file))
				if item.pos then
					vim.api.nvim_win_set_cursor(0, { item.pos[1], item.pos[2] - 1 })
				end
			end
		end,
	},
	layout = {
		layout = {
			box = "horizontal",
			width = 0,
			height = 0,
			{
				box = "vertical",
				width = 0.4,
				border = "rounded",
				title = " {title} {live} {flags}",
				title_pos = "center",
				{ win = "input", height = 1, border = "bottom" },
				{ win = "list", border = "none" },
			},
			{ win = "preview", title = " {preview} ", title_pos = "center", border = "rounded" },
		},
	},
	formatters = {
		file = {
			filename_first = true,
		},
	},
}
