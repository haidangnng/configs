local wezterm = require("wezterm")
local act = wezterm.action

return {
  keys = {
    -- Disable default
    -- { key = 'h', mods = 'SHIFT', action = act.DisableDefaultAssignment },
    -- { key = 'j', mods = 'SHIFT', action = act.DisableDefaultAssignment },
    -- { key = 'k', mods = 'SHIFT', action = act.DisableDefaultAssignment },
    -- { key = 'l', mods = 'SHIFT', action = act.DisableDefaultAssignment },
    -- TABS
    { key = 't', mods = 'LEADER', action = act({ SpawnTab = "CurrentPaneDomain"}) },
    { key = 'q', mods = 'LEADER', action = act({ CloseCurrentTab = { confirm = true }}) },
    { key = 'l', mods = 'LEADER', action = act({ ActivateTabRelative = 1}) },
    { key = 'h', mods = 'LEADER', action = act({ ActivateTabRelative = -1}) },
  
     -- PANES
    {
      key = 'm',
      mods = 'LEADER',
      action = wezterm.action.TogglePaneZoomState,
    },
    { key = '|', mods = 'LEADER', action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" }}) },
    { key = '-', mods = 'LEADER', action = act({ SplitVertical = { domain = "CurrentPaneDomain" }}) },
    { key = 'w', mods = 'LEADER', action = act({ CloseCurrentPane = { confirm = true }}) },
    { key = 's', mods = 'LEADER', action = act({ PaneSelect = { alphabet = "1234567890"}}) },
    { key = 'h', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-left') },
    { key = 'j', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-down') },
    { key = 'k', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-up') },
    { key = 'l', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-right') },
    {
      key = 'r',
      mods = 'LEADER',
      action = act.ActivateKeyTable {
        name = 'resize_pane',
        one_shot = false,
      },
    },
  },

  key_tables = {
    resize_pane = {
      { key = 'h', action = act.AdjustPaneSize { 'Left', 5 }},
      { key = 'j', action = act.AdjustPaneSize { 'Down', 5 }},
      { key = 'k', action = act.AdjustPaneSize { 'Up', 5 }},
      { key = 'l', action = act.AdjustPaneSize { 'Right', 5 }},
      { key = "Escape", action = "PopKeyTable" },
    }
  },
}

