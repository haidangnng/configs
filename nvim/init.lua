-- Byte-compile and cache lua modules for faster startup
vim.loader.enable()

require("config.options")
require("config.cmd")
require("config.lazy")

-- Load keymaps after plugins are loaded
require("config.keymap")
