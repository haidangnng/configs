-- Shared helpers for the keymap domain files in this directory.
local M = {}

M.map = vim.keymap.set

local opts = { noremap = true, silent = true }
M.opts = opts

function M.desc(description)
	return vim.tbl_extend("force", opts, { desc = description })
end

return M
