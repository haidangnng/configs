local util = require("config.keymaps.util")
local map = util.map
local desc = util.desc

--------------------------------------------------------------------------------
-- TERMINAL (Snacks)
--------------------------------------------------------------------------------
map("n", "<C-t>", function()
	Snacks.terminal(nil, { win = { position = "float" } })
end, desc("Toggle floating terminal"))
map("t", "<C-t>", "<Cmd>close<CR>", desc("Close terminal"))

--------------------------------------------------------------------------------
-- Per-buffer terminal keymaps, applied on TermOpen (skipped for lazygit)
--------------------------------------------------------------------------------
local function set_terminal_keymaps()
	local bufname = vim.api.nvim_buf_get_name(0)
	if bufname:match("lazygit") then
		return
	end

	local buf_opts = { buffer = 0 }
	map("t", "<esc>", [[<C-\><C-n>]], buf_opts)
	map("t", "jk", [[<C-\><C-n>]], buf_opts)
	map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], buf_opts)
	map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], buf_opts)
	map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], buf_opts)
	map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], buf_opts)
	map("t", "<C-w>", [[<C-\><C-n><C-w>]], buf_opts)
end

vim.api.nvim_create_autocmd("TermOpen", {
	desc = "Apply terminal keymaps to all terminals except lazygit",
	group = vim.api.nvim_create_augroup("terminal-keymaps", { clear = true }),
	pattern = "term://*",
	callback = set_terminal_keymaps,
})

-- Auto enter insert mode when opening terminal
vim.api.nvim_create_autocmd("TermOpen", {
	desc = "Auto enter insert mode when opening terminal",
	group = vim.api.nvim_create_augroup("terminal-insert-mode", { clear = true }),
	callback = function()
		local bufname = vim.api.nvim_buf_get_name(0)
		if not bufname:match("lazygit") then
			vim.cmd("startinsert")
		end
	end,
})
