require("lspsaga").setup({
	lightbulb = { enable = false },
	ui = {
		border = "rounded",
		lines = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	},
	code_action = {
		num_shortcut = true,
		show_server_name = false,
		extend_gitsigns = false,
		keys = {
			quit = { "q", "<ESC>" },
			exec = "<CR>",
		},
	},
})

-- LSP Saga highlight
vim.cmd([[
	highlight HoverBorder guibg=NONE ctermbg=NONE
	highlight HoverNormal guibg=NONE ctermbg=NONE
	highlight ActionPreviewBorder guibg=NONE ctermbg=NONE
	highlight ActionPreviewNormal guibg=NONE ctermbg=NONE
	highlight DiagnosticBorder guibg=NONE ctermbg=NONE
	highlight DiagnosticNormal guibg=NONE ctermbg=NONE
	highlight RenameBorder guibg=NONE ctermbg=NONE
	highlight RenameNormal guibg=NONE ctermbg=NONE
	highlight SagaBorder guibg=NONE ctermbg=NONE
	highlight SagaNormal guibg=NONE ctermbg=NONE
]])
