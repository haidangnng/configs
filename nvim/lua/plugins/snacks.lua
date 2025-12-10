local snacks_config = require("config.snacks")

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = snacks_config.opts,
	config = snacks_config.config,
	-- Keymaps are now centralized in config/keymap.lua
}
