require("smart-splits").setup({
	ignored_filetypes = { "nofile", "quickfix", "prompt" },
	ignored_buftypes = { "nofile" },
	default_amount = 3,
	at_edge = "stop", -- Don't wrap around at edges
	move_cursor_same_row = false,
})
