local util = require("config.keymaps.util")
local map = util.map
local desc = util.desc

map("n", "<leader>gg", function()
	Snacks.lazygit()
end, desc("Open Lazygit"))
map({ "n", "v" }, "<leader>gb", function()
	Snacks.gitbrowse()
end, desc("Open in GitHub"))
