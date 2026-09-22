local util = require("config.keymaps.util")
local map = util.map
local desc = util.desc

map("n", "<leader>z", function()
	Snacks.zen()
end, desc("Toggle zen mode"))
map("n", "<leader>Z", function()
	Snacks.zen.zoom()
end, desc("Toggle zoom"))
