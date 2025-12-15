-- Snacks.nvim configuration
-- Each module is configured in its own file

local M = {}

M.opts = {
	bigfile = { enabled = true },
	bufdelete = { enabled = true },
	gitbrowse = { enabled = true },
	indent = { enabled = true },
	quickfile = { enabled = true },
	git = { enabled = true },
	scope = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	terminal = require("config.snacks.terminal"),
	notifier = require("config.snacks.notifier"),
	input = require("config.snacks.input"),
	lazygit = require("config.snacks.lazygit"),
	picker = require("config.snacks.picker"),
	zen = { enabled = true },
}

M.config = function(_, opts)
	local snacks = require("snacks")
	snacks.setup(opts)
	-- MonkeyPatch - https://github.com/folke/snacks.nvim/pull/2012
	local M = require("snacks.picker.core.main")
	M.new = function(opts)
		opts = vim.tbl_extend("force", {
			float = false,
			file = true,
			current = false,
		}, opts or {})
		local self = setmetatable({}, M)
		self.opts = opts
		self.win = vim.api.nvim_get_current_win()
		return self
	end
	-- Custom highlight groups for git pickers
	vim.api.nvim_set_hl(0, "SnacksPickerGitAdd", { fg = "#9ece6a", bold = true })
	vim.api.nvim_set_hl(0, "SnacksPickerGitChange", { fg = "#e0af68", bold = true })
	vim.api.nvim_set_hl(0, "SnacksPickerGitDelete", { fg = "#f7768e", bold = true })
end

return M
