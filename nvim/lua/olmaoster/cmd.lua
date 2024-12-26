vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_user_command("BufRemoveAll", function(opts)
	local is_all = opts.args == "all" -- Check if the argument is 'all'
	local current_buf = vim.api.nvim_get_current_buf() -- Get the current buffer

	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(bufnr) then
			if is_all then
				MiniBufremove.delete(bufnr, false) -- Delete all buffers
			else
				if bufnr ~= current_buf then
					MiniBufremove.delete(bufnr, false) -- Delete all except current
				end
			end
		end
	end
end, {
	nargs = 1, -- Command requires exactly one argument
	complete = function() -- Provide argument completion
		return { "all", "others" } -- Possible arguments
	end,
})
