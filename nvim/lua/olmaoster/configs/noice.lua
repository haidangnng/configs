local options = {
	cmdline = {
		view = "cmdline",
		format = {
			cmdline = { icon = "  " },
			search_down = { icon = "  󰄼" },
			search_up = { icon = "  " },
			lua = { icon = "  " },
		},
	},
	lsp = {
		progress = {
			enabled = true,
			view = "mini",
			throttle = 1000 / 60,
		},
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = true,
		lsp_doc_border = true,
	},
	routes = {
		view = "notify",
		filter = { event = "msg_showmode" },
	},
	views = {
		mini = {
			backend = "mini",
			timeout = 5000,
			size = { height = "auto", width = "auto", max_height = 5 },
			border = { style = "none" },
			zindex = 30,
			win_options = {
				winbar = "",
				foldenable = false,
				winblend = 0,
			},
		},
	},
}

require("noice").setup(options)
