local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local options = {
	extensions = {
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg" },
			find_cmd = "rg",
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
		},
		extensions = {
			fzf = {},
			-- ["ui-select"] = {
			-- 	require("telescope.themes").get_dropdown(),
			-- },
		},
	},
	defaults = {
		mappings = {
			i = {
				["<C-l>"] = "select_vertical",
				["<C-j>"] = "select_horizontal",
				["<C-e>"] = "close",
			},
			n = {
				["q"] = "close",
			},
		},
		prompt_prefix = "   ",
		selection_caret = " ❯ ",
		sorting_strategy = "ascending",
		file_ignore_patterns = {
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
		},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
	},
}

telescope.setup(options)
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "media_files")
-- pcall(require("telescope").load_extension, "ui-select")
