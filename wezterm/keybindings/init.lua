local key_tables = require("keybindings.tables")
local keys = require("keybindings.keys")

local M = {}

M.keys = keys
M.key_tables = key_tables
M.leader = {
	key = "a",
	mods = "CTRL",
}

return M
