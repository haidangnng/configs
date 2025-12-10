-- Snacks.nvim configuration
-- Each module is configured in its own file

local M = {}

M.opts = {
	bigfile = { enabled = true },
	bufdelete = { enabled = true },
	gitbrowse = { enabled = true },
	indent = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	lazygit = { enabled = true },
	picker = require("config.snacks.picker"),
	zen = { enabled = true },
}

M.config = function(_, opts)
	local snacks = require("snacks")
	snacks.setup(opts)

	-- Custom highlight groups for git pickers
	vim.api.nvim_set_hl(0, "SnacksPickerGitAdd", { fg = "#9ece6a", bold = true })
	vim.api.nvim_set_hl(0, "SnacksPickerGitChange", { fg = "#e0af68", bold = true })
	vim.api.nvim_set_hl(0, "SnacksPickerGitDelete", { fg = "#f7768e", bold = true })
end

return M
