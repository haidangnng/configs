local wezterm = require("wezterm")
local keybinding = require('keybindings')
local utils      = require('utils')
local gui        = require('gui')
require('helpers.status')
require('on')

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end


config = utils.merge_tables(config, keybinding)
-- helpers.apply_to_config(config)

return utils.merge_tables(config, gui)

