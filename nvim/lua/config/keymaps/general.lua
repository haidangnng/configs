local util = require("config.keymaps.util")
local map = util.map
local desc = util.desc

-- Disable space key in normal mode (leader key)
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", util.opts)

-- Escape and clear
map("n", "<ESC>", ":nohl<CR>", desc("Clear search highlight"))
map("i", "jk", "<ESC>", { noremap = true, desc = "Exit insert mode", nowait = true })
map("i", "jK", "<ESC>", { noremap = true, desc = "Exit insert mode", nowait = true })
map("i", "Jk", "<ESC>", { noremap = true, desc = "Exit insert mode", nowait = true })
map("i", "JK", "<ESC>", { noremap = true, desc = "Exit insert mode", nowait = true })
map("v", "q", "<ESC>", { noremap = true, desc = "Exit visual mode", nowait = true })

-- Navigation with centered cursor
map("n", "<C-d>", "<C-d>zz", desc("Page down (centered)"))
map("n", "<C-u>", "<C-u>zz", desc("Page up (centered)"))

-- Better indenting (stay in visual mode)
map("v", ">", ">gv", desc("Indent right"))
map("v", "<", "<gv", desc("Indent left"))

-- Paste without yanking in visual mode
map("v", "p", '"_dP', desc("Paste without yanking"))
map("x", "p", '"_dP', desc("Paste without yanking"))

-- Move lines in visual mode
map("x", "J", ":move '>+1<CR>gv-gv", desc("Move selection down"))
map("x", "K", ":move '<-2<CR>gv-gv", desc("Move selection up"))

-- Search and replace
map("n", "<leader>rf", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], desc("Replace word in file"))
map("n", "<leader>rl", [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], desc("Replace word in line"))

-- Copy current file path
map("n", "<leader>cp", function()
	local path = vim.fn.expand("%:.")
	vim.fn.setreg("+", path)
	vim.notify("Copied: " .. path, vim.log.levels.INFO)
end, desc("Copy current file path (relative)"))
