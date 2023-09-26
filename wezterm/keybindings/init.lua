local navigation = require("keybindings.navigation")

local M = {}

M.keys = navigation.keys
M.key_tables = navigation.key_tables
M.leader = {
  key = 'a',
  mods = 'CTRL',
}

return M
